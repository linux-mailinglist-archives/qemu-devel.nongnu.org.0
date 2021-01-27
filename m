Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151C03063AF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:03:05 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4q5n-0004im-Sz
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4q2Q-0003do-Jy
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4q2O-0001HC-9l
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611773970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rau1CmjDdTb9MGHJW4v0SJVzS6dronZic+bz7sJGXmM=;
 b=bpzKUWS8OwxpayQyJ5UFGnMABrfSfK+zNV4yuTPC3E/Eex79ruz6HhimF5+Wii57k9iP08
 rAYYStPbFRjzH6AZ0/D5K/2pLt4/8vISK0cgP/VJvKvH5pF1n3+RU1mpzHbxuYHqr6vzKh
 mJA1ZJ2GBX3uzkGRf7Sz84a0a+WXuMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-S9xWwIOJOxeFYDZWRSyN8Q-1; Wed, 27 Jan 2021 13:59:24 -0500
X-MC-Unique: S9xWwIOJOxeFYDZWRSyN8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E57668066E9;
 Wed, 27 Jan 2021 18:59:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDE25D744;
 Wed, 27 Jan 2021 18:59:20 +0000 (UTC)
Date: Wed, 27 Jan 2021 18:59:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210127185917.GB3653144@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Wed, Jan 27, 2021 at 07:56:16PM +0100, Stefan Weil wrote:
> Am 27.01.21 um 19:17 schrieb Daniel P. Berrangé:
> 
> > On Wed, Jan 27, 2021 at 06:05:08PM +0100, Stefan Weil wrote:
> > > Am 27.01.21 um 17:53 schrieb Daniel P. Berrangé:
> > > 
> > > > In $QEMU.git/crypto/init.c can you uncomment the "#define DEBUG_GNUTLS"
> > > > line and then re-build and re-run the test case.
> > > > 
> > > > There's a bunch of debug logs in code paths from gnutls_x509_crt_privkey_sign
> > > > that might give us useful info.
> > > > 
> > > > Regards,
> > > > Daniel
> > > 
> > > % LANG=C.UTF-8 tests/test-crypto-tlscredsx509
> > > # random seed: R02S9b95072a368ad370cdd4c780b8074596
> > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > 2: signing structure using RSA-SHA256
> > > 3: ASSERT: common.c[_gnutls_x509_der_encode]:855
> > > 3: ASSERT: sign.c[_gnutls_x509_pkix_sign]:174
> > > 3: ASSERT: x509_write.c[gnutls_x509_crt_privkey_sign]:1834
> > > 3: ASSERT: x509_write.c[gnutls_x509_crt_sign2]:1152
> > > Bail out! FATAL-CRITICAL: Failed to sign certificate ASN1 parser: Value is
> > > not valid.
> > So it shows its failing inside a asn1_der_coding call, but I can't see
> > why it would fail, especially if the same test suite passes fine on
> > macOS x86_64 hosts.
> 
> 
> It returns ASN1_MEM_ERROR, so the input vector is too small.

Hmm, that's odd - "Value is not valid" corresponds to
ASN1_VALUE_NOT_VALID error code.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


