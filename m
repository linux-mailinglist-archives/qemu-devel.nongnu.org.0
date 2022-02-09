Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD74AF183
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 13:29:00 +0100 (CET)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHm5i-0008KC-LZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 07:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHm3J-0007dh-DI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHm3F-0001Zy-C4
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644409583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=O2vOwfEGPJpeX8cQKfdtYPBPC84l5vS/7xOZDikCqcY=;
 b=aSYP7HIuRlYuyQXUzcDew+Q6q37fYdOJuuS0e/7AWCE1mJom2OeAado20PgXbBbbbuHJ+R
 FMBg33GOV3x/2R4R5bQXlljTD0OKgVEuala28YOMW4ff7SYz4phkNC7qXCrhJqjsHfOHlp
 IM/aJN0wexOC/1af0QAfCBPhwzMTTUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-ZKe7m7mYPWy_2zCOYB8AdQ-1; Wed, 09 Feb 2022 07:26:19 -0500
X-MC-Unique: ZKe7m7mYPWy_2zCOYB8AdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6212F1923B82;
 Wed,  9 Feb 2022 12:26:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15BD81059A63;
 Wed,  9 Feb 2022 12:25:59 +0000 (UTC)
Date: Wed, 9 Feb 2022 12:25:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
Message-ID: <YgOy04WldttoXLSt@redhat.com>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
 <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
 <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
MIME-Version: 1.0
In-Reply-To: <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09, 2022 at 12:13:02PM +0200, Liviu Ionescu wrote:
> 
> 
> > On 9 Feb 2022, at 11:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> > 
> > Is the existing ./configure --with-pkgversion= option not enough?
> 
> My understanding of --with-pkgversion=, based on the fact that in QEMU this string is appended to the version, was that it is a suffix that describes a specific version.
> 
> Most GNU tools, including GCC, binutils, etc, use a similar option, but the string is prepended to the greeting message.
> 
> In my use case, --with-branding-prefix does the same, QEMU presents itself with:
> 
> .../xpack-qemu-arm-6.2.0-1/bin/qemu-system-arm --version
> xPack QEMU emulator version 6.2.0 (v6.2.0-1-xpack-arm)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
> 
> All other binary xPacks (https://github.com/xpack-dev-tools/) do the same.
> 
> In my opinion, a prefix is preferred, and is consistent with the GNU behaviour.

Being consistent with GNU doesn't add any functional benefit
over what we already provided, so isn't a compelling justification
IMHO.

> Anyway, having both does not break any backward compatibility and
> does not add any significant overhead/complexity.

Changing the name of the program printed by adding a prefix certainly
could cause compatibility failures. I would not be surprised to see
something looking at the --version output programatically and getting
tripped up by having a arbitrary string prefix.

If there are multiple functionally equivalent ways to achieve the same
goal, it is preferrable to pick one, rather than try to implement all
of them.

Given that we already have --with-pkgversion which satisfies the use
case, I don't see a compelling reason to add a new option. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


