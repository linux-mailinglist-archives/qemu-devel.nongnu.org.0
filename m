Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D8109C77
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:43:50 +0100 (CET)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZYJx-0005Ei-A0
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iZY31-0003NN-CG
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:26:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iZY2y-0003Xj-D1
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:26:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41990
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iZY2x-0003XA-SB
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574763974;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jun8ydUo8qDErM3Dj7H++uoe8Gz1TUchBI8znFnwte4=;
 b=O08c+fdn8FW+FqnLZnZ9PUD69jjeQnHzRZfJdTV8rsr90XeyERkhiEFdaoLdzsQcelVgDs
 ZiWxi9HL6QfvGQNuz+IKHS4HMXQ/OTqChWMCw2EriRYbsCZ0RgXIBke2vCtdQwTLNonprx
 6UMnsG0bwcIdX9FNYHBXh+jX6aPg5SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-tFL1jfsTPoeHmKKOkrkKUg-1; Tue, 26 Nov 2019 05:26:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB1C188352E
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 10:26:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F076C60C80;
 Tue, 26 Nov 2019 10:26:03 +0000 (UTC)
Date: Tue, 26 Nov 2019 10:26:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: virtiofsd: Where should it live?
Message-ID: <20191126102600.GG556568@redhat.com>
References: <20191125185021.GB3767@work-vm>
MIME-Version: 1.0
In-Reply-To: <20191125185021.GB3767@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tFL1jfsTPoeHmKKOkrkKUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: mszeredi@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 25, 2019 at 06:50:21PM +0000, Dr. David Alan Gilbert wrote:
> Hi,
>   There's been quite a bit of discussion about where virtiofsd, our
> implemenation of a virtiofs daemon, should live.  I'd like to get
> this settled now, because I'd like to tidy it up for the next
> qemu cycle.
>=20
> For reference it's based on qemu's livhost-user+chunks of libfuse.
> It can't live in libfuse because we change enough of the library
> to break their ABI.  It's C, and we've got ~100 patches - which
> we can split into about 3 chunks.
>=20
> Some suggestions so far:
>   a) In contrib
>      This is my current working assumption; the main objection is it's
>      a bit big and pulls in a chunk of libfuse.

My main objection to 'contrib/' is actually the perceived notions
about what the contrib directory is for. When I see 'contrib/'
code in either QEMU, or other open source projects, my general
impression is that this is largely unsupported code which is just
there as it might be interesting to someone, and doesn't typically
get much ongoing dev attention.

Parts that are fully supported & actively developed by projects
usually live elsewhere like a src/ or lib/ or tools/ directory.

This has kind of been the case with QEMU historically, with
the vhost-user-blk, vhost-user-scsi not being real production
quality implementations. Rather they are just technology demos
to show what you might do.   vhost-user-gpu/input blurred this
boundary a bit as they're more supported tools, and so I'd
argue contrib/ probably wasn't the right place for them either
in hindsight.

virtiofsd is definitely different as it is intended to be a
fully production quality supported tool with active dev into
the future IIUC.

IOW, if we did decide we want it in QEMU, then instead of
'$GIT/contrib/virtiofsd', I'd prefer to see '$GIT/virtiofsd'.

>   b) In a submodule
>=20
>   c) Just separate
>=20
> Your suggestions/ideas please.  My preference is (a).

What I'm wondering is just how much sharing / overlap of code and concepts
and community operation there is going otbetween QEMU and virtiofsd. From
the tech POV, IIUC, the main blocker it would need to be in QEMU is because
it links to libvhost-user and we've not declared that to be a stable API
for 3rd party linking.

Personally I'm always biased towards self-contained apps being in their
own repositories, rather than bundling too much stuff into one repo. You
can see that in the way we've created independant git repos for any libvirt
module that didn't need to be part of the main libvirt.git.

To me the key benefit this gives is flexibility in approach. ie the app
doesn't need to blindly follow every precedent that QEMU has set. It
can instead take the most appropriate path for its needs. For example...

It could use meson for its build system already. This would be good as
builds will be done in a matter of seconds. For contributors it would
be a much less daunting project to join as it wouldn't be lost in the
firehose of other non-virtiofsd contributions on qemu-devel.

It doesn't have to follow QEMU's 3-times a year release model, with 6
week long freeze periods. It can be more agile releasing 6 times a year
with 1 week freezes if desired, I personally think tihs would be quite
desirable for a young project like virtiofsd which is evolving rapidly
as it would get new work available to users much more rapidly.

It doesn't have to follow QEMU's API stability & deprecation policies.
It could be more flexible in taking non-compatible changes, which again
may be valuable for a young rapidly evolving app.



Anyway to be clear, I'm not a contributor to virtiofsd, nor likely to
be one in the future, so just consider this a personal POV. From QEMU's
POV I don't think it'll matter whether virtiofsd in or out of QEMU git.
It is more about the impact & burden QEMU's dev process & standards might
impose on virtiofsd itself.

I'm fine with whatever option above is chosen, with the only caveat
being that if its in qemu.git, I don't think it belongs under contrib/
it should be a top level dir of its own.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


