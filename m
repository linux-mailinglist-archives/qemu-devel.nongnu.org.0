Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BED3E59F5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:33:20 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQwZ-0005uc-Jz
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDQv3-0004RT-AH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDQv1-0007nW-Dt
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628598702;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8Lm7f8WIRFCEK0qbwXDVjgkTh9QakhQ1K2qEcArdDg=;
 b=EmbUmmgkQDA0O/e7TNGFJb6snyYORzl0xUCztBof/W6ZNo9nkvHAez7arRrc+84Uwcwtf4
 QELtsGgQJvfmP/N6snKZ84hUN9GbfhplCeflm5FKVG7GWRnL05737MfSrsIhvtay5WQ0uA
 T9DhzCVcgM607hpJpS9uC2cVkejkTlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-jjddL5ZLOGOdF5gjEdNLAw-1; Tue, 10 Aug 2021 08:31:40 -0400
X-MC-Unique: jjddL5ZLOGOdF5gjEdNLAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E3F801A92;
 Tue, 10 Aug 2021 12:31:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5326C6A056;
 Tue, 10 Aug 2021 12:31:34 +0000 (UTC)
Date: Tue, 10 Aug 2021 13:31:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Name and email address change
Message-ID: <YRJxo0qC6XdOHZHU@redhat.com>
References: <20210810095049.35602-1-hreitz@redhat.com>
 <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
 <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
MIME-Version: 1.0
In-Reply-To: <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 01:46:51PM +0200, Hanna Reitz wrote:
> On 10.08.21 13:29, Philippe Mathieu-Daudé wrote:
> > On 8/10/21 11:50 AM, Hanna Reitz wrote:
> > > I have changed my name and email address.  Update the MAINTAINERS file
> > > to match.
> > > 
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > > ---
> > >   MAINTAINERS | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > I'd recommend you to also add an entry in .mailmap:
> > 
> > -- >8 --
> > diff --git a/.mailmap b/.mailmap
> > index 082ff893ab3..504839c84d3 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -53,6 +53,7 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony
> > Liguori <aliguori@us.ibm.com>
> >   Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
> >   Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
> >   Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
> > +Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
> >   Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
> >   Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
> >   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> > ---
> 
> Hu, I didn’t know there is such a thing.  Looks like I could even do
> 
> Hanna Reitz <hreitz@redhat.com> Max Reitz <mreitz@redhat.com>

With the line Philippe suggested, the rewrite will happen any time
the original email is seen. With this line, the rewrite will only
happen if both original name + email match. In practice this is
functionally the same, unless someone had variations in the spelling
of their real name over time, so either would work.

> Feels a bit like cheating, though...?

I wouldn't call it cheating. It is just an input for canonicalizing
contributors' identities, where there were changes in name or email
over time. It gives a more useful view to tools like 'git shortlog'
and 'git-dm' stats reports, such that all work over time will be
grouped together instead of split.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


