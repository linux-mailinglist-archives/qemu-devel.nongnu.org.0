Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA0303107
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:54:23 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ccg-0000rk-3M
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4CbI-0008Ra-1v; Mon, 25 Jan 2021 19:52:56 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4CbG-0002ZI-8J; Mon, 25 Jan 2021 19:52:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id p15so675162pjv.3;
 Mon, 25 Jan 2021 16:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ItIoU6rpveq2ElPgXtBNepLlTU3DibtATPndMULk6gg=;
 b=U3fBIttpPUgrzarR20VAp/bwQwdiz/gE20bjStFrVqqKQg4njWzaLN2po4iPVCrjGQ
 7Ac7wvhVshS1BVh30UzHpYi/Hy0PPwyEGmGGYIbm7uWBRDpt0PRn+6RWxQmiNSHHTzvJ
 sOnVJzJOyCE15zNpMyMRjLJad8+Ef7OAK0ZTqUp2Jgy491A+YS3hA1jxTFMIiXgzFt37
 5v9z/AwJSZY3R1GO8wDCV7ekZ/Qqx4kVNdOXNFJ9GHCKceRQgNU687JGXgJFfxO6wYV5
 rNze9cfAbVoMEUQRnc2sAhJWXmGIsFVfH1EDbdwecWJzrMVoqD4buzMGYL5yhwZIg5Zc
 GJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ItIoU6rpveq2ElPgXtBNepLlTU3DibtATPndMULk6gg=;
 b=qUiZVBcoX0XpTrixZsmdYMzl022DOxqt/qYVc8Pey0t9qrvFfRTpD7FZbCdDoFUcRO
 jIO6w9MChP65iZuTO/l8+Hu13whHX7IqV8+Dv9TZsLihm1iljaE3ybEOo+xhVZoKhrXy
 cVlykDjMT52BsSJ5TPVX39fqtWWU+hYRg0sAIhCgqeUAtgaBI9wd3QvpUSLQWBnMEAtI
 t2gDEax0GBN6j84NNe40vRdUCo4M7TAyjNbQhKedetYK3OWfylRfY90RBBOWHbtPDgLb
 wrRutAE48JexUs2K1mDC3ZNF/dqxVohhtwdQZpih8kVwJzpYzorTmKbeChtMtl6FpMOR
 T0Hw==
X-Gm-Message-State: AOAM531HNrbeg7vDodwRZJKck3rjh3jWujw2W1dzlXkikgoDpTt52zMY
 r2y8V6pngKpTZUXYNx4vd9w=
X-Google-Smtp-Source: ABdhPJxLHRftt6yI2Nh3K1Rcb9pnvklA8ejMLFHRo0A/Mq5zPT3H6W5NYrPu3mx4kvvoH7FCQ+y5/A==
X-Received: by 2002:a17:90b:fc9:: with SMTP id
 gd9mr3006097pjb.107.1611622372083; 
 Mon, 25 Jan 2021 16:52:52 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id b10sm17391761pgh.15.2021.01.25.16.52.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Jan 2021 16:52:51 -0800 (PST)
Date: Tue, 26 Jan 2021 09:52:48 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V6 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210126005248.GA3719@localhost.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-5-minwoo.im.dev@gmail.com>
 <YA8H9GTfBNPZFdqo@apples.localdomain>
 <20210125181143.GA1732086@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210125181143.GA1732086@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-25 10:11:43, Keith Busch wrote:
> On Mon, Jan 25, 2021 at 07:03:32PM +0100, Klaus Jensen wrote:
> > On Jan 24 11:54, Minwoo Im wrote:
> > > We have nvme-subsys and nvme devices mapped together.  To support
> > > multi-controller scheme to this setup, controller identifier(id) has to
> > > be managed.  Earlier, cntlid(controller id) used to be always 0 because
> > > we didn't have any subsystem scheme that controller id matters.
> > > 
> > > This patch introduced 'cntlid' attribute to the nvme controller
> > > instance(NvmeCtrl) and make it allocated by the nvme-subsys device
> > > mapped to the controller.  If nvme-subsys is not given to the
> > > controller, then it will always be 0 as it was.
> > > 
> > > Added 'ctrls' array in the nvme-subsys instance to manage attached
> > > controllers to the subsystem with a limit(32).  This patch didn't take
> > > list for the controllers to make it seamless with nvme-ns device.
> > > 
> > > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > > ---
> > >  hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
> > >  hw/block/nvme-subsys.h |  4 ++++
> > >  hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
> > >  hw/block/nvme.h        |  1 +
> > >  4 files changed, 55 insertions(+)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index b525fca14103..7138389be4bd 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -4481,6 +4484,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> > >      id->psd[0].enlat = cpu_to_le32(0x10);
> > >      id->psd[0].exlat = cpu_to_le32(0x4);
> > >  
> > > +    if (n->subsys) {
> > > +        id->cmic |= NVME_CMIC_MULTI_CTRL;
> > > +    }
> > 
> > Since multiple controllers show up with a PCIe port of their own, do we
> > need to set bit 0 (NVME_CMIC_MULTI_PORT?) as well? Or am I
> > misunderstanding that bit?
> 
> AIUI, if you report this MULTI_PORT bit, then each PCI device in the
> subsystem needs to report a different "Port Number" in their PCIe Link
> Capabilities register. I don't think we can manipulate that value from
> the nvme "device", but I also don't know what a host should do with this
> information even if we could. So, I think it's safe to leave it at 0.

AFAIK, If we leave it to 0, kernel will not allocate disk for multi-path
case (e.g., nvmeXcYnZ).

