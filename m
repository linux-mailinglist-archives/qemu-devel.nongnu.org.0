Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6200D2C5B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:56:46 +0100 (CET)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLVd-000599-FP
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiLLV-00055K-0G
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiLLS-0008Ml-Sz
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfLv9sn75hFi4vrNX0/cdhCzTxZHr7btcEyxi0LGyNA=;
 b=hLUy6klhbkdFcfa+XpR6P1luU+zspbgqHBxTTVpiGHcINgQGyFCv6tIuvesCDZZ3gfT5rT
 ugJw0jx4oBHyzn493pqOkz2re36V8gK4glkQJr2Gd7VvCP4g6SsRG7fDB0qILgog5xoA7e
 OUs+SWaiGAGse6ArU7xxjFsQnmci/gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-BB1HWuiHPgCSHcsN6cw6zQ-1; Thu, 26 Nov 2020 12:46:09 -0500
X-MC-Unique: BB1HWuiHPgCSHcsN6cw6zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA43D805BFA;
 Thu, 26 Nov 2020 17:46:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2E85C1C2;
 Thu, 26 Nov 2020 17:46:00 +0000 (UTC)
Date: Thu, 26 Nov 2020 12:45:59 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS 7)
Message-ID: <20201126174559.GP2271382@habkost.net>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
 <20201126173824.GB2098@perard.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <20201126173824.GB2098@perard.uk.xensource.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> On Sun, Nov 08, 2020 at 09:45:33PM +0100, Philippe Mathieu-DaudÃ© wrote:
> > Xen packages are available in CentOS 7, but have been
> > removed from CentOS 8. Use the CentOS 7 container.
> 
> Technically Xen has never been in CentOS 8, I'm working on it, slowly.
> 
> > Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
> > ---
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org
> > ---
> >  .gitlab-ci.yml | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 2f0da7b3dc1..8e15266c277 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -557,6 +557,27 @@ check-crypto-only-gnutls:
> >      IMAGE: centos7
> >      MAKE_CHECK_ARGS: check
> >  
> > +build-xen-centos:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: centos7
> > +    TARGETS: i386-softmmu x86_64-softmmu
> > +    CONFIGURE_ARGS: --enable-xen
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    paths:
> > +      - build
> > +
> > +check-xen-centos:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-xen-centos
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: centos7
> > +    MAKE_CHECK_ARGS: check
> 
> Is `make check` going to do something useful with the Xen support? Or is
> it going to need more work in order to test the Xen support of QEMU?
> (Like starting an actual Xen guest.)

I don't think it will test Xen support, but we still want to at
least check if --enable-xen doesn't break anything else.

Is there any public CI system anywhere where Xen support is
tested today?

-- 
Eduardo


