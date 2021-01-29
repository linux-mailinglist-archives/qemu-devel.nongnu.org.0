Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBF308913
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:33:09 +0100 (CET)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SxY-0005xA-Dc
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5SFu-0007kA-DI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5SFq-0001kv-7l
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611920876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gCojLzpBURK0W8Lls+JECBh5mSMRM9TcYmrN8p+rsu0=;
 b=E561LVlpOXNnelpfGwSRVBlrsDcv4g0wlfsl/WhUFJZrsTsvxF7FltaBQLtppjh+rxV1ax
 8MUhjC0WYrEPw5JMNwdqqKU1MzuC29xV+zZw8ySLVbeMAJhw3T25Ve0uIg+dqtMzbRV9SD
 uae1vGwmj2uzkl8m54JpDNUBWz4oqco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-kvC5nEysPY2rmrOh-TLY0A-1; Fri, 29 Jan 2021 06:47:50 -0500
X-MC-Unique: kvC5nEysPY2rmrOh-TLY0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12CEB802B40;
 Fri, 29 Jan 2021 11:47:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DC25B699;
 Fri, 29 Jan 2021 11:47:48 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:47:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] tests: Replace deprecated ASN1 code
Message-ID: <20210129114745.GI4001740@redhat.com>
References: <20210128171523.45921-1-sw@weilnetz.de>
 <20210129100624.GE4001740@redhat.com>
 <f8e03cad-4eb8-92c0-eed5-a3ab033e2ab4@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <f8e03cad-4eb8-92c0-eed5-a3ab033e2ab4@weilnetz.de>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 12:35:59PM +0100, Stefan Weil wrote:
> Am 29.01.21 um 11:06 schrieb Daniel P. Berrangé:
> 
> > On Thu, Jan 28, 2021 at 06:15:23PM +0100, Stefan Weil wrote:
> > > This fixes several compiler warnings on MacOS with Homebrew.
> > Could you give an example of the warnings seen as I'm wondering
> > why we won't have seen them already on other platforms ?
> 
> 
> Here they are (at least the first few, as the list is lengthy). I used
> 
> ../configure --enable-sanitizers --enable-debug
> --extra-cflags=-I/opt/homebrew/include --enable-cocoa
> 
> Maybe the warnings were enabled by --enable-debug.
> 
> Regards, Stefan
> 
> 
> % ninja
> [4696/4942] Compiling C object
> tests/test-crypto-tlscredsx509.p/test-crypto-tlscredsx509.c.o
> In file included from ../../../tests/test-crypto-tlscredsx509.c:23:
> ../../../tests/crypto-tls-x509-helpers.h:128:14: warning: 'ASN1_ARRAY_TYPE'
> macro is deprecated, use 'asn1_static_node' instead. [-W#pragma-messages]
> extern const ASN1_ARRAY_TYPE pkix_asn1_tab[];
>              ^
> /opt/homebrew/Cellar/libtasn1/4.16.0/include/libtasn1.h:582:25: note:
> expanded from macro 'ASN1_ARRAY_TYPE'
> #define ASN1_ARRAY_TYPE _Pragma ("GCC warning \"'ASN1_ARRAY_TYPE' macro is
> deprecated, use 'asn1_static_node' instead.\"") asn1_static_node
>                         ^
> <scratch space>:18:6: note: expanded from here

This is really odd.

I've got the 4.16.0 tar.gz for libtasn1 and it does not contain any
such _Pragma / deprecation warnings.

The libtasn1  git repo *does* contain these pragmas, but only in the
dev tree for the unreleased 4.17.0 version.

The homebrew-core.git repo recipe for libtasn1 claims to be using
4.16.0 release

  https://github.com/Homebrew/homebrew-core/blob/master/Formula/libtasn1.rb

and those tarballs match what i have.

None the less it looks like your 4.16.0 installed version is in fact
a  git snapshot. Damned if I understand what homebrew is doing.

None the less, given that these deprecations are in libtasn1 git upstream,
we're going to have to deal with them.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


