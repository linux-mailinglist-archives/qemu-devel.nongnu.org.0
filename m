Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AE15D7A2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 13:48:32 +0100 (CET)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2aOV-0001WZ-N9
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 07:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j2aN3-0000dZ-CY
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:47:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j2aN1-0004OQ-UN
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:47:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29988
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j2aN1-0004JZ-Ke
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 07:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iA+OAyQXj+iwrD2ZYT8Z0Jgna68s6auuduexaA1FCwE=;
 b=Ej/bRB9O+NZac+JD0BIATI0fW4E+nIIw0n1Dw0S1FpR+Q/SUcVCKa9Wn2cwV4kH7k6KApu
 OMMltJfLQdbZDvC/XsyRnDji31o+63Adc+2pVrj2xh7wyL1Z0IYIzdRCuqKSOzOXya+8zZ
 Rmdo57nlJ3po/IUpoO2eMy0evGqBZDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Zw01kHWzMLClthTliqg4Lw-1; Fri, 14 Feb 2020 07:46:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA3B10CE780;
 Fri, 14 Feb 2020 12:46:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4EB5C1C3;
 Fri, 14 Feb 2020 12:46:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54B6311385C9; Fri, 14 Feb 2020 13:46:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 06/30] qga/qapi-schema.json: minor format fixups for rST
References: <20200213175647.17628-1-peter.maydell@linaro.org>
 <20200213175647.17628-7-peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 13:46:50 +0100
In-Reply-To: <20200213175647.17628-7-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 13 Feb 2020 17:56:23 +0000")
Message-ID: <87tv3twd39.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Zw01kHWzMLClthTliqg4Lw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> rST format requires a blank line before the start of a bulleted
> or enumerated list. Two places in qapi-schema.json were missing
> this blank line.

Relies on the previous commit message's "we would like to add a rST
backend" to establish context.  Suggest:

  We would like to switch the doc comments to rST format, and rST
  requires...

> Some places were using an indented line as a sort of single-item
> bulleted list, which in the texinfo output comes out all run
> onto a single line; use a real bulleted list instead.

The old text tempts developers to add additional items the same way, and
the all items run together.  So this makes sense on its own.

> Some places unnecessarily indented lists, which confuses rST.
>
> guest-fstrim:minimum's documentation was indented the
> right amount to share a line with @minimum, but wasn't
> actually doing so.
>
> The indent on the bulleted list in the guest-set-vcpus
> Returns section meant rST misindented it.
>
> Changes to the generated texinfo are very minor (the new
> bulleted lists, and a few extra blank lines).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I checked the plain text output, and it's fine.

Preferably with the commit message tweak I suggested
Reviewed-by: Markus Armbruster <armbru@redhat.com>


