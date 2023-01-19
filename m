Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3486673B7F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:16:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVgi-0001uc-T5; Thu, 19 Jan 2023 09:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pIVgh-0001uQ-9S
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pIVgf-0000vM-7o
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674137679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/b2GmnpA4q74W/+iK0aHosaDPhxphoRZmGJzxuhGPs=;
 b=f37fjRjR2IAe5weNP90C6k1Uy69SHiNrkK6tHasKcDYvLmevlToMJ+QKpdm0yujoBT64K5
 w7efGFG/3BxqeGB2UsD3J7IyXaMsCKVq0ShMib6F9rM35/2RmWbCRK4OkCrF5rx3xDZuIT
 /tdnZ3l0RGc9DT6uV22BwhikedBxXHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-5QGkFWvbNjOHRBXqapJ76g-1; Thu, 19 Jan 2023 09:14:38 -0500
X-MC-Unique: 5QGkFWvbNjOHRBXqapJ76g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57D318A0106;
 Thu, 19 Jan 2023 14:14:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 780B9492C3C;
 Thu, 19 Jan 2023 14:14:37 +0000 (UTC)
Date: Thu, 19 Jan 2023 14:14:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Message-ID: <Y8lQS9/UrF+sZN0M@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
 <Y8kmlVU5NKaR7i4D@redhat.com>
 <7a46cdc2-42b7-a71d-5c00-a7b6e30d2622@linaro.org>
 <Y8kqeC5UWPHC+yIX@redhat.com>
 <fe0f448c-6a8f-9830-208b-5e1c52e5e203@linaro.org>
 <Y8kw6X6keB5l53nl@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8kw6X6keB5l53nl@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Thu, Jan 19, 2023 at 12:00:41PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 19, 2023 at 12:49:48PM +0100, Philippe Mathieu-Daudé wrote:
> > So to detect makecontext() I have to add
> > --extra-cflags=-mmacosx-version-min=10.5 but then linking fails with
> > multiple "$LIBNAME was built for newer macOS version (13.0) than being
> > linked (11.0)".
> 
> Yes, ucontext has been deprecated forever on macOS, but in practice it
> has still been functional if you define _XOPEN_SOURCE, which is what
> gtk-vnc has done traditionally.
> 
> I presume this is on the aarch64 macOS though, and so all bets are off
> wrt ucontext backend unless someone knows it works correctly with the
> m1 port. I fear that's not the case though, given the wierd error
> scenario we're hitting in gtk-vnc.

Yep,  I've confirmed there's something broken with gtk-vnc. When we
call 'getcontext' is corrupts memory in gtk-vnc structs. This makes
me believe that the defined 'struct ucontext_t' is too small for use
with 'getcontext' on macOS aarch64 platforms.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


