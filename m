Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C927163AA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 14:24:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNz8z-00004z-8d
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 08:24:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hNz7v-0008AF-7L
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hNz7s-0003qJ-2q
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:23:17 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
	id 1hNz7r-0003oO-Lz
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WS71eIOcuEET9lEYbooXPckmFay8olpdz+Ttg4iB7BI=;
	b=Cb5FFSTwUIF8ii9U44DriN0ZoE
	lWvDBUzbs+5p1sgiMRModj6O+P6kQO6ah58kica6mqaxr0asyXHXH0hA/tWf+TXKcuPHxeEBPMSCQ
	2QOAnWvdc7WDJ/4ON0tfovDNAyfFSLORrnyvPnrGTCu9doSMQOaaSD7/F5werlYu8vEP270IeJ1uz
	rCHKcmkr6VCx3eV3H1CD2BuxzcXMYEQXluu3kd15MJV6XBbH8YjEXp5sz7CXnDh0knt7ioaUbMWjm
	aO0H3UZDyXlzDwvNNTIHjbls/n9RNhqFjLQrUkMMFUORou2ZE9mMx9XLIVb8aChw2aw8McvZQYGEm
	WowvZxxeinAj1J4nWWhVFa0vVnbZk2eJpY/MAoRbAkk7TwoHMpUk+OFNj68mGH13U9LUZOb/TUetr
	owB4/Iqfr763Yoq9bmubms0QPhly4P0qWJSwKrsNXWf16eEBb+f0QVv8spYarowkyCelyYEEJXa6f
	HyUdSsjhjouT/3jb+e4NrDHuvTgxowgLL4JDOg8+aN3OoGTLpHABnPbWJeSvetzTit9+8BRetQCAK
	ZDhbcJnBIDqkQ++43QrJgBdhWIPoJpdx+4LLgH1tuetBcTm83LNF2VqBFa3IcR7bv8a3Td3V9EODc
	yK63yq1zelfc+6CSU2ob8abVs86pLHlne2AQzS3yo=;
To: qemu-devel@nongnu.org
Date: Tue, 07 May 2019 14:23:11 +0200
Message-ID: <3336211.WybC1Bzqah@silver>
In-Reply-To: <20190507115556.3d578690@bahia.lan>
References: <590216e2666653bac21d950aaba98f87d0a53324.1557093245.git.qemu_oss@crudebyte.com>
	<1895198.u98Sn5qOsY@silver> <20190507115556.3d578690@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
Subject: Re: [Qemu-devel] [libvirt patch] qemu: adds support for virtfs 9p
 argument 'vii'
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Greg Kurz <groug@kaod.org>, Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 7. Mai 2019 11:55:56 CEST Greg Kurz wrote:
> > support the 'vii' feature of patch 5, which introduces the XML config
> 
> What is patch 5 ?!? What is 'vii' ? I am a bit lost here...

Hi Greg,

Sorry that I caused a bit of confusion, You were actually commenting mostly on 
v2 of the patch set, where my email client replaced the message IDs and hence 
screwed threading.

This is v3 that I sent yesterday and which has correct threading:
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01143.html

Please just have a glimpse on that v3 thread, and before I address the details 
that you requested (I have reviewed them all already and will address them), I 
would like you to ask you for a coarse feedback on design/features first. 
Because there are some things where I am unresolved on design level yet:

1. Should I drop the "persistency" feature of patch 3 (same inode numbers 
after reboots/suspends)  completely from the patch set? It is disabled at 
compile time by default for now after entire v3 patch set is applied. Or 
should that persistency feature probably become a qemu command line option 
instead?

2. If persistency feature should be preserved, shall I probably move out all 
the inode remapping code into a separate C unit to avoid 9p.c getting bloated 
too much (the amount of code for saving/loading the qp*_table hash tables is 
quite large). If yes, any suggestion for an appropriate unit name?

3. Are you fine with the suggested variable length suffixes (patch 4) becoming 
the default behaviour (instead of the fixed length 16 bit prefix solution by 
Antonios)?

4. Do you have a better idea for a name instead of the suggested "vii" (patch 
5) virtfs qemu command line option? And are you fine with the idea of that 
"vii" feature anyway?

> > This is the counter part patch against latest libvirt git master head to
> 
> Hmm... shouldn't this be Cc'd to libvir-list@redhat.com as well then ?

Well, for now I just provided that libvirt patch to give you an idea about how 
imagined this "vii" feature to be used. Does it make sense to CC them already 
even though this suggested "vii" command line option does not exist on qemu 
side yet?

I know I piled up quite a bit of code on this patch set, so to speed up things 
simply raise questions instead of spending too much time in reviewing 
everything in detail already.

Thanks Greg!

Best regards,
Christian Schoenebeck

