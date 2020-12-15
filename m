Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151C2DAF37
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:45:05 +0100 (CET)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBZY-0007LP-48
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBTz-00023A-QV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBTy-0007a3-2g
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVrRmms1nnm/j25Q0cojUZsqS0aSjuOVXf6N4e0rAOE=;
 b=NvxHYa7RheMONqIv8U1FbU7cwyIWsaHAU801b+D04SP9BgqLpXGyX5IteiV+Sy5xXKRbzz
 7eEaUDKUiSE57EatO3kcARYsi32rhd69zaSioNjhYB5scBTob3BG+DxE+OLsfXPkmolriO
 lVIzYvhmtdV5jzSJKn0vAtbWp1YPTzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-2uBFu3XmP-OY24o_Q_aopA-1; Tue, 15 Dec 2020 09:39:15 -0500
X-MC-Unique: 2uBFu3XmP-OY24o_Q_aopA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F7541842145;
 Tue, 15 Dec 2020 14:39:14 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6861319C44;
 Tue, 15 Dec 2020 14:39:08 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:39:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 17/32] sparc: Use DEFINE_PROP for nwindows property
Message-ID: <20201215153907.7720c678@redhat.com>
In-Reply-To: <20201214173013.GL1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-18-ehabkost@redhat.com>
 <20201214154248.33e191e4@redhat.com>
 <20201214173013.GL1289986@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
 John Snow <jsnow@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 12:30:13 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Dec 14, 2020 at 03:42:48PM +0100, Igor Mammedov wrote:
> > On Fri, 11 Dec 2020 17:05:14 -0500
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > Use the DEFINE_PROP macro (which will set extra fields in the
> > > struct) instead of initializing a Property struct manually.
> > > 
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > This is a new patch added in v2 of the series
> > > ---
> > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> > > Cc: qemu-devel@nongnu.org
> > > ---
> > >  target/sparc/cpu.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> > > index 6a3299041f..92534bcd18 100644
> > > --- a/target/sparc/cpu.c
> > > +++ b/target/sparc/cpu.c
> > > @@ -848,7 +848,8 @@ static Property sparc_cpu_properties[] = {
> > >                           qdev_prop_uint64, target_ulong),
> > >      DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
> > >      DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
> > > -    { .name  = "nwindows", .info  = &qdev_prop_nwindows },
> > > +    DEFINE_PROP("nwindows",     SPARCCPU, env.def.nwindows,  
> >                                ^^^^
> > stray whitespace  
> 
> I was trying to keep it aligned to the other entries (not visible in diff
> context), but I agree it's just confusing.  I will fix this while committing.
> 
With that
Reviewed-by: Igor Mammedov <imammedo@redhat.com>


