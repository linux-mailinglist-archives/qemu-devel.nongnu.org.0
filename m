Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7F187054
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:45:08 +0100 (CET)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDsrT-00011o-NN
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDrLs-00072K-BD
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDrLr-0005pL-7D
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:08:24 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jDrLq-0005gi-W4
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:08:23 -0400
Received: by mail-wm1-x342.google.com with SMTP id m3so18476201wmi.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3e/Xoh9EDjv9hW7MmFhIRubIX69+Vu6eMQn29T9QEZE=;
 b=knrpJMnAvUf0pvcvgn1SsVjSB1nWDklUV+E8cYt0f6fCda6UapAhD2Or8Co1D5mNQu
 NacvLG9P+JSNVZqMLWAzWLKzW96fERRTmCxscIQMOFKrMvtn+jnfhxCAQYs8yZZVb48x
 B1fNs4+EU/lpoho9Cnq/vf2MMrjE38ec907qmLLwbZIPXK38JIZS5X6Sr1gEW8yJevbM
 bXal53GkxAzTvrK0WtweOXGDlscnMJMXHOKULfsPFs8cAiFPrgFenRdPxozE7x00zOCN
 d8L1dbTVfE+fZ9OlGdHcLGd2E/ZeWdasJwEDDHILaFkp/wxc8dm/TOvLit5aShJU9TrL
 DvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3e/Xoh9EDjv9hW7MmFhIRubIX69+Vu6eMQn29T9QEZE=;
 b=CeGTDOs0vxzNWWVDX7ZVXl/hu90JINisJcpQ0SwlAeo952zUhIfbgjxg6T1zuqGIBH
 +1sTa9rugpjDDs2exiKIVGOSDyBanMFSrpeCLRiwSnI7CbrZvZnI5pgEH29/wCSgZhZq
 hhJSwl5eHKCJ9rteVhX3ZUzBwamTuCU/Nt+OmIg5bNws3b9pWEljjdNJjLOgGU3hvBSf
 uuhHSa/1kksvG3uldAjj3TCz3r1v49C+5djszGc2EVvmb2+rSN4fqxV64j9pnbohDhjU
 MrUZQA8bVXbEgvj28W+Rl+h2gPfYCoq0kDeBGNeeTuANuZNB8t43aFk3YiOuWOmlhvDQ
 BDmg==
X-Gm-Message-State: ANhLgQ3rlghQCWNIAhJ7lnc59rXqyZSrMGXj3vyR2vAjeymxMj02z+Va
 0YWDqqsI+dQI7YqGuflOaw+IksE02xwMkL4FnHI=
X-Google-Smtp-Source: ADFU+vtn/iLbe+jZHQCtQRnvMVG0lJrHQMtg+adpbux5xQ4hX4gwc+KQqBo78WKrxOOCzF9rKIT4ilbsw82REKDqfh8=
X-Received: by 2002:a7b:c153:: with SMTP id z19mr27098572wmi.37.1584371300895; 
 Mon, 16 Mar 2020 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-7-armbru@redhat.com>
In-Reply-To: <20200315144653.22660-7-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 16 Mar 2020 16:08:08 +0100
Message-ID: <CAJ+F1CK7bAFLqyuh3tJ_5A47pvvFLMuB8JyWaqY-FsT9jkvyOA@mail.gmail.com>
Subject: Re: [PATCH v3 06/34] tests/test-qmp-cmds: Check responses more
 thoroughly
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 15, 2020 at 3:51 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/test-qmp-cmds.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
> index b31064b064..464b370189 100644
> --- a/tests/test-qmp-cmds.c
> +++ b/tests/test-qmp-cmds.c
> @@ -151,9 +151,10 @@ static QObject *do_qmp_dispatch(QDict *req, bool all=
ow_oob)
>      QObject *ret;
>
>      resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
> -    g_assert(resp && !qdict_haskey(resp, "error"));
> +    g_assert(resp);
>      ret =3D qdict_get(resp, "return");
>      g_assert(ret);
> +    g_assert(qdict_size(resp) =3D=3D 1);
>
>      qobject_ref(ret);
>      qobject_unref(resp);
> @@ -163,9 +164,17 @@ static QObject *do_qmp_dispatch(QDict *req, bool all=
ow_oob)
>  static void do_qmp_dispatch_error(QDict *req, bool allow_oob, ErrorClass=
 cls)
>  {
>      QDict *resp;
> +    QDict *error;
>
>      resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
> -    g_assert(resp && qdict_haskey(resp, "error"));
> +    g_assert(resp);
> +    error =3D qdict_get_qdict(resp, "error");
> +    g_assert(error);
> +    g_assert_cmpstr(qdict_get_try_str(error, "class"),
> +                    =3D=3D, QapiErrorClass_str(cls));
> +    g_assert(qdict_get_try_str(error, "desc"));
> +    g_assert(qdict_size(error) =3D=3D 2);
> +    g_assert(qdict_size(resp) =3D=3D 1);
>
>      qobject_unref(resp);
>  }
> @@ -174,11 +183,12 @@ static void do_qmp_dispatch_error(QDict *req, bool =
allow_oob, ErrorClass cls)
>  static void test_dispatch_cmd(void)
>  {
>      QDict *req =3D qdict_new();
> -    QObject *ret;
> +    QDict *ret;
>
>      qdict_put_str(req, "execute", "user_def_cmd");
>
> -    ret =3D do_qmp_dispatch(req, false);
> +    ret =3D qobject_to(QDict, do_qmp_dispatch(req, false));
> +    assert(ret && qdict_size(ret) =3D=3D 0);
>
>      qobject_unref(ret);
>      qobject_unref(req);
> @@ -187,11 +197,12 @@ static void test_dispatch_cmd(void)
>  static void test_dispatch_cmd_oob(void)
>  {
>      QDict *req =3D qdict_new();
> -    QObject *ret;
> +    QDict *ret;
>
>      qdict_put_str(req, "exec-oob", "test-flags-command");
>
> -    ret =3D do_qmp_dispatch(req, true);
> +    ret =3D qobject_to(QDict, do_qmp_dispatch(req, true));
> +    assert(ret && qdict_size(ret) =3D=3D 0);
>
>      qobject_unref(ret);
>      qobject_unref(req);
> --
> 2.21.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

