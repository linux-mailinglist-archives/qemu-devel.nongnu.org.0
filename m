Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B374630DEAE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:52:06 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KRp-00036F-RM
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7KQd-0002ay-Uq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7KQZ-00072e-LQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612367446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjQXTXRCRwwSXbHYUcA7BvwA50UFdAW2bq81dCMzJSg=;
 b=Q/ZKBrgOn/NbPeSijWNGo1ydFvTc1mBoYumn+eYMY7tCX6tkbPd7YWII+fhO0YJPrhpeWf
 /a5/23n2b6Nfu5cchQhpTsEEkW8pBuzcWH+y5cPqrY09Wa+v6KGB2of9zDx3OII+4qo87W
 Fza6DUgXhKGroauRUDZOZWor6dbO28s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-NrM2-_lGNp-T7pDaBYxzYg-1; Wed, 03 Feb 2021 10:50:43 -0500
X-MC-Unique: NrM2-_lGNp-T7pDaBYxzYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C17EC7401;
 Wed,  3 Feb 2021 15:50:42 +0000 (UTC)
Received: from redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD9460C13;
 Wed,  3 Feb 2021 15:50:26 +0000 (UTC)
Date: Wed, 3 Feb 2021 15:50:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 10/12] tests/qemu-iotests: Replace the words
 'blacklist/whitelist'
Message-ID: <20210203155023.GV300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-11-philmd@redhat.com>
 <20210203102757.GL300990@redhat.com>
 <20210203154133.GD5507@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210203154133.GD5507@merkur.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 04:41:33PM +0100, Kevin Wolf wrote:
> Am 03.02.2021 um 11:28 hat Daniel P. Berrangé geschrieben:
> > On Tue, Feb 02, 2021 at 09:58:22PM +0100, Philippe Mathieu-Daudé wrote:
> > > Follow the inclusive terminology from the "Conscious Language in your
> > > Open Source Projects" guidelines [*] and replace the words "blacklist"
> > > and "whitelist" appropriately.
> 
> We're not doing access control here, so allowlist/denylist are not the
> appropriate words to use here.
> 
> > > [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > >  tests/qemu-iotests/149     | 14 +++++++-------
> > >  tests/qemu-iotests/149.out |  8 ++++----
> > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> > > index 328fd05a4c9..b1d3f5fad67 100755
> > > --- a/tests/qemu-iotests/149
> > > +++ b/tests/qemu-iotests/149
> > > @@ -500,7 +500,7 @@ configs = [
> > >  
> > >  ]
> > >  
> > > -blacklist = [
> > > +denylist = [
> > >      # We don't have a cast-6 cipher impl for QEMU yet
> > >      "cast6-256-xts-plain64-sha1",
> > >      "cast6-128-xts-plain64-sha1",
> > > @@ -510,17 +510,17 @@ blacklist = [
> > >      "twofish-192-xts-plain64-sha1",
> > >  ]
> > 
> > "skiplist" better describes the purpose of this.
> 
> That it's a list is very obvious from the code and doesn't tell anything
> about the content. How about skip_configs?

Sure

> > >  
> > > -whitelist = []
> > > +allowlist = []
> > >  if "LUKS_CONFIG" in os.environ:
> > > -    whitelist = os.environ["LUKS_CONFIG"].split(",")
> > > +    allowlist = os.environ["LUKS_CONFIG"].split(",")
> > 
> > And "filterlist"
> 
> test_configs? configs_to_test?

The list of configs to test is built up by the code. This
env variable is just a hack to let me filter the configs
for debugging. Just  "filter_configs" is ok.

> 
> > >  
> > >  for config in configs:
> > > -    if config.name in blacklist:
> > > -        iotests.log("Skipping %s in blacklist" % config.name)
> > > +    if config.name in denylist:
> > > +        iotests.log("Skipping %s in denylist" % config.name)
> > >          continue
> > >  
> > > -    if len(whitelist) > 0 and config.name not in whitelist:
> > > -        iotests.log("Skipping %s not in whitelist" % config.name)
> > > +    if len(allowlist) > 0 and config.name not in allowlist:
> > > +        iotests.log("Skipping %s not in allowlist" % config.name)
> > >          continue
> 
> The messages need to be updates accordingly, of course.
> 
> Kevin

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


