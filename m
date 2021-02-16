Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBDF31CD50
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:57:03 +0100 (CET)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2il-0001nZ-2Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC2gC-0000Oi-Dh
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:54:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC2g7-0004Wk-Lz
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613490856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xj8wI8FQpfAQxBssXLDSftq9iNCY6LfJxAiXVD84+5g=;
 b=ia95uv59S9sTrSrEdSG0o/f/KIreUNHxofj+WF146yeak4k86niJq68NDE1lPO3ARWd7x0
 qtfxRK7pcMXTECSRSPe6B15m0B0Jd4b+DMrsCns5S4Ltr21u2pQa1yL7hVjX7r3xrM7C1N
 JSl+CENrCUirtf2xZzNe0l5uc9j+NQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-42nO463LOvKp-QZFwQqm_A-1; Tue, 16 Feb 2021 10:54:14 -0500
X-MC-Unique: 42nO463LOvKp-QZFwQqm_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0747189DF4E;
 Tue, 16 Feb 2021 15:54:13 +0000 (UTC)
Received: from gondolin (ovpn-113-145.ams2.redhat.com [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20DD19D9F;
 Tue, 16 Feb 2021 15:54:07 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:54:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210216165405.57599fe8.cohuck@redhat.com>
In-Reply-To: <20210216151945.736eb6c7.pasic@linux.ibm.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210216151945.736eb6c7.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 15:19:45 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 16 Feb 2021 12:18:30 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > The virtio standard specifies that any non-transitional device must
> > reject commands prior to revision setting (which we do) and else
> > assume revision 0 (legacy) if the driver sends a non-revision-setting
> > command first. We neglected to do the latter.  
> 
> Huh, I my opinion, it ain't very clear what is specified by the virtio
> standard (which starts with version 1.0) for the described situation.
> 
> The corresponding device normative section (4.3.2.1.1 Device
> Requirements: Setting the Virtio Revision) says that: "A device MUST
> treat the revision as unset from the time the associated subchannel has
> been enabled until a revision has been successfully set by the driver.
> This implies that revisions are not persistent across disabling and
> enabling of the associated subchannel.". It doesn't say anything more
> about the situation where the first command is not SET_VIRTIO_REV.
> 
> The section "4.3.2.1.3 Legacy Interfaces: A Note on Setting the Virtio
> Revision" which is to my best knowledge not normative, as none of the
> legacy-interface stuff is normative, but a mere advice on how to deal
> with legacy then says: "A legacy driver will not issue the
> CCW_CMD_SET_VIRTIO_REV prior to issuing other virtio-ccw specific
> channel commands." ... "A transitional device MUST assume
> in this case that the driver is a legacy driver and continue as if the
> driver selected revision 0. This implies that the device MUST reject any
> command not valid for revision 0, including a subsequent
> CCW_CMD_SET_VIRTIO_REV."
> 
> Do we agree that the legacy interface sections in general, and 4.3.2.1.3
> in particular is non-normative?

IMHO, normative and non-normative are not something that applies to the
legacy sections. The legacy sections are supposed to give guidance on
how to write transitional devices/drivers that can deal with legacy
implementations. If you want to write something that strictly only
adheres to normative statements, you have to write a non-transitional
device/driver. Legacy support was never an official standard, so
'normative' is meaningless in that context.

> 
> In my opinion the normative 'must threat as unset until set by driver'
> and 'if first cmd is not _REV, must continue as if the driver selected
> revision 0' is in a slight collision.

I don't think there's a collision. If we want to accommodate legacy
drivers, we have to deal with their lack of revision handling, and
therefore treat non-_REV commands as implicitly selecting revision 0.

If we want to implement a non-transitional device, the implicit
selection of revision 0 goes away, of course. In fact, I'm currently
trying to make legacy support optional for virtio-ccw, so that's why I
had been looking at the revision handling :)

> 
> 
> > 
> > Fortunately, nearly everything worked as intended anyway; the only
> > problem was not properly rejecting revision setting after some other
> > command had been issued. Easy to fix by setting revision to 0 if
> > we see a non-revision command on a legacy-capable revision-less
> > device.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> 
> The change won't hurt so with a toned down commit message:
> Acked-by: Halil Pasic <pasic@linux.ibm.com>

Replace 'and else' with 'a transitional device needs to'?

> 
> > ---
> >  hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> > index 4582e94ae7dc..06c06056814b 100644
> > --- a/hw/s390x/virtio-ccw.c
> > +++ b/hw/s390x/virtio-ccw.c
> > @@ -327,13 +327,20 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
> >                                     ccw.cmd_code);
> >      check_len = !((ccw.flags & CCW_FLAG_SLI) && !(ccw.flags & CCW_FLAG_DC));
> >  
> > -    if (dev->force_revision_1 && dev->revision < 0 &&
> > -        ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> > -        /*
> > -         * virtio-1 drivers must start with negotiating to a revision >= 1,
> > -         * so post a command reject for all other commands
> > -         */
> > -        return -ENOSYS;
> > +    if (dev->revision < 0 && ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> > +        if (dev->force_revision_1) {
> > +            /*
> > +             * virtio-1 drivers must start with negotiating to a revision >= 1,
> > +             * so post a command reject for all other commands
> > +             */
> > +            return -ENOSYS;
> > +        } else {
> > +            /*
> > +             * If the driver issues any command that is not SET_VIRTIO_REV,
> > +             * we'll have to operate the device in legacy mode.
> > +             */
> > +            dev->revision = 0;
> > +        }
> >      }
> >  
> >      /* Look at the command. */  
> 


