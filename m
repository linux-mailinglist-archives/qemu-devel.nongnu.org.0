Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85864414B4F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:02:50 +0200 (CEST)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2pl-0008Tv-IF
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@kernel.org>) id 1mT2ml-0007CX-5w
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:59:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:52576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@kernel.org>) id 1mT2mi-0003YP-Nm
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:59:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB94611C9;
 Wed, 22 Sep 2021 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632319179;
 bh=36IWk6It8GnKx4IJa/NIBW4AEPYji1iLwvfilDyjCXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pekUNLVhn+YYL/CO9fT43ZTrfotwbsqxmeiiHiPuOBIeanmiMbOApgFDPqoNg+gAi
 FNfFzj4CVqKEkpWuEoityr4Fee26sPBLpdCW39J/fCQEof/s14b+FPdM/QbKO0vPyo
 mdSeGCVBCTeMvzIkPSLrKd0d4dAJTVt0TG1x2DifZ3HpedfaMgO3YSeDZYjyc41pqE
 +ynfgXqeKMTFJyJPIXU3ubLtBvCUSwAbLWtUjZWVRAmReoXHHKPsgq2use649Fq3Mu
 YcRyiBs2S/5gpSCSaQtZHwJwQ93fUbCD5ariOReFV469g6gw2K8SBJBO5JFRJDR8wU
 XbbWiNMzFfhpQ==
Date: Wed, 22 Sep 2021 16:59:35 +0300
From: Leon Romanovsky <leon@kernel.org>
To: =?utf-8?B?6a2P5L+K5ZCJ?= <weijunji@bytedance.com>
Subject: Re: Re: [RFC 0/5] VirtIO RDMA
Message-ID: <YUs2x9tUEgdC5lpr@unreal>
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <20210915134301.GA211485@nvidia.com>
 <E8353F66-4F9E-4A6A-8AB2-2A7F84DF4104@bytedance.com>
 <YUsqQY5zY00bj4ul@unreal>
 <CAGH6tLV=9ceaUH_zdevtTyL5ft4ZxxX8d0axops4DmbFdFYFjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGH6tLV=9ceaUH_zdevtTyL5ft4ZxxX8d0axops4DmbFdFYFjQ@mail.gmail.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=leon@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Gunthorpe <jgg@nvidia.com>,
 mst <mst@redhat.com>, RDMA mailing list <linux-rdma@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 yuval.shaia.ml@gmail.com,
 virtualization <virtualization@lists.linux-foundation.org>,
 Yongji Xie <xieyongji@bytedance.com>, Doug Ledford <dledford@redhat.com>,
 =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 09:37:37PM +0800, 魏俊吉 wrote:
> On Wed, Sep 22, 2021 at 9:06 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Wed, Sep 22, 2021 at 08:08:44PM +0800, Junji Wei wrote:
> > > > On Sep 15, 2021, at 9:43 PM, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > <...>
> >
> > > >> 4. The FRMR api need to set key of MR through IB_WR_REG_MR.
> > > >>   But it is impossible to change a key of mr using uverbs.
> > > >
> > > > FRMR is more like memory windows in user space, you can't support it
> > > > using just regular MRs.
> > >
> > > It is hard to support this using uverbs, but it is easy to support
> > > with uRDMA that we can get full control of mrs.
> >
> > What is uRDMA?
> 
> uRDMA is a software implementation of the RoCEv2 protocol like rxe.
> We will implement it in QEMU with VFIO or DPDK.

ok, thanks

> 
> Thanks.
> Junji

