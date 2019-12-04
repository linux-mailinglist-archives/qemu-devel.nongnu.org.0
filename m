Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F8112BE2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 13:46:52 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icU3P-0008Cx-54
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 07:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icTa2-0007kp-SB
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icTZn-0005St-TA
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icTZn-0005A1-OE
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575461773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lhELDBp2p7kSZYzziYGeg4mIOq150GA1nTJ88AVdZ4=;
 b=duPcoHNKIHSCI2p8RsLEgSUYvE8f0UkHQTu2dOr5PRpZoJubzzX6dJNG88ebh2E+Vkz19y
 ir7QXdo0i3kjiqD8Id2ixGQWBSJpRM7BTK0wUXEGv3lGlovGTbh4NcCKkGXXImnRHBwoNT
 MocS+vUUWIxP1tuDpRsmPC8KegOsHkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-rjDh1BFNNfikRkjb436bSg-1; Wed, 04 Dec 2019 07:16:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C601005502;
 Wed,  4 Dec 2019 12:16:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33531001901;
 Wed,  4 Dec 2019 12:16:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18DB51138606; Wed,  4 Dec 2019 13:16:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Han Han <hhan@redhat.com>
Subject: Re: [PATCH] Revert "qemu-options.hx: Update for reboot-timeout
 parameter"
References: <20191204085628.2892-1-hhan@redhat.com>
Date: Wed, 04 Dec 2019 13:16:08 +0100
In-Reply-To: <20191204085628.2892-1-hhan@redhat.com> (Han Han's message of
 "Wed, 4 Dec 2019 16:56:28 +0800")
Message-ID: <87immwb81j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rjDh1BFNNfikRkjb436bSg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Han Han <hhan@redhat.com> writes:

> This reverts commit bbd9e6985ff342cbe15b9cb7eb30e842796fbbe8.
>
> In 20a1922032 we allowed reboot-timeout=3D-1 again, so update the doc
> accordingly.
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 65c9473b73..e14d88e9b2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -327,8 +327,8 @@ format(true color). The resolution should be supporte=
d by the SVGA mode, so
>  the recommended is 320x240, 640x480, 800x640.
> =20
>  A timeout could be passed to bios, guest will pause for @var{rb_timeout}=
 ms
> -when boot failed, then reboot. If @option{reboot-timeout} is not set,
> -guest will not reboot by default. Currently Seabios for X86
> +when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will n=
ot
> +reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
>  system support it.
> =20
>  Do strict boot via @option{strict=3Don} as far as firmware/BIOS

Reviewed-by: Markus Armbruster <armbru@redhat.com>


