Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4954C42B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 01:50:49 +0200 (CEST)
Received: from localhost ([::1]:42580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdkLo-0006hO-P9
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 19:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlureau@redhat.com>) id 1hdkJC-000546-JU
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 19:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1hdk9e-0007Ga-IR
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 19:38:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1hdk9c-0007DV-Kn
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 19:38:14 -0400
Received: by mail-ot1-f67.google.com with SMTP id r21so848419otq.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 16:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U+XhKb1ZIzjtzXl8t+1xfp/NAdgXCCEaKm0yhnZ7G0k=;
 b=LgmvQ82dl5iXgGbMwcwaa/xxY5TtexhIgxj+d18OqfWiu5Y2C0F66G1ruPanlxn032
 i0LELqYXEiESA0bddP5nRECYcaSfSX/eRDDXIV6vETs+8cCFBpbAFhtATCplDpDOZdir
 Fvzg6wGxwqwtCQgf3Zkkdd+goGSNEjNzUVK/JPD9GkkoK5U+Hbbs0iaFN8npwjNd0J0O
 /bsBaG6jwNxhsaOibstP31tc1SVY8X+B8WiCsauo6k64eKPH+Llt2px+uitJfuWzNPRL
 oHJERE+slH51Yew85/VlDBaFB0QnMJuwX4Z0bkQfxsawWZ0YdJi/BjuXE5gpgtIaQC8d
 doYA==
X-Gm-Message-State: APjAAAXkSKcHAnLbt2n+dBRuD2h5O2xvcu4/eOS5g+XtKbhOE0kdMlQP
 UdiOLKRjbPnxgEGt8DHnJKzk30v5a/hnyyQ+EE77MA==
X-Google-Smtp-Source: APXvYqytez7ANGqsg17QYw1YK2MQNRq698Tui1g+DJlaspFGsWlWtqenTLHQeRSEUtH5us5JLzZuPAGiwHO+SyCvaK4=
X-Received: by 2002:a9d:460d:: with SMTP id y13mr8153404ote.368.1560987491809; 
 Wed, 19 Jun 2019 16:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-17-armbru@redhat.com>
In-Reply-To: <20190619201050.19040-17-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 20 Jun 2019 01:38:00 +0200
Message-ID: <CAMxuvawuFeQAjCJY6fBrYqYu-mfvsCTWznpDMDA8dJd86EDrvw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.67
Subject: Re: [Qemu-devel] [PATCH 16/17] MAINTAINERS: Add Windows dump to
 section "Dump"
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 19, 2019 at 10:10 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
> Commit 2da91b54fe9 "dump: add Windows dump format to
> dump-guest-memory" neglected to update MAINTAINERS.  Do it now.
>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

argh, I guess I will CC relevant people ;)

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a3fdda015f..327ad80ae4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1850,9 +1850,10 @@ F: include/sysemu/device_tree.h
>  Dump
>  S: Supported
>  M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> -F: dump/dump.c
> +F: dump/
>  F: hw/misc/vmcoreinfo.c
>  F: include/hw/misc/vmcoreinfo.h
> +F: include/qemu/win_dump_defs
>  F: include/sysemu/dump-arch.h
>  F: include/sysemu/dump.h
>  F: qapi/dump.json
> --
> 2.21.0
>

