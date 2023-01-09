Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2ED662544
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqkS-0003xk-LS; Mon, 09 Jan 2023 06:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEqkQ-0003wj-Cd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEqkO-0000Bb-N8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673265324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Bax02BSkvxaOEt2CRhklLybKGV/xR8mYNLZmlYBdyg=;
 b=iZ1vw41NOfSmJlm+VPfFnXYnGMs6gnAeQ716TUqyu63V9hqbjmvtDBFk6gbcZrmUad45lT
 pwmI2TxnnLHhfCIXaI0p8OKnnmfzVA+52FExnVifAqVlHY2/EzW97TJ7miQDe5dKzkEcau
 WrMC9On41xRaf9OSanPuR+QBd1t3mN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-1tSs-3KtOzSxT7itYk1Mjw-1; Mon, 09 Jan 2023 06:55:20 -0500
X-MC-Unique: 1tSs-3KtOzSxT7itYk1Mjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5B4C858F0E;
 Mon,  9 Jan 2023 11:55:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B4D2026D4B;
 Mon,  9 Jan 2023 11:55:07 +0000 (UTC)
Date: Mon, 9 Jan 2023 11:55:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 virtio-fs@redhat.com, Michael Roth <michael.roth@amd.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
Message-ID: <Y7wAlHEIafbNzsdf@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-6-berrange@redhat.com>
 <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 29, 2022 at 10:34:55AM +0100, Thomas Huth wrote:
> On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/qtest/ahci-test.c           |  3 +++
> >   tests/qtest/arm-cpu-features.c    |  1 +
> >   tests/qtest/erst-test.c           |  2 +-
> >   tests/qtest/ide-test.c            |  3 ++-
> >   tests/qtest/ivshmem-test.c        |  4 ++--
> >   tests/qtest/libqmp.c              |  2 +-
> >   tests/qtest/libqos/libqos-pc.h    |  6 ++++--
> >   tests/qtest/libqos/libqos-spapr.h |  6 ++++--
> >   tests/qtest/libqos/libqos.h       |  6 ++++--
> >   tests/qtest/libqos/virtio-9p.c    |  1 +
> >   tests/qtest/migration-helpers.h   |  1 +
> >   tests/qtest/rtas-test.c           |  2 +-
> >   tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
> >   tests/unit/test-qmp-cmds.c        | 13 +++++++++----
> >   14 files changed, 36 insertions(+), 18 deletions(-)
> ...
> > diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> > index 2373cd64cb..6d52b4e5d8 100644
> > --- a/tests/unit/test-qmp-cmds.c
> > +++ b/tests/unit/test-qmp-cmds.c
> > @@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
> >   }
> > +G_GNUC_PRINTF(2, 3)
> >   static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
> >   {
> >       va_list ap;
> > @@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
> >       return ret;
> >   }
> > +G_GNUC_PRINTF(3, 4)
> >   static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
> >                                     const char *template, ...)
> >   {
> > @@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
> >   static void test_dispatch_cmd_deprecated(void)
> >   {
> > -    const char *cmd = "{ 'execute': 'test-command-features1' }";
> > +    #define cmd "{ 'execute': 'test-command-features1' }"
> >       QDict *ret;
> 
> That looks weird, why is this required?

This means that the compiler can see we're passing a constant string
into the API call a few lines lower. Without it, the compiler can't
see that 'cmd' doesn't contain any printf format specifiers, and thus
it would force us to use  func('%s', cmd)... except that's not actually
possible since our crazy json printf formatter doesn't allow arbitrary
'%s', the '%s' can only occur at well defined points in the JSON doc.

Using a constant string via #define was the easiest way to give the
compiler visibility of the safety.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


