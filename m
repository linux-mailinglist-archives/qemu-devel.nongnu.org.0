Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1112FB660
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:32:11 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1r7C-0005bd-A2
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1r4N-00050U-7o
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:29:15 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1r4L-0001dE-HB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:29:14 -0500
Received: by mail-ej1-x62a.google.com with SMTP id 6so28484744ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52EKdzx4kXWy7XFoFYK+kiDCH/vHXZgODJjzdcuhIfk=;
 b=rTdmzJ8n7asWjEPKlYE+K/uymY3+DGglJMmI4+RGIVFt+6OcD1Ru5+jI9ztIfzu46m
 pcM3m9YU1B9sy4HodxkoY7oogDgkiu+U7w0XeZeY0wCKPrVMabHZad+g+8XJDP1A71oD
 znz5tvEOpIdm+Cug0A3du6o5v2Ir3acKj0scIFNMe6QvrQSZn7vmM+MG0U1I6QhQNZaM
 /vjJMTBK6eXziKm7txbXUt7KpVRJZgI1o9nq2suWz01Gxd/oHYGeejIoPLmpqg/Hese3
 dk681nChVwcpE39AcXyfqELi7tEUVlbTYzxsycb6B7img7ByXKdCU6QDnmOhXV0FndlU
 Ur8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52EKdzx4kXWy7XFoFYK+kiDCH/vHXZgODJjzdcuhIfk=;
 b=t3ic84Bed4EfT1Q9LtjGP38ZKEYRNzTy+bLfQg26mLhtVPZ5XQ7e60xucDlvSOaZGt
 +/Rrsgd4bIHIlrzCTfsMWCTAXOCsDu+iiCOTYiPYtz+u+LTaDcQvmNY1YVkK/bDc514b
 E61ajgySPlg3/Onp4bgOZ6fZ3SHs9fBKjDJ9dtuVlMAj1flYgUyGvcsMPKD2fLPAIOEi
 LxV/CRTi2iTt7v5rvC2voovI0WIFauSvIhxDANqF2DeDutq1WkdeOKaHTp8WC+0T5L2X
 7TQfcDEqNoAoSVQu3GlXVUvpBowhBYwqcl6BZ/yJbKe2SIgiDbuCOOLXwXNKjM7bi1lc
 n83w==
X-Gm-Message-State: AOAM533BvNCzIKVIiICY+PZjWR/b9IiEaN0u4jZo3Qn//kRim2lw7izM
 uHlpZnBNqLPxyxJ/mNskroi1hFYMu6FQpMu6GD1uhg==
X-Google-Smtp-Source: ABdhPJwUg/hzWf/k2Nx9bdMsu9l1L/gFcIbskQEqbLrxuOJN6BVFhiCeVHtK2LNSqrsd1Xp33GDQlQlKjboUxvRQFcg=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr3025164ejf.85.1611062951150; 
 Tue, 19 Jan 2021 05:29:11 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:29:00 +0000
Message-ID: <CAFEAcA-0J_kH5NMjQFOBMRFxVcjAzPy5iT16BkF20xPwb4hQVA@mail.gmail.com>
Subject: Re: [PATCH v3] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 19:21, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> This patchset adds support for pvpanic pci device.
>
> v3 applied feedback:
>
> - patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
>   only when isa device is present
>
> - patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
>   PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
>
> - patch 3: fixed documentation
>
> - patch 4: add a qtest for pvpanic-pci
>
> Mihai Carabas (4):
>   hw/misc/pvpanic: split-out generic and bus dependent code
>   hw/misc/pvpanic: add PCI interface support
>   pvpanic : update pvpanic spec document
>   tests/qtest: add a test case for pvpanic-pci

Since the only issue in this version was a minor thinko in
the docs, I'm going to apply this to target-arm.next and
make that s/device/bus/ docs fix there. (target-arm seems like
a reasonable queue to use since the main reason for having
this device is for the virt board.)

thanks
-- PMM

