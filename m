Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A223915D788
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 13:37:46 +0100 (CET)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2aE5-0003qJ-Fc
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 07:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j2aDK-0003J5-7w
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:37:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j2aDJ-0006e0-3K
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:36:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44305
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j2aDI-0006dA-SU
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581683815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Bf/UfFYZJlhUl32pPu22GpvnvgnyArB045j+9dxzY4=;
 b=Zu1ZBQjBRBP6Lj3uOVDFl/C9/xWJEmJP6sQ0VZLY48uT2h0evvLnh9NN+ZXdNf0WIjfZ+R
 89dDB8tGM4eJiQ9qnRCrCjx6CbfnkLICr0DYVNos+Jm7C6t6kq0S/Zt2xZuuEM6ddoOF3e
 zIav1hLjuKvCs3Ikvpkshxij/BD3CQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-qEbPcP7HOgWU7gW02iryvA-1; Fri, 14 Feb 2020 07:36:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2608B107ACC7;
 Fri, 14 Feb 2020 12:36:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B0D560BF1;
 Fri, 14 Feb 2020 12:36:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B25DD11385C9; Fri, 14 Feb 2020 13:36:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 05/30] qga/qapi-schema.json: Fix indent level on doc
 comments
References: <20200213175647.17628-1-peter.maydell@linaro.org>
 <20200213175647.17628-6-peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 13:36:43 +0100
In-Reply-To: <20200213175647.17628-6-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 13 Feb 2020 17:56:22 +0000")
Message-ID: <874kvtxs4k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qEbPcP7HOgWU7gW02iryvA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> The texinfo doc generation doesn't care much about indentation

Let's spell Texinfo with a capital T.

> levels, but we would like to add a rST backend, and rST does care
> about indentation.

Nitpick: an rST *backend* should not care about the doc generator's
*input* format.  We actually intend to change the input format into a
domain-specific dialect of rST, as you state in your cover letter: "This
series switches all our QAPI doc comments over from texinfo format to
rST."

Perhaps:

  The current doc generation doesn't care much about indentation levels,
  but we would like to switch to an rST format, and rST does care about
  indentation.

> Make the doc comments more strongly consistent about indentation
> for multiline constructs like:
>
> @arg: description line 1
>       description line 2
>
> Returns: line one
>          line 2
>
> so that there is always exactly one space after the colon, and
> subsequent lines align with the first.
>
> This commit is a purely whitespace change, and it does not alter the
> generated .texi files (because the texi generation code strips away
> all the extra whitespace).  This does mean that we end up with some
> over-length lines.
>
> Note that when the documentation for an argument fits on a single
> line like this:
>
> @arg: one line only
>
> then stray extra spaces after the ':' don't affect the rST output, so
> I have not attempted to methodically fix them, though the preference
> is a single space here too.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

R-by stands even without the commit message improvement I suggested.


