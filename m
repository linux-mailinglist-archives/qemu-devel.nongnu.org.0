Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923B30615C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:54:57 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4o5o-0003n5-Bx
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4o4a-0003KW-Ex
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4o4Y-0003Qm-Gw
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611766417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pilPm5yc2GdFza0Ihd3EWp/O+vPs0OXyRkLWUaNzghw=;
 b=VfvAodw1g6bt9u1lC8w/VHXj8vueyHYzmUmLPEB30V4ELSROJEimc60qpP+BGk5vVGAn9l
 4WHO4mTSFPEr5v3drWBzlCrC0L8NFOj1qDtnNgGc6T9KHz0COlMTb4QvlOKNwpDaR5YuXC
 gi9KPk5AtMuhmORCXyX1qoonHfEgp0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-lfkezU9iOdqJeWjLM7Ca-A-1; Wed, 27 Jan 2021 11:53:35 -0500
X-MC-Unique: lfkezU9iOdqJeWjLM7Ca-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629C38066E9;
 Wed, 27 Jan 2021 16:53:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FAFC5D9CA;
 Wed, 27 Jan 2021 16:53:32 +0000 (UTC)
Date: Wed, 27 Jan 2021 16:53:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210127165330.GT3653144@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 05:44:59PM +0100, Stefan Weil wrote:
> Am 27.01.21 um 13:17 schrieb Daniel P. Berrangé:
> 
> > On Tue, Jan 26, 2021 at 04:41:13PM +0000, Peter Maydell wrote:
> > > On Tue, 26 Jan 2021 at 16:37, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
> > > > > ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
> > > > > Failed to sign certificate ASN1 parser: Value is not valid.
> > > > > ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> > > > > sign certificate ASN1 parser: Value is not valid.
> > > > > make: *** [run-test-70] Error 1
> > > > > 
> > > > > 
> > > > > Does this failure ring any bells for anybody?
> > > > Not seen it before.
> > > > 
> > > > Is this using a gnutls from homebrew, or one that apple
> > > > ship themselves ?  Any idea what version it is ?
> > > Homebrew gnutls, 3.6.15.
> > On further investigation it seems the error comes from libtasn1,
> > but unfortunately there are 100's of scenarios it could arise
> > so difficult one to debug.
> > 
> > In the test_tls_generate_cert method in QEMU tests/crypto-tls-x509-helpers.c
> > 
> > There are conditional lines like
> > 
> >      if (req->country) {
> > 
> >      if (req->altname1) {
> >      ...etc...
> > 
> > I guess one, or more of those, is writing data that libtasn1 is not happy
> > with.
> > 
> > Some one with easy access to this apple silicon will likely need to start
> > by incrementally disabling each of those conditionals eg.  if (req->country
> > && 0)
> > 
> > until we find out which one (might be more than one) make the
> > 
> >     Failed to sign certificate ASN1 parser: Value is not valid.
> > 
> > error message go away. NB, once that ASN1 error goes away, the QEMU test
> > suite will likely give its own error because the certs will no longer
> > have the data it is expecting.
> > 
> > Regards,
> > Daniel
> 
> 
> I could debug into gnutls_x509_crt_sign2. gnutls_x509_crt_privkey_sign seems
> to fail.
> 
> Disabling the conditionals mentioned above did not help.

In $QEMU.git/crypto/init.c can you uncomment  the "#define DEBUG_GNUTLS"
line and then re-build and re-run the test case.

There's a bunch of debug logs in code paths from gnutls_x509_crt_privkey_sign
that might give us useful info.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


