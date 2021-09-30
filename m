Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B316441DFA0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:56:04 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzLn-0006op-8m
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVzKD-00064o-3O
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVzK9-0004O9-4f
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633020860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xt50t/fyoJd+kIAy2XH/KvBfNxA3CM+Msre7mmM0JU=;
 b=UV27jVzeenQHfnPWO+3tztGH/cayKvojYisKP5XmGN10DjqDNqhD9Fp+Rplm/B7aG74VCw
 u13cFE58sRre3mZqq7p10OS9i9dlr6Sb/9eWKeaae3hOghPUIJ/jrZ7nj8K0bnHex1SVME
 mugfKn7Y7ktzitmynpHbs9MkOGRv4rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-fBrJb2_RNwqy86OWjtwFLg-1; Thu, 30 Sep 2021 12:54:14 -0400
X-MC-Unique: fBrJb2_RNwqy86OWjtwFLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869E718D6A31;
 Thu, 30 Sep 2021 16:54:13 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222955F4E2;
 Thu, 30 Sep 2021 16:54:12 +0000 (UTC)
Date: Thu, 30 Sep 2021 17:54:12 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/2] tests/docker: Fix fedora-i386-cross
Message-ID: <20210930165412.GC3361@redhat.com>
References: <20210930163636.721311-1-richard.henderson@linaro.org>
 <20210930163636.721311-3-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210930163636.721311-3-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 12:36:36PM -0400, Richard Henderson wrote:
> By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
> we were still including the 64-bit packages.  Install
> pcre-devel.i686 to fill a missing glib2 dependency.
> 
> By using --extra-cflags instead of --cpu, we incorrectly
> use the wrong probing during meson.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index dbb8195eb1..820740d5be 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -17,12 +17,13 @@ ENV PACKAGES \
>      glibc-static.i686 \
>      gnutls-devel.i686 \
>      nettle-devel.i686 \
> +    pcre-devel.i686 \
>      perl-Test-Harness \
>      pixman-devel.i686 \
>      zlib-devel.i686
>  
> -ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
> -ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
> +ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
> +ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
>  
>  RUN dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt

While I'm not able to directly test this docker file, I did run the
equivalent commands (PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig ../configure
--cpu=i386 [etc]) and successfully build a 32-bit qemu binary on
Fedora 64-bit host with the multilib libraries installed.  Therefore
I'm pretty confident it should work:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


