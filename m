Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB02281CD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:18:08 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxt5r-00015t-DZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxt4t-0000fd-Qw
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:17:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46120
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxt4s-0002my-9y
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595341025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ztslInhe9syyoAtFnJyvrIWdSs/BW5E9+2zcQPQKBm0=;
 b=HxHY51IX1zeNZ+dKgoJZMQZXWyMM7vGmRIyxa9IUOyEVhLBXBVrSq/gpfej1Y8Z/p23Tp+
 qtooB6S0eFTRzhj9dMDWRYfEpwzdI5VF2TusBpjSBe9u5tg45YqFlJY+JkkFfLExDI134/
 /VhxsB4o9VdNrpDxJvD5ihFxg7DPbdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-9T_1GiK_PY2pNvuzZoTJ-g-1; Tue, 21 Jul 2020 10:17:03 -0400
X-MC-Unique: 9T_1GiK_PY2pNvuzZoTJ-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45448E919
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:17:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A8DF70106;
 Tue, 21 Jul 2020 14:16:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89E5B9D05; Tue, 21 Jul 2020 16:16:55 +0200 (CEST)
Date: Tue, 21 Jul 2020 16:16:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v5 01/10] module: qom module support
Message-ID: <20200721141655.qbvwuom7zbv3r4ls@sirius.home.kraxel.org>
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-2-kraxel@redhat.com>
 <7hlfjemfup.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
In-Reply-To: <7hlfjemfup.fsf@turbo.dinechin.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:17:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +/*
> > + * Building devices and other qom objects modular is mostly useful in
> > + * case they have dependencies to external shared libraries, so we can
> > + * cut down the core qemu library dependencies.  Which is the case for
> > + * only a very few devices & objects.
> > + *
> > + * So with the expectation that this will be rather the exception than
> > + * to rule and the list will not gain that many entries go with a
> 
> Nit: Add a comma after "entries"
> 
> I would also indicate that this list needs to be sorted by prefix/module

Done (incremental patch, series is merged already).

> > +    const char *type;
> > +    const char *prefix;
> > +    const char *module;
> 
> Because of the sorting rule, it is more intuitive to put the module first
> and the type last, for cases where you have
> 
>     mod1 prefix1 type1
>     mod1 prefix1 type2
>     mod1 prefix1 type3
>     mod2 prefix2 type1
> 
> Visually, I expect the constants to come first.

I see it more as a object-type -> module lookup table, thats why the
type comes first ...

take care,
  Gerd


