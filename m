Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398A1554FE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 10:47:26 +0100 (CET)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j00EP-0000Tw-Ci
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 04:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j00D2-0008SR-VN
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j00D1-0008HX-Dx
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:46:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50104
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j00D1-0008GR-Ag
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581068758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJcTR2CM7hoEl5Nw8xSpTwnRMhiwZxPeoZExpng3GOk=;
 b=SBhHPwJoaYHZd44En4d7/oB9ErIRS4ttcrdihdwldAhBFtf0Ozxk0GC/DSsWYDi2aUAcra
 Vx+bekj498eKwryQIk1AJ5RSQ/Dh0ITdHKpoWZUFmwStt0PuN4TtrzkoyNKEf4fItxmBnD
 iMa7hxWCxEwr011y1dOmC7oK59lqOkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-YYQyez7hPQy1et5fRbzkFQ-1; Fri, 07 Feb 2020 04:45:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F3B100511E;
 Fri,  7 Feb 2020 09:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5907D19C7F;
 Fri,  7 Feb 2020 09:45:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D68CF11386A7; Fri,  7 Feb 2020 10:45:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/29] qapi/ui.json: Put input-send-event body text in the
 right place
References: <20200206173040.17337-1-peter.maydell@linaro.org>
 <20200206173040.17337-12-peter.maydell@linaro.org>
Date: Fri, 07 Feb 2020 10:45:45 +0100
In-Reply-To: <20200206173040.17337-12-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 6 Feb 2020 17:30:22 +0000")
Message-ID: <87r1z6spbq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: YYQyez7hPQy1et5fRbzkFQ-1
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

> In the doc comment for input-send-event, there is a multi-line
> chunk of text ("The @device...take precedence") which is intended
> to be the main body text describing the event. However it has
> been placed after the arguments and Returns: section, which
> means that the parser actually thinks that this text is
> part of the "Returns" section text.
>
> Move the body text up to the top so that the parser correctly
> classifies it as body.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qapi/ui.json | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index aced267a1e4..94a07318f55 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -949,13 +949,6 @@
>  #
>  # Send input event(s) to guest.
>  #
> -# @device: display device to send event(s) to.
> -# @head: head to send event(s) to, in case the
> -#        display device supports multiple scanouts.
> -# @events: List of InputEvent union.
> -#
> -# Returns: Nothing on success.
> -#
>  # The @device and @head parameters can be used to send the input event
>  # to specific input devices in case (a) multiple input devices of the
>  # same kind are added to the virtual machine and (b) you have
> @@ -967,6 +960,13 @@
>  # are admissible, but devices with input routing config take
>  # precedence.
>  #
> +# @device: display device to send event(s) to.
> +# @head: head to send event(s) to, in case the
> +#        display device supports multiple scanouts.
> +# @events: List of InputEvent union.
> +#
> +# Returns: Nothing on success.
> +#
>  # Since: 2.6
>  #
>  # Note: The consoles are visible in the qom tree, under

Reviewed-by: Markus Armbruster <armbru@redhat.com>


