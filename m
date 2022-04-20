Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D3508D70
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:35:02 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDID-0004Mi-D1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCxV-0004pL-2J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCxT-00072g-Ad
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650471214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muok6I9fnBE4AkuxCBACIJRCtUl+ZNsfBwaiG+rY+Xs=;
 b=bszx6tjxzvXF58RP7AV9G7Xgi3sqG+XMiXlXpvMmDbeTkpShegizO9M1pfWMJIVe1WfytV
 OWQ6NG6M0LjoBayKd80rBAtSH9MsdfVQRCtplNy5d3bij67Tl688fAfp2jZ2VEjWWInz1z
 AnM4UaYgzvkUUIuA6IF+6L6Vgk5d6QY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-69tyjsp3NXOOgc_woSu74w-1; Wed, 20 Apr 2022 12:13:31 -0400
X-MC-Unique: 69tyjsp3NXOOgc_woSu74w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89173800B28;
 Wed, 20 Apr 2022 16:13:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9936FC3597A;
 Wed, 20 Apr 2022 16:13:27 +0000 (UTC)
Date: Wed, 20 Apr 2022 17:13:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/41] include: rename qemu-common.h qemu/copyright.h
Message-ID: <YmAxJdh6mupPRxh+@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-7-marcandre.lureau@redhat.com>
 <YmAg+9GExN7wn6Yb@redhat.com>
 <CAFEAcA-n89moZJX5t72ek0iB0MEMQCAyq9jhVymcwyHEK_NNMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-n89moZJX5t72ek0iB0MEMQCAyq9jhVymcwyHEK_NNMw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:virtiofs" <virtio-fs@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:10:51PM +0100, Peter Maydell wrote:
> On Wed, 20 Apr 2022 at 16:04, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 05:25:49PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > Could use a commit message explaining why this is a good
> > idea.
> >
> > I see it contains QEMU_COPYRIGHT macro, but it also then
> > contains QEMU_HELP_BOTTOM which is about bug reporting
> > not copyright.
> >
> > IMHO something like 'qemu-cli.h' could be a better match
> 
> "-cli" is both too broad and also inaccurate, because we use
> these macros in the GUI UI frontends too. It's "macros defining
> strings for use in version/usage/help dialogs and output".
> Maybe qemu/help-texts.h ?

I guess I tend to still view qemu-system-XXX as cli, despite the
possibility of a GUI, since you're passing 10's/100's of CLI
parameters regardless.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


