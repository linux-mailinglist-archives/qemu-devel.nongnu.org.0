Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C1380AB5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:49:51 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYCM-00061c-Mw
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhYBZ-0005Ak-Ke
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhYBX-0003L4-8O
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621000138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8NQnATMMwLcSfxyjGe3R7vV9VD2kXYHHaVjzezCXllw=;
 b=TbEVOFbpPDbCEWoIY17PnnPcS72gtmuX2loXkHGNZKKBsH83KaHBePokeXATzVhUP2J0ZV
 rw23nHKDsjlxcYerI/xnl1Wai12bbdBN7/fD0/lDvn8CS6AXtLhKXi4PhcWVPrhnvmOurR
 w3B2r6xOIK+DHaFP66Rft0a3Ha1xY7M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-yVqpu2ChMN-OhANiALk-ig-1; Fri, 14 May 2021 09:48:57 -0400
X-MC-Unique: yVqpu2ChMN-OhANiALk-ig-1
Received: by mail-wm1-f71.google.com with SMTP id
 c138-20020a1c9a900000b0290173dd9788cdso103217wme.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8NQnATMMwLcSfxyjGe3R7vV9VD2kXYHHaVjzezCXllw=;
 b=CDym/ucYR5ayCNlGx2DGLHOIBaXbgGiX8rM3UET3Iv3YNLmQ/sFI2fBXx8UKIAEkIb
 rqVkY9VZclSTbWCmdhGIgAxXa9SUgK9mLpmGuc3vVejW/R6Xvc5WN5ujSvCrSTigwsRc
 9mO2qrQbM5sdGYbSWYH3i5Jd+X7erBXYOHzaxt3JrHtJuJyCEUlAMDBq88M/qrpZNexi
 1UG+UyQ3+W76az7Toeg6W/nP8bKSQwlQBQdwrZJ8bV646RzJmN9m90eHRVVM+zoKCX6x
 SVC/+i5/OrHU8oLh1OvOyy/0Zdz2s1XwRUuHXDOv+4Ti/GcuaH5QJka9Wl5f3J8zSzYl
 uBdQ==
X-Gm-Message-State: AOAM531kzpg1ziC25vhXuuffArVzGTn+Z0HuY8HsC2v/Ua5/0qXN+RRC
 9Gl2QWNperxOtZExl4IZ1dUK7duaDLZAQVH64FpRZUiRW0urbwVbLy64ISU4G4Dn9+Xt12b+781
 0yH+/cs78B2sOwgA=
X-Received: by 2002:a5d:670c:: with SMTP id o12mr7109895wru.223.1621000135818; 
 Fri, 14 May 2021 06:48:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzioe4rEPK76p+Oj7wyMqsHgvD8J4h79dUNvt6LEzXrbIwrSznmCNEp41QDcYlo/WjkppgeTw==
X-Received: by 2002:a5d:670c:: with SMTP id o12mr7109866wru.223.1621000135566; 
 Fri, 14 May 2021 06:48:55 -0700 (PDT)
Received: from redhat.com (bzq-79-181-160-222.red.bezeqint.net.
 [79.181.160.222])
 by smtp.gmail.com with ESMTPSA id p7sm6550245wrt.24.2021.05.14.06.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 06:48:55 -0700 (PDT)
Date: Fri, 14 May 2021 09:48:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH v4 0/1] Rework ACPI OEM fields handling to simplify code
 (was: acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Message-ID: <20210514094819-mutt-send-email-mst@kernel.org>
References: <20210401202928.16082-1-posteuca@mutex.one>
MIME-Version: 1.0
In-Reply-To: <20210401202928.16082-1-posteuca@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 11:29:27PM +0300, Marian Postevca wrote:
> This patch consolidates ACPI OEM fields handling
> by:
> - Moving common code in PC and MICROVM to X86.
> - Changes unnecessary dynamic memory allocation to static allocation
> - Uses dedicated structure to keep values of fields instead of two
>   separate strings
> - Adds helper functions to initialize the structure


I'd like to apply this, could you please rebase on top of my tree?
Conflicts with some changes there.

> v2:
> - Move the setters/getters of OEM fields to X86MachineState to
>   remove duplication
> - Change commit message to make it clear the second commit is
>   a re-factor
> 
> v3:
> - Rebase "acpi: Consolidate the handling of OEM ID and OEM
>           Table ID fields to latest" to latest HEAD
> - Dropped "acpi: Move setters/getters of oem fields to
>            X86MachineState" since it was accepted already
> 
> v4:
> - Drop helper macros and use static inline functions instead
> - Removed variables starting with __
> - Used consistent naming for helper functions that start with ACPI_BUILD_OEM_*
> - Didn't drop the defines ACPI_BUILD_APPNAME6 and ACPI_BUILD_APPNAME8 since
>   ACPI_BUILD_APPNAME8 is still used in build_header() in aml-build.c and it
>   feels better to keep them defined together. But if others prefer to drop the
>   ACPI_BUILD_APPNAME6 define, will resend the patch.
> 
> Marian Postevca (1):
>   acpi: Consolidate the handling of OEM ID and OEM Table ID fields
> 
>  hw/acpi/hmat.h                   |  2 +-
>  hw/i386/acpi-common.h            |  2 +-
>  include/hw/acpi/acpi-build-oem.h | 61 +++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h      | 15 +++---
>  include/hw/acpi/ghes.h           |  2 +-
>  include/hw/acpi/pci.h            |  2 +-
>  include/hw/acpi/vmgenid.h        |  2 +-
>  include/hw/arm/virt.h            |  4 +-
>  include/hw/i386/x86.h            |  4 +-
>  include/hw/mem/nvdimm.h          |  4 +-
>  hw/acpi/aml-build.c              | 27 ++++++-----
>  hw/acpi/ghes.c                   |  5 +-
>  hw/acpi/hmat.c                   |  4 +-
>  hw/acpi/nvdimm.c                 | 22 +++++----
>  hw/acpi/pci.c                    |  4 +-
>  hw/acpi/vmgenid.c                |  6 ++-
>  hw/arm/virt-acpi-build.c         | 40 ++++++----------
>  hw/arm/virt.c                    | 16 +++----
>  hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------
>  hw/i386/acpi-common.c            |  4 +-
>  hw/i386/acpi-microvm.c           | 13 ++----
>  hw/i386/x86.c                    | 19 ++++----
>  22 files changed, 188 insertions(+), 148 deletions(-)
>  create mode 100644 include/hw/acpi/acpi-build-oem.h
> 
> -- 
> 2.26.2


