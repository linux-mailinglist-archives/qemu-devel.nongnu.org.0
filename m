Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADA55E54E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:24:33 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6C8l-0004Yi-R0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C6Y-00039m-0t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C6V-0004Q4-Pm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656426131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uy6K5wBrEhsnXuBXv3yKzoIeZSoI0VVlvXsVds3+lWY=;
 b=RNuLTsI1pLYlWXYpkzanDkKBpk78VRKsXGOXA16YS3hQ3B3cam6+/gIGLrMcJXA+Q1h42g
 tc+5s8spa6Qiwqd/O8Pt61Mi2J1imFIaaUqKpJCuRhR73fneAR4ECuVx2/S1113MuZ+8Cv
 lj8dFwlaCq1/TR7NaaGR4FissvA26Vs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-jWGW0RApODqvFN1hxlWokg-1; Tue, 28 Jun 2022 10:22:07 -0400
X-MC-Unique: jWGW0RApODqvFN1hxlWokg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso5169198wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uy6K5wBrEhsnXuBXv3yKzoIeZSoI0VVlvXsVds3+lWY=;
 b=LyB68KssXrfGspYUb8G376Dek5Lo90VvY5y1q1LKRO87rr9wcR+lcjIRUvFG2o1mQC
 EnatTBc4P3LNFcKJYY81NRXg0mdECSUBY7RoyILBRN793PMxxlT0/n/EzuIANTx62cHq
 tOhomnplT7OUfpKlE4B9HWYES2mKZ5uLYKhABSdflXNu3IpyHG28vOV/l9vdjLYQmsXF
 VOmEGMIzbiPQ2QzpFtZqcZsLC3i24+TqYJWEZ9YQh3MlUBakm7WoNDAGaeeuo1vYVuhn
 lZBPY2Y2Yf7/nM3KauKFBxjEQlFJCpGFjuZg5Xyaiqdw1FVjZjJ6Tw7PhwH95f6+L/5O
 40BA==
X-Gm-Message-State: AJIora8DLik/LGtfz7m2DxCKVt61HNsSBXfr2WY/aP/2p30f/hjYTy+t
 V0vPOzWvek3mHZ1hsx8JzI5HCSTGvprTmroQDABVyYbD9QOPnyDjKF7pLam0taIP8ZynWHjnJkn
 df1mzjX9FD213WRs=
X-Received: by 2002:a5d:598e:0:b0:219:ea16:5a2a with SMTP id
 n14-20020a5d598e000000b00219ea165a2amr17559810wri.343.1656426125380; 
 Tue, 28 Jun 2022 07:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v64wCZhlg8VprspRTcSdCFJz6xYBE0SyABwVuM0VcAozHyHIONcKRJ9gjrjNp5dQUotS0aJA==
X-Received: by 2002:a5d:598e:0:b0:219:ea16:5a2a with SMTP id
 n14-20020a5d598e000000b00219ea165a2amr17559779wri.343.1656426125118; 
 Tue, 28 Jun 2022 07:22:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c2b9400b00397623ff335sm16956319wmc.10.2022.06.28.07.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:22:04 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:22:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Message-ID: <20220628162203.07551a58@redhat.com>
In-Reply-To: <f76a7763-7c15-045a-acc2-0a7cb939661b@inria.fr>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
 <f76a7763-7c15-045a-acc2-0a7cb939661b@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 23 Jun 2022 16:59:01 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> .. which will be used by follow up hmat-noinitiator test-case.
> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
>   tests/data/acpi/q35/FACP.acpihmat-noinitiator | 0
>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
>   tests/qtest/bios-tables-test-allowed-diff.h   | 5 +++++
>   6 files changed, 5 insertions(+)
>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
> 
> diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/FACP.acpihmat-noinitiator b/tests/data/acpi/q35/FACP.acpihmat-noinitiator
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..ae025e3a3e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,6 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
> +"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
> +"tests/data/acpi/q35/FACP.acpihmat-noinitiator",
> +"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
> +"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",


