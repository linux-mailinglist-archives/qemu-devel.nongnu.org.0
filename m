Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32F36F82D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:53:57 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPqO-0005fc-9d
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lcPoT-0004u5-2t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:51:57 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:52183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lcPoQ-0001FM-LA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:51:56 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C879611D4;
 Fri, 30 Apr 2021 05:51:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 05:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 qclBwyen7LsGqQKs1R5cvF4Tki/Gln0fGV0eu+A2QBk=; b=BHE2FRbaPbj7+Gt+
 T+PId9wbwzgJ8l97wC6+Zb4TsqjBcBB/jzR7OLFT6JQtLvuADLrKCTPphokXhkal
 ZhUay8urHmelqd9LURKqUjbGYSFqTYY6cgQinmEYwSXer8z2fniypooC+tI27vyW
 24Mq9aJGP0UVddIW7McKRZat5cH6nyJHjKFyNxpHEhkwCbmfi01D38uRFbAkvSyc
 pGihN7bBJvL/tq+2pN0C+rPOcI6LSYVZmJyp9ldW6I3e9uIm1tisVZaq5Dl8YVU8
 ro7icvVJk1EFdDVtAmr2bkQOEB+2Mi+HwPCiVWmJms8Q7eZjmvI/IyGOhvZgn5nU
 dw3EQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qclBwyen7LsGqQKs1R5cvF4Tki/Gln0fGV0eu+A2Q
 Bk=; b=ZqixDBSYCxdqn9pYy2wkx6SISIISHclyAeFIujXez1qOIkNTK/DB2CRB2
 Mp50YZpS6WSB7HHojjd4to6Ogpon0LkuzA21+S2NAWPWFBX40zpvvCj7SlY5vT2X
 ouJ9YBdrwWrd3wEpncxa1VPaHVU5E+uPk/mkFLqHy+Quusbg2svi/OSGU/zjWSqp
 Bq1285/5iELS8o1CiNqdxAsjXxUBPpo3PKD/Pnb9dZVfRk5rlUH/UxR6LxTVsqkB
 kNZCnLfi7Hv/rO2DmR3LPjunEgJ6r8YnMOiixsPFFdCflt7jni8VhOGvOLbLyz9A
 yMrMUKOKwfSnAi0tNuRNsaTvTA7uw==
X-ME-Sender: <xms:NtOLYMIksMPMAW6vFF90sUJQcim28PW5rZt7qate2d_5h_ir6a0P-g>
 <xme:NtOLYMIO1PmDpjcGvw4aLq0xZsj_w2iOLVBNcXZBr_T4DvnMres4htVGkL1mk2UwI
 YLHzrTH4bOrEG6F-EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppedukeehrdduvdefrddviedrvddtvdenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvihhntggvnhhtsegsvghrnhgrthdr
 tghh
X-ME-Proxy: <xmx:NtOLYMvsxLKDMXIb7crYXtbr8XOUM6e4wg0jGmiC8gq1rgUhlV6I7w>
 <xmx:NtOLYJagnqTG0-m6TShkxVYDcL24Gc6UN43wa4ahkvxH7mVXLbOu-g>
 <xmx:NtOLYDboXPbQKFKdPaGGfvy2UNZlKL_NmDfePEyimh7CPI1egCKXBw>
 <xmx:NtOLYKzoNDkZDnHpO3pcjUJzEwIZ_mSyD_U0Ighc_t2A1wxz6Lqeeg>
Received: from guybrush.luffy.cx (unknown [185.123.26.202])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 05:51:49 -0400 (EDT)
Received: by guybrush.luffy.cx (Postfix, from userid 1000)
 id E5D211FE37; Fri, 30 Apr 2021 11:51:46 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401171138.62970-1-vincent@bernat.ch>
Date: Fri, 30 Apr 2021 11:51:46 +0200
In-Reply-To: <20210401171138.62970-1-vincent@bernat.ch> (Vincent Bernat's
 message of "Thu, 1 Apr 2021 19:11:38 +0200")
Message-ID: <87tunom765.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=vincent@bernat.ch;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 19:11 +02, Vincent Bernat:

> Type 41 defines the attributes of devices that are onboard. The
> original intent was to imply the BIOS had some level of control over
> the enablement of the associated devices.

Now that QEMU 6 is released, I think this patch is ready (it still
applies). It already contains the fixes discussed previously (notably
bailing out when the PCI bus is not a root one). If you still find it
useful on its own, it could be merged.

Thanks.
-- 
Use free-form input when possible.
            - The Elements of Programming Style (Kernighan & Plauger)

