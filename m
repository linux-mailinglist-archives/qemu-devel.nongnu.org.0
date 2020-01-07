Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1056132081
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 08:32:55 +0100 (CET)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iojMD-0008Kz-GP
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 02:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iojC1-0000JZ-Cg
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:22:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iojC0-0003B2-6j
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:22:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41457
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iojC0-0003Aq-2d
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578381739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xfx3H205kEuRvuPavrxF6bGolHmxlMbcsZkjs0aavWk=;
 b=F8FyCJUtiMtYJqlVV45/9kvvScPR0XyHsz4g1cMDiv6u82xwQpI9L4L0xvOjVO5qX8ag2w
 LC/BhnMjN2ScFOsVoc/5b+FddZkry5xyZfEqv6zTFoKLZ2rqvbrK31JRvM09kXjSvi0g/r
 mI7sve4WSXwzkjPPxGDHT2rBjYdBY34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-DgnLkY8HMVC5g-hriCki6g-1; Tue, 07 Jan 2020 02:22:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D98A1005513;
 Tue,  7 Jan 2020 07:22:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE6EE858B0;
 Tue,  7 Jan 2020 07:22:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED3159DA3; Tue,  7 Jan 2020 08:22:13 +0100 (CET)
Date: Tue, 7 Jan 2020 08:22:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/6] audio/audio: Add missing fall through comment
Message-ID: <20200107072213.beiz4vter3snprqt@sirius.home.kraxel.org>
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: DgnLkY8HMVC5g-hriCki6g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/audio/audio.c b/audio/audio.c
> index 56fae55047..57daf3f620 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_info *info=
, struct audsettings *as)
>      switch (as->fmt) {
>      case AUDIO_FORMAT_S8:
>          sign =3D 1;
> +        /* fall through */
>      case AUDIO_FORMAT_U8:

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


