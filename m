Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97BB673683
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISuW-0006m9-Iv; Thu, 19 Jan 2023 06:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pISuS-0006lm-N3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:16:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pISuR-0001ir-1o
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674127002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAFqDK523dLJ/vSz/K3KS3huW+ImEWVP9nVKikgEn6M=;
 b=c1rpPOBwUCMV3iNQs2n0OQNpKYcvT4hYvshok+Ow5AA3b/RrpKtCMkpIjdW+0MYTk72Bc3
 s6DGFdyfahScXN4ESXmhrhxMG9DTaGCyzklsRnKnpbnzhHH1NqeTghmKqQa72mvwIy2tlk
 v5xYh0a4PmYd7bIUH7hO0w6NxJWY4Wk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-o0q7BzElOZiJ1z8xfP1l6Q-1; Thu, 19 Jan 2023 06:16:40 -0500
X-MC-Unique: o0q7BzElOZiJ1z8xfP1l6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8742D3815EF1;
 Thu, 19 Jan 2023 11:16:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB48E2166B2A;
 Thu, 19 Jan 2023 11:16:39 +0000 (UTC)
Date: Thu, 19 Jan 2023 11:16:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Message-ID: <Y8kmlVU5NKaR7i4D@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Thu, Jan 19, 2023 at 12:01:18PM +0100, Philippe Mathieu-Daudé wrote:
> On 5/12/22 08:51, Marc-André Lureau wrote:
> > On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > 
> > > The vnc-display-test is failing on Darwin:
> > > 
> > > tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
> > > Unsupported auth type 17973672
> > 
> > It is supposed to pass. Can you share more details? It doesn't look
> > like an endianness issue, at first sight..
> 
> Adding '-trace vnc*' and setting _VNC_DEBUG in "vnc.h" I get:
> 
> # Start of vnc-display tests
> vnc_server_dpy_recreate VNC server dpy recreate dpy=0x130008000 size=640x480
> fmt=537004168
> Initializing VNC server with no auth
> vnc_auth_init VNC auth init state=0x130008000 websock=0 auth=1 subauth=0
> Initializing VNC server with no auth
> vnc_auth_init VNC auth init state=0x130008000 websock=1 auth=1 subauth=0
> vnc_client_connect VNC client connect state=0x130050000 ioc=0x13f7077f0
> Client sioc=0x13f7077f0 ws=0 auth=1 subauth=0
> New client on socket 0x13f7077f0
> vnc_set_share_mode/0x13f7077f0: undefined -> connecting
> Write Plain: Pending output 0x14880a400 size 4096 offset 12. Wait SSF 0
> Wrote wire 0x14880a400 12 -> 12
> Read plain 0x0 size 0 offset 0
> Read wire 0x13f8c8c00 4096 -> 12
> Client request protocol version 3.8
> Write Plain: Pending output 0x14880a400 size 4096 offset 2. Wait SSF 0
> Wrote wire 0x14880a400 2 -> 2
> Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 5489072

^^^^ This specific message is comnig from the gtk-vnc client rather
than QEMU

Still doesn't tell us if the flaw is server or client side. The
logs from QEMU are insufficient. In theory it should be reporting
auth type == 0 though, for 'no auth' configs. 

> Read plain 0x13f8c8c00 size 4096 offset 0
> Read wire 0x13f8c8c00 4096 -> 1
> vnc_auth_reject VNC client auth rejected state=0x130050000 method expected=1
> got=176
> Write Plain: Pending output 0x14880a400 size 4096 offset 30. Wait SSF 0
> Wrote wire 0x14880a400 30 -> 30
> Closing down client sock: protocol error
> vnc_client_disconnect_start VNC client disconnect start state=0x130050000
> ioc=0x13f7077f0
> vnc_set_share_mode/0x13f7077f0: connecting -> disconnected
> vnc_client_disconnect_finish VNC client disconnect finish state=0x130050000
> ioc=0x13f7077f0
> 
> ** (tests/qtest/vnc-display-test:8465): ERROR **: 11:59:18.613: vnc-error:
> Unsupported auth type 5489072
> Trace/BPT trap: 5
> 
> Does that help? What else can I do to gather more info?

Modify vnc-display-test.c to call  vnc_util_set_debug(TRUE);
before vnc_connection_new(), to get the gtk-vnc debug logs
to stderr too.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


