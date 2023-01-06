Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572965FFDF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 12:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDlM2-0007cp-ED; Fri, 06 Jan 2023 06:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDlLx-0007bb-98
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 06:57:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDlLv-00041K-Oy
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 06:57:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m3so923094wmq.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 03:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQ9Kowb5UFRkOgPpfWFXH4KBQ/+tEHqkgqWDkXNwP6Y=;
 b=d9sXpq+4d8eMkCoxiotBiOtSnLUz8oDUQ3tITY5+gL03rmO2FHkLLmLWDNDtmovvgN
 Fe9ETCzwIAKowaKgmIbXxRHKYgCvWFRhqSIDfnsgJJBamNoX+azYobkhycGDDppuVpVl
 2IlM1fiUlk56BWgYivCDdCOzHwqzsZC5QbNaX2jmZ77qGiu4PFz2dIeio3qkhoNPSd77
 eR9KpqN2juo0hRXp/qKWlzU7KMyZywpNRWBkJTRCMu3TMjN9eBmCt/aJ6q56ad+Fibkv
 IG+akgSDZrh3W7PRyM1oUNqCakhHgMhgk5y26xsJc9aP2k44Pj/8CmbPmN9Cj3bMGsaV
 RCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQ9Kowb5UFRkOgPpfWFXH4KBQ/+tEHqkgqWDkXNwP6Y=;
 b=PioTpZSgr2jU1cmj5VNqk7u08K/ELKYqqPybeOm5O5odcFgAnLOsjZF3kt5Yd5VUOi
 YbgfWKfVYFdUd1GwWOKY/QWKV4TMCxa0kuVeoxB0YNPZYcJDJiwO3AHHHyB0RKxc90Yg
 adTZq+6NPv4p0cN5vVZY450gCOTSvIxqJdJa/SwfcgR74S2YrQlbJv54anp45WUoWDtF
 Gp3jtyMG6aaw2le6hoRO+74365nU0hFA/K2b+szjNR/b4MkCHLCACeNfqmajpgKtsKpv
 8Lhcnl980JojypnJMEqvEW1V3+5tD13xPRUbW3Sr5QZyc+ZeSK6q+mxLPPkiRXXR6B7U
 fYIw==
X-Gm-Message-State: AFqh2kp220gSPzWBx5TQ6RffLlc9jdFDGaMgmGVsGChLywTJsPsCHKYl
 PszhZDnUVGKVTg75OnQAcGJTPA==
X-Google-Smtp-Source: AMrXdXvpiH0G7ilhuGahW1cHjf2pUXcdmsybnk998JOjlc2MLayIBWPwTHO5vSVZp70nR2sTqKWLWw==
X-Received: by 2002:a05:600c:1d0e:b0:3cf:8957:a441 with SMTP id
 l14-20020a05600c1d0e00b003cf8957a441mr5375775wms.12.1673006257713; 
 Fri, 06 Jan 2023 03:57:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm1658783wmo.3.2023.01.06.03.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 03:57:37 -0800 (PST)
Message-ID: <3d0a30ac-7c1b-7868-b06e-c676c84e398d@linaro.org>
Date: Fri, 6 Jan 2023 12:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230106113927.8603-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230106113927.8603-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/1/23 12:39, Bernhard Beschow wrote:
> mv64361_pcihost_map_irq() is a reimplementation of
> pci_swizzle_map_irq_fn(). Resolve this redundancy.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> Testing done:
> * `qemu-system-ppc -machine pegasos2 \
>                     -rtc base=localtime \
>                     -device ati-vga,guest_hwcursor=true,romfile="" \
>                     -cdrom morphos-3.17.iso \
>                     -kernel morphos-3.17/boot.img`
> ---
>   hw/pci-host/mv64361.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


