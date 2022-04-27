Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4995118E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:45:03 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiuc-0007sq-Uc
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njip6-0000LG-3A
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njip4-00010p-5i
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651070357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHkiyV8Z9C4+SM2gFvRL6LU0mjQzp+un8sZH/5OmEW8=;
 b=Nw8mU++nAc/DkEkhPxTsbLFSKqv938duk6a9H5wv54HlsK5w+Trd6GdA51bAwWhkbujXZu
 8XKUa8z67twBayA+kObj8Dim9hhF72ZJi4x01WJWYHRFcu6pqkCTXa74nF2CymqYo37B0B
 w72okR7VA5zQVO8lzEZIQkTgrRfOa7w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-POBrzOOAODSXjyBJ_hd1Nw-1; Wed, 27 Apr 2022 10:39:16 -0400
X-MC-Unique: POBrzOOAODSXjyBJ_hd1Nw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso819189wma.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 07:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHkiyV8Z9C4+SM2gFvRL6LU0mjQzp+un8sZH/5OmEW8=;
 b=JKvGpnW/RqfdDQHD0+M9PwldsIAWbFbxx62iWvIU7QMY1XvvsGI8yyO5OIr/fB8y7M
 R390emRYo44PodkfRhHkWVY23rqeqdsj2b2yaSCmHOzKeUIlxa/3pL77kLEgp/1j/seK
 XjO4U+j7ac1RE1+ahls9d/jVCzLo11vwRrBqruERuvlmO+OcKsbmwHG5S3YC7FqA8VDj
 9/uUDunm5P2cUg5u8eMx/Q6IzBGdd2UTHGE3cOe2UD6zriII9UUzCPvNn5a10BW6keVc
 Uw8PN1jkOxPQGmu30KIYhqGOlO/NXL8tnITE9a/6Pm2XwVMmuMym+ZYtO4acAj7E33Sf
 2HBQ==
X-Gm-Message-State: AOAM530N2rdX4cPTMrAr5n5SqV4ZZqiSz0UjX+SVZnDbkCaM77/sLCtV
 gN8K6HShUHs9Gs5CAV84I3fBTlJ6knujtdJRijOXpvi4Ub9TPQ3kwnDNKSwY1vl6Q1iG9ZcIX5j
 GBDHwuYBFOlX0NWM=
X-Received: by 2002:a5d:54c4:0:b0:20a:d2ea:1f7f with SMTP id
 x4-20020a5d54c4000000b0020ad2ea1f7fmr17141324wrv.306.1651070353842; 
 Wed, 27 Apr 2022 07:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1dt8rrqPtGVeOlGZbLzEAbPAA+bfXE4itRChmhKTNDDQKsM2kTHmxt4vfcRV9ODQtXL12IQ==
X-Received: by 2002:a5d:54c4:0:b0:20a:d2ea:1f7f with SMTP id
 x4-20020a5d54c4000000b0020ad2ea1f7fmr17141301wrv.306.1651070353592; 
 Wed, 27 Apr 2022 07:39:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e30-20020adf9bde000000b0020ad8ffb0f9sm8779091wrc.69.2022.04.27.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:39:13 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:39:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [RESEND][PATCH 0/2] acpi/nvdimm: support NVDIMM _LS{I,R,W} methods
Message-ID: <20220427163912.621bd366@redhat.com>
In-Reply-To: <20220412065753.3216538-1-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 14:57:51 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> The original NVDIMM _DSM functions (index 4~6) for label operations have
> been deprecated by new ACPI methods _LS{I,R,W}[1][2].
> 
> Patch 1 implements the new _LS{I,R,W} methods, on top of old _DSM
> implementation.
> 
> Patch 2 fixes some typo of logical and/or with bitwise and/or, though
> functionally they haven't causing trouble.

generic requirement for ACPI patches,
the should pass bios-tables-test (part of 'make check')

for that you need to update testcase expected data,
see tests/qtest/bios-tables-test.c for the process
also see https://www.mail-archive.com/qemu-devel@nongnu.org/msg875304.html for example

> 
> [1] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html, 6.5.10 NVDIMM Label Methods
> [2] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf, 3.10 Deprecated Functions
> 
> ---
> Resend for previous failed delivery to "qemu-devel@nongnu.org" due to
> 550-'Message headers fail syntax check'. 
> 
> Robert Hoo (2):
>   acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
>   acpi/nvdimm: Fix aml_or() and aml_and() in if clause
> 
>  hw/acpi/nvdimm.c | 60 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 54 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 95a3fcc7487e5bef262e1f937ed8636986764c4e


