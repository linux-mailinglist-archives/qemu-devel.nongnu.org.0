Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA652FD109
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:11:35 +0100 (CET)
Received: from localhost ([::1]:45956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DGo-0005Wt-Ua
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2DBy-0003Fq-Sz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2DBw-0004v0-BF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611147991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9UXiIp9vhjeuMFj8BM/Hb8NafvbcAaickHyleEJg8c=;
 b=HLbLMg0vBOc3wf9DK3yQR0aIOAGd1gTNYoYcAh/nYPFXLQxmzO5n2FSE71UJMDuPB+tvVo
 T5a+yAbg2SuFFFgNlO6v/O+Yls7wIQ3UjilK29YLf3PF+rIBWS0S6MKHJiqQbLbjehswOc
 shylu342CXgu73UPiUNN8DP+U+qbqqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-2cQLrM5tNDCRab7zEacYfg-1; Wed, 20 Jan 2021 08:06:29 -0500
X-MC-Unique: 2cQLrM5tNDCRab7zEacYfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DBF3CE642
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:06:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 341A360C6C;
 Wed, 20 Jan 2021 13:06:26 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:06:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: How to run crypto benchmarks tests?
Message-ID: <20210120130624.GI3015589@redhat.com>
References: <c72a38ac-d164-9357-4eda-2334c496c555@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c72a38ac-d164-9357-4eda-2334c496c555@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 01:50:48PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Using the following "build tools and doc" config:
> 
> ../configure --disable-system --disable-user
>                                  ...
>                      TLS priority: "NORMAL"
>                    GNUTLS support: YES
>                         libgcrypt: NO
>                            nettle: YES
>                               XTS: YES
>                          libtasn1: YES
>                               PAM: YES
>                                  ...
> 
> $ make check-help
> ...
>  make check-speed          Run qobject speed tests
> ...
> Test targets:
>   check                          - Run all tests (check-help for details)
>   bench                          - Run all benchmarks
>   docker                         - Help about targets running tests
> inside containers
> 
> $ make check-speed
> make: *** No rule to make target 'bench-speed', needed by 'check-speed'.
>  Stop.
> $ make bench-speed
> make: *** No rule to make target 'bench-speed'.  Stop.
> $ make check-bench
> make: *** No rule to make target 'check-bench'.  Stop.
> $ make bench
> make: Nothing to be done for 'bench'.
> 
> I want to run these tests:
> 
> $ ls -1 tests/test-crypto-*c
> tests/test-crypto-afsplit.c
> tests/test-crypto-block.c
> tests/test-crypto-cipher.c
> tests/test-crypto-hash.c
> tests/test-crypto-hmac.c
> tests/test-crypto-ivgen.c
> tests/test-crypto-pbkdf.c
> tests/test-crypto-secret.c
> tests/test-crypto-tlscredsx509.c
> tests/test-crypto-tlssession.c
> tests/test-crypto-xts.c

These aren't benchmarks - they're regular unit tests - eg make check-unit 

The benchmarks are tests/benchmark-crypto*.c

Either way, all of this is surrounded by 'if have_block' in tests/meson.build
which should apply if you have tools enabled or system emulators enabled.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


