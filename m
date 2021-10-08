Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05026426D7C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:28:23 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrnK-0001ln-2S
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrlp-00005F-3k
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:26:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrlm-0006YF-TN
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:26:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id v25so30902539wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wcWyrvxOKLEpdq6q7EwxjxFJw9h5PmcqB4+2loQL3ls=;
 b=tzivasKij+So4F0iZc1QDLAFUrbjwWWTXQVezttHk4Hz6HSCEnDXvlFiC0DQoUASuS
 T0nDLv5QJWoumOn/wK07hfVPUIHvh058o+ALc7tMHD9TCtAG2cUd53BUzo6ZvdGCxQFI
 JbcZQtQj7zZfQiSfTqACfljfi5agctOo2eVxUtKRqUCD7SP4xmSwU4Veaag17wIp/IIR
 p1yg9TnH/EEiky4fSJh8rvMer5niH65eetGLZi/5bqTfITJSofpPIfLH26E4pj75j43M
 qoNVlL4ShmtdjRfa6VObEJk9Q3D4dcBjKkqTl9XQnsV3LIHtDWdvLb3iWxTKykaJP0VE
 BJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wcWyrvxOKLEpdq6q7EwxjxFJw9h5PmcqB4+2loQL3ls=;
 b=tPsRKpMHCo/isJj3PgQO/P9q74SrcPaCF034zCtufuMhoB8gaRmzDWNL7p06YKaiLy
 QueA3bTpjyfMyCXaoFTmb11GL9tRm9wpTPnLk75OK3/4h/fgMK4sc+ReZHKisNWB9mdP
 JhN/V4rAF9l0mmt0hjw5T2Kn0/DYL7O2jaNgcJu/rHGr7FbQoWSeH9thJ81M1YTfHMIi
 Cl4UBeOGoP+O8ln9f3FUC+4W/gLzGTKg362ZUU/f4V4z3OTEiYcPuRmXggGvVgMI9bjs
 NS+7x/rYaXkaGrNHEve/QestW1/ueyfO3tw2bKQjypJsHSNvcbxQ8OLrkOaT8VUGszN6
 Zz0Q==
X-Gm-Message-State: AOAM530K/c6U/e+pli6ZZf6ldjrRPXKMrNlooMRF3jS1nHpCe7isQkZM
 F/Gn1+J63cXsNVxf5/5eD2A78A==
X-Google-Smtp-Source: ABdhPJyCZCGGXEGhEm6GrDmrwBRMlTgN1fQrVEbAbpSgMmc78LUZgXtKJmF6uzat9KoFU6Y0DtsMnA==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr4718159wrb.318.1633706804956; 
 Fri, 08 Oct 2021 08:26:44 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v23sm2777723wmj.4.2021.10.08.08.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:26:44 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:26:22 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected data
 files
Message-ID: <YWBjHrELdZIBXcOD@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
 <20211006101215.24414401@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006101215.24414401@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 10:12:15AM +0200, Igor Mammedov wrote:
> On Fri,  1 Oct 2021 18:33:56 +0100
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Create empty data files and allow updates for the upcoming VIOT tests.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
> >  tests/data/acpi/q35/DSDT.viot               | 0
> 
> does default tests/data/acpi/q35/DSDT differs from
> DSDT.viot?

Yes the VIOT test has one more PCI device (virtio-iommu) and PXB devices,
so there are additional descriptors in the DSDT

Thanks,
Jean

> 
> >  tests/data/acpi/q35/VIOT.viot               | 0
> >  tests/data/acpi/virt/VIOT                   | 0
> >  4 files changed, 3 insertions(+)
> >  create mode 100644 tests/data/acpi/q35/DSDT.viot
> >  create mode 100644 tests/data/acpi/q35/VIOT.viot
> >  create mode 100644 tests/data/acpi/virt/VIOT
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..29b5b1eabc 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,4 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/virt/VIOT",
> > +"tests/data/acpi/q35/DSDT.viot",
> > +"tests/data/acpi/q35/VIOT.viot",
> > diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> > new file mode 100644
> > index 0000000000..e69de29bb2
> 

