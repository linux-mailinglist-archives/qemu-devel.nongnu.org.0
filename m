Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5395E6025
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:44:27 +0200 (CEST)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJgv-0005u2-Vd
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obJcd-0000D2-8t
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obJcY-0008HR-LL
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663843193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llkzwBio9YznelJyNEHBXomhNnIZvzzCthmK4+xY4ps=;
 b=U37orUzlXHHNJkZntxHEJ1gZT0OdAIW2AbypDR3ebhbm0kx00U7c7UBJVR2i+msvonYXfq
 ESMsf8asvFwVQy2Ci6kxQx39KF+NZRv3I2p2GBSrKd4pzwxBEGwIGaawcM7VFhTqgjZUGI
 0qNXxufED6PLga0Ma5rSyHriG3dg27c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140--xX6WDDiNku-tbpQFhkPuQ-1; Thu, 22 Sep 2022 06:39:52 -0400
X-MC-Unique: -xX6WDDiNku-tbpQFhkPuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7564F3C0D863;
 Thu, 22 Sep 2022 10:39:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D10B2024CBE;
 Thu, 22 Sep 2022 10:39:51 +0000 (UTC)
Date: Thu, 22 Sep 2022 11:39:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
Message-ID: <Yyw7dFEWACkGCoNP@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm> <YytIkiMEC/KHL/9p@redhat.com>
 <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Thu, Sep 22, 2022 at 10:47:26AM +0800, Bin Meng wrote:
> On Thu, Sep 22, 2022 at 1:23 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert wrote:
> > > * Bin Meng (bmeng.cn@gmail.com) wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Some migration test cases use TLS to communicate, but they fail on
> > > > Windows with the following error messages:
> > > >
> > > >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
> > > >   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
> > > >   query-migrate shows failed migration: TLS handshake failed: Error in the pull function.
> > > >
> > > > Disable them temporarily.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > > I am not familar with the gnutls and simply enabling the gnutls debug
> > > > output does not give me an immedidate hint on why it's failing on
> > > > Windows. Disable these cases for now until someone or maintainers
> > > > who may want to test this on Windows.
> > >
> > > Copying in Dan Berrange, he's our expert on weird TLS failures.
> >
> > Seems to match this:
> >
> >    https://gnutls.org/faq.html#key-usage-violation2
> >
> > which suggests we have a configuration mis-match.
> >
> > I'm surprised to see you are only needing to disable the TLS PSK tests,
> > not the TLS x509 tests.
> 
> The TLS x509 qtests all passed.
> 
> >
> > I'd like to know if tests/unit/test-crypto-tlssession passes.
> 
> These unit tests currently are not built on Windows as they simply
> don't build due to usage of socketpair().

Doh, yes, that's rather annoying, as debugging this problem in the
unit tests would be easier than in qtests.

> > If so, it might suggest we are missing 'priority: NORMAL' property
> > when configuring TLS creds for the migration test.
> 
> I did the following changes but the error is still the same:

> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index dbee9b528a..c1e3f11873 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -788,7 +788,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> " 'id': 'tlscredspsk0',"
> " 'endpoint': 'client',"
> " 'dir': %s,"
> - " 'username': 'qemu'} }",
> + " 'username': 'qemu',"
> + " 'priority': 'NORMAL'} }",
> data->workdir);
> qobject_unref(rsp);
> @@ -797,7 +798,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> " 'arguments': { 'qom-type': 'tls-creds-psk',"
> " 'id': 'tlscredspsk0',"
> " 'endpoint': 'server',"
> - " 'dir': %s } }",
> + " 'dir': %s,"
> + " 'priority': 'NORMAL'} }",
> mismatch ? data->workdiralt : data->workdir);
> qobject_unref(rsp);
> 
> I am not sure whether I did the right changes.


That ought to have been sufficient, if priority strings were the
problem.


I think we'd need the debug output from gnutls - could you edit crypto/init.c
and uncomment the '#define DEBUG_GNUTLS' line near the top.

If you can post the output you get from a single migration-test test case
involving PSK, it might be enough to diagnose why gnutls is failing.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


