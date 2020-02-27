Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812D1724E7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 18:22:18 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7MrZ-0006gC-7w
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 12:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1j7MqP-0006DK-HQ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1j7MqO-00034Z-BW
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:21:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55673
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1j7MqO-00034M-7s
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582824063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdN3AvOhB+FIzP3gS/TTrkLzy8xyMjxRY4c9+3VUrUM=;
 b=AkJVuURuF8o2QwrB/s1LiECbd23pmcnph0KtakkmzggiNpY2IL0dVjeR+O55/24hIhQy6Z
 R3pcH+r9wsbwadlr0rHaTxfemGKGn6IvbwcuMKeRC+DPAMFWvpBYjHnWKMNie1OCYvMFwa
 K0IV+52TMtrdQBkseV3lEEn3xMrOwzQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Fu1S-KWqOyK2J1jeA5Jc4A-1; Thu, 27 Feb 2020 12:21:02 -0500
X-MC-Unique: Fu1S-KWqOyK2J1jeA5Jc4A-1
Received: by mail-ot1-f70.google.com with SMTP id m18so73478otp.20
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 09:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RdN3AvOhB+FIzP3gS/TTrkLzy8xyMjxRY4c9+3VUrUM=;
 b=YUd6RztgscMMS4gOjJsGSsK7zZw8nwXt81cWlbV8RTZcRXlGpvhqf7piW83t5FSLTN
 eM+G+/UI1rM46dZiyqFc5ZGeNjjulDp2EXvQcJRxxV51FeNziwEG+/TMtuRkykdfGiPZ
 z6t0BxtOdHBtqOV4jSJ1LBC05sLA7zpRyE31DMA1Bfx4iFzdBDhQEOzm+eN04zOLIEXT
 Y6CYmnnijeSZSlkrr6n6xvRBGtc1NE/p036pl2bHd2WvSDCsjdy08uzIUNUDyOJscPyo
 DHQNA2VikCz4uyEPQ53I8ZjyN9/5qQtnGgEHNPbXR9L0RA/VZBWbf2xoJP58nMOIBgWr
 x76A==
X-Gm-Message-State: APjAAAXJMoSdHQuf9DFU5u/kLP3ZQsS2XKfwc1WOu+qH9IxguQ6wPFMq
 cMX8R6pmTOVYfPfPke8E/X2DJhsD/ViN+2jXm+fTsaw/sDojgZqtvZ6h76Z/63Jq1yM0+UnlOzs
 QVNa6YAiU8VRsXrohIVD+0apVyVrEJ2g=
X-Received: by 2002:a05:6830:50:: with SMTP id
 d16mr677870otp.166.1582824061425; 
 Thu, 27 Feb 2020 09:21:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbxyDVZ3fqSeSIdeHVErdLCFufqxsJHUmPwQodYmw1ZdziHXAbHSGf2lQB0xSzdatN8v9fKN8yqT12dlIalMw=
X-Received: by 2002:a05:6830:50:: with SMTP id
 d16mr677855otp.166.1582824061178; 
 Thu, 27 Feb 2020 09:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20200227163101.414-1-philmd@redhat.com>
 <20200227163101.414-7-philmd@redhat.com>
In-Reply-To: <20200227163101.414-7-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 27 Feb 2020 18:20:50 +0100
Message-ID: <CAMxuvaxi=aYxapo1K4XtO_Xoc==+b+j9w0PeotkN=neqcqdYzg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] qga: Improve error report by calling
 error_setg_win32()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Feb 27, 2020 at 5:32 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Use error_setg_win32() which adds a hint similar to strerror(errno)).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qga/channel-win32.c  | 3 ++-
>  qga/commands-win32.c | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/qga/channel-win32.c b/qga/channel-win32.c
> index 774205e017..4f04868a76 100644
> --- a/qga/channel-win32.c
> +++ b/qga/channel-win32.c
> @@ -308,7 +308,8 @@ static gboolean ga_channel_open(GAChannel *c, GAChann=
elMethod method,
>      }
>
>      if (method =3D=3D GA_CHANNEL_ISA_SERIAL && !SetCommTimeouts(c->handl=
e,&comTimeOut)) {
> -        g_critical("error setting timeout for com port: %lu",GetLastErro=
r());
> +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError())=
;
> +        g_critical("error setting timeout for com port: %s", emsg);
>          CloseHandle(c->handle);
>          return false;
>      }
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 2461fd19bf..8e1f32ea23 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -315,8 +315,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mo=
de, Error **errp)
>      }
>
>      if (!ExitWindowsEx(shutdown_flag, SHTDN_REASON_FLAG_PLANNED)) {
> -        slog("guest-shutdown failed: %lu", GetLastError());
> -        error_setg(errp, QERR_UNDEFINED_ERROR);
> +        error_setg_win32(errp, GetLastError(), "guest-shutdown failed");

did you drop the slog() intentionally?

>      }
>  }
>
> @@ -1319,7 +1318,8 @@ static DWORD WINAPI do_suspend(LPVOID opaque)
>      DWORD ret =3D 0;
>
>      if (!SetSuspendState(*mode =3D=3D GUEST_SUSPEND_MODE_DISK, TRUE, TRU=
E)) {
> -        slog("failed to suspend guest, %lu", GetLastError());
> +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError())=
;
> +        slog("failed to suspend guest: %s", emsg);
>          ret =3D -1;
>      }
>      g_free(mode);
> --
> 2.21.1
>


