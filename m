Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8425F643A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:15:18 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNuM-00040Z-Dd
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMgK-0002lo-M2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMgH-0000qp-JZ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665046595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+3w60/iC5QrK+TpBxX68Avws7mXnpSF+5a/DHmPchA=;
 b=JAb0YIEZT+us1fq9vMlfcbI86d6tzcuX1jmCmHhvlsQS96T0K4ysEE5qmonigcnRpYpizV
 C86uYKcPxIY2dw30kLWPYQ5rFAGAhvYx179qmyDUJrrx1MCEi3I1KD2h/67hUhsPsVAuLu
 fYznPTpUJQEx7cJ9D0bb3Flpl1IH5d0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-zN9kS6mhPaiXBzENiR9PZA-1; Thu, 06 Oct 2022 04:56:34 -0400
X-MC-Unique: zN9kS6mhPaiXBzENiR9PZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C7E1101A528
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:56:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C265A2024CC0;
 Thu,  6 Oct 2022 08:56:32 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:56:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 5/5] tests/unit: make test-io-channel-command work on
 win32
Message-ID: <Yz6YPR+MGo72TOAF@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-6-marcandre.lureau@redhat.com>
 <Yz6U7GXKg+Ctb3t0@redhat.com>
 <CAMxuvawpOSiGYFnGgmh4mb7jKbbKvd5UD_QP6FMZZh8gUAzVBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvawpOSiGYFnGgmh4mb7jKbbKvd5UD_QP6FMZZh8gUAzVBQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 12:46:17PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Oct 6, 2022 at 12:42 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Oct 06, 2022 at 12:12:22PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > This has been tested under msys2 & windows 11. I haven't tried to make
> > > it work with other environments yet, but that should be enough to
> > > validate the channel-command implementation anyway.
> > >
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  tests/unit/test-io-channel-command.c | 32 ++++++++++++----------------
> > >  tests/unit/meson.build               |  2 +-
> > >  2 files changed, 15 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> > > index aa09c559cd..be98c3452a 100644
> > > --- a/tests/unit/test-io-channel-command.c
> > > +++ b/tests/unit/test-io-channel-command.c
> > > @@ -24,29 +24,27 @@
> > >  #include "qapi/error.h"
> > >  #include "qemu/module.h"
> > >
> > > -#ifndef WIN32
> > > +#define TEST_PATH "test-io-channel-command.fifo"
> > > +
> > > +#define SOCAT_SRC "PIPE:" TEST_PATH ",wronly"
> > > +#define SOCAT_DST "PIPE:" TEST_PATH ",rdonly"
> > > +
> > >  static void test_io_channel_command_fifo(bool async)
> > >  {
> > > -#define TEST_FIFO "tests/test-io-channel-command.fifo"
> > >      QIOChannel *src, *dst;
> > >      QIOChannelTest *test;
> > > -    const char *srcfifo = "PIPE:" TEST_FIFO ",wronly";
> > > -    const char *dstfifo = "PIPE:" TEST_FIFO ",rdonly";
> > >      const char *srcargv[] = {
> > > -        "/bin/socat", "-", srcfifo, NULL,
> > > +        g_getenv("SOCAT"), "-", SOCAT_SRC, NULL,
> >
> > Please don't rely on env variables, as it complicates the ability to
> > invoke the test directly, without the meson harness. Either pass the
> > path from meson at compile time in config-host.h, or make this code
> > use an unqualified path, so it honours $PATH at runtime.
> 
> I tried to pass it through config-host.h, but I dont see a way to
> escape the \ is the paths.

This must be possible, as we have lots of strings in config-host.h
that are paths - eg many CONFIG_QEMU_xxxDIR variables


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


