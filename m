Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E1414A2D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:09:38 +0200 (CEST)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT20H-0004BI-EC
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@kernel.org>) id 1mT1x6-0001km-Qc
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:06:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@kernel.org>) id 1mT1x3-00083L-RW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:06:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F7D1611CA;
 Wed, 22 Sep 2021 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632315973;
 bh=oNdKNGeEDSMsQZb0QR79jAvNFQsEnJOIQSDq8mmnnzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZmZut9FaGDBMBk0SNp1LqarjL1dNIa9LJeP0D32JOFaldMmVLyxNsVJ5ye+/213Vb
 Y046E+hu85twyYidfc5wmzc5AmSKuc+XzHEgENvVUzw8bRu5CSGd5JJ2siUC9sjmmK
 cX83OJtY+o4t2AZ9D3hXac09JxL7f/a4uYR9TLVg0j7ZYKpSPvFrQlq30WzyPHa6OT
 5AIha5qJjIg+YSHBe58gEGciD3IPjh9f1quU8Ay3WYTdk+GbuatGI+3QG6cPJuNp/0
 fru4jCWvG50H6w/4YLaxXYgzhZL82FCR5vR0sbMrjZzxgDsHUFugPDQDkbA25HUO1j
 O7AhSCzM57NFg==
Date: Wed, 22 Sep 2021 16:06:09 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Junji Wei <weijunji@bytedance.com>
Subject: Re: [RFC 0/5] VirtIO RDMA
Message-ID: <YUsqQY5zY00bj4ul@unreal>
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <20210915134301.GA211485@nvidia.com>
 <E8353F66-4F9E-4A6A-8AB2-2A7F84DF4104@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E8353F66-4F9E-4A6A-8AB2-2A7F84DF4104@bytedance.com>
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

On Wed, Sep 22, 2021 at 08:08:44PM +0800, Junji Wei wrote:
> > On Sep 15, 2021, at 9:43 PM, Jason Gunthorpe <jgg@nvidia.com> wrote:

<...>

> >> 4. The FRMR api need to set key of MR through IB_WR_REG_MR.
> >>   But it is impossible to change a key of mr using uverbs.
> > 
> > FRMR is more like memory windows in user space, you can't support it
> > using just regular MRs.
> 
> It is hard to support this using uverbs, but it is easy to support
> with uRDMA that we can get full control of mrs.

What is uRDMA?

Thanks

