Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B22136A1A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:43:38 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqpN-0000GJ-4E
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ipqo4-000890-LI
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:42:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ipqo3-0008P1-NQ
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:42:16 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45871)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ipqo0-00089x-Bj; Fri, 10 Jan 2020 04:42:12 -0500
Received: by mail-wr1-x444.google.com with SMTP id j42so1101413wrj.12;
 Fri, 10 Jan 2020 01:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8dqO2ueHj7gIKIyWyu1BBEDjKzHtdvHlP1LJUdwu2HE=;
 b=P7Fvn1XGTB/A3yaZY22gHasoTZPt6xhhsQdjchKZFFtrYsr847sfz/Chvn9TlYpp5S
 4vSivyS4L+YtJLF/PSONEn+TVeyBIEu1fiI1rSIZWDpzPjzSBkRYM9RzWwdn0FjfYfUv
 ugT+oTFm4amHIjmqWJE1TEbFy6vbZPeMF7VwkqqayP1su6SJteekXv5GX1UyV+WNN31Y
 MVK2MD5MmWpUvLXAoCebecjxCQombS/p3PekDnfce6ynEvEana3M0nxKULjW6Lj0c4v0
 ePZOxkVtP4Y5ssnDikNVeAkwmxex1sJrNgFXVI2JoTbAsfaCzR1hQk+J5mw9briqlDBM
 KFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8dqO2ueHj7gIKIyWyu1BBEDjKzHtdvHlP1LJUdwu2HE=;
 b=XDk8+sdh3ckZdMKqyhLCfT2c4fkV20J9+ZN0WucI1eq/1tb86ZnQD7UIDb3nKLZH7/
 VYhXxiwUCEu0LVwNrDhYSnh3xHTDXNkUH7QGs3JyP9cGF8CMnv/sIkDovA1k197liWwQ
 WEABje52DSDlSoXNcDGbPbZbTSjTvn/Rj5TX8jaF3EGRdG3ECcfPvHTb7I/d7s9LnGWs
 ZQOMkScbbr5bVcWc2jpQkQkIVTB/h/9zt6aoacuZKm3WDwju7fulWjo5T4dp0AWo80Nc
 EiJwYurk3jaZvrq0vx4Garuc6BXTgEZgTaNdQJ8nxZDbeyBUXgGJ0QH759xbtXHwNdOd
 a38g==
X-Gm-Message-State: APjAAAVM9zhm325V1+37EkwZDQpU+bE/TVjrTCW54mQ0a/UZQXPYAGcy
 0eVs4XGzm4H3b3QXBdEox/5dWfHTdhQtBlvPRv8=
X-Google-Smtp-Source: APXvYqyEXPaHRzt10u2yvHTvFczu74JAiA4FG/kAdDZKMw8/kosQ2XuzHKMDJZTxvpQhO58mxnr3T21LLDD/AIkr/yU=
X-Received: by 2002:adf:f10a:: with SMTP id r10mr2483033wro.202.1578649331183; 
 Fri, 10 Jan 2020 01:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20200110091710.53424-1-pannengyuan@huawei.com>
 <20200110091710.53424-3-pannengyuan@huawei.com>
In-Reply-To: <20200110091710.53424-3-pannengyuan@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 10 Jan 2020 13:41:58 +0400
Message-ID: <CAJ+F1CKTDYa50ss4ckd-mHxyuHmc=sF3CmuOFq2ABkzPtSCkrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] qga/main: Don't mismatch g_strsplit/g_free in
 split_list()
To: pannengyuan@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 10, 2020 at 1:18 PM <pannengyuan@huawei.com> wrote:
>
> From: Pan Nengyuan <pannengyuan@huawei.com>
>
> fix a mismatch between g_strsplit and g_free
>
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

NACK, the elements are added to the returned list.

> ---
> Changes v2 to v1:
> - fix a mismatch in qga/main.c
> ---
>  qga/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index c35c2a2120..a72ae074f4 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -933,7 +933,7 @@ static GList *split_list(const gchar *str, const gcha=
r *delim)
>      for (i =3D 0; strv[i]; i++) {
>          list =3D g_list_prepend(list, strv[i]);
>      }
> -    g_free(strv);
> +    g_strfreev(strv);
>
>      return list;
>  }
> --
> 2.21.0.windows.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

