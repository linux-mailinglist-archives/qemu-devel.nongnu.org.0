Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A503B4BF6E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 19:15:49 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdeBO-0005uh-Nf
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 13:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hddyG-0003bi-Ez
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hddyE-0000Rr-Hf
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:02:04 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hddyA-0000Ot-ML
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:02:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id m3so50915wrv.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=L/9ydQoBbEq9PzFdMqhFejqtTd+jx5K+HY40pNoInkQ=;
 b=idXmpCGgKUlDqM7E/KkJnAOrbec/AKg92vJunZatVWAViweLvmvn23R0D7nYsKdxAx
 PNqcCDT91vD6CnBS371oaHsLuEDcYX9oJ9NlScuAXH54VGL/yoXOYLAwmga63pZ6yEAE
 lIb81tWtzTcHEyk5+8JC1G2aP0vV9E7t8ZzecrY055QEDkGnsd9SecqRx8Z1VG/Tv8+S
 0zdgPGvMYsW5BWS7Ck/aOsOeSZOKJcQoGkNyhPK5VOOsW/44UyzWe7bYSsVsvGs4SM81
 7Ov/1RIAQR/XweEGBFax3uu1UnMH3d/O50q2hu0pULcvULOnlTzQrJzBk9hY4rIpiXs4
 Lhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=L/9ydQoBbEq9PzFdMqhFejqtTd+jx5K+HY40pNoInkQ=;
 b=nuDA1A1FXBGTxNuHAhWvMSwZQdAp1WMPcnOfcGRJvw6B3rMeiyiEv0GnqNrVbTBbQ3
 fpRJRWjSCiWuaq8VScqak0TRo2Eb8r6Lglb13FOR9HJjY0WYt/UKU+4FN6gOB4DddXlf
 Zq5i5cWKsvXtuDb3tAU5/eYH0RbdLwXQ5qTtfBLugLrvvzjXw7/682gwjtXzfDMFrHZy
 9L3NvT3uHEWGuGJeUUO6+nF5dSIfZD0etISfHPXHBhZ6l79sckvkLjJzWP62r196evTf
 Z9w4zQv1y/8JxpngtRuJWJ3sAFeEdGIe1x7pgCap0uvX9uClHuN0BkwxRkrG+Z5GYpQX
 +nhw==
X-Gm-Message-State: APjAAAVfdsfsy6ouQJ8AEHA/KmR7IXkNN3boQhGo0b4+Xvfp3FoScLUT
 gdRmnPLNtY7GFEgnmpCXGhkh8A==
X-Google-Smtp-Source: APXvYqxWj7qSLXUEnQdSwpbzfhokKZvI4R7pXm5qpbVLNOwSpxPgLhQG2dONEtRyPSN1hZ84Oso7+w==
X-Received: by 2002:adf:afe8:: with SMTP id y40mr8263522wrd.328.1560963714261; 
 Wed, 19 Jun 2019 10:01:54 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id h21sm1153579wmb.47.2019.06.19.10.01.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 10:01:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E57B1FF87;
 Wed, 19 Jun 2019 18:01:53 +0100 (BST)
References: <20190619145654.118068-1-ldurfina@tachyum.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: lukas.durfina@gmail.com
In-reply-to: <20190619145654.118068-1-ldurfina@tachyum.com>
Date: Wed, 19 Jun 2019 18:01:53 +0100
Message-ID: <87y31x8q66.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH] gdbstub: print message on startup as
 gdbserver
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


lukas.durfina@gmail.com writes:

> From: Lukas Durfina <ldurfina@tachyum.com>
>
> It helps to test gdb running qemu instead of a gdbserver.
> It prints the same message as the gdbserver on startup.
>
> Signed-off-by: Lukas Durfina <ldurfina@tachyum.com>
> ---
>  gdbstub.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 8618e34311..9ad9929968 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3109,6 +3109,7 @@ int gdbserver_start(int port)
>      gdbserver_fd =3D gdbserver_open(port);
>      if (gdbserver_fd < 0)
>          return -1;
> +    printf("Listening on port %d\n", port);

Not really - we don't arbitrarily output stuff on stdout. In fact the
best way to track what gdbserver is doing is to use the built-in trace
points:

  $QEMU -d trace:gdb\* $QEMU_ARGS

For system emulation from the console you can run:

  (qemu) info chardev

which will report the state of the gdb connection:

  gdb: filename=3Ddisconnected:tcp:0.0.0.0:1234,server

>      /* accept connections */
>      if (!gdb_accept()) {
>          close(gdbserver_fd);


--
Alex Benn=C3=A9e

