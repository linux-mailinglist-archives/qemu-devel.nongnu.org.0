Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0192563A53D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaaL-0002np-8E; Mon, 28 Nov 2022 04:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ozaaB-0002kM-El
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:37:47 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ozaa9-0006f1-4b
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:37:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9A58F23407;
 Mon, 28 Nov 2022 09:37:30 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 28 Nov
 2022 10:37:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00548048cbe-6c0e-42da-9079-280610ff9088,
 483F72FF82335D43BB9469369EB65BED83AD3533) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 28 Nov 2022 10:37:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: Fix some return statements in the synth backend
Message-ID: <20221128103728.2001332c@bahia>
In-Reply-To: <8735a3y1j9.fsf@pond.sub.org>
References: <166930551818.827792.10663674346122681963.stgit@bahia>
 <8735a3y1j9.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 1f4a3df3-4e5e-49a9-8133-1d9d62c1549d
X-Ovh-Tracer-Id: 9320762381477059037
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.58.48; envelope-from=groug@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 28 Nov 2022 08:35:22 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
> > currently return a positive errno value on failure. This causes
> > checkpatch.pl to spit several errors like the one below:
> >
> > ERROR: return of an errno should typically be -ve (return -EAGAIN)
> > #79: FILE: hw/9pfs/9p-synth.c:79:
> > +        return EAGAIN;
> >
> > Simply change the sign. This has no consequence since callers
> > assert() the returned value to be equal to 0.
> 
> Out of curiosity: why is assert() appropriate?
> 

Most of the code base comes from the original synth backend which
was designed to expose QEMU internals to the guest using 9p. The
hope of the virtio-9p authors was that each QEMU subsystem would
create its own tree using these two functions (note that they
are declared extern). Of course these never happened and the synth
backend remained nearly dead code for years, until finally it got
re-used to implement 9p qtest. In this context, failure to create a
synthetic directory or file means the related test has a bug (e.g.
messing with the paths used by some other test). This code likely
needs improvements but we never got to it.

> > While here also get rid of the uneeded ret variables as suggested
> > by return_directly.cocci.
> >
> > Reported-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 

