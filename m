Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6742B172
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 02:58:07 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSas-0006kV-2F
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 20:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaiwei.kernel@gmail.com>)
 id 1maSZN-0005NK-2t; Tue, 12 Oct 2021 20:56:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lihaiwei.kernel@gmail.com>)
 id 1maSZK-0006IP-6C; Tue, 12 Oct 2021 20:56:32 -0400
Received: by mail-ed1-x535.google.com with SMTP id y12so3068061eda.4;
 Tue, 12 Oct 2021 17:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=An1HmjHJ1BP2kSUgUv69hnBjrUPzSNLb9vEMT1R51/s=;
 b=m9viLB7xFeotxqYj7/RBQ/P6AfxhwGGMJ+J/9ZcyI+33jCpgM6+S+wN5ufJJgi5hTM
 K+m7Cb3S3/qten0Pb56vx3E1EWuAooWBhEg3ciEHGvtfSbBxro22h7OYFy21l//kqigH
 duhH//FP+N1Pdro1fXS3/E7yl1wKAZffvCqeI/vxurld7AX13iR/IwDEbMxzlK/8q5UQ
 FovSNbrCh/xi6VdoHAInvkipv3Pc2dv1vFZcVcdXmHBJSFtmWmq2wuIUcR876DEk9lhg
 knHtnKsKkwCHZ36NbZGpxb567Wc2+kDUrIUP44t+/vZc3z+6oKoIouLR2WKb2N44TRxo
 ofiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=An1HmjHJ1BP2kSUgUv69hnBjrUPzSNLb9vEMT1R51/s=;
 b=IrqkN/bI+HFNX5HD5x55YOuAehQWH1o5XhBoa2QsmUsZxITSv9lnzKfAgnCjKM+oTS
 YU2xQei0ievTDbJyC5YZitT5oYtCN7N+5RKKTqUq4RLPg6fCvFI0pExksOkJhmk/+mKy
 WrK30T03sikPvOi5nAECpoc7zO15LuRCH6mZ8IjnFr0qRa+ldBcG1jC9UEJWNvMMTlsI
 nnvGEjI7649i/ZrDGNsxclKSmPBrU3HNxyvzrQ46CIrLglFkzPmHQpLs9mevsnoOhpQs
 Si+J944tPmAm9LeGV45P2oL4Web8mwwsrgEfFt4BWI17yleHaMqSqrcPjVf2Vr3QE7FK
 vLBA==
X-Gm-Message-State: AOAM532ROGx+3xAXnNfq0titvjV0uX4+ScinpsshcATf5ju2wryLMAsU
 hajfY1DGYNi2cbTo47iG2gC6fBjGaaJvMkLgCw==
X-Google-Smtp-Source: ABdhPJyWKKtFbO4Na1Yz7nwRtCIgn1jeXNLFokmAhOphaZJqmUTwhsVYd4x60UZI3xPvN3/hO7eYFwgngALgGRsSUrc=
X-Received: by 2002:a17:906:f747:: with SMTP id
 jp7mr34950655ejb.530.1634086587851; 
 Tue, 12 Oct 2021 17:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org> <YWBhEQxM4wRyZWzs@myrica>
 <CAB5KdOa4aLUq_d5RBws1cp_cfq55fw8_FhLY-HPV-1iVyFYKQQ@mail.gmail.com>
 <YWR1q1bL6a4e4a7v@myrica>
In-Reply-To: <YWR1q1bL6a4e4a7v@myrica>
From: Haiwei Li <lihaiwei.kernel@gmail.com>
Date: Wed, 13 Oct 2021 08:56:16 +0800
Message-ID: <CAB5KdObfNpWPLFFnawrOOpk1FBM+0ue5XgZYE12YAbQ_RPdTcQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=lihaiwei.kernel@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 eric.auger@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 1:34 AM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Hi Haiwei,
>
> On Mon, Oct 11, 2021 at 06:10:07PM +0800, Haiwei Li wrote:
> [...]
> > Gave up waiting for root file system device.  Common problems:
> >  - Boot args (cat /proc/cmdline)
> >    - Check rootdelay= (did the system wait long enough?)
> >  - Missing modules (cat /proc/modules; ls /dev)
> > ALERT!  UUID=3caf26b5-4d08-43e0-8634-7573269c4f70 does not exist.
> > Dropping to a shell!
> >
> > Any suggestions? Thanks.
>
> It's possible that the rootfs is on a disk behind the IOMMU, and the IOMMU
> driver doesn't get loaded. That could happen, for example, if the
> virtio-iommu module is not present in the initramfs. Since IOMMU drivers
> are typically built into the kernel rather than modules, distro tools that
> build the initramfs might not pick up IOMMU modules. I'm guessing this
> could be the issue here because of the hints and "Dropping to a shell"
> line.
>
> The clean solution will be to patch the initramfs tools to learn about
> IOMMU drivers (I'm somewhat working on that). In the meantime, if this is
> indeed the problem, you could try explicitly adding the virtio-iommu
> module to the initramfs, or building the kernel with CONFIG_VIRTIO_IOMMU=y
> rather than =m, though that requires VIRTIO and VIRTIO_PCI to be built-in
> as well.

Thanks, Jean. It works.

--
Haiwei

