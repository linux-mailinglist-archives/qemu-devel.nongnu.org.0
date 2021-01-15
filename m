Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DD2F7D66
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:57:32 +0100 (CET)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PbX-0005Ch-VB
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l0PCv-0008JR-LD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l0PCs-0007T6-R4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610717522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r53Se0g+/TCVHS49vu74STlzn+H2plp9K7RU4vC8zww=;
 b=gR7Yr1zMNGi1ouCbNZ5jHoDWseaYOiP5MiH406JomrWPG5YU/tScEDOS4HBuFktDJDbnW/
 S5GW0DS+n/VSy8odle2s0cBXX1H4syR9Hx8T7Sv/YPZMGpy+ugL/TXUB38a/0b414O0r1G
 5vQXtCBiECDrpIsUSgEg3nCUrw2JCjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-WNHsZ73dMFuNYcEI1ft5sA-1; Fri, 15 Jan 2021 08:31:57 -0500
X-MC-Unique: WNHsZ73dMFuNYcEI1ft5sA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D6AF802B45;
 Fri, 15 Jan 2021 13:31:56 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3BDC6B8DD;
 Fri, 15 Jan 2021 13:31:55 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 46C753E0497; Fri, 15 Jan 2021 14:31:54 +0100 (CET)
Date: Fri, 15 Jan 2021 14:31:54 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
Message-ID: <20210115133154.GA531618@paraplu>
References: <cover.1610715661.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <cover.1610715661.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 15, 2021 at 02:02:36PM +0100, Alberto Garcia wrote:
> Hi,

Hi, 

> during the past months we talked about making x-blockdev-reopen stable
> API, and one of the missing things was having support for changing
> bs->file. See here for the discusssion (I can't find the message from
> Kashyap that started the thread in the web archives):
> 
>    https://lists.gnu.org/archive/html/qemu-block/2020-10/msg00922.html

Yeah, I noticed that too -- seems like it got "lost" somehow :-(.  For
the record, I've attached here the original e-mail I sent on 06-OCT-2020
that started the above thread.

Thanks for working on this!

> I was testing this and one of the problems that I found was that
> removing a filter node using this command is tricky because of the
> permission system, see here for details:
> 
>    https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00092.html
> 
> The good news is that Vladimir posted a set of patches that changes
> the way that permissions are updated on reopen:
> 
>    https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00745.html
> 
> I was testing if this would be useful to solve the problem that I
> mentioned earlier and it seems to be the case so I wrote a patch to
> add support for changing bs->file, along with a couple of test cases.
> 
> This is still an RFC but you can see the idea.
> 
> These patches apply on top of Vladimir's branch:
> 
> git: https://src.openvz.org/scm/~vsementsov/qemu.git
> tag: up-block-topologic-perm-v2
> 
> Opinions are very welcome!
> 
> Berto
> 
> Alberto Garcia (2):
>   block: Allow changing bs->file on reopen
>   iotests: Update 245 to support replacing files with x-blockdev-reopen
> 
>  include/block/block.h      |  1 +
>  block.c                    | 61 ++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/245     | 61 +++++++++++++++++++++++++++++++++++---
>  tests/qemu-iotests/245.out |  4 +--
>  4 files changed, 121 insertions(+), 6 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
/kashyap

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="x-blockdev-reopen-thread_06OCT2020.txt"
Content-Transfer-Encoding: 8bit

Date: Tue, 6 Oct 2020 11:10:01 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: berto@igalia.com, eblake@redhat.com
Subject: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
Message-ID: <20201006091001.GA64583@paraplu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, folks

If this was already discussed on the list, please point me to the
thread.  I took a quick look at my local archives, I didn't find any,
besides patches to tests.

I learn that `x-blockdev-reopen` enables a couple of interesting use
cases:

(#) Allowing one to live-change the backing file to point to a different
    location, with the target having content identical to original.
    This one I was already familiar with.

(#) Yesterday I learnt another use case from Peter Krempa and Eric
    Blake.  Allow me to quote (paraphrasing) Eric's example from IRC.
    E.g.  we have (where 'overlay1' has a bitmap):

        base <- overlay1

    Then create a temporary snapshot (which results a bitmap being
    created in 'overlay2', because 'overlay1' had one):
    
        base <- overlay1 <- overlay2
    
    If you want to do a `block-commit` to merge 'overlay2' back into
    'overlay1', currently upstream QEMU does not merge the bitmap states
    from 'overlay2' back into 'overlay1' properly.  This current
    limitation is because QEMU can't merge the bitmaps unless it can
    reopen 'overlay1' [for read-write] _prior_ to doing the commit — but
    the only way to do that is with `x-blockdev-reopen`.

            - - -

From an old chat with Berto on #qemu, he was looking for some more
robust testing, before lifting it out of experimental mode, as it was a
rather complicated command to implement.

Currently, I see there are some 'qemu-iotests' that exercise
'x-blockdev-reopen': 155, 165, 245, and 248.  What else kind of tests
can give more confidence?

(I personally don't have an urgent need for this, so I'm not trying to
rush anything. :-))

-- 
/kashyap

--1yeeQ81UyVL57Vl7--


