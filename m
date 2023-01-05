Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD765E61F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 08:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDKiR-0000RR-N7; Thu, 05 Jan 2023 02:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKiO-0000R7-Mk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:31:04 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKiM-0003tH-Ti
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:31:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id d4so27280105wrw.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 23:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=beqdtDmznkoL4lMqeArfgw0rDP6n2wrcj81zQ+yAqWM=;
 b=P+WCQuMuuM7pQ3uod+3pzyzJFPTzjTPPigNR/xEYDV/OmmmijOM0DRxbbfMhpIXisc
 EVTdnU+hFDpEppWYo9/vNOe5ueSUvD2RPAIy2UZz2Y9le/qHCjx918GRh0MW0SEbK6/s
 KS4lULJJH5HcDe4QAfGo4zFD/1rwdu0Etaqr4+xgXx1ri1Phhds8wl2h7hl7EtfMo74B
 eoOsz0VWNHZRNWNwmhIpC6JcgpboTI5OtGzTbZM8Kr91tNHAe3SEvTIKGnbK9Kaebk8F
 2r1IK75QtzaSNSvAMV2ihQeOHQ8Mg7IVq0WbXv4mYm+xMqoRv+0viarNzFC3QxsuaCqV
 YTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beqdtDmznkoL4lMqeArfgw0rDP6n2wrcj81zQ+yAqWM=;
 b=e5tml1SMehOOX62/uFGys+otrp35vieyTsnntMnRzuS2RiKLMAwU8Sb9y/uZXKp8Ti
 KSYGkRB/1t5rRzbrBdEBIh8EjLtvGUG8EcFPE/fkFqAwp7ubJWg92HntYZKR28Lm99+W
 3RVnXFvcQ4b45Hlj+PdSP0oCYfMWFJwjM4nSifDdPCs17oZhRW2DxMCFpGr41T6gQTMd
 nrop8+rRsh3cnZfwLAAUUXi3U1/JBacmgFTPNTFSnrHazfJW4abClDKDBORe7S7tFl2h
 NlN2MY2Ql4IuvpmD3OuFrPozCXnI3Bg8atoOnKZdrL44hw6ImQffc+cVDtCGjUhuWYw6
 P5rQ==
X-Gm-Message-State: AFqh2kobrRGKCDF0FCltj2+Ubz/b4YwziQmoqTClbRhGQh75V+hjpLTj
 cvmyHB3LU90Lc8H4WvQ1MLygSA==
X-Google-Smtp-Source: AMrXdXtz2LpCfaxo1JkbQDNqp+qVOiJnoqEG79bB3FSXJ6hj/oxAW9Qiyr2dea8nHcg9VhaiLULYxg==
X-Received: by 2002:a5d:4e0a:0:b0:27b:d6c0:78a6 with SMTP id
 p10-20020a5d4e0a000000b0027bd6c078a6mr21819564wrt.7.1672903861497; 
 Wed, 04 Jan 2023 23:31:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d484e000000b00242814c2cf0sm35936984wrs.4.2023.01.04.23.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 23:31:01 -0800 (PST)
Message-ID: <0b8d056d-710b-fe80-6421-96753a4b963c@linaro.org>
Date: Thu, 5 Jan 2023 08:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 7/7] mac_newworld: Document deprecation
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <baf0bed71eec81fac16b6495e781cc6b42cdd155.1672868854.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <baf0bed71eec81fac16b6495e781cc6b42cdd155.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 22:59, BALATON Zoltan wrote:
> Also update PowerMac family docs with some more recent info.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   docs/about/deprecated.rst    |  7 +++++++
>   docs/system/ppc/powermac.rst | 12 ++++++++----
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 93affe3669..07661af7fe 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -248,6 +248,13 @@ These old machine types are quite neglected nowadays and thus might have
>   various pitfalls with regards to live migration. Use a newer machine type
>   instead.
>   
> +``mac99`` variants other than the default qemu-system-ppc version (since 7.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``mac99`` machine emulates different hardware depending on using
> +qemu-system-ppc64 or ``via`` property. To avoid confusion new machine
> +types has been added for these variants which are now preferred over
> +``mac99``.

^ this part is OK,

but below is part of patch 4/7 "Add different mac99 machine types".

> diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
> index 04334ba210..d4a47a6881 100644
> --- a/docs/system/ppc/powermac.rst
> +++ b/docs/system/ppc/powermac.rst
> @@ -4,8 +4,12 @@ PowerMac family boards (``g3beige``, ``mac99``)
>   Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
>   PowerPC system.
>   
> -- ``g3beige``              Heathrow based PowerMAC
> -- ``mac99``                Mac99 based PowerMAC
> +- ``g3beige``           Heathrow based old world Power Macintosh G3
> +- ``mac99``             Core99 based generic PowerMac
> +- ``powermac3_1``       Power Mac G4 AGP (Sawtooth)
> +- ``powerbook3_2``      PowerBook G4 Titanium (Mercury)
> +- ``powermac7_3``       Power Mac G5 (Niagara) (only in ``qemu-system-ppc64``)
> +
>   
>   Supported devices
>   -----------------
> @@ -15,9 +19,9 @@ QEMU emulates the following PowerMac peripherals:
>    *  UniNorth or Grackle PCI Bridge
>    *  PCI VGA compatible card with VESA Bochs Extensions
>    *  2 PMAC IDE interfaces with hard disk and CD-ROM support
> - *  NE2000 PCI adapters
> + *  Sungem PCI network adapter
>    *  Non Volatile RAM
> - *  VIA-CUDA with ADB keyboard and mouse.
> + *  VIA-CUDA or VIA-PMU99 with or without ADB or USB keyboard and mouse.
>   
>   
>   Missing devices


