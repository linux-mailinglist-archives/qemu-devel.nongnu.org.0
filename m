Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2169304A6E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:46:01 +0100 (CET)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4VDs-0001o6-Na
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4VC5-00017E-Io; Tue, 26 Jan 2021 15:44:09 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4VC3-0002ez-Th; Tue, 26 Jan 2021 15:44:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u11so10406360plg.13;
 Tue, 26 Jan 2021 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LLPDiyabQFrrRGR5qrobI9DpPjV8ztBp+r971SSTLug=;
 b=cqd1TysEQO5UAgw+0S5YTChNtmI9I5Eurgl2hYyY1wohOr8Gd9WsJ72I6SwEBU0lp+
 xhDuT5804VTl3itYv+ALAkqxCEG96H9VI4h3P7O9jmgnbrPmKgzAdPLz0Zxms2z4VVmu
 wMYcgxzluZ+Pt860O9YMxb8PlipoNrSB0Y1DRPTlmyXfOiX5cHr1O3QVPzODOu6I7cJ+
 vdJ1BG9JzIZEPASVhplZe8y1EKs0jkgav+DlyMfETkPu5AiwGbwhCpMKgMzahibyySlX
 ZTt6PXgiVu8KwUYWES5KwbQw8rh+NBnFlufvgPJYJgSgdYtI8lRUkB+lqyHCX7lxdsNU
 MUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LLPDiyabQFrrRGR5qrobI9DpPjV8ztBp+r971SSTLug=;
 b=XokXsVs2bQPQ+KPT6WDhO2iVxuM+KpMjm/ysU/MmQinz4mAM3nR00D/E4MwEuZQxY0
 uMMwmCIlEexOTk/eQO++vkhT4Fdm3ekURIJT2N0sV+sB1JrpUqNs9Lo+m4OjV296CGzY
 isB0vdXzNknONrLbSm/1g6XxcXGzPPa/jgJzWsqd9J8grdY9pnMKXU2OCfi9Ok9mVGgt
 nYv2D+h/1EAU4nCmHtA4BMQ7/+jqUK2+OFvipIpGtgRQ18/pxC8tpIaLDZW2QoJP1SrN
 A3oafYL+3tMU/bYXBI/1clQLFLaLAUd/BXq50NhwbPId/ebPWcStre7YsEqmCdTaY3Ns
 OuKg==
X-Gm-Message-State: AOAM530NyzwBMLfGE3KayQB5fcLSXj3uht9cTOP0aQKuSx/N/HLQU68w
 YyS9hzYg5jGPr1Vhdu5nwN4=
X-Google-Smtp-Source: ABdhPJy9IrtWsKO4emXpE3UHsPmkhBFrTn+5yi7o9Hc6BXoxZteI2OR0JQr8J3+WW7bGyHAenpXneQ==
X-Received: by 2002:a17:902:9005:b029:da:f580:c5f7 with SMTP id
 a5-20020a1709029005b02900daf580c5f7mr7992619plp.85.1611693846052; 
 Tue, 26 Jan 2021 12:44:06 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 30sm20530100pgl.77.2021.01.26.12.44.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 Jan 2021 12:44:05 -0800 (PST)
Date: Wed, 27 Jan 2021 05:44:03 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V6 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210126204403.GA3564@localhost.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-5-minwoo.im.dev@gmail.com>
 <YA8H9GTfBNPZFdqo@apples.localdomain>
 <20210125181143.GA1732086@dhcp-10-100-145-180.wdc.com>
 <20210126005248.GA3719@localhost.localdomain>
 <20210126175723.GB1732086@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210126175723.GB1732086@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62c.google.com
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

On 21-01-26 09:57:23, Keith Busch wrote:
> On Tue, Jan 26, 2021 at 09:52:48AM +0900, Minwoo Im wrote:
> > On 21-01-25 10:11:43, Keith Busch wrote:
> > > On Mon, Jan 25, 2021 at 07:03:32PM +0100, Klaus Jensen wrote:
> > > > On Jan 24 11:54, Minwoo Im wrote:
> > > > > We have nvme-subsys and nvme devices mapped together.  To support
> > > > > multi-controller scheme to this setup, controller identifier(id) has to
> > > > > be managed.  Earlier, cntlid(controller id) used to be always 0 because
> > > > > we didn't have any subsystem scheme that controller id matters.
> > > > > 
> > > > > This patch introduced 'cntlid' attribute to the nvme controller
> > > > > instance(NvmeCtrl) and make it allocated by the nvme-subsys device
> > > > > mapped to the controller.  If nvme-subsys is not given to the
> > > > > controller, then it will always be 0 as it was.
> > > > > 
> > > > > Added 'ctrls' array in the nvme-subsys instance to manage attached
> > > > > controllers to the subsystem with a limit(32).  This patch didn't take
> > > > > list for the controllers to make it seamless with nvme-ns device.
> > > > > 
> > > > > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > > > > ---
> > > > >  hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
> > > > >  hw/block/nvme-subsys.h |  4 ++++
> > > > >  hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
> > > > >  hw/block/nvme.h        |  1 +
> > > > >  4 files changed, 55 insertions(+)
> > > > > 
> > > > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > > > index b525fca14103..7138389be4bd 100644
> > > > > --- a/hw/block/nvme.c
> > > > > +++ b/hw/block/nvme.c
> > > > > @@ -4481,6 +4484,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> > > > >      id->psd[0].enlat = cpu_to_le32(0x10);
> > > > >      id->psd[0].exlat = cpu_to_le32(0x4);
> > > > >  
> > > > > +    if (n->subsys) {
> > > > > +        id->cmic |= NVME_CMIC_MULTI_CTRL;
> > > > > +    }
> > > > 
> > > > Since multiple controllers show up with a PCIe port of their own, do we
> > > > need to set bit 0 (NVME_CMIC_MULTI_PORT?) as well? Or am I
> > > > misunderstanding that bit?
> > > 
> > > AIUI, if you report this MULTI_PORT bit, then each PCI device in the
> > > subsystem needs to report a different "Port Number" in their PCIe Link
> > > Capabilities register. I don't think we can manipulate that value from
> > > the nvme "device", but I also don't know what a host should do with this
> > > information even if we could. So, I think it's safe to leave it at 0.
> > 
> > AFAIK, If we leave it to 0, kernel will not allocate disk for multi-path
> > case (e.g., nvmeXcYnZ).
> 
> Kernel only checks for MULTI_CTRL. It doesn't do anything with MULTI_PORT.

Please forgive me that I took this discussion as MULTI_CTRL rather than
MULTI_PORT.  Please ignore this noise ;)

Thanks!

