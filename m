Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B23337070
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:49:10 +0100 (CET)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIsQ-0005L4-1J
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKIqf-0003N3-15
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKIqT-0005mx-Tf
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615459629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51JhgV2X20kkH17ArReRYPvnbx3P0msJTxvPsFHD91M=;
 b=hfSQfvnw68r5XI8kf0VxLbY0nSBES07dCyQ2wbxsAz00I1Y4UkR+Jv2lU1jjPnmgVDuekR
 +05VkDv894alD2MRmF20/8/NqEibu8F5AA2QNV/i7Sg/W4rY6p6ZUY6bLwldtDM7sM+Xuy
 vRPClq+DXknIjJU+sVnuAitcfvOneao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ZQ-05d4nMmWST4_6JPaNEg-1; Thu, 11 Mar 2021 05:47:05 -0500
X-MC-Unique: ZQ-05d4nMmWST4_6JPaNEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FBB880432E;
 Thu, 11 Mar 2021 10:47:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466FE6A965;
 Thu, 11 Mar 2021 10:46:37 +0000 (UTC)
Date: Thu, 11 Mar 2021 10:46:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/14] hw/scsi: remove 'scsi-disk' device
Message-ID: <YEn1CneqjU9hK9hQ@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-11-berrange@redhat.com>
 <007eb811-6c4f-b456-2536-40dfb254ff14@redhat.com>
MIME-Version: 1.0
In-Reply-To: <007eb811-6c4f-b456-2536-40dfb254ff14@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 03:26:59PM +0100, Thomas Huth wrote:
> On 24/02/2021 14.11, Daniel P. Berrangé wrote:
> > The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   docs/system/deprecated.rst       |  9 -----
> >   docs/system/removed-features.rst |  6 ++++
> >   hw/i386/pc.c                     |  1 -
> >   hw/scsi/scsi-disk.c              | 62 --------------------------------
> >   hw/sparc64/sun4u.c               |  1 -
> >   scripts/device-crash-test        |  1 -
> >   tests/qemu-iotests/051           |  2 --
> >   tests/qemu-iotests/051.pc.out    | 10 ------
> >   8 files changed, 6 insertions(+), 86 deletions(-)
> 
> I see some occurrances of "scsi-disk" in the config files in the
> docs/config/ directory, too ... I guess they should also be removed?

Those aren't referring to the "scsi-disk" device type, they are qdev
IDs, and do indeed already use "scsi-hd" as the  device type.

> 
> > diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> > index d7c27144ba..cda7df36e3 100644
> > --- a/hw/sparc64/sun4u.c
> > +++ b/hw/sparc64/sun4u.c
> > @@ -749,7 +749,6 @@ static char *sun4u_fw_dev_path(FWPathProvider *p, BusState *bus,
> >                                  DeviceState *dev)
> >   {
> >       PCIDevice *pci;
> > -    int bus_id;
> >       if (!strcmp(object_get_typename(OBJECT(dev)), "pbm-bridge")) {
> >           pci = PCI_DEVICE(dev);
> 
> This lonely hunk should be squashed into the previous (ide-disk) patch instead.
> 
>  Thomas

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


