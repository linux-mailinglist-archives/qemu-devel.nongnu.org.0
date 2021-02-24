Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C6323F39
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:44:25 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvOq-0008CA-TC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEvMA-0005Xm-Lw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEvM8-0001I6-JU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSaGBK9o1EFC3yot+Rxt/hgAW8VJY1LkPtvz1U7ZKT0=;
 b=FL0pZy24JT4SSlpNnrIRV2rfSKV1B8TY61jFO23M908DwcvANkg87WDqB8jQzmX6EGP7aR
 FVoyOlV+6je7o8H6r9p32+vwFlCc6y0YJ15tIjHhGxGUSC3HJLNSop13mW4ilHwOy2XPe7
 oQfffMC5vKyEHrXNORQFZcyHTd2x9qA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-ZjGb-sBuNCe1VEU8T68-jw-1; Wed, 24 Feb 2021 09:40:16 -0500
X-MC-Unique: ZjGb-sBuNCe1VEU8T68-jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8C4118B9EF2;
 Wed, 24 Feb 2021 13:44:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF852C168;
 Wed, 24 Feb 2021 13:44:29 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:44:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/14] softmmu: remove '-usbdevice' command line option
Message-ID: <YDZYOlMynIf+5Kqm@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-5-berrange@redhat.com>
 <18b76a19-6f69-890e-8bb5-54d90aa132c1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <18b76a19-6f69-890e-8bb5-54d90aa132c1@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 02:25:46PM +0100, Paolo Bonzini wrote:
> On 24/02/21 14:11, Daniel P. Berrangé wrote:
> > This was replaced by the '-device usb-DEV' option.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> This is probably used in many tutorial as "-usbdevice tablet" (for example
> https://wiki.gentoo.org/wiki/QEMU/Options).

It has been deprecated, printing a warning message, for almost 4 years
now, and had your ack originally :-)

  commit a358a3af4558a24398a541951cad7a6c458df72b
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Fri May 19 08:35:16 2017 +0200

    usb: Deprecate the legacy -usbdevice option
    
    The '-usbdevice' option is considered as deprecated nowadays and
    we might want to remove these options in a future version of QEMU.
    So mark this options as deprecated in the documenation and print out
    a warning if it is used to tell the user what to use instead.
    While we're at it, improve also some other minor USB-related spots
    in qemu-options.hx that were not up to date anymore.
    
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-id: 1495175716-12735-1-git-send-email-thuth@redhat.com
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


There's some tradeoff to be had.  The 3rd party docs will be unlikely
to be updated to the new syntax as long as the old syntax still works.
So we get ourselves into a chicken & egg scenario.

Overall the -usbdevice doesn't add significant syntax sugar benefits
over -device, as compared benefits of other syntax sugar args we
have.

> > ---
> >   docs/system/deprecated.rst       |  9 -------
> >   docs/system/removed-features.rst |  9 +++++++
> >   softmmu/vl.c                     | 42 --------------------------------
> >   3 files changed, 9 insertions(+), 51 deletions(-)

It seems this is incomplete though, I missed qemu-options.hx,
docs/qdev-device-use.txt and hw/usb/bus.c updates to remove
associated cruft.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


