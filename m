Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4786737CC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITbC-0005L0-Np; Thu, 19 Jan 2023 07:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pITb9-0005EQ-2O
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:00:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pITb6-00016h-Lg
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674129647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98yJ0j9DHw2eV+RtjtmgDrTsYYqvhmck7wAd2rewn38=;
 b=ilt7BFhs5FeABIhwNh27a8XVtTAnGRkUpKg6YL52FlEXaw3ucCXu/gm6Xs984vnXJBRFOJ
 k8y4TID2/I8Rsbm08DzczaHKOwA5bkoxdMXH00Nl7yTCC8YLe46oiXrjti7WczaDXNK7EG
 iiVJDFTFarHQW6eZ29F/CTaDQr10Dx8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-CxfqohsrP-GYZhjh9wdEdQ-1; Thu, 19 Jan 2023 07:00:44 -0500
X-MC-Unique: CxfqohsrP-GYZhjh9wdEdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BDA93C1069C;
 Thu, 19 Jan 2023 12:00:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1362026D68;
 Thu, 19 Jan 2023 12:00:43 +0000 (UTC)
Date: Thu, 19 Jan 2023 12:00:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Message-ID: <Y8kw6X6keB5l53nl@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
 <Y8kmlVU5NKaR7i4D@redhat.com>
 <7a46cdc2-42b7-a71d-5c00-a7b6e30d2622@linaro.org>
 <Y8kqeC5UWPHC+yIX@redhat.com>
 <fe0f448c-6a8f-9830-208b-5e1c52e5e203@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe0f448c-6a8f-9830-208b-5e1c52e5e203@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 12:49:48PM +0100, Philippe Mathieu-Daudé wrote:
> On 19/1/23 12:33, Daniel P. Berrangé wrote:
> > On Thu, Jan 19, 2023 at 12:21:58PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 19/1/23 12:16, Daniel P. Berrangé wrote:
> > > > On Thu, Jan 19, 2023 at 12:01:18PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > On 5/12/22 08:51, Marc-André Lureau wrote:
> > > > > > On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > > > > > 
> > > > > > > The vnc-display-test is failing on Darwin:
> > > > > > > 
> > > > > > > tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
> > > > > > > Unsupported auth type 17973672
> > > > > > 
> > > > > > It is supposed to pass. Can you share more details? It doesn't look
> > > > > > like an endianness issue, at first sight..
> > > > > 
> > > > > Adding '-trace vnc*' and setting _VNC_DEBUG in "vnc.h" I get:
> > > 
> > > > > Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 5489072
> > > > 
> > > > ^^^^ This specific message is comnig from the gtk-vnc client rather
> > > > than QEMU
> > > > 
> > > > Still doesn't tell us if the flaw is server or client side. The
> > > > logs from QEMU are insufficient. In theory it should be reporting
> > > > auth type == 0 though, for 'no auth' configs.
> > > 
> > > > > Does that help? What else can I do to gather more info?
> > > > 
> > > > Modify vnc-display-test.c to call  vnc_util_set_debug(TRUE);
> > > > before vnc_connection_new(), to get the gtk-vnc debug logs
> > > > to stderr too.
> > > Here you go:
> > > 
> > > vnc_server_dpy_recreate VNC server dpy recreate dpy=0x1588b8000 size=640x384
> > > fmt=537004168
> > > vnc_auth_init VNC auth init state=0x1588b8000 websock=0 auth=1 subauth=0
> > > vnc_auth_init VNC auth init state=0x1588b8000 websock=1 auth=1 subauth=0
> > > vnc_client_connect VNC client connect state=0x1484b0000 ioc=0x152e667f0
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Init VncConnection=0x14f0168b0
> > > gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Init
> > > VncConnection=0x14f0168b0
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Thinking about auth type 1
> > > gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Thinking about auth type
> > > 1
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Decided on auth type 1
> > > gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Decided on auth type 1
> > 
> > So here we set conn->auth_type == 1
> > 
> > 
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Open fd=4
> > > gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open fd=4
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Open coroutine starting
> > > gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open coroutine starting
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Started background coroutine
> > > gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Started background
> > > coroutine
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Connecting to FD 4
> > > gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Connecting to FD 4
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 16
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Emit main context 16
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Protocol initialization
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Protocol initialization
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Schedule greeting timeout
> > > 0x14f0155e0
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Schedule greeting
> > > timeout 0x14f0155e0
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Remove timeout 0x14f0155e0
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Remove timeout
> > > 0x14f0155e0
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Server version: 3.8
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Server version: 3.8
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Sending full greeting
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Sending full greeting
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Using version: 3.8
> > > gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Using version: 3.8
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Possible auth 1
> > > gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Possible auth 1
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 14
> > > gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Emit main context 14
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Waiting for auth type
> > > gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Waiting for auth type
> > > # gtk-vnc-DEBUG: ../src/vncconnection.c Choose auth 10486192
> > 
> > Here we've read conn->auth_type and got back 10486192 nonsense instead
> > of 1.
> > 
> > Interestingly this value is differetn from the previous debug log
> > which reported  5489072, so i guess we're getting garbage here for
> > unknown reasons.
> > 
> > This looks like a gtk-vnc problem rather than QEMU.
> > 
> > I'm a little worried that perhaps the gtk-vnc ucontext coroutine backend
> > is broken on macOS
> > 
> > What coroutine backend does QEMU end up using on macOS ? Is it the
> > sigaltstack one ?
> 
>   Block layer support
>     coroutine backend            : sigaltstack
>     coroutine pool               : YES
> 
> When trying the coroutine options, with --with-coroutine=windows:
> 
> ERROR: 'windows' coroutine backend only valid for Windows
> 
> :) and with --with-coroutine=ucontext I get:
> 
> ERROR: 'ucontext' backend requested but makecontext not available
> 
> config.log hints:
> 
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ucontext.h:51:2:
> error: The deprecated ucontext routines require _XOPEN_SOURCE to be defined
> #error The deprecated ucontext routines require _XOPEN_SOURCE to be defined
>  ^
> 
> Adding _XOPEN_SOURCE to QEMU_CFLAGS:
> 
> warning: 'makecontext' is deprecated: first deprecated in macOS 10.6 - No
> longer supported [-Wdeprecated-declarations]
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ucontext.h:41:6:
> note: 'makecontext' has been explicitly marked deprecated here
> void makecontext(ucontext_t *, void (*)(), int, ...);
>      ^
> 
> So to detect makecontext() I have to add
> --extra-cflags=-mmacosx-version-min=10.5 but then linking fails with
> multiple "$LIBNAME was built for newer macOS version (13.0) than being
> linked (11.0)".

Yes, ucontext has been deprecated forever on macOS, but in practice it
has still been functional if you define _XOPEN_SOURCE, which is what
gtk-vnc has done traditionally.

I presume this is on the aarch64 macOS though, and so all bets are off
wrt ucontext backend unless someone knows it works correctly with the
m1 port. I fear that's not the case though, given the wierd error
scenario we're hitting in gtk-vnc.

I might need to add a sigaltstack impl to gtk-vnc

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


