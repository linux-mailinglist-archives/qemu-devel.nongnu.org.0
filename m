Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCF3282AD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:39:47 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkeA-000858-BY
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGkc9-0005pR-Ve; Mon, 01 Mar 2021 10:37:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:58032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGkc8-0004Tt-5K; Mon, 01 Mar 2021 10:37:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 021CD64DF5;
 Mon,  1 Mar 2021 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614613057;
 bh=DTBvN08Ezs/8ALSfS9yuG7kRMsvZsDWrw0D5GyU17EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A1HpuJsnkVqRM9yaAIk24eZtZSbaIOwTF8XB71HEjom6cXvANY4fsSgVaTRAB3EJ+
 Ff6BZE8p6DqCcaX0gwr/S7d3RoXwBcPeVgrxB1YUev4Gh296A1wFqOz7kVaveMZxJQ
 nhXbgUyhU3+6NX5KdC/UhQRo/BASTUupOKav+bpGPuFJ+HO/PehDn9jIPt1AiAZp+I
 PTel1nL75boi+jzXuxNEWYDaRnj1xTiFbsIJTlY0+RvfLqTn+t69IHLF7ptlp1RilG
 SJY0kTWcp2oXVSZD+alrpJ6eKKoCbAzsQbRxQfsDV8+8CCbXG+O/bqB+W2qfxmLWuG
 jkoWy6+3W3UDQ==
Date: Tue, 2 Mar 2021 00:37:30 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 5/5] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <20210301153730.GA17228@redsun51.ssa.fujisawa.hgst.com>
References: <20210222184759.65041-1-its@irrelevant.dk>
 <20210222184759.65041-6-its@irrelevant.dk>
 <20210222205506.GB16253@redsun51.ssa.fujisawa.hgst.com>
 <YDQeNpjTCvYbKhjh@apples.localdomain>
 <YDzMznTMIam04v+J@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDzMznTMIam04v+J@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 12:15:26PM +0100, Klaus Jensen wrote:
> On Feb 22 22:12, Klaus Jensen wrote:
> > On Feb 23 05:55, Keith Busch wrote:
> > > On Mon, Feb 22, 2021 at 07:47:59PM +0100, Klaus Jensen wrote:
> > > > +typedef struct NvmeIdCtrlNvm {
> > > > +    uint8_t     vsl;
> > > > +    uint8_t     wzsl;
> > > > +    uint8_t     wusl;
> > > > +    uint8_t     dmrl;
> > > > +    uint32_t    dmrsl;
> > > > +    uint64_t    dmsl;
> > > > +    uint8_t     rsvd16[4080];
> > > > +} NvmeIdCtrlNvm;
> > > 
> > > TP 4040a still displays these fields with preceding '...' indicating
> > > something comes before this. Is that just left-over from the integration
> > > for TBD offsets, or is there something that still hasn't been accounted
> > > for?
> > 
> > Good question.
> > 
> > But since the TBDs have been assigned I believe it is just a left-over.
> > I must admit that I have not cross checked this with all other TPs, but
> > AFAIK this is the only ratified TP that adds something to the
> > NVM-specific identify controller data structure.
> 
> Are you otherwise OK with this?

Yes, I compared other TP's and it appears to be set for good once an
actual numeric value is assigned, so okay to go here.

Reviewed-by: Keith Busch <kbusch@kernel.org>

