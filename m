Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711A323F35
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:42:53 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvNM-0005iA-Ft
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEvLJ-0004Hi-9P
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:40:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEvKi-0000h6-7c
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GegC50EfuvPzZzMK7MgbgwP/E1JrvN4Hv1w+5TCIrN0=;
 b=NJXsN9KEJ90NhVDUeLwKTF6r9jqSBXlf10bjBysgMExkEGbUuun923EbQdd8SAmXN2L45q
 5PznICF3jiIeU12xfgk8PrfmDNGeo+MUG6NAqAn1SaVkSaCe4nSjR8T3m4e3tqmJ4hF1+Y
 B4tdJmRaBhqWXobPABzE1ys1amAoqkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-9jojPhYtMY2FFWiwQpJCsg-1; Wed, 24 Feb 2021 09:40:04 -0500
X-MC-Unique: 9jojPhYtMY2FFWiwQpJCsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48024115B03C;
 Wed, 24 Feb 2021 13:46:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 584C210016FD;
 Wed, 24 Feb 2021 13:46:25 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:46:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 01/14] ui, monitor: remove deprecated VNC ACL option and
 HMP commands
Message-ID: <YDZYroyUabw4acKp@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-2-berrange@redhat.com>
 <c82447de-e268-4237-248f-cb9017798b09@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c82447de-e268-4237-248f-cb9017798b09@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Feb 24, 2021 at 02:36:46PM +0100, Thomas Huth wrote:
> On 24/02/2021 14.11, Daniel P. Berrangé wrote:
> > The VNC ACL concept has been replaced by the pluggable "authz" framework
> > which does not use monitor commands.
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   docs/system/deprecated.rst       |  16 ---
> >   docs/system/removed-features.rst |  13 +++
> >   hmp-commands.hx                  |  76 -------------
> >   monitor/misc.c                   | 187 -------------------------------
> >   ui/vnc.c                         |  38 -------
> >   5 files changed, 13 insertions(+), 317 deletions(-)
> 
> If I run:
> 
>  grep -r vnc.*acl *
> 
> I also see some lines in tests/check-block-qdict.c ... are they related and
> should be removed, too?

Yes & no.  This test is using the vnc ACL syntax as example input for
validating the qdict parsing, but isn't functionally connected to the
actual VNC ACL impl.

> Apart from that, patch looks fine to me:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


