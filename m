Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056F58FCC5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:49:09 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7cZ-0003QU-Vz
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oM76X-0001p5-7l
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oM76T-0000hj-N7
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660220156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wo5JfqSSQoWgDsEK9HyhrDTU/UcOrl5/VqfaSrmG0XU=;
 b=C9499Q1OFl16aCrhhefS/w7tBM6FWbWuJol7NiuLG8KFJ36gVE+BO0IhVYlQrC7eWm9SB0
 svu0oUrHJxdJp7tPt0UVN7mo7Cy/UQhpvzkAgiHvyt5ZI5V0+bhF6sGmgd78xzun4VI5tW
 NYNF67QuS6Yd5iRP/8ReTTYZOd44Fco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-90q3aG3zOF6kK8UN6AdXdg-1; Thu, 11 Aug 2022 08:15:53 -0400
X-MC-Unique: 90q3aG3zOF6kK8UN6AdXdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24298380452E;
 Thu, 11 Aug 2022 12:15:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49A7C18EA8;
 Thu, 11 Aug 2022 12:15:50 +0000 (UTC)
Date: Thu, 11 Aug 2022 13:15:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>,
 Kyle Evans <kevans@freebsd.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
Message-ID: <YvTy8zYFQYAKqgoF@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
 <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
 <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
 <CAJ+F1CLb=+gA=Keb3WgW3Mf84eWRikWVxV8HTjdQU8pFTVNMEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CLb=+gA=Keb3WgW3Mf84eWRikWVxV8HTjdQU8pFTVNMEg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > On Thu, 11 Aug 2022 at 11:09, Marc-André Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > > On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster <armbru@redhat.com>
> > wrote:
> > >> Your moves tear closely related code apart.  This is going to be a drag
> > >> for developers in general and maintainers in particular.
> > >>
> > >> Ergonomics suffer when related code is in multiple places.  Having to
> > >> switch between directories and remember where is what will a constant
> > >> low-level pain.  Things that used to be simple & quick, like git-grep
> > >> qapi/*.c, become more involved.
> > >>
> > >
> > > It's inevitable when a project grows. QEMU is already a very large
> > project. Over the years, we have structured the project, by moving things
> > and splitting in subdirectories. Imho, this is actually helpful in many
> > ways, and we got used to it easily hopefully.
> >
> > I agree with this. But generally we've tried to do that by
> > having the subdirectory splitting and naming match the
> > structure of the codebase. The exception, which I strongly
> > dislike, is that contrib/ is a grabbag of random stuff.
> > subprojects/ is starting to feel like it is also turning
> > into "place where random stuff ends up"...
> >
> 
> Yes, most of contrib/* should probably be standalone projects. If only we
> had some kind of common library/subproject :)
> 
> subproject/* is a meson *cough* convention (imposed location for
> subprojects). If we don't want to depend on external released libraries,
> that's just the way it is.
> 
> 
> >
> > > Do you see fundamental reasons why qemu-ga or (qemu-img, qemu-nbd,
> > storage-daemon, virtiofsd, vhost-user-*, *helper, ivshmem* etc) need to be
> > tight to qemu code, release and management process? I am not saying it's
> > time to move them out of qemu project, but I believe it's helpful to have
> > code that is structured and can be compiled indepently.
> > >
> > > And by having "standalone" subprojects, we can more easily evolve in new
> > directions, without touching the rest of the projects.
> >
> > As Markus says, your branch ends up moving most of qobject into
> > qemu-common/. We are never going to let that out of QEMU proper,
> > because we are never going to allow ourselves to be tied to API
> > compatibility with it as an external library. So anything that
> >
> 
> Why is that? We do it with a lot of dependencies already, with stable APIs.
> 
> Furthermore, we don't "have to" be tied to a specific ABI/API, we can
> continue to link statically and compile against a specific version. like
> with libvfio-user today.
> 
> And at this point, I am _not_ proposing to have an extra "qemu-common"
> repository. I don't think there are enough reasons to want that either.
> 
> 
> 
> > needs qobject is never going to leave the QEMU codebase. Which
> >
> means that there's not much gain from shoving it into subproject/
> > IMHO.
> 
> 
> (just to be extra clear, it's qobject not QOM we are talking about)
> 
> qobject is fundamental to all the QAPI related generated code. Why should
> that remain tight to QEMU proper?

Neither qobject nor QOM have ever been designed to be public APIs.
Though admittedly qobject is quite a bit simpler as an API, I'm
not convinced its current design is something we want to consider
public. As an example, just last month Markus proposed changing
QDict's implementation

https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html


If we want external projects to be able to take advantage of QAPI,
the bare minimum we need to be public is a QAPI parser, from which
people can then build any code generators desired.

We don't neccessarily need the current QAPI C code generator. There
could be a new C generator that didn't use qobject, but instead used
some standard GLib types like GHashTable/GList instead of QDict/QList.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


