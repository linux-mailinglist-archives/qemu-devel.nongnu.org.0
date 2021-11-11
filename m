Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9144D1C8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 06:58:35 +0100 (CET)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml36X-0007hv-TY
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 00:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml349-0006lL-SF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 00:56:05 -0500
Received: from [2607:f8b0:4864:20::533] (port=38573
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml348-0002vf-F9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 00:56:05 -0500
Received: by mail-pg1-x533.google.com with SMTP id e65so4271171pgc.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 21:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vfYTlcLHbAbVB5Q7wTSCJAVxIFIuEU1fhUkRCrwUtdM=;
 b=ATVq4I0y5Nj0jKpf65ofhjd/CezScgbJLAB+Ny1iZZD5dxsSroCYhNa1ygmq52J31m
 e+B5KW2YgQV4xp1v7Wn5xyIXK0DHEegc83H1qAfVN6IY5a23QtmhU6VOz+eF37GM2FyH
 8GAz5cwp0deEmOYJwcGrBTN/ZLBHERoJ/D0HPYdUddOiDe/sIbPZgc7S0/EuyQYtwd0J
 0IH0JiAlKW7MqUk3ayeJYj0GONxwqYU/PKY9vZsskvk/EMxx+F9VeVUPersMH9XuaToR
 GJixlOy9AWK1rFPJlJ9+1Hk62E1HOBzx1tYDFz+Ucsf+q4qPiAq+6UPKywYJEYdy1fwo
 sH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vfYTlcLHbAbVB5Q7wTSCJAVxIFIuEU1fhUkRCrwUtdM=;
 b=0cxis2kOalmyZe3qmIHF7JmBaWFL77w8t4NMjCsrlFPZ4Ym08Wub22tAc26wkNsgTh
 UVttdeNsvKLiXb9TudzjiBftIkZPOuSrI6sMCwuUmL7/rO/VE8IHzo73oF4efdnwo8Ft
 CDsI986Pfq19UOmPpQlljRgKXJQ6bAH94uh8lwfZGzAuBBLpV+MGW+gHQbi/B3IF9Ujn
 OkOaKHR+PRaLwqEcCceL7aBfKfNpSmFSG6L78HAweBLH2BU1mTInv3OahgmIOW80Z163
 6BighTKakogm7LSjeQdSwU2eCYSG/I7qyFalWLvNIEWu5M2vY8zPN6Y4OCFcUeESRqTk
 rziw==
X-Gm-Message-State: AOAM53189RvEG2z6TsuM+plOQy8cByqRWcDsRg6DtoeMnWmj/iZ+Zrhy
 i4Dxtq2mvVhjsX+eTy6ZqSFgfg==
X-Google-Smtp-Source: ABdhPJyH22OptoxbsqxjgxqnRqS6HZlYnHmlsuChSQ/V/hP0dCn6VV6g7vzB55CeI/VxmUy/IUYn5w==
X-Received: by 2002:a05:6a00:1a51:b0:4a0:3c1:4f45 with SMTP id
 h17-20020a056a001a5100b004a003c14f45mr4442233pfv.86.1636610163064; 
 Wed, 10 Nov 2021 21:56:03 -0800 (PST)
Received: from anisinha-lenovo.lan ([49.207.211.103])
 by smtp.googlemail.com with ESMTPSA id s2sm1105944pgd.13.2021.11.10.21.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 21:56:02 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 11 Nov 2021 11:25:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for 6.2 v2 3/5] bios-tables-test: Allow changes in DSDT
 ACPI tables
In-Reply-To: <20211110211140.3057199-4-imammedo@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111111125330.133428@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-4-imammedo@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 10 Nov 2021, Igor Mammedov wrote:

> From: Julia Suvorova <jusual@redhat.com>
>
> Prepare for changing the _OSC method in q35 DSDT.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..48e5634d4b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,17 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.nohpet",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.multi-bridge",
> +"tests/data/acpi/q35/DSDT.ivrs",
> +"tests/data/acpi/q35/DSDT.xapic",
> --
> 2.27.0
>
>

