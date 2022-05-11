Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6895523F08
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 22:43:46 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1notBR-0000ri-KO
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 16:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1notAE-0008RM-JR; Wed, 11 May 2022 16:42:30 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:35914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1notAC-0004Bu-Qq; Wed, 11 May 2022 16:42:30 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-edeb6c3642so4294994fac.3; 
 Wed, 11 May 2022 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5mqlZpi5bFAzuLYlq1rZ6Q8VlmjU4W82GQKgjGtFAIs=;
 b=XD/qSjiqxMbO6X55SDxHKgLkkQCrSFx/PQsDtJejVgbfDDWA7daul5IDVipCU200xA
 /nRVwJyT90kTLA6gqq8ts+4pD5RiAtMoBdW5qHcntdHYWKXTlk9iq175VIa//2YMeTDa
 dV/4cPE5WVk778DN+2g5q/0bGMdygLti0vOH2I4nVEtioC9FUc2kq5NH8vn68QtJE/UF
 bf57EHPeBSIMRDROLZgoog4mvrUdXCvBlBwcyO3SpWRbtfIgybDCI0wYlAtPq15odoOe
 E79OOLwyHOZG4K+sRfgYSO4+x5LZWwjjAYIAw8qV9KCKhRf7wfhmHRJAlzplml6t977K
 DHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5mqlZpi5bFAzuLYlq1rZ6Q8VlmjU4W82GQKgjGtFAIs=;
 b=S1d3d5Jywtm2C51FS3NzUWiLc/sM+LGCakJoBLc1Ue8zjDpFgRIisqc+8G/jpgje21
 2Yid8GN9508MV5wXVgcGiBvO4kblBq7eHUhGHRTy1JKsjKi4dTOb8AqXupoeVu1+zUcV
 5cJnRkNJUFUY1OWuo9ppRopf4T8hLMO/j/JHatiK1avxADxAkt1S9M/pL3OKX9aWaJ44
 qpI8W4MmDehEPdO/b2RKl4D/FpSvnx7lKeplfwCza6ksl3H1E8nKzxkEcAHz7owAapO4
 Dh03JCH8Ag4zvZZFqRaiPecwLGPwn0SXUzgAPl5DZreF7ezK6h7wAH0c060H5s4ODREQ
 pN1w==
X-Gm-Message-State: AOAM533LKJUeR0H3wWWH22T6HfIG/uzIaRhWmJeebaFeYC3uGlBzWgKu
 7w7GZ9k+Wl6uP0opv9sCLMii51RPrj0=
X-Google-Smtp-Source: ABdhPJyXg5GdWoxH3r7nVr6I0MWi/V5y97ncmi/L9qYHaHjwUnmjGTZI2v5fWLmrcXZDgCTKw8L0Jg==
X-Received: by 2002:a05:6870:630d:b0:e2:6498:6734 with SMTP id
 s13-20020a056870630d00b000e264986734mr3697752oao.3.1652301746781; 
 Wed, 11 May 2022 13:42:26 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a056808090d00b00325cda1ff8csm1108615oih.11.2022.05.11.13.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 13:42:26 -0700 (PDT)
Message-ID: <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
Date: Wed, 11 May 2022 17:42:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
References: <20220506055124.3822112-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220506055124.3822112-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/6/22 02:51, Alexey Kardashevskiy wrote:
> The alternative small firmware needs a few words of what it can and
> absolutely cannot do; this adds those words.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index d9b65ad4e850..4c98a94f9add 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -32,14 +32,42 @@ Missing devices
>   Firmware
>   ========
>   
> +The pSeries platform in QEMU comes with 2 firmwares:
> +
>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>   implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
>   Configuration) Firmware: Core Requirements and Practices
>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>   
> +SLOF performs bus scanning, PCI resource allocation, provides the client
> +interface to boot from block devices and network.
> +
>   QEMU includes a prebuilt image of SLOF which is updated when a more recent
>   version is required.
>   
> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
> +shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
> +
> +VOF does not have device drivers, does not do PCI resource allocation and
> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
> +to PCI resource assignment. It is ideal to use with petitboot.
> +
> +Booting via ``-kernel`` supports the following:
> ++-------------------+-------------------+------------------+
> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
> ++===================+===================+==================+
> +| vmlinux BE        |     ✓             |     ✓            |
> ++-------------------+-------------------+------------------+
> +| vmlinux LE        |     ✓             |     ✓            |
> ++-------------------+-------------------+------------------+
> +| zImage.pseries BE |     x             |     ✓¹           |
> ++-------------------+-------------------+------------------+
> +| zImage.pseries LE |     ✓             |     ✓            |
> ++-------------------+-------------------+------------------+

You need an empty line at the start and at the end of the table. Otherwise it'll
be rendered as regular text.

> +Notes:

I also don't believe you need the "Notes:" addendum here. It's clear that you're
making an observation about the zImage.pseries BE and x-vof=on case.


Everything else LGTM. If no one else has any comment, and you're ok with these
changes I mentioned, I can amend it myself with my R-b.



Thanks,


Daniel


> +¹ must set kernel-addr=0
> +
>   Build directions
>   ================
>   

