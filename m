Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6B6C2354
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peMcQ-0000bb-7O; Mon, 20 Mar 2023 17:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1peMcL-0000bQ-3k
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:00:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1peMcI-0007Qq-Tz
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:00:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so3214080wmq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679346029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqJWahcMA1W2uh/BtssTHtJ1R/mZUz2vXzd48/3uLn0=;
 b=M9wTSmrkQVZHO0xSZypCRslf23lj2uaDPCIMPueNWHQpmqiFFnKYdaj//OyhwTIkc5
 spHFnVpdNil+jTCXj6rdC/l0JiYkiHIGt5sTSFifjX0/K4NTciW2Y5f/J/F9V+0cloE9
 f10HveGWUTGVeonq0wid7hFD1I1bpAAt6IihE1gRUBaOPr6vwa5MBA29hQeq+ve7KtR1
 vrd/OwZRcBoULlPrIDcqMLBSrVzy1npWJbbV5c7RvEvH69kRKjqh2qUCHQf5bmZSjDLn
 4eNVGB8AmCYl+AFnxOa5ca40v/vCNU2uiQemaNGl8q4vdm3ZrpnDwnLT/t3dA+7cEMwi
 aB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679346029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqJWahcMA1W2uh/BtssTHtJ1R/mZUz2vXzd48/3uLn0=;
 b=tNqHihHeOG/qvYTyhoDvxRmsQmUuzxpjoyBSHyA75YhOrGDG3K2ZdL/VA+fD5dmOWO
 jPSUiY+bfvavPdfaaNCWwa0W9VbnWaSfmv7Q/mZ+WzdrdigbsiBhupHfkNvWwkMTQJuD
 4oL08uavYZAee5mb4Sx2drlv3NfcVdxvhOVYfHUll6W/ChAiwai7n7knL5BAIP1Yot8s
 KMmS3ttBdsnyNV0mWUuX9JmLndnP6F+dX4KsDu5RxlZHNIE770A8qHDqxnrtGMZDLdPq
 0GqVxaQI5eEkpnahWdjJHG2qYd6GkJvqT3m41PO2vcSV7ArmFgXsWmotyfRIIhmUXdsx
 HSUg==
X-Gm-Message-State: AO0yUKXCxKVYDQQ/Z6faYAhQGkuzvxgsJWyPBLSca4gRIYJ+u9SmIjpJ
 OzDjinACOBiJWFXwNOCbO6/4rvZJWvHq0qsyezucPSRuRDM=
X-Google-Smtp-Source: AK7set9elKwJ8zTMBum2ABjr6yOytTdy2Eh2mSPOxO1w52FCIEOIJp14m5KKsvESLB7SGV0Fu3+RlDQwd4nsDxr6pBM=
X-Received: by 2002:a50:ce45:0:b0:4fb:80cf:898b with SMTP id
 k5-20020a50ce45000000b004fb80cf898bmr460182edj.7.1679346008983; Mon, 20 Mar
 2023 14:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230320000554.8219-1-jandryuk@gmail.com>
 <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
In-Reply-To: <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Mar 2023 16:59:57 -0400
Message-ID: <CAKf6xpsnUambc26RFktFRmj3z5o4wBz9qBBMvVzCBH_BO6n0Rw@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix host pci for stubdom
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, 
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jandryuk@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Mar 20, 2023 at 2:41=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:
>
>
>
> Am 20. M=C3=A4rz 2023 00:05:54 UTC schrieb Jason Andryuk <jandryuk@gmail.=
com>:
> >PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
> >dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
> >the stubdom.  xen-pciback has boolean module param passthrough which
> >controls "how to export PCI topology to guest".  If passthrough=3D1, the
> >frontend shows a PCI SBDF matching the backend host device.  When
> >passthough=3D0, the frontend will get a sequentially allocated SBDF.
> >
> >libxl passes the host SBDF over QMP to QEMU.  For non-stubdom or stubdom
> >with passthrough=3D1, this works fine.  However, it fails for
> >passthrough=3D0 when QEMU can't find the sysfs node for the host SBDF.
> >
> >Handle all these cases.  Look for the xenstore frontend nodes.  If they
> >are missing, then default to using the QMP command provided SBDF.  This
> >is the non-stubdom case.  If xenstore nodes are found, then read the
> >local SBDF from the xenstore nodes.  This will handle either
> >passthrough=3D0/1 case.
> >
> >Based on a stubdom-specific patch originally by Marek
> >Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>, which is ba=
sed
> >on earlier work by HW42 <hw42@ipsumj.de>
> >
> >Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >---
> > hw/xen/xen-host-pci-device.c | 96 +++++++++++++++++++++++++++++++++++-
> > hw/xen/xen-host-pci-device.h |  6 +++
> > 2 files changed, 101 insertions(+), 1 deletion(-)
> >
> >diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> >index 8c6e9a1716..51a72b432d 100644
> >--- a/hw/xen/xen-host-pci-device.c
> >+++ b/hw/xen/xen-host-pci-device.c
> >@@ -9,6 +9,7 @@
> > #include "qemu/osdep.h"
> > #include "qapi/error.h"
> > #include "qemu/cutils.h"
> >+#include "hw/xen/xen-legacy-backend.h"
> > #include "xen-host-pci-device.h"
> >
> > #define XEN_HOST_PCI_MAX_EXT_CAP \
> >@@ -33,13 +34,101 @@
> > #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> > #define IORESOURCE_MEM_64       0x00100000
> >
> >+/*
> >+ * Non-passthrough (dom0) accesses are local PCI devices and use the gi=
ven BDF
> >+ * Passthough (stubdom) accesses are through PV frontend PCI device.  T=
hose
>
> I'm unable to parse this sentence, which may be due to my unfamiliarity w=
ith Xen terminology.

It's two sentences, but it's missing a period.
"Non-passthrough (dom0) accesses are local PCI devices and use the
given BDF."  and "Passthough (stubdom) accesses are through PV
frontend PCI device."

> There is also an extra space before "Those".

It's two spaces between sentences, which visually separates the
sentences.  It's a common formatting, so I think it's okay.

Thanks for taking a look.

> >+ * either have a BDF identical to the backend's BFD (xen-backend.passth=
rough=3D1)

(And a typo here: s/BFD/BDF/)

> >+ * or a local virtual BDF (xen-backend.passthrough=3D0)
> >+ *
> >+ * We are always given the backend's BDF and need to lookup the appropr=
iate
> >+ * local BDF for sysfs access.
> >+ */

Regards,
Jason

