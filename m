Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E11023A9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:55:05 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX264-0005UO-Tf
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX24k-0004XT-Rm
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX24i-0002Mg-S9
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:53:42 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iX24i-0002Lv-M2; Tue, 19 Nov 2019 06:53:40 -0500
Received: by mail-wm1-x343.google.com with SMTP id z19so3225147wmk.3;
 Tue, 19 Nov 2019 03:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p7tcEpK4hUoxrrEVa2Gcy6h+d/xNF7rwJwObuWfndic=;
 b=DBepyiI669hUavnanLtPEQvurAUoqvmF6HRuFIIWxG3t1x+PVNHQV6UYz7yTaO5R88
 UFDB1HBxcXGJ/heMVhGXFwTG0oRaLzfYehgKG48zscsyTUgm39EyYby43SuPbxE2p9RS
 Ekjev2+493orgli52bdPwBH3a14/sYCTu7RROPUw61FmnN/2zVrEl69n8L+DRfNsxV/h
 BlNsLqIlfZuKZJ02ylcVY5q6TEvACsk5TXGGxmIsgmzxnhPtQleHnmYnnqQvgO4fVF1s
 c91j22u+Azxej1ismzDbp2pPWuQ/iiMznhSx8eeKzuvtwpmDN2HVmZ44TLxzGZqQNvb1
 nPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p7tcEpK4hUoxrrEVa2Gcy6h+d/xNF7rwJwObuWfndic=;
 b=m7srMgCWPgjQTEEFBWfDFwxNZVkMs914khu67/ltkUqTWzjnPiaezGeTYKvscT9S6c
 d9mP1pkyN9DOanDjQZKAIQyPZfEiCybwhvjRCzlIF+bShRyYsNIDaCRzpVXSsLBqeib8
 92mpLttMQQUQmEFVc7PmiPlSmXclgxpj3AO4wNmaSuA7FOeGWlyo6lm7TIa1jLMEr84D
 xFh6qkFK71Jcwr/BHBbPKb4EApR+3NA0DTe1sowPyKk8wLPl9yL6atQNFG0Pjp+ujnt6
 Mtg5h4VLvZn7DR2c56khBiZ9uPNyLJDbgYiPy8+ftP/ej0IiiNWqHocfAzCqKZNO9BZH
 PV1A==
X-Gm-Message-State: APjAAAWQO7zXebzGGGBVqK+NnQs9C9iOGBYsLu6Agg84Z94qnbjNY0hT
 LdkWnDdkmckHFu0Fy4ZMflNkydVFQP7IN+KWB6JOoQ==
X-Google-Smtp-Source: APXvYqyNfkkmNkLwXkNKKj+4e5aFDv2GvRQHw0XdlPcGEsHQpq3yQ0dYrgZm9lZxrDjY0HDbC8d5QiHXTd6FOKO6fyQ=
X-Received: by 2002:a05:600c:489:: with SMTP id
 d9mr4991227wme.20.1574164418844; 
 Tue, 19 Nov 2019 03:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
In-Reply-To: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Nov 2019 15:53:25 +0400
Message-ID: <CAJ+F1CJsPFOYuMcTE8jffcBQ2QAm+xT=cO-dKcjWPKyS-crcZQ@mail.gmail.com>
Subject: Re: [PATCH] monitor: Remove unused define
To: Yury Kotov <yury-kotov@yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: qemu trival <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 19, 2019 at 3:07 PM Yury Kotov <yury-kotov@yandex-team.ru> wrot=
e:
>
> Remove the definition of QMP_ACCEPT_UNKNOWNS as it is unused since
> refactoring 5c678ee8d940
>
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  monitor/misc.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3baa15f3bf..6680734ea1 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -106,9 +106,6 @@ struct MonFdset {
>      QLIST_ENTRY(MonFdset) next;
>  };
>
> -/* QMP checker flags */
> -#define QMP_ACCEPT_UNKNOWNS 1
> -
>  /* Protects mon_fdsets */
>  static QemuMutex mon_fdsets_lock;
>  static QLIST_HEAD(, MonFdset) mon_fdsets;
> --
> 2.24.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

