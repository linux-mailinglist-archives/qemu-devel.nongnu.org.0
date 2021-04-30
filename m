Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335436F6CC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:59:55 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcO41-0007Ko-No
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lcO2m-0006e8-E8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lcO2j-0002dn-A7
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619769511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8iHExsZ2m+mAFJX3nRD4G6SJG+KA0IVj1+Vi46udoRU=;
 b=A20jlqArZGU0GCl8e6SAG1cWj5VB78aQRgZOhp0P3Li5O/5xPpgDs2uWLk3zcgEn/IhQFD
 +JU65lAZERpqvP798e8uO6XSC83cIFFiDWZq4e0aPMCgvFCJqzhZhTMtONcC2nVrvZjXHx
 cGstBGy+wGeWLF4IqsJJ5s3KRyYzbe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-FrBfPZuvPLyxTN6_ettI6Q-1; Fri, 30 Apr 2021 03:58:29 -0400
X-MC-Unique: FrBfPZuvPLyxTN6_ettI6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C299107ACCD;
 Fri, 30 Apr 2021 07:58:28 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B91A75C237;
 Fri, 30 Apr 2021 07:58:15 +0000 (UTC)
Date: Fri, 30 Apr 2021 09:58:12 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <YIu4lDTeg1TZKWZg@angien.pipo.sk>
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
 <87lf905icy.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf905icy.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 09:42:05 +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
> >> The scsi=on|off property was deprecated in QEMU 5.0 and can be removed
> >> completely at this point.
> >> 
> >> Drop the scsi=on|off option. It was only available on Legacy virtio-blk
> >> devices. Linux v5.6 already dropped support for it.
> >> 
> >> Remove the hw_compat_2_4[] property assignment since scsi=on|off no
> >> longer exists. Old guests with Legacy virtio-blk devices no longer see
> >> the SCSI host features bit.
> >> 
> >
> > This means pc-2.4 will now break guest ABI if using virtio-blk
> > devices, correct?
> >
> > This looks like a sign we should have deprecated pc-2.4 a long
> > time ago.
> 
> The last batch of PC machine type retiring was pc-1.0 to pc-1.3:
> deprecated in 5.0 (commit 30d2a17b4, Dec 2019), dropped in 6.0 (commit
> f862ddbb1, just weeks ago).  pc-1.3 was a bit over seven years old when
> we released 5.0.  pc-2.4 will be six years old by the time we release
> 6.1.  Fair game?

As a data-point, libvirt will be dropping support for <qemu-2.10
(release, not the machine type) in the upcomming release. I'm not sure
whether that justifies more deprecation though.


