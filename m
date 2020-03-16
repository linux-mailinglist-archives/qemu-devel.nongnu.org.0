Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32E1872BA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:51:12 +0100 (CET)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDupT-0007Lp-76
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDtcC-0002n2-IX
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:33:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDtcB-0001el-9j
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:33:24 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jDtcB-0001UI-0S
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:33:23 -0400
Received: by mail-wr1-x441.google.com with SMTP id t2so12251270wrx.12
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 10:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6cJb6Luk4ML8CBF5q+P44f9KLf8qXp+OI4lIie4NGpI=;
 b=sEU0vjj/X54gVIO+y6gWM+bBuacNDrwxo16aeO/L33fBfoANLwx4J47jhCV9DJsGVw
 j7vSNhhqu4Ea631QDhkFt5h+FIXzTJlzRJo6yuXZ+8cBhYfpKZMhLbmap4cUTghZNN+G
 PpIFbft8eYuZwxNAQgPXvZKo8FwIxQDtDG/G1+DHrOZuZSdDuNjYVVmaZMxk9LpPcoOo
 XuVQXSPBVM5aS2IHEL61x7hP1mu7t5ODc93AwGzup4xdmskFj86xI8EiIZhxZvHt4dp+
 3w592CLtk1NRBB2EX+gKw8yBspA0Ge1Kv+J0MeAgJjPvvz9Pd1NpZifTsVA/5vNXIcDc
 l1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6cJb6Luk4ML8CBF5q+P44f9KLf8qXp+OI4lIie4NGpI=;
 b=bSSaIGMrM0XXCJ4G+h/XIto+Hw8HuGrlrhy4Ah1KGcPnbwom7vlc/aquFhp2z+Y1SX
 AA3RKb9btjMjtVZSEoMAznhwbWA5E5e1CSzQ4ZkRdxrbhQhtkSx/yOqq1alvZ5A3qJVj
 kSCwgGc2qzMQyQF8weNydMu8TXVtQbg7O0dBV0VqMgv7zERbJ+SMTFBZ6UjDGI50sthd
 qH+21tAY3ItvuOo5yFBQ0S+lxpHzs8ZlKp1yGDXuKM7Gh8kLHtVo0DfU5g7Ji2+Qxlu8
 t2YuyfNJPxDsOpZBPTOpbCTrfuXqYvSwxLJxWd7taPkEpcodwIwVWgERC/WeEM+f7pO6
 5EQA==
X-Gm-Message-State: ANhLgQ3hjnJvKbJNozGZEXfkWOH7KZ5AgciZymF3Iq/j5/dh13SnIRTY
 hP3ImwLVwrYLF4rbdBHCRZkXxFqjjykRUVUYDkPkcPVBylo=
X-Google-Smtp-Source: ADFU+vvfQ1sFBpkM3802gVjLD2RLHHDAr6V6zvxj66lsezuvxMhQEVxa2SxW0bx1vzzXnLhflbNFTDO+wqO4Eg+lWQM=
X-Received: by 2002:a05:6000:4a:: with SMTP id
 k10mr383772wrx.381.1584380002043; 
 Mon, 16 Mar 2020 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-24-armbru@redhat.com>
In-Reply-To: <20200315144653.22660-24-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 16 Mar 2020 18:33:09 +0100
Message-ID: <CAJ+F1CLUikxRN2nH8h_9zGXLLpsxz4H-cMxxLbctAzavWjAcWw@mail.gmail.com>
Subject: Re: [PATCH v3 23/34] qapi: Simplify how qmp_dispatch() gets the
 request ID
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
> We convert the request object to a QDict twice: first in
> qmp_dispatch() to get the request ID, and then again in
> qmp_dispatch_check_obj(), which converts to QDict, then checks and
> returns it.  We can't get the request ID from the latter, because it's
> null when the qdict flunks the checks.
>
> Move getting the request ID into qmp_dispatch_check_obj().
>

I don't see this is a an improvement. qmp_dispatch_check_obj() doesn't
care about id.

And it doesn't look like it is saving cycles either.

Is that worth it?


Code change is ok otherwise,

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/qmp-dispatch.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 550d1fe8d2..112d29a9ab 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -20,7 +20,7 @@
>  #include "qapi/qmp/qbool.h"
>
>  static QDict *qmp_dispatch_check_obj(const QObject *request, bool allow_=
oob,
> -                                     Error **errp)
> +                                     QObject **id, Error **errp)
>  {
>      const char *exec_key =3D NULL;
>      const QDictEntry *ent;
> @@ -30,10 +30,13 @@ static QDict *qmp_dispatch_check_obj(const QObject *r=
equest, bool allow_oob,
>
>      dict =3D qobject_to(QDict, request);
>      if (!dict) {
> +        *id =3D NULL;
>          error_setg(errp, "QMP input must be a JSON object");
>          return NULL;
>      }
>
> +    *id =3D qdict_get(dict, "id");
> +
>      for (ent =3D qdict_first(dict); ent;
>           ent =3D qdict_next(dict, ent)) {
>          arg_name =3D qdict_entry_key(ent);
> @@ -103,12 +106,12 @@ QDict *qmp_dispatch(QmpCommandList *cmds, QObject *=
request,
>      const char *command;
>      QDict *args;
>      QmpCommand *cmd;
> -    QDict *dict =3D qobject_to(QDict, request);
> -    QObject *id =3D dict ? qdict_get(dict, "id") : NULL;
> +    QDict *dict;
> +    QObject *id;
>      QObject *ret =3D NULL;
>      QDict *rsp =3D NULL;
>
> -    dict =3D qmp_dispatch_check_obj(request, allow_oob, &err);
> +    dict =3D qmp_dispatch_check_obj(request, allow_oob, &id, &err);
>      if (!dict) {
>          goto out;
>      }
> --
> 2.21.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

