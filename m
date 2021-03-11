Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4896337AA4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:21:14 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOzp-0006dG-HC
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOov-0005Ii-Q5
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOos-0004vv-SB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615482593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12MOtvDdtPTBcHloFL+KKCYlpALhhZswH+gA6Jk+OeI=;
 b=VCWJQdbev2QE20Dt9yRv9/MDZNug3WkIWJeobzAXZOLDUMsyZhCsKOGvGFm8T4YHfgOVuh
 SmrLdusY6B63D96k0f7xEvQ9ZBieMVdMzyoqSLbSZJJ9iUxT/IT/npwO2eY5IpcbGWk2rt
 dHevrN3ql329sc6BFbRs2Hf5IT2oRkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-F1X8isuLNFCz7TgCzgV1RQ-1; Thu, 11 Mar 2021 12:09:50 -0500
X-MC-Unique: F1X8isuLNFCz7TgCzgV1RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9817100C668;
 Thu, 11 Mar 2021 17:09:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 777B15C255;
 Thu, 11 Mar 2021 17:09:47 +0000 (UTC)
Date: Thu, 11 Mar 2021 18:09:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC 0/3] block: drop inherits_from
Message-ID: <20210311170946.GG9008@merkur.fritz.box>
References: <20210311151505.206534-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210311151505.206534-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.03.2021 um 16:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> I now work on v3 for "block: update graph permissions update", and I'm
> at "[PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
> action".
> 
> So, the problem is we should handle inherits_from carefully, and most
> probably it should be updated in bdrv_replace_child_noperm().. And
> then, bdrv_replace_child_noperm will become a transaction action,
> which should store old inherits_from to the transaction state for
> possible rollback.. Or something like this, I didn't try yet. I just
> thought, may be we can just drop inherits_from?
> 
> I decided to learn the thing a bit, and found that the only usage of
> inherits_from is to limit reopen process. When adding bs to
> reopen_queue we do add its children recursively, but only those which
> inherits from the bs.
> 
> That works so starting from
> 
> commit 67251a311371c4d22e803f151f47fe817175b6c3
> Author: Kevin Wolf <kwolf@redhat.com>
> Date:   Thu Apr 9 18:54:04 2015 +0200
> 
>     block: Fix reopen flag inheritance
> 
> 
> The commit made two things:
> 
> 1. reopen recursively all* children, not only .file. That's OK.
> 
> 2. * : not all, but only that inherits_from bs.
> 
> [2] Means that we don't reopen some implicitely created children..
> And, I want to ask, why?

The reason is the difference between

    -drive if=none,file=test.qcow2

and something like

    -blockdev file,filename=backing.img,node-name=backing
    -blockdev file,filename=test.qcow2,node-name=file
    -blockdev qcow2,file=file,backing=backing

The former means that bs->file and bs->backing inherit options from the
qcow2 layer. If you reopen the qcow2 layer to set cache.direct=on, both
children inherit the same update and both the file itself and the
backing file will use O_DIRECT - this is the same as would happen if you
had set cache.direct=on in the -drive option from the start.

In the -blockdev case, the nodes were defined explicitly without
inheriting from the qcow2 layer. Setting cache.direct=on on the qcow2
layer (which is actually created last) doesn't influence the two file
layers. So a reopen of the qcow2 layer shouldn't change the two file
nodes either: If they didn't inherit the option during bdrv_open(), they
certainly shouldn't inherit it during bdrv_reopen() either.

> For me it seems that if we have reopen process.. And bs involved. And
> it has a child.. And child role defines how that child should inherit
> options.. Why not to just inherit them?

The -blockdev behaviour makes things a lot more predictable for a
management tool for which we know that it can handle things on the node
level.

So what we really want is not inheriting at all. But compatibility with
-drive doesn't let us. (And actually -blockdev with inline declaration
of children behaves the same as -drive, which may have been a mistake.)

Kevin


