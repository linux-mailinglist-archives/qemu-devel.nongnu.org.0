Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E53043EF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:43:25 +0100 (CET)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RR6-0004fV-48
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4RKy-0000j8-0T
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4RKw-0003LY-35
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611679021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JnZk1RqeFSi7bclREiSoIRSyCiYu7PLa0t9pwv3lrHI=;
 b=F0KUu1QRD29hsdklxI1pXvMHs9jSrwVSYjCgccHq3Ze7KrFgvgCMqzyJ78TKfwYmRH+dOR
 2qAmVD+YoRtrbnaQ2ma8OKaDSzZdaLaEpaYf8P2x8XMelKrIYbjJaILwX9ixQFXZIwz+zy
 mEpG0OxHurQ2tQusYS88cMQbq0Wvp/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-54qIJSGENuWH4VsyYfXTmg-1; Tue, 26 Jan 2021 11:36:55 -0500
X-MC-Unique: 54qIJSGENuWH4VsyYfXTmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA9A107ACF6;
 Tue, 26 Jan 2021 16:36:54 +0000 (UTC)
Received: from redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80FD2100239F;
 Tue, 26 Jan 2021 16:36:53 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:36:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210126163647.GJ3640294@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
> My Big Sur/Apple Silicon system fails "make check" in
> test-crypto-tlscredsx509:
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> G_TEST_SRCDIR=/Users/pm215/qemu/tests
> G_TEST_BUILDDIR=/Users/pm215/qemu/build/all/tests
> tests/test-crypto-tlscredsx509 --tap -k
> 
> ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
> Failed to sign certificate ASN1 parser: Value is not valid.
> ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> sign certificate ASN1 parser: Value is not valid.
> make: *** [run-test-70] Error 1
> 
> 
> Does this failure ring any bells for anybody?

Not seen it before.

Is this using a gnutls from homebrew, or one that apple
ship themselves ?  Any idea what version it is ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


