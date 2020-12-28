Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB112E335B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 01:36:50 +0100 (CET)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktgWm-0003qn-Lk
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 19:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1ktgVW-0002sq-Bg
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:35:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:49892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1ktgVU-0001p2-0p
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:35:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8643229C6
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609115724;
 bh=j3DVuoV/WpTulCnP8D93EPx+NRwN7IRIvFWAtT6fknk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IxZBf0IbAT53T5domnl+kKZvoRa9hq2bpSLgRAuddMIV3+szaRGm9qonutJAFyGPZ
 ryada7ef1MA2LxHVivmlXOwiX/yOL4u4EZ7+bpGX6PWTydnA2YzyRJWQ+a8FHzpvor
 wVR/9a0vVVHbc0aXieQW2F5tN+73z/d4csu4ZSLqnwB1cFtVvYmcde/3kjWxEGmSU6
 FGoS83DbAGWumjN6mWWVkA+7OkcPMSp0CuZYA62ZC9sXkCGRctwrRMRH/7W/hJhG+D
 eqVU3AUaekTlsFiCaxksSjLtF2e1N8IS29AFROw12+46P1V7DOU+Y8loTcoPLMS3KN
 Q51ZSnhgllGMw==
Received: by mail-io1-f42.google.com with SMTP id u26so5413301iof.3
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 16:35:24 -0800 (PST)
X-Gm-Message-State: AOAM533o6wEgcabVXuGIMIB7kO4Y/7GU/iwDZ5BVaCbNKv8i7yDjUCpP
 RBIdrsBJGeGAR7vK/7CJjDUJ/47uLtAueoMbiO8=
X-Google-Smtp-Source: ABdhPJyt/75vuo81w/l67mFYvOgfWnTVpDeOYwVP/glpd6Wi5B8J3L5/mhiR9i11G9vdV7HakDeLV8dV0zlEH9TX1w8=
X-Received: by 2002:a6b:dc0f:: with SMTP id s15mr34720808ioc.180.1609115724367; 
 Sun, 27 Dec 2020 16:35:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <2157782addb379824c71edd301108f7799302694.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <2157782addb379824c71edd301108f7799302694.1609031406.git.balaton@eik.bme.hu>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 28 Dec 2020 08:35:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6YE5-GbK52Pj-Lrr2uCkaXR298umq1vonBCXN5cxQFwg@mail.gmail.com>
Message-ID: <CAAhV-H6YE5-GbK52Pj-Lrr2uCkaXR298umq1vonBCXN5cxQFwg@mail.gmail.com>
Subject: Re: [PATCH 01/12] vt82c686: Add APM and ACPI dependencies for VT82C686
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, BALATON

On Sun, Dec 27, 2020 at 9:21 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Compiling vt82c686.c fails without APM and ACPI_PM functions. Add
> dependency on these in Kconfig to fix this.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index c7f07854f7..2ca2593ee6 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -47,6 +47,8 @@ config VT82C686
>      select ACPI_SMBUS
>      select SERIAL_ISA
>      select FDC
> +    select APM
> +    select ACPI_X86
I feel a bit uncomfortable with ACPI_X86 in the MIPS code, can we just
select ACPI? And if that is not enough, can we select more options?

Huacai

>
>  config SMC37C669
>      bool
> --
> 2.21.3
>

