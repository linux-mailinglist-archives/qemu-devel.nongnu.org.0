Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A01C19F9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 17:46:49 +0200 (CEST)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUXsG-0001Vi-DI
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 11:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jUXqT-0008TL-VL
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jUXqR-00057a-LU
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:44:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jUXqR-00055L-6o
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588347893;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlLHhibFWjNPeMAjIwMVVIguL6gIhnu7WGu2lsB/8Y4=;
 b=BfUb4Lt82m4TrZVkfc5OrAqAr1+FzGNw8fAEv6GxYDuQ0SO1HEdlfLuG/a/uVUsrhRRzGH
 oX624Fuh420mtd25ikvnXowfnd9EuijYfWk9qiejCYwv8du00EW/zVZGNofWVsMAW8Jomp
 1HGEOCPAzf+Vu7l38kvOb8oLRkzPIlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-ORG993mvPuuaomtFVxnX9g-1; Fri, 01 May 2020 11:44:51 -0400
X-MC-Unique: ORG993mvPuuaomtFVxnX9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FAC81005510;
 Fri,  1 May 2020 15:44:50 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2CB5D714;
 Fri,  1 May 2020 15:44:48 +0000 (UTC)
Date: Fri, 1 May 2020 16:44:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 1/1] Fix win32 keycode for VK_OEM_102
Message-ID: <20200501154445.GC3356@redhat.com>
References: <1862f332-a40e-2416-5ab4-37d885f87337@t-online.de>
 <20200429184250.8238-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20200429184250.8238-1-vr_qemu@t-online.de>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 08:22:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 29, 2020 at 08:42:50PM +0200, Volker R=C3=BCmelin wrote:
> The win32 keycode for VK_OEM_102 is 0xe2. The Microsoft docu-
> mentation for virtual-key codes agrees with mingw32/winuser.h.

Yes, I concur. I must have made a typo when entering this.

>=20
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  data/keymaps.csv | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

and queued for merge

>=20
> diff --git a/data/keymaps.csv b/data/keymaps.csv
> index bc2376c..8111047 100644
> --- a/data/keymaps.csv
> +++ b/data/keymaps.csv
> @@ -145,7 +145,7 @@ KEY_KPDOT,83,ANSI_KeypadDecimal,0x41,0x53,0x71,0x71,9=
9,VK_DECIMAL,0x6e,83,83,XK_
>  KEY_KPDOT,83,ANSI_KeypadDecimal,0x41,0x53,0x71,0x71,99,VK_DECIMAL,0x6e,8=
3,83,XK_KP_Decimal,0xffae,NumpadDecimal,KPDC,kp_decimal,0x32,0x41
>  ,84,,,0x54,,,,,,,,,,,,,,
>  KEY_ZENKAKUHANKAKU,85,,,0x76,0x5f,,148,,,,,,,Lang5,HZTG,,,
> -KEY_102ND,86,,,0x56,0x61,0x13,100,VK_OEM_102,0xe1,86,86,,,IntlBackslash,=
LSGT,less,0x7c,
> +KEY_102ND,86,,,0x56,0x61,0x13,100,VK_OEM_102,0xe2,86,86,,,IntlBackslash,=
LSGT,less,0x7c,
>  KEY_F11,87,F11,0x67,0x57,0x78,0x56,68,VK_F11,0x7a,87,87,XK_F11,0xffc8,F1=
1,FK11,f11,0x09,0x67
>  KEY_F12,88,F12,0x6f,0x58,0x07,0x5e,69,VK_F12,0x7b,88,88,XK_F12,0xffc9,F1=
2,FK12,f12,0x0b,0x6f
>  KEY_RO,89,,,0x73,0x51,,135,,,,,,,IntlRo,AB11,ro,,
> --=20
> 2.16.4
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


