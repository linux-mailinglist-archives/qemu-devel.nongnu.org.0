Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B9372D22
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:39:26 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx8v-0004RX-6R
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ldwwh-00017f-V2
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ldwwZ-0000hz-Rl
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620141998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ot+XuDGDq72eg7LmHupejUozcDXHELSlPsG8x+q5v1A=;
 b=g2KIr+3qpOHCQo8XgmSBf5Pk8mmTUqjA+rUfiP4UWw0VZkExnpzK0ACWBucWvFo0rfmEWU
 AuFQQvoFtVOAeGd33qSmYldIeGYq4eNQXsG1m75fjlyLRf9DzsXKuKhE1bIu7tm+wo1PNQ
 azHb97cT4IBIKEb83h7mxAVtZcaTbFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-dL0yIzDiMRmJ7l0cxi-Byw-1; Tue, 04 May 2021 11:26:35 -0400
X-MC-Unique: dL0yIzDiMRmJ7l0cxi-Byw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDCBA40C0;
 Tue,  4 May 2021 15:26:34 +0000 (UTC)
Received: from localhost (unknown [10.22.8.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43B175C1B4;
 Tue,  4 May 2021 15:26:23 +0000 (UTC)
Date: Tue, 4 May 2021 11:26:23 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <20210504152623.cq5pokrzfnqcke7a@habkost.net>
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
 <YJFbFztA61itLoR2@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJFbFztA61itLoR2@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 03:32:55PM +0100, Stefan Hajnoczi wrote:
> On Thu, Apr 29, 2021 at 02:03:52PM -0400, Eduardo Habkost wrote:
> > On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
> > > Live migrating old guests from an old QEMU with the SCSI feature bit
> > > enabled will fail with "Features 0x... unsupported. Allowed features:
> > > 0x...". We've followed the QEMU deprecation policy so users have been
> > > warned...
> > > 
> > 
> > Were they really warned, though?  People running
> > "-machine pc-i440fx-2.4" might be completely unaware that it was
> > silently enabling a deprecated feature.
> > 
> > Can we have this documented in a more explicit way?  Maybe just a
> > comment at hw_compat_2_4 would be enough, to warn people doing
> > backports and rebases downstream.
> > 
> > Can we make QEMU refuse to start if using pc-2.4 + virtio-blk
> > together, just to be sure?
> 
> On second thought, do we really want to break pc-2.4 user's QEMU
> command-lines if they have a virtio-blk device?

It depends which command line you are talking about.

I believe we _must_ break the following:
"-machine pc-i440fx-2.4 -device virtio-blk", and
"-machine pc-i440fx-2.4 -device virtio-blk,scsi=on".
Your patch breaks only the latter.

Your patch also breaks the following:
"-machine pc-i440fx-2.4 -device virtio-blk,scsi=off",
which I don't think we should break.

> 
> BTW Peter mentioned libvirt avoids the unnecessary scsi=off:
> https://gitlab.com/libvirt/libvirt/-/commit/ec69f0190be731d12faeac08dbf63325836509a9
> 
> Stefan



-- 
Eduardo


