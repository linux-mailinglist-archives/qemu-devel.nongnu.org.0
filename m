Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD032AA57
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:28:38 +0100 (CET)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAhB-0006Ov-3q
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9z5-0007gM-1U
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:43:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9z2-0005k1-8U
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614710579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T9aYNu+rMhnBtVu/Rg1Hj279rbGvXw0u250JQ9BVxAg=;
 b=L2D0+psY6N9bpsAc5YJhVCovVho/BkITihEGFVV/0XB6r5iXDoysSj3b11OEcF+TgpIibc
 qzAjiAbWx+SExn+dlqi71ssKh70JE2pE6m6LihaAcgqchk8nTp/mDCR75ALZfMM3F+qB7g
 xUrM9hS35u93H5ZRjgBOqWgwk12rRRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-6HgIL4NjOg2kt5d5EW5fCw-1; Tue, 02 Mar 2021 13:42:57 -0500
X-MC-Unique: 6HgIL4NjOg2kt5d5EW5fCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEDD0107ACF5;
 Tue,  2 Mar 2021 18:42:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF14710016F6;
 Tue,  2 Mar 2021 18:42:45 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:42:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 17/31] qapi/qom: Add ObjectOptions for input-*
Message-ID: <20210302184244.GJ5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-18-kwolf@redhat.com>
 <5b289a55-6c6f-2529-a21f-19012782229c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b289a55-6c6f-2529-a21f-19012782229c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 21:55 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the input-* objects.
> > 
> > ui.json cannot be included in qom.json because the storage daemon can't
> > use it, so move GrabToggleKeys to common.json.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/common.json | 12 ++++++++++
> >  qapi/qom.json    | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/ui.json     | 13 +----------
> >  3 files changed, 71 insertions(+), 12 deletions(-)
> > 
> 
> > +##
> > +# @InputBarrierProperties:
> > +#
> > +# Properties for input-barrier objects.
> > +#
> > +# @name: the screen name as declared in the screens section of barrier.conf
> > +#
> > +# @server: hostname of the Barrier server (default: "localhost")
> > +#
> > +# @port: TCP port of the Barrier server (default: "24800")
> 
> I can understand this being a string (if non-numeric, it can be treated
> as a well-known service name instead), but...
> 
> > +#
> > +# @x-origin: x coordinate of the leftmost pixel on the guest screen
> > +#            (default: "0")
> 
> ...why are these other fields a string instead of an integer?  But you
> are just doing faithful translation of what we already have.

I wondered the same. Most properties of the user creatable objects make
sense, but for some, I can't imagine why we thought this was a good
idea.

Well, moving descriptions to the QAPI schema can hopefully help to avoid
introducing new cases in the future because they become more obvious.

> Bummer - our naming for this member implies that it is experimental,
> which is a misnomer (it is quite stable, when viewed in tandem with
> y-origin).  Not your fault.  Would 'origin-x' and 'origin-y' be any
> better as new aliases in a followup patch?

Oh, good point. Makes sense, once the alias series is in.

Kevin


