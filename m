Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B19A1553A3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 09:20:09 +0100 (CET)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izyrw-0005Vk-4n
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 03:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1izyr1-00057C-0w
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1izyr0-0003FO-2F
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:19:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30291
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1izyqz-0003FA-V5
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 03:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581063549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cf7vAuz6M0yYU5MJj37D+lArag1b5m2z4YrGgyGqIWU=;
 b=ShttzfNdhvh1yAWS70Lf1LzEAXyoOctnbVTcQB0bADJAjbPFkEIAfQUoakRXZBVOEIYAzi
 PNVOs0wdmfleVukKoVZB1GNpQjMXCPC5cUQS+E5SY136Wf37YHSBIuFad6dJUCfXF6RS7n
 pTxJliE74CI3yhzjKEdKPNWjOUQvCBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-S0kkx1WuNs-WGHObdNljMQ-1; Fri, 07 Feb 2020 03:19:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76EC918FE860;
 Fri,  7 Feb 2020 08:19:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF63360BEC;
 Fri,  7 Feb 2020 08:18:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9222111386A7; Fri,  7 Feb 2020 09:18:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/29] qga/qapi-schema.json: Fix indent level on doc
 comments
References: <20200206173040.17337-1-peter.maydell@linaro.org>
 <20200206173040.17337-6-peter.maydell@linaro.org>
Date: Fri, 07 Feb 2020 09:18:57 +0100
In-Reply-To: <20200206173040.17337-6-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 6 Feb 2020 17:30:16 +0000")
Message-ID: <87pneqvmha.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: S0kkx1WuNs-WGHObdNljMQ-1
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
> levels, but we would like to add a rST backend, and rST does care
> about indentation.
>
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

How is this commit related to PATCH 9?  The commit messages are
suspiciously similar...


