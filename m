Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081943C25C2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:19:06 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rLN-0003cT-3S
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rKC-00020g-5X
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rKA-0008Cd-I9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625840270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDFZx2F4T2TULPlpl1nzfbmRGs6qCqxN1WWf3eZrToA=;
 b=cNsPEITadpZh7oAdJ4c3hAnAHS2XWvXDqnzsldg8Axu5l+hzYL04VKozPsRVjp6s7kEpPz
 cXytqvAUFanxfTIvdFASGFkqqL4zzxZcjKhamwnuccLGBYhHsJ+Vj5ClB4f+satgXEUjYo
 4WN5ORA4pPDMl0xuXB2y7ccowj94ySI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-lJuUiFWENX2P9c_0SOeU7g-1; Fri, 09 Jul 2021 10:17:46 -0400
X-MC-Unique: lJuUiFWENX2P9c_0SOeU7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD96A802921;
 Fri,  9 Jul 2021 14:17:45 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4F010016F7;
 Fri,  9 Jul 2021 14:17:45 +0000 (UTC)
Date: Fri, 9 Jul 2021 09:17:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/2] iotests: Improve and rename test 291 to
 qemu-img-bitmap
Message-ID: <20210709141743.mp3g7oeu4zoouxpl@redhat.com>
References: <20210708013001.2576991-1-eblake@redhat.com>
 <20210708013001.2576991-2-eblake@redhat.com>
 <0abfb3e1-7075-39f6-16c9-3690377c2d56@virtuozzo.com>
 <20210709131650.atmnvid6376msxpz@redhat.com>
 <37cad204-ccb7-454e-b91c-83be04c38167@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <37cad204-ccb7-454e-b91c-83be04c38167@virtuozzo.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, nsoffer@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 04:49:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 09.07.2021 16:16, Eric Blake wrote:
> > On Fri, Jul 09, 2021 at 09:33:50AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> > 
> > > > +echo
> > > > +echo "=== Check handling of inconsistent bitmap ==="
> > > > +echo
> > > > +
> > > > +$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
> > > > +$QEMU_IMG bitmap --add "$TEST_IMG" b4
> > > > +$QEMU_IMG bitmap --remove "$TEST_IMG" b1
> > > > +_img_info --format-specific | _filter_irrelevant_img_info
> > > > +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> > > 
> > > Worth then removing remaining inconsistent bitmaps and try again?
> > > 
> > > I think you should now remove $TEST_IMG.copy in _cleanup
> > 
> > $TEST_IMG.copy isn't created on failure (or if it is, that in itself
> > is a problem we should be avoiding),
> 
> Seems that's the case:

Oh. Thanks for checking.  Yeah, re-reading the code, we don't attempt
to copy the bitmaps until after the rest of the convert operation is
done.  Which means a fix to pre-validate bitmaps before starting the
convert requires more code, but may be the right thing (failing at the
very end of a long convert attempt, but leaving the file around, is
not ideal compared to failing fast).

Looks like my v2 will be a bit more beefy.
> ./build/qemu-img convert --bitmaps -O qcow2 x y
> qemu-img: Failed to populate bitmap b1: Bitmap 'b1' is inconsistent and cannot be used
> Try block-dirty-bitmap-remove to delete this bitmap from disk[root@kvm master]#
> # ls y
> y
> ./build/qemu-img info y
> image: y
> file format: qcow2
> virtual size: 1 MiB (1048576 bytes)
> disk size: 204 KiB
> cluster_size: 65536
> Format specific information:
>     compat: 1.1
>     compression type: zlib
>     lazy refcounts: false
>     bitmaps:
>         [0]:
>             flags:
>             name: b1
>             granularity: 65536
>     refcount bits: 16
>     corrupt: false
>     extended l2: false
> 
> 
> WOW! It even contains the bitmap not marked in-use. That's a real bug.

So we left things dangling with a bitmap that has completely different
contents than in the original file.  Yeah, that looks like an issue
worth improving.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


