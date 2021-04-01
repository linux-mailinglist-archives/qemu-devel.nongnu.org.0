Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257783515A0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:28:08 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyIo-0003Ql-En
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRyHl-0002t1-OK
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:27:01 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRyHe-0006Rv-1H
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:27:01 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1770A5C0097;
 Thu,  1 Apr 2021 10:26:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Apr 2021 10:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 /l40LFjC09Vzp0gGE6Jj1wvXXza7MjTGBc6TiChaxBY=; b=ANsfg2ZsdEIBvKUP
 pp3DAMMTN/LBfGqkJAPhZSJ7NsfKFTnyqAoFZIBoO9HijBFBgzNIPbgZh3111p+/
 s0oFEU5A8BoZz0P1C1yg6tX9DaRQb/KaEXM+kzanjUjy0+aIBPjEU5tHkfmf0NF0
 h6bpxilzdR9E/FdwA4WTWpmDAUCgJctgOf1IexD1127qNKIQUl40eG2jEdiql42Z
 Fx1mIVXhIzXAAg2J4xPEgpwlMxPasVNx84iWVBb5ixhpVwjBsmQJ8Rs6pCGSNO6V
 iVkWYgdUgFDH6ksVXeIkOZJrr6op6Oal7BmJvLJYA65vp6yrYFs755Y905CIcGKK
 Ox2uiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=/l40LFjC09Vzp0gGE6Jj1wvXXza7MjTGBc6TiChax
 BY=; b=exqxQir7ZA8N0zN2QNSPunguTaCI7SndZ6rzoRHPjoBvALIKeaiY64NNV
 XZJUowo7C7SQwx5iEjoAHh9YZZf6+G2UXvgZlXGffIh5I6Ow4crDUYwACP3woht0
 vfJVzBHku8K6unuY/zp0UZzHTOGxC6+GTWhUYvVDgb4N3xRBMcOqvWNvu/RpGEnl
 SmCEZLkosRiMOovCT7hhmiE5KuZEwmCQUxHJM4LWQ3yRf5pphHSxHFp2fzlqMSwE
 Y86Q5qnm44o5w40uEfe3yVovi673/KlzazpNAiftknqYLHLjDm1nBI/UVORcHiyD
 EFV+bpP4HtqK3UKFPPRpPJxMWrApw==
X-ME-Sender: <xms:LNhlYCGgM3KFSqdGFTThfRxPywSwysbJhg470X01cam5go2PBk69UQ>
 <xme:LNhlYI3z44jtqqth8wOieEFzO3GeywUaMHKmZK9v6oRDEWT_Bv0M6NS0EF5Or_Jpi
 lE7uhv67nasQ4RR9UY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:LNhlYEf49UP_o7EldO1QCfRAXLLOlxggvh41LEeSGEwmB7t4BhAvTw>
 <xmx:LNhlYKI_9ftjyh2BwaNHyF0Hi_mJVF5CrHlWVyTwALCz8RZ6wy5zgQ>
 <xmx:LNhlYKFa5seAcHZnYakkZAR2TD5_fy-dbOTZTQ1f9l2oCGpckgRsxw>
 <xmx:LdhlYPBYKTPj05xYVsYPHmwUwtDPUF-IrRbC3ORzetRvryQ4e_Zq3Q>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 746681080054;
 Thu,  1 Apr 2021 10:26:52 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 814CCA28; Thu,  1 Apr 2021 16:26:50 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
 <20210401095725-mutt-send-email-mst@kernel.org>
Date: Thu, 01 Apr 2021 16:26:50 +0200
In-Reply-To: <20210401095725-mutt-send-email-mst@kernel.org> (Michael S.
 Tsirkin's message of "Thu, 1 Apr 2021 09:59:26 -0400")
Message-ID: <m3k0pmjd1x.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=vincent@bernat.ch;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 09:59 -04, Michael S. Tsirkin:

>> +                /*
>> +                 * TODO: Extract the appropriate value. Most of the
>> +                 * time, this will be 0.
>> +                 */
>> +                t->segment_group_number = cpu_to_le16(0);
>> +                t->bus_number = pci_dev_bus_num(pdev);
>> +                t->device_number = pdev->devfn;
>
> Problem is, for devices behind bridges for example, bus is only
> configured by guest, after pci has been enumerated.
>
> So I suspect this either
> - needs to be limited to only work for the root bus
> - needs to be re-evaluted on guest access, like we do
>   with ACPI

Or the address can be provided by the user. I didn't want to keep that
at this is error prone and there may be surprises after adding a device
or after a QEMU upgrade.

Otherwise, limiting to the root bus seems a fine limitation by me. How
do I check that?
-- 
Don't just echo the code with comments - make every comment count.
            - The Elements of Programming Style (Kernighan & Plauger)

