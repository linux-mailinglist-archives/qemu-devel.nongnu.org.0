Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FEF2D9DF0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:39:47 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korp3-0000LZ-P1
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1korg4-0004cJ-3O
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1korg1-00037V-68
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607967023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPZuH9lHvoOlcGrLJEBFk9BWjd6JYYuF3cdWKqCQlIY=;
 b=NZTRQol5ngsLYBRtg6g2WBb5SMJ9iFXiCZoJrF5WaKve4sahehLBhr5uXTwhOPBuuDy67K
 iC+QkTQLhiLYfHiT1gBsKSXI/Nv5EJsDHSc0db98eJGVWjTluTcsRkuYoPnAc7efB+R1rN
 zWrBkP5YNVKeQCEO6kcgXxv70NliZvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-kyqzqWLzO4i3aOjAAzFzYw-1; Mon, 14 Dec 2020 12:30:19 -0500
X-MC-Unique: kyqzqWLzO4i3aOjAAzFzYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E37E10054FF;
 Mon, 14 Dec 2020 17:30:18 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6C1B5D9DC;
 Mon, 14 Dec 2020 17:30:14 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:30:13 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 17/32] sparc: Use DEFINE_PROP for nwindows property
Message-ID: <20201214173013.GL1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-18-ehabkost@redhat.com>
 <20201214154248.33e191e4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214154248.33e191e4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 03:42:48PM +0100, Igor Mammedov wrote:
> On Fri, 11 Dec 2020 17:05:14 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Use the DEFINE_PROP macro (which will set extra fields in the
> > struct) instead of initializing a Property struct manually.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > This is a new patch added in v2 of the series
> > ---
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  target/sparc/cpu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> > index 6a3299041f..92534bcd18 100644
> > --- a/target/sparc/cpu.c
> > +++ b/target/sparc/cpu.c
> > @@ -848,7 +848,8 @@ static Property sparc_cpu_properties[] = {
> >                           qdev_prop_uint64, target_ulong),
> >      DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
> >      DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
> > -    { .name  = "nwindows", .info  = &qdev_prop_nwindows },
> > +    DEFINE_PROP("nwindows",     SPARCCPU, env.def.nwindows,
>                                ^^^^
> stray whitespace

I was trying to keep it aligned to the other entries (not visible in diff
context), but I agree it's just confusing.  I will fix this while committing.

-- 
Eduardo


