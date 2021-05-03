Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4437208F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 21:36:28 +0200 (CEST)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldeMl-00087b-BB
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 15:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1ldeLG-0007Si-JO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:34:54 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:57003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1ldeLC-000823-S8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:34:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A05821C1A;
 Mon,  3 May 2021 15:34:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 03 May 2021 15:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 XT4aNK/Drf5nW9Gv88m1+EJ+vw+7ca3KdezyJQ83G3k=; b=QYxPyugVTSfKT+wk
 7aLRuoDi2vAqU/opvSaBOucctllqfwp4pm3JYdKb+81d4IMfmbU1o/R046iK8XmG
 LG8FHpk36lnx1Xber4ezhrXsODRsmgLDr/pZPLuqJM04GZcUAQrniUHywzzSQMLT
 H3pjvbWdC2U45DCYLYETB8hggKlvGSsAajNBBe42cCDubT0py79xV8oA65tYftm5
 Pi46B5YTqFjEq/jHjHweR7aZ9x0JxFrTEmxCqvYFv38Y5JIBHGcUEGmuBj/M6N8c
 5l6MgO86QGTXGlAgMVn36aJG9BmI88ZW8KQJ3HiD80UBx9B8Td9v60u1a9Epy+oE
 m4A0Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=XT4aNK/Drf5nW9Gv88m1+EJ+vw+7ca3KdezyJQ83G
 3k=; b=UQ9NBw8ZWAKhzM1gOoYSE4Y6qhFzDjI6C1WjLofJ72Bj4c/K10kMlwoth
 PSObZjNmf1A1jKnZ2Up1CyQvkq8voToOh7m7w3U7321y6flF0BSIgclJBrm86zkF
 4KV2y0YoWrc1MyMTWSbCiQ3VgwCc/WU0ATuIgP2J2JQIyZY2zyDldey5qXA30DTG
 FQIopNwjciAczOJk9dXguMdei8ebUZhdDAXhgQ+1rF92oPDwWavnT5iYWkhsQq1R
 q5KUPowjgHJ+vKStcMcQ6WCedgkoGAY0r1YZUPiUUa9S0BooJJwzqoOnWmVEZtGf
 GpYFHf9ZQU/L+f3RzgzrKmpNr7aTA==
X-ME-Sender: <xms:VVCQYECL4govNptZbKtuZFOI2tj66oZmdzWSUEeyMKrCx7g0avfhZQ>
 <xme:VVCQYGjmhlJ81aaxLAuCq2XcpC_R72EzqdRo19rxoxqLxDHj0uqrap_3yCol2GUW7
 uZEvd3lm4h-2QWfUWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufhffjgfkfgggtgfgsehtkeertddtreejnecuhfhrohhmpeggihhn
 tggvnhhtuceuvghrnhgrthcuoehvihhntggvnhhtsegsvghrnhgrthdrtghhqeenucggtf
 frrghtthgvrhhnpeduueevgeegtdevuddujefgieffieevudeivdejvddufeeltefgfedv
 hfektdeijeenucfkphepledtrdeltddrledtrdefheenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvihhntggvnhhtsegsvghrnhgrthdrtghh
X-ME-Proxy: <xmx:VVCQYHniseXzoTUg_nEOQXGcmZ90Eis9Iyc5s2u7aWnRZ0JgR4o8Xw>
 <xmx:VVCQYKyPpZgwS3BNNsdvt2REJhUPdCxL300seona7IdUOXpccJ4O8Q>
 <xmx:VVCQYJR4ZpQ4YsAGfMscCcJfpMJ2e8UKOrWvyHofhAtqPuvmyDbN3A>
 <xmx:VlCQYIJkxjRvsiguCODLa8PpDq8IxfyO3Oj2bnuqX1TrcfGLImFC0w>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 15:34:45 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 8590091F; Mon,  3 May 2021 21:34:42 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401171138.62970-1-vincent@bernat.ch>
 <20210503170539.5e813f89@redhat.com>
Date: Mon, 03 May 2021 21:34:42 +0200
In-Reply-To: <20210503170539.5e813f89@redhat.com> (Igor Mammedov's message of
 "Mon, 3 May 2021 17:05:39 +0200")
Message-ID: <m3sg338vcd.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=vincent@bernat.ch;
 helo=wout1-smtp.messagingengine.com
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

 ❦  3 mai 2021 17:05 +02, Igor Mammedov:

>> +            /*
>> +             * We only handle the case were the device is attached to
>> +             * the PCI root bus. The general case is more complex as
>> +             * bridges are enumerated later and the table would need
>> +             * to be updated at this moment.
>> +             */
>> +            if (!pci_bus_is_root(pci_get_bus(pdev))) {
>> +                error_setg(errp,
>> +                           "Cannot create type 41 entry for PCI device %s: "
>> +                           "not attached to the root bus",
>> +                           t41->pcidev);
>> +                return;
>> +            }
> Is this limitation really necessary?
>
> As far as I see caller of this smbios_get_tables(), is called at machine_done time
> when all devices (including bridges) present on CLI are created.

I wasn't sure how to get the segment group number in this case. It seems
this is not exposed directly. There is a root_bus_path method returning
a string that would need to be parsed to extract the segment group
number. Looking a bit, it seems to be always 0.
-- 
Don't stop with your first draft.
            - The Elements of Programming Style (Kernighan & Plauger)

