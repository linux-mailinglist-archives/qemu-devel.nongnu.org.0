Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729F2DB47F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:32:25 +0100 (CET)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpG3c-0003mr-AQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpG0v-0002t6-FO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:29:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpG0s-0005Q4-Mk
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608060570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgYtuHk9QxZyj8fi3ZR5NNNzyfxXcECD8CR1Sn7L64Y=;
 b=WjrlSTRYcS/+ydzQgm/ILP9gLM26kXwk3157dBUzfBXzVY3WMu2lFitw+h4MMG+sYFx/v0
 04xVEnV5E4ou1HDsfSjR+ejXSgzFaXc9nGN0D5W12bzSe2h59EioDjUy0HugybjjojC7dw
 ANoc9WDguGHJGWM03HouJuq5I/Iqigc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-K8yYZ16RMOW5OSQB444f_Q-1; Tue, 15 Dec 2020 14:29:28 -0500
X-MC-Unique: K8yYZ16RMOW5OSQB444f_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B1C510054FF;
 Tue, 15 Dec 2020 19:29:27 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51DEE10013C1;
 Tue, 15 Dec 2020 19:29:23 +0000 (UTC)
Date: Tue, 15 Dec 2020 14:29:22 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 1/2] test-char: abort on serial test error
Message-ID: <20201215192922.GB3140057@habkost.net>
References: <20200728143108.2192896-1-marcandre.lureau@redhat.com>
 <20200728143108.2192896-2-marcandre.lureau@redhat.com>
 <cc2227d3-9e5c-96ba-03f9-54f12a356da8@amsat.org>
MIME-Version: 1.0
In-Reply-To: <cc2227d3-9e5c-96ba-03f9-54f12a356da8@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 11:51:05PM +0100, Philippe Mathieu-Daudé wrote:
> On 7/28/20 4:31 PM, Marc-André Lureau wrote:
> > We are having issues debugging and bisecting this issue that happen
> > mostly on patchew. Let's make it abort where it failed to gather some
> > new informations.
> 
> "good" news, this started to fail on Gitlab (centos7):
> 
> Running test test-char
> Unexpected error in object_property_try_add() at ../qom/object.c:1220:
> attempt to add duplicate property 'serial-id' to object (type 'container')
> ERROR test-char - too few tests run (expected 38, got 9)
> make: *** [run-test-86] Error 1
> 
> https://gitlab.com/philmd/qemu/-/jobs/908114388
> https://gitlab.com/philmd/qemu/-/jobs/908114389
> https://gitlab.com/philmd/qemu/-/jobs/908114390

Do we have any clue what could be causing this?  After looking at
the code, it smells like memory corruption.

At first, I thought it could be due to the multi-threaded test
cases, but the test binary seems to be crashing before the
multi-threaded test cases have an opportunity to run.

> 
> > 
> > Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/test-char.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/test-char.c b/tests/test-char.c
> > index 614bdac2df..d35cc839bc 100644
> > --- a/tests/test-char.c
> > +++ b/tests/test-char.c
> > @@ -1200,7 +1200,7 @@ static void char_serial_test(void)
> >  
> >      /* test tty alias */
> >      qemu_opt_set(opts, "backend", "tty", &error_abort);
> > -    chr = qemu_chr_new_from_opts(opts, NULL, NULL);
> > +    chr = qemu_chr_new_from_opts(opts, NULL, &error_abort);
> >      g_assert_nonnull(chr);
> >      object_unparent(OBJECT(chr));
> >  
> > 
> 
> 

-- 
Eduardo


