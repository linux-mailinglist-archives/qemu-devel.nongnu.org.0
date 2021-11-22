Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0614597C2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 23:36:33 +0100 (CET)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpHvM-0000ox-BB
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 17:36:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mpHtG-0007ht-G1; Mon, 22 Nov 2021 17:34:22 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mpHtE-0004Nk-8T; Mon, 22 Nov 2021 17:34:22 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 37CC632007F9;
 Mon, 22 Nov 2021 17:34:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 22 Nov 2021 17:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GeFxMH
 hk963wP48bsosdue7CpFiGqCtYGCh+cQeLAqc=; b=G544TbUuegMA17h5LDHI7F
 06AcnoozJviUc5aRrUB3jMdwpCDJ+Ctnd6slj+mdylBirZHz28M8Qf6HT/0hX4DY
 udc48KXBoYgqEZsUWA0TWEupz0Fr4hbNtXAEoVNVspDoZdLv0+Z8Uj5pmAjJQi1O
 HZ3OolLzEED0c5UAj4LRzWBm9myD+HvniC+MKuUlyQD7lNAlJ+8OAb3WMa09vn3Y
 KlUdUr8L3fvesmGcKBrVgatOzXojpLRIGXqtc8IZRhLaACNrXom3GmhHY86kM2fZ
 aWgwaktGlsEOXqHeCBab+u7XqI+E5+QRZAwDA1zML160xQTdmCLn5hoN48kj1XIA
 ==
X-ME-Sender: <xms:5xqcYf0P59kpZb553sSlkHlkKMnsjRUGJxPUDAIec8IwhLAH7MuZ1g>
 <xme:5xqcYeE48cpQ3EZk5RT9Tfh_Tvebf74K7JeQvXjdcqH3jbatdNQ_xL52i1sz7w5f_
 UqAHqUJSzgklbtOUU4>
X-ME-Received: <xmr:5xqcYf61m6Yxtz88AVPK58pPhX1ZJJjDh63Urk0mT68mL5A5y9CP6IMNUB1uLl3ShCtcluxeskPDV_l1KaIayZexqokyDMjwy2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdduieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepkeevvedtkeeftdefhfdvgfelleefhfdtfeeiteejjeevgffhudefjeekhefg
 uedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:5xqcYU0d2iQkq-rIhEMDA11rAtiC0UZ_fru5XFIOjO12UCCnH_JOoA>
 <xmx:5xqcYSFscaxCOzfCmIX-zpHI4PCCYweraLUFmqzwHnj1xNgwYD1x0g>
 <xmx:5xqcYV9MwyCsj1Nm80AmQzNIQmtlAR_zlkmX2yRQ8uE7J68wwr7ODQ>
 <xmx:5xqcYeikPp98SUZt6QeXLPZ9F5056E9tZsUXmtyxBOzpTTgt5hK-2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 17:34:11 -0500 (EST)
Date: Tue, 23 Nov 2021 09:34:06 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
In-Reply-To: <CAFEAcA-h2B3JELSrQs0dP3shqPNDe2NDMqCqT5oGoOjjM6mzRw@mail.gmail.com>
Message-ID: <159c1cb-eec0-d689-1df7-8fcfdc2e5c25@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
 <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
 <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
 <ad537ce9-ec40-b5e4-bb32-5f53e42db29@linux-m68k.org>
 <74d1f17a-d414-8cda-6720-a62617613215@ilande.co.uk>
 <8b1022bd-f4ae-d0bd-3f22-425da56ef753@linux-m68k.org>
 <CAFEAcA-h2B3JELSrQs0dP3shqPNDe2NDMqCqT5oGoOjjM6mzRw@mail.gmail.com>
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021, Peter Maydell wrote:

> On Sat, 20 Nov 2021 at 23:40, Finn Thain <fthain@linux-m68k.org> wrote:
> > Anyway, thanks for taking the time to write. A competent reviewer has to
> > do much more than that, but I'm not paying for competence so I suppose I'm
> > asking too much.
> 
> Please dial back the aggressive tone here, Finn: this kind of
> thing is way out of line. We're all trying to help improve QEMU here,
> and sniping at Mark is not constructive.
> 

Peter, you seem to have misunderstood what I wrote. What I said was not 
sniping. "Incompetent" was my conclusion after I judiciously rejected 
"malicious". Here's what I mean by incompetent.


CONTRIBUTOR: Here's a patch.

MAINTAINER: I personally don't like that pattern. End of story.

CONTRIBUTOR: I don't think I'll contribute further to this project.

[Everyone loses.]


Now, here's what I would consider "competent":

CONTRIBUTOR: Here's a patch.

MAINTAINER: That pattern (I've quoted it to help further the discussion) 
is widely deprecated. You should use a different pattern instead. [Or read 
this reference. Or refer to this code.]

CONTRIBUTOR: OK, I see that this really is a problem, and I see that there 
really is a better way. However, the antipattern is already part of 
existing code, and my changes don't worsen the problem, and don't require 
that the problem persist.

MAINTAINER: You're right. My bad (I'm new to this). Since I never bothered 
to fix the existing antipattern, and no-one else thought it was worth 
fixing either, clearly it's not that important, and I should not have 
sought to veto your work, which is substantially unrelated, and beneficial 
either way.

CONTRIBUTOR: No problem.

[Everyone wins.]


Finally, here's the background for you to ponder, in case you would like 
to intervene to produce a better outcome. (I think you are potentially 
well positioned for that.)

https://lore.kernel.org/qemu-devel/cover.1629799776.git.fthain@linux-m68k.org/
https://lore.kernel.org/qemu-devel/cover.1632437396.git.fthain@linux-m68k.org/

