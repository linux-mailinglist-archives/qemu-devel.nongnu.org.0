Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389E332888
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:26:21 +0100 (CET)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdJU-0002OM-8i
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdEk-0005Gv-NR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:21:27 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdEi-0003PU-63
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:21:26 -0500
Received: by mail-ot1-x333.google.com with SMTP id v12so12911621ott.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tO11odYloYiBNqHHEty762zU7hnMijqxpbqOAqSkBmA=;
 b=PKGy5vvYva8Lxh64476y2pqpAr/lH0BcAkf5jkORpUmmnlRDM3jVPv+WwRQd2Kqi1Q
 MxeQVNozRVJseEMNDikRFvO6dVKR8WFaj5s+U2gguZ3NGwQuvVIbihhL/TKSExplT/1O
 4A4GZ7nFcFNjsnYaHcQbAwkpdB0LrfxoQ6d4YY9rQYf85hCSgF6xYX9NjwIw0U0196tm
 Urx9q1eMQfe5EGQqv4KfjnymHkp89TNcNCpqbDxignZ8PfJ8sX0ExT/+VM+ty41QHVVu
 C0bCVrT3JYCePQW0KPXSSd/T1qu0PTxepynM5eikbw9f65uJrH7myKQC/0n1UcG1Yo45
 BYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tO11odYloYiBNqHHEty762zU7hnMijqxpbqOAqSkBmA=;
 b=uQeDd/jvdoBAUYTrn70YVjF/KyB9knvxgbm9IcuQVcZvT6YdZWWU2WxDHQ1fxWSWNc
 4khg1NSKDhG+igw17bId5lz3drrvmQ2+H0RswsL8Qutqsk12Kd4ZZUaFFclZZcY9xSkD
 Ui9JDI2Kc/ygziTBfhubDVFLPkQNVtCBnyrm1PBjqi5vWPq5Z2d5J2mc7jBfRGqDy8aj
 uEdGrldz5rgcCsiMY+kw3lWQO0yM9KMt2BZ5x6T5uYTd3mNMI3mBqJFR5UrA7vg1Jefg
 bdAZndS/P8wbGk/fZeUsG1KxjzJi/D6VwPh8UkI2A6K3LXASdSleGJJqbmkImxCvzdS1
 vXQw==
X-Gm-Message-State: AOAM532BFAVjH3i0Ex873Upa2oi+APs5thMc5Hux392zWNZgRejdeSaJ
 ulmEFjAz1G+KwcZBYqgJuWzk+w==
X-Google-Smtp-Source: ABdhPJwDC4xwIvllDqdVsn1gJG7PEx3LLEewra0Ghd110Yb/4LokdAJXDKFMYUU0vR2XzqpkyZvLFg==
X-Received: by 2002:a9d:2d8a:: with SMTP id g10mr14540089otb.212.1615299681272; 
 Tue, 09 Mar 2021 06:21:21 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v10sm1889584oom.12.2021.03.09.06.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:21:20 -0800 (PST)
Subject: Re: [PATCH v2 2/3] target/m68k: reformat m68k_features enum
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
 <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32ff3525-4f69-c1cf-2f2c-7a95ead9496d@linaro.org>
Date: Tue, 9 Mar 2021 06:21:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 4:11 AM, Mark Cave-Ayland wrote:
> Move the feature comment from after the feature name to the preceding line to
> allow for longer feature names and descriptions without hitting the 80
> character line limit.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

