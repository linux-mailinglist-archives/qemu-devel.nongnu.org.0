Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D66EA66D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:01:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmcs-0002Xz-Fi; Fri, 21 Apr 2023 05:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppmcn-0002X7-QY
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:00:13 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppmcl-0005MI-V0
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:00:13 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94ef8b88a5bso184403666b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682067608; x=1684659608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g/TX6juvxrNRge0RbzEgffYsnFUl50CvQS4ESQezygQ=;
 b=iRZX09VP9L0mqNQs26MOm79Db32kDVcRCo+LHB3s9P2LsJYMYw5VLUb1s6YlwoyjPq
 GsLNVQMP/zyhOmwuf6du/PPEN1MYeX84BHWokU/zc/vguLuc3GOgpvgtfedu3VfxB1im
 EyYZ0um5lQVXlWTdgfdps5nMvmL4ttf9+jWUDAR53Z39x47IVLMxGaAZ+6S+G5LQvqut
 Yd11/gc1ruXuE5bgA29IjZYpmO4ZiZFPaAO7+5yGCsBLUgRH4Z617Rv/3BhexULaA2po
 hgU9349CzrvR0nFEdDsr50sb8W8/MluA4XwD1R02+MLSYKtm9933ELCoHNlSPmDgaWYE
 h++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682067608; x=1684659608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/TX6juvxrNRge0RbzEgffYsnFUl50CvQS4ESQezygQ=;
 b=KVgMdWwIc9JzO4Z9yfAFEIEHAhJIfWHdGuijFyFYwCWiOtNzeLXTzaB8nfPXEMkxze
 qCmKPWDm365aCJfsywgivc1V4qeulkff1tWIVhtIqthpQvG8ufEMx8cFNy1LCvAXdPxc
 SfIgSGtQWl+djf46VtOvt2DUuK4MGQLTnDwZ83bnQJs7y81Hgl/6zNR4watxfXGx+yol
 3SSZmGMiCS7A3xqHbEURswGl4UH1KByvFEjA+40Zg3stLWO6lsnfPgDaPv7TJBbtLXqV
 vTPk9grgyFa4aidImeSJN5Jse6m6QkHDFwdNsl7Eo2gITRcMHtbc5LeR/MZJW+1+kAeW
 jvIA==
X-Gm-Message-State: AAQBX9ec/+zhLSGj6FCdfmkMAPWSSI1jKuRsgbR1NyX5bVIVWGjvk5vn
 ya1nSpptOO6rqRsQw8he8Mu8Xnn+tQU451U4kMEimw==
X-Google-Smtp-Source: AKy350YeV/MOxubG3UxgaQLEKYnrHH8mc1l0z3FPof+8KQPxSKMTviPZrH6sbTz7zSeOvigTFYU2gZ9bOgPUAeLRd8k=
X-Received: by 2002:a17:906:ca55:b0:94e:fd09:a02d with SMTP id
 jx21-20020a170906ca5500b0094efd09a02dmr1737213ejb.47.1682067608001; Fri, 21
 Apr 2023 02:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230421041812-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230421041812-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 09:59:57 +0100
Message-ID: <CAFEAcA8g2GeCmQkx3MvotqNVV7AOD7-6BxFckiYcooJj9-UFyg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type
 and rework inheritance.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org, 
 Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Apr 2023 at 09:19, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Apr 20, 2023 at 03:27:48PM +0100, Jonathan Cameron wrote:
> > Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
> > a device that didn't have that a an ancestor type. PXB_DEV() used instead of
> > PXB_CXL_DEV()/
> >
> > https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/
> >
> > During the discussion it became clear that the inheritance of the various
> > TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
> > fix then cleans up the inheritance of types based on functionality.
> >
> > There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.
> >
> > Before this series
> > TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
> > had TYPE_PCI_DEVICE as their direct parent though they shared a common
> > struct PXBDev for their state.  As a result this state contained
> > some data that was irrelevant for some the types.
> >
> > This series changes to
> > TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
> > TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
> > TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.
> >
> > Each of the TYPE_PXB*_DEV has a state structure adding those elements
> > to their parent that they need. This also allowed dropping a wrapping
> > structure for the CXL state as the PXBCXLDev structure already provides
> > the equivalent grouping.
> >
> > Patches are similar to those posted in the thread but rebased on v8.0.0.
>
> this conflicts with
>     Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless overridden"
>
> I think you acked that one?

We should take one or the other, but not both. If this patchset
is good then it's probably better to fix the bug rather than
revert the feature, I think.

-- PMM

