Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9947B1DD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:09:44 +0100 (CET)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMAR-0001B5-6Z
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mzKR3-00022C-54; Mon, 20 Dec 2021 10:18:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:2559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mzKQh-0006jK-4I; Mon, 20 Dec 2021 10:18:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="227426120"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="227426120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 02:07:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="520742368"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.56.197])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 02:06:58 -0800
Date: Mon, 20 Dec 2021 11:06:55 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20211220100655.GA13759@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <YZ3xurkIxozrTbqu@apples.localdomain>
 <20211125141534.GA28269@lgieryk-VirtualBox>
 <YcAsxmA2gG1yET2S@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YcAsxmA2gG1yET2S@apples>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 08:12:06AM +0100, Klaus Jensen wrote:
> On Nov 25 15:15, Łukasz Gieryk wrote:
> > On Wed, Nov 24, 2021 at 09:03:06AM +0100, Klaus Jensen wrote:
> > > Hi Lukasz,
> > > 
> > > I've been through this. I have a couple of review comments, but overall
> > > looks good for inclusion in nvme-next. Would be nice to get this in
> > > early in the cycle so it can mature there for 7.0.
> > 
> > We (I’m speaking on behalf of the other Lukasz) are really happy to
> > read that. We will do our best to make it happen.
> > 
> 
> Keith, do you have any comments on this series - otherwise I'd like to
> stage this for nvme-next come January.
> 

Please, wait with the staging - we are about to release the v3.

We have few fixes that will make the device more compliant with the NVMe
and SR-IOV Spec.



