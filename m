Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3625A5735E3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 13:57:30 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBazg-0004HJ-RS
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 07:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBaxx-0002Q5-4t
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBaxt-0001CC-6f
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657713336;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QEupXo+wkwgf32qMs/+d1XxoNtGb9sUziU4A5gjZyc=;
 b=BNeUE3BMGTXUpCLdnHT8K8vEoD1QFlniQFYKG3nnu7yaZDUdQx2ecJp9sQ6Xf2SFQ7ChTj
 WrmaMUUWny9FDPSWIEEOQO3kO/KHvyZNNvMwA91xRs16oecF6SOCr+lBC3dncTw6cim113
 Y30uNpPRp4HRWEyRK0RBvAWYlw+lctw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-6v8XLFgePjWQE0irgPw4AA-1; Wed, 13 Jul 2022 07:55:33 -0400
X-MC-Unique: 6v8XLFgePjWQE0irgPw4AA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97D391C1BD27;
 Wed, 13 Jul 2022 11:55:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA355401E54;
 Wed, 13 Jul 2022 11:55:31 +0000 (UTC)
Date: Wed, 13 Jul 2022 12:55:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 1/3] MAINTAINERS: Add myself as Guest Agent reviewer
Message-ID: <Ys6ysTAqLt9zLjkO@redhat.com>
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
 <20220713101908.2212307-2-kkostiuk@redhat.com>
 <Ys6gl74SLea6dsfU@redhat.com>
 <CAPMcbCretrK9i5tA7joRXaKa0f7HruO=SNa18sZqZPmCZK9ypA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPMcbCretrK9i5tA7joRXaKa0f7HruO=SNa18sZqZPmCZK9ypA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Wed, Jul 13, 2022 at 02:31:08PM +0300, Konstantin Kostiuk wrote:
> On Wed, Jul 13, 2022 at 1:38 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrote:
> > > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > > Message-Id: <20220712092715.2136898-1-kkostiuk@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > > ---
> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 450abd0252..b1e73d99f3 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git
> > qapi-next
> > >
> > >  QEMU Guest Agent
> > >  M: Michael Roth <michael.roth@amd.com>
> > > +R: Konstantin Kostiuk <kkostiuk@redhat.com>
> >
> > This pull request contains functional changes under qga/, which
> > suggests you're acting as a (co-)maintainer for QGA, not merely
> > a reviewer. I wouldn't normally expect reviewers to send pull
> > requests for a subsystem. As such should this be "M:", to
> > indicate co-maintainership and have an explicit ACK from
> > Michael Roth.
> >
> 
> As the maintainer of the Windows part of the Guest Agent, I have added
> myself
> as a reviewer so I don't miss out on general patches for the Guest Agent.
> Some time ago, I asked Michael Roth if I could submit PRs for all guest
> agent components and he allow me to do this.
> If need I can add myself as a co-maintainer to Guest Agent not only
> Guest Agent Windows.

It sounds like you're defacto a co-maintainer already then and
might as well ackowledge this in MAINTAINERS.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


