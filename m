Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417B158557
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 23:13:56 +0100 (CET)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1HJT-0004yv-Fn
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 17:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rjones@redhat.com>) id 1j1HIQ-0004Sd-Vh
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 17:12:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rjones@redhat.com>) id 1j1HIP-0001e2-Rr
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 17:12:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30836
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rjones@redhat.com>) id 1j1HIP-0001ZD-No
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 17:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581372767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOz4jUc9DBSbAVfQbhgVjaaSplcNNtLmmQV105ndPrw=;
 b=Gz7xVIYjxdejEdBuKwpbixG/MqB/61puKI8+ABp8pJrwFrETUT1goCVco9jQVhH+/qGjxv
 aJzA1bY2t9N0NcdqqhLbESLu5fe4nJN+XNMDb0qc16D/8lKH9f2S45Q//YGt7tUishU6WC
 DrrYd9h9gSRcUiqvaf34sYMW2ED8eOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-ix0loyFpNxm6I5fLidTLxg-1; Mon, 10 Feb 2020 17:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C6CDB60;
 Mon, 10 Feb 2020 22:12:38 +0000 (UTC)
Received: from localhost (unknown [10.36.118.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B55B19C70;
 Mon, 10 Feb 2020 22:12:35 +0000 (UTC)
Date: Mon, 10 Feb 2020 22:12:34 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Message-ID: <20200210221234.GH3888@redhat.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ix0loyFpNxm6I5fLidTLxg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 10, 2020 at 03:37:20PM -0600, Eric Blake wrote:
> For now, only 2 of those 16 bits are defined: NBD_INIT_SPARSE (the
> image has at least one hole) and NBD_INIT_ZERO (the image reads
> completely as zero); the two bits are orthogonal and can be set
> independently, although it is easy enough to see completely sparse
> files with both bits set.

I think I'm confused about the exact meaning of NBD_INIT_SPARSE.  Do
you really mean the whole image is sparse; or (as you seem to have
said above) that there exists a hole somewhere in the image but we're
not saying where it is and there can be non-sparse parts of the image?

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


