Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7E59FA68
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 14:50:01 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQppY-0004qQ-7T
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 08:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQpi0-0005Ue-5A
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:42:13 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQphy-0000oz-1c
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:42:11 -0400
Received: by mail-pg1-x535.google.com with SMTP id s206so14929481pgs.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:references:message-id:in-reply-to:subject
 :cc:to:date:from:from:to:cc;
 bh=y4yi0g7ScAdrG0hGel6x+zdnPwn+l3Lqp1uh+Eo+RU0=;
 b=ri1gzUF+WGzT5aCH/c6+R3U5zqglo5ztY5FsF9AvEW4XJ9Qbz7nebofm1A51PyndnN
 p4aEtxeJmvjBbW2NvQbpeSwXzhWJ/NXpDXP2PPMOilVAWvmDBzWRhy/0RyDL5QNu9WQy
 ZZKFL8XdqCeAdRrF/gL0EB0OC9wIDQqrvocSVG6KeDt0mKgygZA7CiE/U+Pav0tUfh9j
 Acin51VoXtz44eDHIAHyvvQxfwKQXjgZCbNFbwlt1XuQaBMAsFeIDVzhl6hgS9WMrJhI
 rU03R1GWQo0+to58ydBekn8n/lbumfeP9K3tAFuOXFSpR38YsGZuddSKabrvI4uWWq0Q
 Jecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:references:message-id:in-reply-to:subject
 :cc:to:date:from:x-gm-message-state:from:to:cc;
 bh=y4yi0g7ScAdrG0hGel6x+zdnPwn+l3Lqp1uh+Eo+RU0=;
 b=IR/KaspBmu6Qw88k+NZX3w/sHWY6Jm+6YmcTcUC9ID8ZdPRIHKRxPQ3/F1PXlCQsH8
 PLdESdhd09Ybvh+AhE3k7Jfk7bQbERBdB1WoBSZpsns0BLq0b35thg/UYeA8Bs1nY3Id
 y4mCwaKnU6LuovyOSA5m1JAm5BxAsDt6LiB4nXu86/XjSvhc7tLy7rw39yWLi0STWamk
 Zpycx4NTaL6DyDX3FAMm2TWgwExebal5Z4ZkwniuR/fLc4GZFxMM2/KvvSIJ5hPiY86z
 Y/azVDFlsgWomSMYNDWvMoP+tD8ZFZ35NDhFNPkp5sL9CVp3m/69mvgBOJjGAfIoVGPe
 sbUQ==
X-Gm-Message-State: ACgBeo1fVW7mL25KBUU8ntCXzOCqf8YFWhdnTua6aQ1wF9koSdK8VlDx
 XRpeA3nHj4Swk2zUoKsgv4gJag==
X-Google-Smtp-Source: AA6agR53SYZsOYplFKVWevU6Dd2sPoDphlrR7faaZ93qy2uk5VLPJ2UAUesKIcDyGrIYa4mxysvNyg==
X-Received: by 2002:a05:6a00:330b:b0:536:a88a:b4b8 with SMTP id
 cq11-20020a056a00330b00b00536a88ab4b8mr13780583pfb.22.1661344927250; 
 Wed, 24 Aug 2022 05:42:07 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.149.162])
 by smtp.googlemail.com with ESMTPSA id
 t4-20020a170902e1c400b001728ac8af94sm12305954pla.248.2022.08.24.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 05:42:06 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 24 Aug 2022 18:12:00 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Bin Meng <bmeng.cn@gmail.com>
cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 34/51] tests/qtest: bios-tables-test: Adapt the case for
 win32
In-Reply-To: <20220824094029.1634519-35-bmeng.cn@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208241745400.562041@anisinha-lenovo>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-35-bmeng.cn@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Wed, 24 Aug 2022, Bin Meng wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Single quotes in the arguments (oem_id='CRASH ') are not removed in
> the Windows environment before it is passed to the QEMU executable.
> The space in the argument causes the "-acpitable" option parser to
> think that all of its parameters are done, hence it complains:
>
>   '-acpitable' requires one of 'data' or 'file'
>
> Change to use double quotes which works fine on all platforms.
>
> Also /dev/null does not work on win32, and nul should be used.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/bios-tables-test.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 36783966b0..0148ce388c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
>      free_test_data(&data);
>  }
>
> +#ifndef _WIN32
> +# define DEV_NULL "/dev/null"
> +#else
> +# define DEV_NULL "nul"
> +#endif
> +
>  static void test_acpi_q35_slic(void)
>  {
>      test_data data = {
> @@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
>          .variant = ".slic",
>      };
>
> -    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
> -                  "oem_rev=00002210,asl_compiler_id='qemu',"
> -                  "asl_compiler_rev=00000000,data=/dev/null",
> +    test_acpi_one("-acpitable sig=SLIC,oem_id=\"CRASH \",oem_table_id=ME,"
> +                  "oem_rev=00002210,asl_compiler_id=qemu,"

ME and qemu should be surrounded by quotes. They are string arguments.
https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html?highlight=oem_table_id




> +                  "asl_compiler_rev=00000000,data=" DEV_NULL,
>                    &data);
>      free_test_data(&data);
>  }
> --
> 2.34.1
>
>

