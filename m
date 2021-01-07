Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C02ED3F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:10:30 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXrp-0006nm-UJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxXpm-0005sP-Ug
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxXpl-0001b2-79
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610035699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oV5VM36LVs8zXTYciWnULN94V0KpB9wVobLdvyvLp9Q=;
 b=g5PEZiMhqODEmvUTXTAoS+krjeqhT+ah7yq9duqSs0pzOUWH0mFJEldJsMbCaQtqlAFNWs
 S5lY+362NhMGP1VyzmAAnLrDU7d2jg0AKVTlB+kMreCCAohMOsoq8GiT45yw4YpL1dPx5F
 qKEpPOkUp8fD1ETsS2gZIUms1kSW3vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-6-h4R9QrP8qH9E0IDXDfoQ-1; Thu, 07 Jan 2021 11:07:05 -0500
X-MC-Unique: 6-h4R9QrP8qH9E0IDXDfoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2D110054FF;
 Thu,  7 Jan 2021 16:07:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 266B560937;
 Thu,  7 Jan 2021 16:06:55 +0000 (UTC)
Date: Thu, 7 Jan 2021 16:06:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
Message-ID: <20210107160653.GD1029501@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 04:50:36PM +0100, Paolo Bonzini wrote:
> On 07/01/21 16:01, Peter Maydell wrote:
> > On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > 
> > > Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
> > > a warning) if the host CPU is unsupported, making it more similar to
> > > other --enable-* options.
> > 
> > The current behaviour is kind of deliberate. Using the TCG
> > interpreter is a terrible idea and think it's better if we
> > don't let users end up using it without realising that they have.
> > (Personally I would vote to deprecate-and-delete TCI, and also
> > to just have configure error out on unknown host CPU architectures.)
> 
> Fair enough, I can change this back of course.  The missing targets are
> parisc, ia64 and sh4 I guess.

ia64 is a dead host architecture and doesn't exist in any OS distro that
we target anymore, so I don't think we need to consider it.

Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I
think we can rule that out too.

Only sh4 still seems to be supported in Debian. I expect the primary
need there is for sh4 guest support rather than sh4 host support.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


