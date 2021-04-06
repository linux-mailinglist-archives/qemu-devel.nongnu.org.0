Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11395355C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:14:30 +0200 (CEST)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTr9g-0004Ae-IK
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lTr7b-0003Pr-Uh
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:12:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lTr7V-0006wB-EK
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:12:19 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 2B3FA1581;
 Tue,  6 Apr 2021 15:12:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Apr 2021 15:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 D40qV2E1ZHSlbIH5FV+7PzbB3WaM8XLTxRrnXJkfQtA=; b=rQBhlT+xge73sEb2
 pSo7wT9dawMB5luvLNmhliPMtVdqGj7v1usLQH24h/7dvCwZgwzmCsgzQi+g9iNK
 cUpGELiGST322OVcx5cKAGxLtvmEfM6b+7a6s4nC7HtY8k/DDV+Xz5uA1leI/S8c
 yBNpzMGRQOmdGYsTTsFLXZLFr5xLxQ7hyhcXu2MhJAufk+Zdr8SOZOBS1Q6Bzih+
 4Y54Bs4oOkV3pF/wZJ3YNrkywTGfEcpdbj+WsoTy2AFDSrYfa2WKm5bYmUj0g2Ze
 ExqfpBa+MwQwBFNgjBAMWsVjAwtSD1ri+mKfuxyhn7kQou9Is3m5OJLcPK68vze1
 gYfSFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=D40qV2E1ZHSlbIH5FV+7PzbB3WaM8XLTxRrnXJkfQ
 tA=; b=UX/JU+M5+7vzgrIGpFW3lIug9AzJ+7uYxlBvIPWf25HlXUOOJSlOFs6Zg
 vrd7nHf1O/gJcYHOf1tz2ZM46yMcZgUbk7jwNYCgri+JXYmWmb5SJgkoazAiDtJC
 CEkrPmLYDC3g8hPydDgy6Rorxou9/TsEscnkXF5BV8oIPuhPE9DKhc+KY3UKv5OT
 ztChXM9CgGDbnpV0+jlTm6pxLvS414BvRxnYgLGgAh8oa/OPgO66b8zAZ+7hbSjX
 LLv+lDsjQL6i5jbmKR6zVO8ULvTO0ubpwXbTdMO4UHq8GwvIay9XQ43mdGLNcSHl
 WiiauR2G5k+BQMylOcxaD6Ji4OKiQ==
X-ME-Sender: <xms:h7JsYNyOthpHL0k2pYgfhJueCoLZLnVM-ymOp--7MfdBmhjdOcNUKw>
 <xme:h7JsYNSX2ibrKmH35ro8kYMNxQToawd6za66cW2Q2tAsvN9pJezaQPvWi7nzQMmFG
 RMTP5yYRxWEhX7tv7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepgeejudegieduieehudeukeelkeehjeehheejtddukedvhfdvueetledv
 udetjeevnecuffhomhgrihhnpehmrghilhdqrghrtghhihhvvgdrtghomhdpnhhonhhgnh
 hurdhorhhgnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:h7JsYHV1S7YVKmehEc93UFzRkmAOSiyPkP3Fujn1-hktojN_16jYGg>
 <xmx:h7JsYPiMZ2z3_d0zE-eZPr55k_9eXjkJhYNEvPnUOMTKhT_Bh7pS-w>
 <xmx:h7JsYPCZoXE-iLbTXXLAtCQ8UmtO5llUu6mgmOnAmJsT4z6XNL0Nyw>
 <xmx:h7JsYE4_Fs04Mzos2qIA5Dwwmqey3hn__IZwK6FU90sPeGC-55trFw>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14C5624005A;
 Tue,  6 Apr 2021 15:12:07 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 35BAAA92; Tue,  6 Apr 2021 21:12:04 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
 <m3wntkio0c.fsf@bernat.ch> <20210406210558.15749f84@redhat.com>
Date: Tue, 06 Apr 2021 21:12:04 +0200
In-Reply-To: <20210406210558.15749f84@redhat.com> (Igor Mammedov's message of
 "Tue, 6 Apr 2021 21:05:58 +0200")
Message-ID: <m3zgyb9qij.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=vincent@bernat.ch;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  6 avril 2021 21:05 +02, Igor Mammedov:

>> >>> This can be invoked with:
>> >>> 
>> >>>     $QEMU -netdev user,id=internet
>> >>>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>> >>>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev  
>> >>
>> >> an ACPI alternative was merged recently (current master).
>> >> assigning 'designation=' wasn't implemented there, but important part
>> >> of giving users control over PCI devices 'eno' index is implemented.
>> >>
>> >> When I looked into the issue, smbios way was a bit over-kill for the task
>> >> and didn't really work if hotplug were used.
>> >>
>> >> See, for example how to use new feature:
>> >>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html  
>> >
>> > It seems simpler this way. I don't think my patch is needed then.  
>> 
>> Well, after thinking a bit, if the patch is good enough, maybe it can
>> still be merged. It is fairly generic and it adds the ability to set the
>> name of the card. It's not as convenient as using acpi-index, but I
>> could add a note about acpi-index in the documentation to let people
>> know they may prefer the simpler acpi-index?
>
> Patch looks fine to me.
> Can you fix TODO item in it (segment_group_number) on next respin,
> pls?

I think this is already done in the v4 posted a few days ago:

https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00238.html
-- 
There is a great discovery still to be made in Literature: that of
paying literary men by the quantity they do NOT write.

