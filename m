Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4E56A235
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:39:42 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QnF-0002Yz-H4
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9QeX-0003Qv-Aj
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9QeT-0007b4-G4
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657197036;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYKruevLp0de/NQi3a+E9iDHMCgzAtnjcRNvpURhX4A=;
 b=V/9Pk091534lPzXrEbmNYnmCtwQBLu5Ej6AKBrH8aSefXhUZ1jGb6RqhPOGXBhDr8556bh
 4ZsWWDTIYWmITh44oinDLmo6m1klJTGIncwH8rq/f/ze4lp5bV4Odh1B7JEJThTtK4EGnb
 GQ1M8LTirfnfIYbBeoySm5K6YRIXAA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-c5RpSiFiPjCERu7crqY4MA-1; Thu, 07 Jul 2022 08:30:27 -0400
X-MC-Unique: c5RpSiFiPjCERu7crqY4MA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DA893C0E5C6;
 Thu,  7 Jul 2022 12:30:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD682166B29;
 Thu,  7 Jul 2022 12:30:26 +0000 (UTC)
Date: Thu, 7 Jul 2022 13:30:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 4/7] misc: fix commonly doubled up words
Message-ID: <YsbR3/ZJtQAS2yg/@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-5-berrange@redhat.com>
 <CAFEAcA9=cKaD=LoBheRfU610nOQVjVWmqCT=ONUpD6OhBX9WxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9=cKaD=LoBheRfU610nOQVjVWmqCT=ONUpD6OhBX9WxA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 04, 2022 at 04:52:40PM +0100, Peter Maydell wrote:
> On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> 
> > --- a/docs/tools/qemu-pr-helper.rst
> > +++ b/docs/tools/qemu-pr-helper.rst
> > @@ -22,7 +22,7 @@ storage fabric. QEMU's SCSI passthrough devices ``scsi-block``
> >  and ``scsi-generic`` support passing guest persistent reservation
> >  requests to a privileged external helper program. :program:`qemu-pr-helper`
> >  is that external helper; it creates a socket which QEMU can
> > -connect to to communicate with it.
> > +connect to communicate with it.
> 
> This text is correct as it stands, and the change is wrong.

I think the current text is a rather awkward, so I'll rephrase it
next time.

> > diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
> > index 04e199ec33..6cc1f5d932 100644
> > --- a/tests/qtest/microbit-test.c
> > +++ b/tests/qtest/microbit-test.c
> > @@ -449,9 +449,9 @@ static void test_nrf51_timer(void)
> >      timer_set_prescaler(qts, 0);
> >      /* Swept over in first step */
> >      timer_set_cc(qts, 0, 2);
> > -    /* Barely miss on first step */
> > +    /* Barely miss in first step */
> >      timer_set_cc(qts, 1, 162);
> > -    /* Spot on on third step */
> > +    /* Spot on in third step */
> >      timer_set_cc(qts, 2, 480);
> 
> These changes also look wrong.

It makes them consistent wth the first comment "Swept over in first step"

Also that 'Barely miss in first step' ought to say 'secound step'


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


