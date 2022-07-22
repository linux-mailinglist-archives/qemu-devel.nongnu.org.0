Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAB57E396
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:14:53 +0200 (CEST)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuMe-000875-8Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuGN-0005sb-BU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuGK-00024P-5a
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502499;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2CPznXVTFotBO2L25lCMDn4UpJS4sQKCDt42NppE1I=;
 b=CcCXVaJBhgY0PE3cPd31f8EKz0iCzEIqXUfabbNmRma/3Yg+xgnXfkfzvSDtmo7ESP0aDf
 udc3rvMn0kMofScl0yQ475hB/GLNqYwtUwBWWbvhU4uNAxGjc9Q0+9NZoDyI4F2LAiClaO
 uDovAsmDIUURikOV7bQgDutSpSWwwMk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-P3Pu-SYePJCwFhhqOdWpIQ-1; Fri, 22 Jul 2022 11:08:17 -0400
X-MC-Unique: P3Pu-SYePJCwFhhqOdWpIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6929B3C0D85B;
 Fri, 22 Jul 2022 15:08:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D6540D2962;
 Fri, 22 Jul 2022 15:08:16 +0000 (UTC)
Date: Fri, 22 Jul 2022 16:08:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] trivial: Fix duplicated words
Message-ID: <Ytq9XpkdElP6vphn@redhat.com>
References: <20220722145859.1952732-1-thuth@redhat.com>
 <Ytq8MarsylEWxvhQ@redhat.com>
 <368acb07-ddcd-7d6f-a86d-deb82a64d82b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <368acb07-ddcd-7d6f-a86d-deb82a64d82b@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 22, 2022 at 05:07:08PM +0200, Thomas Huth wrote:
> On 22/07/2022 17.03, Daniel P. Berrangé wrote:
> > On Fri, Jul 22, 2022 at 04:58:59PM +0200, Thomas Huth wrote:
> > > Some files wrongly contain the same word twice in a row.
> > > One of them should be removed or replaced.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   Removing duplicated words seems to be the new hip trend on the
> > >   Linux kernel mailing lists - so let's be hip in QEMU land, too! ;-)
> > 
> > I've got patches proposed for this, as well as test to detect it:
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01405.html
> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01403.html
> > 
> > though I'm not checking 'this this' or 'a a'
> 
> Ah, ok! Sorry, I should have had a closer look at that series...
> 
> So never mind this patch here - but what do we do about "this" and "a" ?
> Shall I respin my patch limited to those two words, or do you want to
> include it in your series?

I don't mind if your patches merge now regardless actually, and I'll
rebase, since it'll likely take me longer to deal with the broader
review feedback on mine.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


