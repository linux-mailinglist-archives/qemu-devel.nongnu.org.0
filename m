Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045D376F59
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 06:21:52 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfETP-0006cr-4T
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lfESB-0005vP-7I
 for qemu-devel@nongnu.org; Sat, 08 May 2021 00:20:35 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lfES9-0003vn-2n
 for qemu-devel@nongnu.org; Sat, 08 May 2021 00:20:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7F6581587;
 Sat,  8 May 2021 00:20:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 08 May 2021 00:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 bk5J2TUYoXgs7p7APzHANnPCskVDHkTj1mYyFWfi1tw=; b=F78ViGQydpH4DUSj
 mYjxSQGMqoWwpX09cuSRT3kcarUVZiuF2Ya3L2V3fLOUr+uNV/r7BmJfoo4NeM87
 6cfRW96d2KAx7oJHqaRiNuR7mOnTxm9e104cVaIBAqwNYim2Ep+B4VH9AL9gJBZ2
 +rUuKDUVOl5yufOXw0TAQOzeYy0TbmSHSDQLRywKEtxqHp3t/nusoyoVZzufytXW
 0t0dzaJ8u8DsaW/EJS2x+cUk9oW/vBrc/zJJU7XG+mn15+O6jYT9v4lghFXPm6Fd
 5upL4j/Cevl4ZxM84MBrlPRAgVZvR+WJum69696VqRreFXj0pvE0UsNn+RDHK+TK
 EsCNBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=bk5J2TUYoXgs7p7APzHANnPCskVDHkTj1mYyFWfi1
 tw=; b=UQhUOUX6ZNewBVQM42zoyodJln7gMjMic3meWQcDF/zSw2XOXGxgEW1df
 gLDmJSksrwucq++s1Flh29EKynDScQztatXWrwC8F5L8mz1uOFEDs6LH/A3t7ENB
 rsmPI5u4JG2cZDpMPVqnY2BHosHoSwn/me2AOgQhIXHWEjC42kOfF83xZPpfVtv5
 I93v//ybnzAXD8TBMs8Ukz9PgdZh68UKNpboaKsK9EoNUWoyxZ4kTU/cIbk4lYd5
 9FI6D9xm42KJXOmecPAMUPmJ1b4Fmog5q9xG0pMyzAtfpMWIwACZus018fnG7FwN
 VFH4Yt+jM7n769rRgjRRpMDLqp/nA==
X-ME-Sender: <xms:jBGWYFymfb9briGGlnNjrgFeMVY_OEnpntCg4EBLX1VS-Dj_7ncTHg>
 <xme:jBGWYFSZvNjpoTVfLDHGYYFScfZaIf2LqR__jEeYlZ79zu6t7u0nhU3qzNs7cH-D4
 5TlqQW5m8tJgeoY3CY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegfedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:jBGWYPUY3-KRhWoZrXXfVTvBSo7NsC1q56dn2h_4n2ZWcnoJ9kjCJQ>
 <xmx:jBGWYHgqKcYs2Kb7chkTnvmwzy7SR2K5dNBqYxVo6mvJr-qDhOPGNw>
 <xmx:jBGWYHCpks7dvo8qPlhf5Wps1XV3DWwWPyZI3snR6HTjhRRezeSp4A>
 <xmx:jRGWYM4MXuOeSfI_OnycsHA9kgQWq1S8W1sdesMn4BmTxaWjcx9HAA>
Received: from guybrush.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat,  8 May 2021 00:20:28 -0400 (EDT)
Received: by guybrush.luffy.cx (Postfix, from userid 1000)
 id AD5A91FE81; Sat,  8 May 2021 06:20:27 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401171138.62970-1-vincent@bernat.ch>
 <20210503170539.5e813f89@redhat.com> <m3sg338vcd.fsf@bernat.ch>
 <20210503154024-mutt-send-email-mst@kernel.org>
Date: Sat, 08 May 2021 06:20:27 +0200
In-Reply-To: <20210503154024-mutt-send-email-mst@kernel.org> (Michael S.
 Tsirkin's message of "Mon, 3 May 2021 15:42:16 -0400")
Message-ID: <877dk9luus.fsf@bernat.ch>
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  3 mai 2021 15:42 -04, Michael S. Tsirkin:

>> >> +            /*
>> >> +             * We only handle the case were the device is attached to
>> >> +             * the PCI root bus. The general case is more complex as
>> >> +             * bridges are enumerated later and the table would need
>> >> +             * to be updated at this moment.
>> >> +             */
>> >> +            if (!pci_bus_is_root(pci_get_bus(pdev))) {
>> >> +                error_setg(errp,
>> >> +                           "Cannot create type 41 entry for PCI device %s: "
>> >> +                           "not attached to the root bus",
>> >> +                           t41->pcidev);
>> >> +                return;
>> >> +            }
>> > Is this limitation really necessary?
>> >
>> > As far as I see caller of this smbios_get_tables(), is called at machine_done time
>> > when all devices (including bridges) present on CLI are created.
>> 
>> I wasn't sure how to get the segment group number in this case. It seems
>> this is not exposed directly. There is a root_bus_path method returning
>> a string that would need to be parsed to extract the segment group
>> number. Looking a bit, it seems to be always 0.
>
> and not just that. the code comments explains the motivation even
> with a single segment.

Yes, now I remember you told me that in complex cases, the bus is
configured by guest and therefore, we cannot get the right address at
boot. I could update the comment to say "enumerated by guest" or
"configured by guest" if it makes the reason clearer.
-- 
Suspicion always haunts the guilty mind.
		-- Wm. Shakespeare

