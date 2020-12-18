Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931382DE8EE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:30:49 +0100 (CET)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKWe-0000wi-H4
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqKRU-0007Kq-BT; Fri, 18 Dec 2020 13:25:28 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqKRO-0001my-QU; Fri, 18 Dec 2020 13:25:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 075385C0170;
 Fri, 18 Dec 2020 13:25:20 -0500 (EST)
Received: from imap8 ([10.202.2.58])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 13:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=GaUa7fpU2C6oycRg3HpaZGcduz6u
 aNVGZ+XoG4ThjEQ=; b=mQwj2jH8DEdr2LbalMleuuyd/qrusoke7Rkv93Vm2hIW
 T5Edm4I8/OCmDCQdPjpeS6ng65ZUPrb7IjiZmHD7v/KWvm+LpmuluKnf3NKR+ztI
 tlWl9DTqjT9h9nIGB4z8CVD/XJ3s7NUlMI2IlRDwxZ1BBuTguxRzxshqwC6Fi7rN
 o/kIqwNHWPvacXN9zAQalsJRnETYWcbt17gUjz/8v7UR3mBedR1B2nBbmumXLJMX
 FOOBpqzwrWblv/up8cSCRNXAfwctSLaP8PvMw4HRrBK6x3jxZpkEBGYPmLdEF3ou
 mIAWynNnqHJ7s957/ebOMsp6KmYd9j4o3l1bvQA11g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GaUa7f
 pU2C6oycRg3HpaZGcduz6uaNVGZ+XoG4ThjEQ=; b=XK5ZOTYC8A5qEkk/ITXD/I
 RWTJSM/mHTHCQPc5BegzFHtKkAp/OgdGfkWJpRh60hIVkmEiwnccfsgxp0KgIXtt
 peozOUFTJWnlGqJTmmrWby4quQgmazB5rw+dqmWYUR60rUwh2DW88A9/WOGk4wYs
 g8ddZVaw+AKDIIbNJuz71yhzzZw+3YT9Q4lt/1+WEGFdDdwjbckSH6s3S2VEVkXJ
 SXwafoyc9+c14svj9eRIduKqZemlEzVrEYMb/7gFDWDYY+p5ojTBUHaVeii+JVjT
 z/kvWAkGjV99CIztWK/cVYAXsIbB7JiHttUKYZh1BU9YLEE3GQb7LBR+/Mftmkyg
 ==
X-ME-Sender: <xms:DvTcXyVKtoQYtVcBwNz1uT_T9kl0D4IfwME827K9iYHRrp9q6PkGTA>
 <xme:DvTcX-nrTAAxCObJwAj7czB3bu6ZrKyLVvnRVk_5yGSw1nBFSoHdx-FLo19gXaSmE
 jLoZJPUID8RBsym9UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfmfhl
 rghushculfgvnhhsvghnfdcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtf
 frrghtthgvrhhnpeethfeitddtvddugeelkefguefghfeltdeuieehgfejteegfeefheet
 geegleetgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DvTcX2Yg4LxkUk7sS4XdcTV81dO4uAUHY4I9qlI4C63mXiEU97zsUg>
 <xmx:DvTcX5XbdF_4VdEZ9vAEeLmgGBKyprugIE9dKOrWVVPWfaE8ZBgE1A>
 <xmx:DvTcX8kgqYFnzikpPZ2f5S9FAzPsqSnCxVv6Y6q64-vhKDjlz9xbVA>
 <xmx:EPTcX6aCDkMtMgcLfDPjVVpU76X-aB8q9S8irVyRXfZn7_TF3E96xw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B9497520095; Fri, 18 Dec 2020 13:25:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <e4f59d92-eb82-4fc5-88d7-8ccdfdf9aa5e@www.fastmail.com>
In-Reply-To: <20201218180806.GC8722@redsun51.ssa.fujisawa.hgst.com>
References: <20201217210222.779619-1-its@irrelevant.dk>
 <20201217210222.779619-4-its@irrelevant.dk>
 <20201218180806.GC8722@redsun51.ssa.fujisawa.hgst.com>
Date: Fri, 18 Dec 2020 19:24:58 +0100
From: "Klaus Jensen" <its@irrelevant.dk>
To: "Keith Busch" <kbusch@kernel.org>
Subject: Re: [PATCH RFC 3/3] hw/block/nvme: end-to-end data protection
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, Dec 18, 2020, at 19:08, Keith Busch wrote:
> On Thu, Dec 17, 2020 at 10:02:22PM +0100, Klaus Jensen wrote:
> >  static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
> >  {
> >      NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
> >      NvmeNamespace *ns = req->ns;
> >      uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
> >      uint64_t slba = le64_to_cpu(rw->slba);
> > +    uint16_t ctrl = le16_to_cpu(rw->control);
> >  
> >      uint64_t data_size = nvme_l2b(ns, nlb);
> > +    uint64_t real_data_size = data_size;
> >      uint64_t data_offset = nvme_l2b(ns, slba);
> >      enum BlockAcctType acct = req->cmd.opcode == NVME_CMD_WRITE ?
> >          BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
> 
> Since this is right in the middle of the nvme read/write path, and we
> have the outstanding ZNS stuff intermixed here, could we possibly
> converge on the ZNS solution first, and rebase new IO path capabilities
> on a ZNS enabled tree?
>

Yes, absolutely. We marked this RFC to get some discussion going and we got that :)

Will definitely merge zns first :)

