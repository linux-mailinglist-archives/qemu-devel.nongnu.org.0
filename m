Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20F3A3EF7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 11:18:56 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrdJW-0001Ab-MO
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 05:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrdIm-0000Lq-Id
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrdIj-0007X2-Tf
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623403085;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hspVsMxBxMud2J5BX5I1D4JRLVN7jaH3A39bqC2tqIg=;
 b=iMqoG+Wllhnd+fu5FFecaMTlBERR6Pea8qBcN6TTy2JhvSxp7UZ18NX8ul3KKARxwl6V8q
 71TXyjAaOPCqInpV7q5DRNeGNEDqcOY1FVWwCF4ypFNYCUWL204kVuoDupE8Bp4+8XjkYz
 iyShwSgZW670OPjlC8txuEbmNskUNp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-n8Ptkam7PNiZemYh9fokEA-1; Fri, 11 Jun 2021 05:17:57 -0400
X-MC-Unique: n8Ptkam7PNiZemYh9fokEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CC0100B3AC;
 Fri, 11 Jun 2021 09:17:56 +0000 (UTC)
Received: from redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B42A310016FC;
 Fri, 11 Jun 2021 09:17:55 +0000 (UTC)
Date: Fri, 11 Jun 2021 10:17:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: iotest 233 failing
Message-ID: <YMMqQJGrR3iLUlFa@redhat.com>
References: <20210610203446.2okmirg7jlt2khwm@redhat.com>
 <YMKEonz0KpiOEVmq@redhat.com> <YMKFNEZIeTT6mD+J@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMKFNEZIeTT6mD+J@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 10:33:40PM +0100, Daniel P. Berrangé wrote:
> On Thu, Jun 10, 2021 at 10:31:14PM +0100, Daniel P. Berrangé wrote:
> > On Thu, Jun 10, 2021 at 03:34:46PM -0500, Eric Blake wrote:
> > > I'm now getting failures on iotest 233:
> > > 
> > > 233   fail       [15:26:01] [15:26:03]   2.1s   (last: 1.3s)  output mismatch (see 233.out.bad)
> > > --- /home/eblake/qemu/tests/qemu-iotests/233.out
> > > +++ 233.out.bad
> > > @@ -65,6 +65,6 @@
> > >  == final server log ==
> > >  qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
> > >  qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
> > > -qemu-nbd: option negotiation failed: TLS x509 authz check for CN=localhost,O=Cthulhu Dark Lord Enterprises client1,L=R'lyeh,C=South Pacific is denied
> > > -qemu-nbd: option negotiation failed: TLS x509 authz check for CN=localhost,O=Cthulhu Dark Lord Enterprises client3,L=R'lyeh,C=South Pacific is denied
> > > +qemu-nbd: option negotiation failed: TLS x509 authz check for C=South Pacific,L=R'lyeh,O=Cthulhu Dark Lord Enterprises client1,CN=localhost is denied
> > > +qemu-nbd: option negotiation failed: TLS x509 authz check for C=South Pacific,L=R'lyeh,O=Cthulhu Dark Lord Enterprises client3,CN=localhost is denied
> > >  *** done
> > > Failures: 233
> > > Failed 1 of 1 iotests
> > > 
> > > Looks like I recently updated to gnutls-3.7.2-1.fc34 on June 1, could
> > > that be the culprit for the error message being reordered?
> > 
> > It is possible I guess. They have indeed made such a change in the past
> > and reverted it when I pointed out that this is effectively an ABI for
> > apps, because access control lists are based on matching the distinguish
> > name string, as an opaque string. The cause certainly needs investigating
> > as a matter of urgency because this is ABI for QEMU's authz access control
> > lists.
> 
> There is an ominous sounding NEWS item in 3.7.2
> 
> ** certtool: When producing certificates and certificate requests, subject DN
>    components that are provided individually will now be ordered by
>    assumed scale (e.g. Country before State, Organization before
>    OrganizationalUnit).  This change also affects the order in which
>    certtool prompts interactively.  Please rely on the template
>    mechanism for automated use of certtool! (#1243)
> 
> This ordering change in certtool seems to correspond with the new order
> you see above in the distinguished name, so I wonder if the certtool
> change had accidental side effects.

Right so iotest 233 of course creates a new certificate, and so it picks
up the new certtool behaviour, which means the certificate it generates
has the distinguished name in the new order. This is good because it
means the gnutls API for querying the distinguished name is still using
the same ordering as before. This is bad because the iotest is obviously
susceptible to changes it the way the certificate is created.

I think we might just need to apply a filter to strip the distinguished
name from the output.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


