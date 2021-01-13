Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEF2F4C96
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:58:24 +0100 (CET)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgfH-0007ov-Ej
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzgeW-0007OO-Rb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzgeU-0008Go-TE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnV5WdeezNh8dU1w9wNLzKpijnoYQlzCaf62DBtMX1o=;
 b=ZWkMGYB4sQ+lxbH1vPVxp1G0zxqTy8zKX6grpiawkvHoPTrvgxDMM5vSF0o+m+R3DpZh0W
 KlxFU8KbVpwM+1oa+jsUY0vbrl8WXo++A+bcX9bbQR/ulHAynLK/5ob5MN/QgpWbuDgKXP
 oJmnq6+O2+02kEhdN3bNn7VCCPX1P2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-FQBKzgo_MWGfFsfYRVWMaA-1; Wed, 13 Jan 2021 08:57:18 -0500
X-MC-Unique: FQBKzgo_MWGfFsfYRVWMaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48EFA9CC03;
 Wed, 13 Jan 2021 13:57:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B22265C730;
 Wed, 13 Jan 2021 13:57:07 +0000 (UTC)
Date: Wed, 13 Jan 2021 13:57:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
Message-ID: <20210113135705.GC1568240@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
MIME-Version: 1.0
In-Reply-To: <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, debian-superh@lists.debian.org,
 Stefan Hajnoczi <stefanha@redhat.com>, debian-hppa@lists.debian.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 02:42:51PM +0100, Helge Deller wrote:
> On 1/13/21 2:09 PM, Philippe Mathieu-Daudé wrote:
> > Cc'ing TCI, SH4 and PA contacts FWIW.
> >
> > On 1/7/21 5:06 PM, Daniel P. Berrangé wrote:
> >> On Thu, Jan 07, 2021 at 04:50:36PM +0100, Paolo Bonzini wrote:
> >>> On 07/01/21 16:01, Peter Maydell wrote:
> >>>> On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>>>>
> >>>>> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
> >>>>> a warning) if the host CPU is unsupported, making it more similar to
> >>>>> other --enable-* options.
> >>>>
> >>>> The current behaviour is kind of deliberate. Using the TCG
> >>>> interpreter is a terrible idea and think it's better if we
> >>>> don't let users end up using it without realising that they have.
> >>>> (Personally I would vote to deprecate-and-delete TCI, and also
> >>>> to just have configure error out on unknown host CPU architectures.)
> >>>
> >>> Fair enough, I can change this back of course.  The missing targets are
> >>> parisc, ia64 and sh4 I guess.
> >>
> >> ia64 is a dead host architecture and doesn't exist in any OS distro that
> >> we target anymore, so I don't think we need to consider it.
> 
> I have no opinion about ia64.
> 
> >> Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I
> >> think we can rule that out too.
> 
> Can we please keep parisc/hppa.
> It's not an official platform any longer, but quite active in the
> "unstable" debian-ports repository:
> https://buildd.debian.org/status/architecture.php?a=hppa&suite=sid
> 
> >> Only sh4 still seems to be supported in Debian. I expect the primary
> >> need there is for sh4 guest support rather than sh4 host support.
> 
> Same as for hppa/parisc, sh4 is in debian-ports too.

So that at least shows that we need *guest target* support hppa/sha4.

The question still remains whether anyone is actually likely to be
running/using QEMU on a sh4/hppa *host*, to emulate a different
guest arch ? This is what that TCG interpreter provides for.
eg would anyone really want to emulate aarch64 guest when runing on
a hppa host ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


