Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEE448C745
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:36:40 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ffz-0001on-7T
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fJi-0008Pj-8W
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:13:38 -0500
Received: from [2607:f8b0:4864:20::102f] (port=41590
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fJf-0007zB-TQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:13:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5373669pjp.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=deXn9jMg+iJKRd5SslC2x4k33JfADvu7c98pE7ui12M=;
 b=jbcK39KnI9J+ujrsWPIg93oe9AhpYLaSGaHCXZvfisFXHMnYn9xvFpKH7E/KB+2Ifn
 Uvbnb7WoyuYeTLVe9JDcEgoUef0mIE7tdB4cODnTvM6R/XoYkk7Bxf2Y3X9/0TJckr2F
 J9AAL7KgqRpWSzUFTik0GTgkKPN7GGkECuCB0pNw0FoNcDpebqEo7yGF3sXLoEHE6C+d
 OJES2oM02xsfAvmvjWbg1rvF+zGOLOR4C6OiDXc4Ez8QM4AIXIYkYzG+mipzZu+mLgJ9
 wodM3PAEX0b6p/8znluR6Sh9xxFlyky7k/Qalj8xJpfnDdELVUTtj2oxffFUunqmwQiE
 2ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=deXn9jMg+iJKRd5SslC2x4k33JfADvu7c98pE7ui12M=;
 b=r/rlKKq9dGNIsSgR/4IoAUPBxAQIVZvNLwo1dC+rwmiloB4536/dn5ygT+xx5jhZIa
 AciwtcvmddVvzC7antkTdQwveguzDwuwOuJsFq7rlF1AiZFHreVSSmcN4OHz8mjHtUED
 RyTlSj1wzL2ajUc7f9cVMsQ5CGoiFiZ10uMxqyGNgdHQBrJzKeg7dn1IvANSxS/EQCa2
 BiPAqAZ268HBPZHLIY33WN2lt54VYGl1d4Zebbahojq2zi2rprjKpMBtSDtAfVb9yqcj
 5+xFp4o4EW0UBJ27a18NJQKZC5mZaIMXZKq2VL95tsaLesAG8E+ugD5r+aEViIJwKeWI
 +iMQ==
X-Gm-Message-State: AOAM532w9hi31vG/3MtTOceznbaKCZsahBC6aWw6MmOzTMxaFQdPNQ/H
 G2ww8eCg9xKsfzz31v/VMO3j0A==
X-Google-Smtp-Source: ABdhPJx3EFNLhmOE8Ns9h+rRQEBsHTHlIOIkKSRfZSlVGdRUeyBtF/Yi7Pv6HRxTqquM3fKRpDatFQ==
X-Received: by 2002:a05:6a00:15c8:b0:4ba:fa69:3807 with SMTP id
 o8-20020a056a0015c800b004bafa693807mr9815691pfu.10.1642000412195; 
 Wed, 12 Jan 2022 07:13:32 -0800 (PST)
Received: from [10.6.18.10] ([84.252.93.8])
 by smtp.googlemail.com with ESMTPSA id
 r10sm14054124pff.120.2022.01.12.07.13.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:13:31 -0800 (PST)
Date: Wed, 12 Jan 2022 20:43:26 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 4/4] tests: acpi: update expected blobs
In-Reply-To: <20220112130332.1648664-5-imammedo@redhat.com>
Message-ID: <alpine.OSX.2.20.2201122043050.60839@athabasca.local>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-5-imammedo@redhat.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 12 Jan 2022, Igor Mammedov wrote:

> Expected changes caused by previous commit:
>
> nvdimm ssdt (q35/pc/virt):
>   - *     OEM Table ID     "NVDIMM  "
>   + *     OEM Table ID     "NVDIMM"
>
> SLIC test FADT (tests/data/acpi/q35/FACP.slic):
>   -[010h 0016   8]                 Oem Table ID : "ME      "
>   +[010h 0016   8]                 Oem Table ID : "ME"
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>  tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 734 bytes
>  tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 734 bytes
>  tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 736 bytes
>  5 files changed, 4 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 7faa8f53be..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,5 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/SSDT.memhp",
> -"tests/data/acpi/pc/SSDT.dimmpxm",
> -"tests/data/acpi/q35/SSDT.dimmpxm",
> -"tests/data/acpi/q35/FACP.slic",
> diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
> index a50a961fa1d9b0dd8ea4096d652c83bcf04db20b..ac55387d57e48adb99eb738a102308688a262fb8 100644
> GIT binary patch
> delta 33
> ocmcb|dXH5iIM^lR9uortW0;e_vq!LkUzm%huP+0`Mu}rg0HzrUKL7v#
>
> delta 33
> ocmcb|dXH5iIM^lR9uortqnMMwvq!LkUzm%hudjl_Mu}rg0HV1GKL7v#
>
> diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
> index 891fd4b784b7b6b3ea303976db7ecd5b669bc84b..15986e095cf2db7ee92f7ce113c1d46d54018c62 100644
> GIT binary patch
> delta 32
> lcmeyu_=Qoz&CxmF3j+fK^CjmX$6yZyUsoUp2qsG00RW!Z2#x>%
>
> delta 32
> kcmeyu_=Qoz&CxmF3j+fKvygL;W3Y#Uud4zWOq93-0G2oijsO4v
>
> diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
> index 617a1c911c7d6753bcedc8ecc52e3027a5259ad6..98e6f0e3f3bb02dd419e36bdd1db9b94c728c406 100644
> GIT binary patch
> delta 33
> ocmcb|dXH5iIM^lR9uortqnnezvq!LkUzm%huP+0`Mu}rg0Ho;&F8}}l
>
> delta 33
> ocmcb|dXH5iIM^lR9uortBb$@Ivq!LkUzm%hudjl_Mu}rg0HKKqF8}}l
>
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index e8b850ae2239d8f496b12de672c2a1268e2f269d..375d7b6fc85a484f492a26ccd355c205f2c34473 100644
> GIT binary patch
> delta 33
> ocmaFB`hZm;IM^lR0TTlQqrH>Avq!LkUzm%huP+0`Mu`(l0HqiSFaQ7m
>
> delta 33
> ocmaFB`hZm;IM^lR0TTlQ<9{cAXOCb7zc3e1Uta}<jS?rA0JOLYFaQ7m
>
> --
> 2.31.1
>
>

