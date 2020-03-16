Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761918701E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:35:49 +0100 (CET)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDsiM-0001Ig-MS
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDr5L-00007w-Aa
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDr5K-00085O-9E
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:51:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jDr5K-0007tp-1Q
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:51:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id a25so21606977wrd.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EBA2kBnuWIbZxYq1IozPBlavq7ho+4yFZxgtcTzlqMM=;
 b=m5Z8fGavUhGGyLfX0PzBZDYHeEfUf5hzVkFzioL5oE8Js7fNG7xg1HAM64OeYx6Xlu
 avw9mCH6HZPOQWoVtlV+S3rFIZ2LvmkhxJ2k6a7wtP3XquLnMnz1g4zrPlnheJX4waGG
 m5Q0IrBEwkn6NTC/+Io8A81VvOEStNFjFKqzVa5BpLLLGHrHTKA6zeVeA+0thSe1td+I
 imhaPfZgxkXVNGZ22hhEFmGjWrY/kSF1O2DGd87KxyeTWjoCF21dsb3LjCr3RiU7gFUC
 zCUIqWZwCK3rQJd2fQtF9728wJCKRAdZgpfKaU8a27HoqNl6rc9l3adsLakfd7KTx6kG
 xIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EBA2kBnuWIbZxYq1IozPBlavq7ho+4yFZxgtcTzlqMM=;
 b=dnxnn4+RinMuYTISUx4EpEMQmif6Nlxl5DKtBD0B89evgLmKE3ywAzEVK+SFgWByiz
 +T8Z68+kwDcYh6wpThoCwaQccvtG55qjmfniRtw3MwzPIucVyq8fM6q46yrw6kdDcLLK
 GMa4B91Vv1eGfWMWA/AEZq26e5srdDW3DXWdvEV75476QPaHxFT8kSQjuWk2JiZmqXLJ
 iTT8Id7GsqrndQnVnpts0h6d/GmFbD2oaXtU0SlTmqUphaOmOu1hhrPW0cGgCPriPjy2
 KGoYlCx5Xd9jgh6rFzrftdztXhO167W5+rju4lNsUMT7xtpbyEPIGSU/Zg341M2Rz8LG
 wNBQ==
X-Gm-Message-State: ANhLgQ1O3iKrVEFmSMJQsCoftpkfnC0Pe7sBIl+RRl+qWQ9CyN14wCZN
 7lYjRsWBeqU+Kn/KZ/64HSKfrLk2w7PE0R0rPvM=
X-Google-Smtp-Source: ADFU+vsmPUmAFZNXCupcgzplpXJcX1MCYgHXmUmwVhROtqxZjkAav4Td7dQ6QNhwwaYVJX6UjAV6aweJM/iCTJviI3E=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr35908613wrj.196.1584370275751; 
 Mon, 16 Mar 2020 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-3-armbru@redhat.com>
In-Reply-To: <20200315144653.22660-3-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 16 Mar 2020 15:51:03 +0100
Message-ID: <CAJ+F1CJ_wUSvv4ZmybaeQxJnUe3RyFHgTnLo=EzYzOJqVq6emA@mail.gmail.com>
Subject: Re: [PATCH v3 02/34] qapi: Belatedly update doc comment for @wait
 deprecation
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

Hi

On Sun, Mar 15, 2020 at 3:48 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Commit a9b305ba29 "socket: allow wait=3Dfalse for client socket"
> deprecated use of @wait for client socket chardevs, but neglected to
> update char.json's doc comment.  Make up for that.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qapi/char.json | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qapi/char.json b/qapi/char.json
> index 6907b2bfdb..daceb20f84 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -258,6 +258,7 @@
>  # @server: create server socket (default: true)
>  # @wait: wait for incoming connection on server
>  #        sockets (default: false).
> +#        Silently ignored with server: false.  This use is deprecated.
>  # @nodelay: set TCP_NODELAY socket option (default: false)
>  # @telnet: enable telnet protocol on server
>  #          sockets (default: false)
> --
> 2.21.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

