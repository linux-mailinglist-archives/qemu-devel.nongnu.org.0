Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6747339F78
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:26:15 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL81l-0000W9-3Z
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL807-0007pN-3i
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:24:32 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL7zz-000558-C5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:24:30 -0500
Received: by mail-qk1-x72b.google.com with SMTP id x10so27702091qkm.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hszrK5X1zKFPcgVtNADuTzMFuaYAiaXIMIPUe65dQ1c=;
 b=kWRtJU1CfgOxtF/8mlp79trUJpUnhoRP19Dy6OCrCVg8O+s8QWGaa9cF5yeO582JuF
 6XlURCtOVuTBJ4xS/lrXQAb0rWgg/fDrJ7eJO+bvGnwtjpdHqBVt74l92O39w+eTLnoL
 TOkWylwkR+K7f0m8yzbd9qTMQBYm3oR/rZysKg9n0I9125VtB5bY++6+CulldPR/p9XE
 pB+AVvBc01VTOYeSSVxx/JDKXIEiRG6rVOfyW4Vt/tyZ/v/d9+S+ToTfo029kFZXrrP3
 y8eLaHIcM2GaltzDSs9yq8J6Z1n0Gd5/oyYTaTHGSg2uuTjd3AoVOy40gQFRiXfvBLam
 mAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hszrK5X1zKFPcgVtNADuTzMFuaYAiaXIMIPUe65dQ1c=;
 b=smfYRmj3p7BWpvoz54MnY9Igjbw9Gs/hR0hI2pjKuK7Oo3G52NhAxRtoEQobwyAlEW
 0aHzPZ7AwewF9sZbaDYEIg1qfongdjlpsAqcQYn0NYZq8wiECjKJv9nQMKaz8sqeHKQu
 iYwSGTsTcFXjHddtw/W5prTXIlcC6Zo1Z+7HwE2uzzXVcG5xJUr7F0YleZt4z596bquZ
 MkoorbdFnnezPxgED6PIy0bN9CaoGdXr+yvX05MvfC/g07ufe/mlO7CEDVFKc3WLJf3F
 jfQqyeWM11rckeEv1VDqvHb7CW5fcu8Q/VszGkxPisa9UZ1mdxEbsc2q/lJGklHWEj+N
 JLQg==
X-Gm-Message-State: AOAM531jLQJy5SELemB7avQoQIS4QMCMylJmDvT6my/XcAMjcrx1Kaz5
 b7b70I668LsKklcS+i8VAyse+w==
X-Google-Smtp-Source: ABdhPJwF0prQSbFnVEdq5Ijn3i9w9GNTmEZnEwszivkErHQDmTCTmXKl0kbfsaFR0YGqmIwbsMfQbQ==
X-Received: by 2002:a05:620a:2216:: with SMTP id
 m22mr18650156qkh.73.1615656262314; 
 Sat, 13 Mar 2021 09:24:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j24sm7013084qka.67.2021.03.13.09.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:24:21 -0800 (PST)
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313171150.2122409-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8ae61ec-6b2b-c28c-3aa8-943121503322@linaro.org>
Date: Sat, 13 Mar 2021 11:24:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 11:11 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/arm: Constify VMStateDescription
>    hw/display/qxl: Constify VMStateDescription
>    hw/usb: Constify VMStateDescription

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

