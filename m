Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF19305B0F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:19:02 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4jmm-0005gj-Ev
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4jlb-0005Ci-Jo
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:17:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4jlW-00080X-Pu
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611749861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxfzpUt7yvHLe90XMO9CCMjxguhmiGKqNGMnKxgVWQQ=;
 b=dZn/apCU9ivyHmacNNVdSzN2r3txcEwRvlKqE8gRSjqjhVOaDFPRFfQS1rBSo8AUqs8kFx
 9rTzX8qP40tNUao4q8RV5QwpS9jQl3m5XR+QPbYn+LpkK+TsyRPKBiUwE1BSAXE0+yDF1e
 PJ06W2sbswGM2QF8sJ1dURZzoO0LtnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-7EUYxJzgPkijXHLc6s6ZqQ-1; Wed, 27 Jan 2021 07:17:34 -0500
X-MC-Unique: 7EUYxJzgPkijXHLc6s6ZqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01EDE8015C8;
 Wed, 27 Jan 2021 12:17:27 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF76A5D6D3;
 Wed, 27 Jan 2021 12:17:25 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:17:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210127121723.GI3653144@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 04:41:13PM +0000, Peter Maydell wrote:
> On Tue, 26 Jan 2021 at 16:37, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
> > > ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
> > > Failed to sign certificate ASN1 parser: Value is not valid.
> > > ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> > > sign certificate ASN1 parser: Value is not valid.
> > > make: *** [run-test-70] Error 1
> > >
> > >
> > > Does this failure ring any bells for anybody?
> >
> > Not seen it before.
> >
> > Is this using a gnutls from homebrew, or one that apple
> > ship themselves ?  Any idea what version it is ?
> 
> Homebrew gnutls, 3.6.15.

On further investigation it seems the error comes from libtasn1,
but unfortunately there are 100's of scenarios it could arise
so difficult one to debug.

In the test_tls_generate_cert method in QEMU tests/crypto-tls-x509-helpers.c

There are conditional lines like

    if (req->country) {

    if (req->altname1) {
    ...etc...

I guess one, or more of those, is writing data that libtasn1 is not happy
with.

Some one with easy access to this apple silicon will likely need to start
by incrementally disabling each of those conditionals eg.  if (req->country
&& 0)

until we find out which one (might be more than one) make the 

   Failed to sign certificate ASN1 parser: Value is not valid.

error message go away. NB, once that ASN1 error goes away, the QEMU test
suite will likely give its own error because the certs will no longer
have the data it is expecting. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


