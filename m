Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34317A4AC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 12:57:31 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9p86-0001Gu-2g
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 06:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j9p6c-00009L-8C
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 06:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j9p6a-0006Mv-Du
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 06:55:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35276
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j9p6a-0006M3-6Y
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 06:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583409355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBFMeX1tUR9btSwjA919NghtH5NO4/XuDwxTCy6JDgc=;
 b=K7aPVKgGtqg3Njv7q5qyX2djRBu3faWyz1ObxUKpZOeQn/RJobHtaE3S5/xjeAmPYtC5tx
 CsnLIPQwxV7rjCKM2A42NxH3kpMRQbQYix1TWOjpxK7lYEOHYBEkltZIKBJYVXDMUF27oh
 FLTkjsbSfElN1nkWVxzy8LwQ7LBBXQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-EQ8gPoxNMmOmjVkIDG9ksQ-1; Thu, 05 Mar 2020 06:55:52 -0500
X-MC-Unique: EQ8gPoxNMmOmjVkIDG9ksQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E7681922960;
 Thu,  5 Mar 2020 11:55:51 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0010F8B75C;
 Thu,  5 Mar 2020 11:55:49 +0000 (UTC)
Date: Thu, 5 Mar 2020 12:55:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 06/10] iotests: limit line length to 79 chars
Message-ID: <20200305115548.GA5363@linux.fritz.box>
References: <20200304213818.15341-1-jsnow@redhat.com>
 <20200304213818.15341-7-jsnow@redhat.com>
 <a23da70f-a46f-acc8-18b4-c1b2e5cea60c@redhat.com>
 <c57333a3-baf3-cc00-7f99-6fce2de91a7f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c57333a3-baf3-cc00-7f99-6fce2de91a7f@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.03.2020 um 00:14 hat John Snow geschrieben:
>=20
>=20
> On 3/4/20 4:58 PM, Philippe Mathieu-Daud=E9 wrote:

Adding back the context:

> -        sys.stderr.write('qemu-img received signal %i: %s\n' % (-exitcod=
e, ' '.join(qemu_img_args + list(args))))
> +        sys.stderr.write('qemu-img received signal %i: %s\n' % (
> +            -exitcode, ' '.join(qemu_img_args + list(args))))

> > Do we want to indent Python like C and align argument below opening
> > parenthesis? Except when using sys.stderr.write() you seem to do it.
>=20
> This isn't an argument to write, it's an argument to the format string,
> so I will say "no."

The argument to write() is an expression. This expression contains the %
operator with both of its operands. It's still fully within the
parentheses of write(), so I think Philippe's question is valid.

> For *where* I've placed the line break, this is the correct indentation.
> emacs's python mode will settle on this indent, too.
>=20
> https://python.org/dev/peps/pep-0008/#indentation

The PEP-8 examples are not nested, so it's not completely clear. I
wonder if hanging indents wouldn't actually mean the following because
if you line wrap an argument list (which contains the whole %
expression), you're supposed to have nothing else on the line of the
opening parenthesis:

    sys.stderr.write(
        'qemu-img received signal %i: %s\n'
        % (-exitcode, ' '.join(qemu_img_args + list(args))))

But anyway, I think the question is more whether we want to use hanging
indents at all (or at least if we want to use it even in cases where the
opening parenthesis isn't already at like 70 characters) when we're
avoiding it in our C coding style.

There's no technical answer to this, it's a question of our preferences.

> (If anyone quotes Guido's belittling comment in this email, I will
> become cross.)
>=20
>=20
> But there are other places to put the line break. This is also
> technically valid:
>=20
> sys.stderr.write('qemu-img received signal %i: %s\n'
>                  % (-exitcode, ' '.join(qemu_img_args + list(args))))
>=20
> And so is this:
>=20
>     sys.stderr.write('qemu-img received signal %i: %s\n' %
>                      (-exitcode, ' '.join(qemu_img_args + list(args))))

PEP-8 suggests the former, but allows both styles:

https://www.python.org/dev/peps/pep-0008/#should-a-line-break-before-or-aft=
er-a-binary-operator

> (And so would be any other number of rewrites to use format codes,
> f-strings, or temporary variables to otherwise reduce the length of the
> line.)
>=20
> I will reluctantly admit that wrapping to 79 columns is useful in some
> contexts. The beauty of line continuations is something I have little
> desire to litigate, though.
>=20
> If there's some consensus on the true and beautiful way to do it, I will
> oblige -- but the thought of spinning more iterations until we find a
> color swatch we like is an unpleasant one.

I'll accept any colour for the bikeshed, as long as it's green. ;-)

Kevin


