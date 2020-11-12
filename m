Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4B2B102E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:25:00 +0100 (CET)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdK5U-0003Cq-13
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK4E-0002go-Vv
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:23:43 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK4D-0000oG-Em
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:23:42 -0500
Received: by mail-pg1-x534.google.com with SMTP id w4so5264244pgg.13
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ViKOv8vRZojipyk9+vrgQUVbIG9PPmfvv0+5YXZ9fqM=;
 b=JusJU9xyrmHE/cNZ1/HW9DOfbSHl17bhYFKApQV19DjXIffOaPztU9HhAmXA93n7ul
 F5XffT/PLAPiEonJWi/XeQgIdR+RFPT8ayYkHxbEfrzCb/pRcrk2Gj8U7dUbowiA7OmP
 B7CI9/U2kR3zGOjMtLRPodlW6GWitcxqEJ37DagRsK8pLxY0rqKcenIzZICYxxiv84Yb
 ME295BGuIzlFwl7ZDMpgYR8PGe6te9hMHiq0Pqe+9WngUuxA9g0ZpR7vqgUwKRMGDIBR
 B1VrJjifFEgPWX7I67WnH2MCyg2On6/AHJXX70ZUClC1AZUCGuYVutVzgWtiM5lnr/6/
 9yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ViKOv8vRZojipyk9+vrgQUVbIG9PPmfvv0+5YXZ9fqM=;
 b=f+x72Ydf0kUsPt/4sU08uuwSQ55YS53I+1Xj4vNmdgkFHBoj8bUVneTa1VjNdQCGjU
 FweH4mOPCxFwti8O04pDhrx4xhYnOTDq/M+mYFXpngPRKhnr5vJbByr1VonENcQs8yWL
 0z1cgFT0AOeGB8VbaLe6SGa0ib9WHV5u8sf/WAMn2byOSEb5IhbQTmKsYhaMd/SczEoX
 A7/gyAi2E2ZaMBGpcDoKCbs7ky0oChtbEl45C9FmWrLW+PdKUu1N5e6GNEIkwsNpTuzg
 kxJEveP7h6W0eX0MKKOQNH8dNI2OrEcidFonCvVnBEaefaqC9lt1Pze3IKex/FYQ+ZUV
 egTg==
X-Gm-Message-State: AOAM530FNeozw1nF+u7HeMWA008ob8g69fuYJYN1TNKogliMnqcHYl5P
 R+PoeTrHLQWFPqNyrv+cuprwww==
X-Google-Smtp-Source: ABdhPJzcl2uioSSXSoYws76KLYkwrw3/SfBMOsSIIXsdTYKv0VqXsDsQJMzMMeD9xrUpX/VOZN1YeQ==
X-Received: by 2002:a63:ca0a:: with SMTP id n10mr1154650pgi.326.1605216220144; 
 Thu, 12 Nov 2020 13:23:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 185sm6973692pfg.173.2020.11.12.13.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:23:38 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v2 2/4] hw/usb/hcd-xhci: Restrict TYPE_XHCI to
 hw/usb/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201109135300.2592982-1-philmd@redhat.com>
 <20201109135300.2592982-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc74bd39-e3a7-8bc1-5feb-c467a5605f17@linaro.org>
Date: Thu, 12 Nov 2020 13:23:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109135300.2592982-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> TYPE_XHCI is not a generic device meant to be instantiated by
> QOM objects outside of hw/usb/. Do not expose the type in public
> namespace (via include/).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/hcd-xhci.h     | 1 +
>  include/hw/usb/xhci.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

