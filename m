Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27A41F11E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:21:44 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKM2-0007US-FV
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWKKT-0006g5-S7
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:20:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWKKS-0003xI-5c
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:20:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so3934270pjb.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Qmwq8rgNIR2Rt+Q8MVO5EyNJS+QQk13afsgJbkTSuO4=;
 b=7EppTQh2WTl/2ol34nRynKKevenn1I4kklhqVSzJS27ujzpmNxmhMOI2A2FoIm1NqW
 NF5S5YGv77GhTx9w7kW4px+IlEc9RqZGVvwkZt2XCuCAqWfBsFoulfgXLL0r+uatxZx6
 LJiT0Llx4iPvv0zQwE3M8W0ryp0gjK2L4jptdadhS2DbVUFMY4I+xr3yS3C/TnK0ONI6
 gMlhg/aXfiB+/zN6SvTjrdiZzZ48EyZWyq1oENIJ9CXebdNOb6zTHjzzS4FGLWGf1RgH
 OoEZwZpivj2oyx/nXYxYG0zTfqaQfLpGNOlcnKFsiO7QPVyXm2lycEr1zFE0CU9woWUT
 Wkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Qmwq8rgNIR2Rt+Q8MVO5EyNJS+QQk13afsgJbkTSuO4=;
 b=Z37nir3SUS6y3bGD48ilx4zV3l5YI/GvoiJcaMXWrdaSTteuQorTUAo9A9eRLaRtA7
 nBdETgXLldfs3SwIQSGuLi4Jio3dom4XzC1WXl+MO10BM/YRp1vOeBEgxyitg3+Nr0vS
 VTzuhlQbZAzvCVGlRE4vw59JzdeemUDmU5qbhXbW77HTBnAFKgpDZq2ob4q9QkEUd1j3
 EEkPnW1F0XBlIgFOeWxGg0C6ONWpe6DkVcETRMxbc3NYwx5Pr1STWsOQQGTis6Buk/Df
 C44BkGZfDoF6IKcWWoxZfLDQ+gsDOLlSrx/7PGXIAT+5WLwLLfZWGVzlVUKdNmCTJLVE
 V34w==
X-Gm-Message-State: AOAM5325CeBXLhyOLV2V2dNff2NR9mGNegQxNYLiqkpen1aNETV/Xlei
 K1REa0eEekXi7ruESoTlCrIErg==
X-Google-Smtp-Source: ABdhPJzNUneGeufNef+PKa3rRwizkyXgLrKHqyYN6JScjXNNbkxblXCwH4ebsheU+4DFLyOgsrM2Jg==
X-Received: by 2002:a17:90b:4c11:: with SMTP id
 na17mr332155pjb.105.1633101602218; 
 Fri, 01 Oct 2021 08:20:02 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.233.126])
 by smtp.googlemail.com with ESMTPSA id g22sm8410465pfj.15.2021.10.01.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:20:01 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 1 Oct 2021 20:49:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
In-Reply-To: <20211001124935.qal55li6aozocan3@sirius.home.kraxel.org>
Message-ID: <alpine.DEB.2.22.394.2110012049310.579856@anisinha-lenovo>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
 <0eeefb15-1b41-076c-7dd4-ca5fc78eefa9@redhat.com>
 <20211001124935.qal55li6aozocan3@sirius.home.kraxel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 1 Oct 2021, Gerd Hoffmann wrote:

>   Hi,
>
> > > So, in case the first time didn't work (for example due to the guest not
> > > listening because grub just doesn't do that), you can try a second time
> > > once the linux kernel is up'n'running.
> > >
> > > I suspect this patch will break that (didn't actually test though).
> >
> > I think the solution to this problem is to not check for
> > pending_deleted_event value in qmp_device_del().
> >
> > But this has been explicitly added by:
> >
> > commit cce8944cc9efab47d4bf29cfffb3470371c3541b
> > Author: Julia Suvorova <jusual@redhat.com>
> > Date:   Thu Feb 20 17:55:56 2020 +0100
> >
> >     qdev-monitor: Forbid repeated device_del
> >
> >     [ ... ]
> >
> > So do you mean ACPI differs from PCIe Native hotplug in this case?
>
> Yes.
>
> It's one of the issues I'm trying to address with the
>
>   https://gitlab.com/kraxel/qemu/-/commits/sirius/pcie-hotplug
>
> series.  See this commit:
>
>   https://gitlab.com/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba
>

I think the scope of this patch is limited to making the acpi hotplug path
identical to PCIE native path wrt failover. If there are issues with the
existing approach, it should be looked into separately using subsequent
patches.


> So, yes, I think acpi and pcie hotplug should show consistent behavior
> here.  And I think we need some way to recover in case the guest didn't
> respond to an unplug event.  Just allowing to send device_del multiple
> times looks like a sensible approach to me, and given OpenStack already
> does that it looks like the most sensible way forward.
>
> take care,
>   Gerd
>
>

