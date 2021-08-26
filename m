Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63353F829E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 08:45:57 +0200 (CEST)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ99A-0005LJ-84
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 02:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJ971-0004VP-QP; Thu, 26 Aug 2021 02:43:43 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJ96z-0000Cu-1I; Thu, 26 Aug 2021 02:43:43 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 16D21320076F;
 Thu, 26 Aug 2021 02:43:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 26 Aug 2021 02:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G7jGw/
 0BWihCD4b19bM9RqSlkHGGt5g1KEvorqHCSXA=; b=VmSoBaglOyur5DNvVGRLSb
 qZ6t0KQvPmP/1mPUcK3AJwSx23V0pg7iRu/H2LJrhhCwqCs9QdBxFl9jzczTdHp7
 KP536Va04PxXR3BfJQBHQDv7cwsFQ8Ht42w8U+3cmqYmWoTPHPIVnB/n+D3iPYqp
 0OupicmnLWRu8d0nBLSBxUS8WI+A0F3mT0oUXdDXWRNt/YZYK3t+inPLn3No+kXm
 4X1NI0H9FncFKD6rc2+QL0TbqI6KSfNaY0cd+eNbOpZSDiPaZHp+0SaTSbT/IhIn
 pvw9c6lxx8nj/d7cqT7v5XTo7N9sIolTIqciXdsU6R4DCXoDeiJr67tvKo9ZJ4Bg
 ==
X-ME-Sender: <xms:FjgnYX2r9vTsQEv8hZpIufS5g2mlV097cPqTFcc-iW0kRVF9dlSASA>
 <xme:FjgnYWFuS7DrJlgpjsjwanQZwt_H3H7wbI-Dewpy7KCBRQXxcRVl3ug5pvMmPFGlO
 3IPdaBz7E5CPD5xFbs>
X-ME-Received: <xmr:FjgnYX59FawoaKNheIo-t4yUoNR3AjECKqDrcNHcH11_UZyb75hHvDFWXOaXK-A5IueuNcKuMdFcYu025rKBv0XHqJnii-Jif-9MNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddutddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveff
 teeuudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:FjgnYc0O8cyCWnCzxofTQHPOp4fTWlMzmsESk_HHBlfdt-4phukbDQ>
 <xmx:FjgnYaE_L322MjnznMHl9hxZqrNgtwSt37QBwHJ91hKwgH32vUwS3A>
 <xmx:FjgnYd9Zm4d98gafxUh-XhHzDJtwGQ0kx48x55njr6bKWrv9k5-YTg>
 <xmx:GDgnYWB8u1tgmG7KBkY5E0STwG3a09QXL-vSSnvSTFDeduyVIr_hpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 02:43:32 -0400 (EDT)
Date: Thu, 26 Aug 2021 16:43:27 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 10/10] hw/mos6522: Synchronize timer interrupt and timer
 counter
In-Reply-To: <8895ba94-2a50-8845-2744-e318fc08dd47@ilande.co.uk>
Message-ID: <f19e9c90-1248-e442-fd3a-1d4022945764@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <cff0bcc8963e6b339716ad095a41687533cd64fd.1629799776.git.fthain@linux-m68k.org>
 <8895ba94-2a50-8845-2744-e318fc08dd47@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Wed, 25 Aug 2021, Mark Cave-Ayland wrote:

> 
> Unfortunately the datasheet I was using for reference doesn't appear to 
> have the relevant detail here. Have you got a reference to the datasheet 
> you're using which shows what happens to the timers at the zero crossing 
> point?
> 

The datasheets which I normally refer to (Rockwell and Synertek) agree 
about this. Also, I established the sequence experimentally when I was 
writing the clocksource drivers for Linux/m68k.

