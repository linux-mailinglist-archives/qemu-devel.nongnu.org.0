Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47924616ECA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 21:31:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqKNg-0004Mk-Ul; Wed, 02 Nov 2022 16:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oqKNZ-0004Kt-7F
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 16:30:29 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oqKNX-0002Ca-Ib
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 16:30:28 -0400
Received: by mail-vs1-xe32.google.com with SMTP id 3so18476372vsh.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4MCVZn/zkh4Wm2gJGegwBeqTUDX6QRdGJAZBtU9ciuQ=;
 b=kfj1Um2aDl2v0LE4oBpSMwM4+AkF0GqtVZrBNQG0Z+hDT7atWOGLX062XsHA5bYmiI
 Y4NT8pBwSo2PFizwx+vsu/2noWsACWcih7vpXAFwUUwsZaQCsC4CXpBUnp2DLbACk6vD
 cXfn2kfx5fyRXwFpahHHzXimuR3eqVZXOHvpVVxrReMKCQYBuEt4TgAze0lgSOhVYToK
 YMVuuECNrmz/ccq3xb+RhP4GJIlpauB9vpzHAQLYbG3Uto9cizxxluwGfarG57B+/ACI
 D6dGeKjPr8vah0PsF/PbfVUGNat+Du0Uk8yEaeUDiH5XUMPfCUBBGJrpayI9/TZGKWAN
 qzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MCVZn/zkh4Wm2gJGegwBeqTUDX6QRdGJAZBtU9ciuQ=;
 b=UEyjpa/4fD3S43yLDkaDNFW3ge2j2s/kK7ZJ7IihiOGJ5naevDtSobtN6gxvRgtMLM
 aeXGaNEXOVtfRzw6ZWuo9uF1OEEK0ZHRh8ygz37GWcopfyMgDhaKeuHzL2HFOkKC/FpO
 /pqjlNk4BQ62qVUZmiq3GV7h6TBEZIhk7sFcb/cnSXXt9AjbhL1TleOGguDQ5qfnfHvK
 00cYYTGiOXfEWYNBAP5Aow3ZbGGU38cXi6WsI1hgOwKOkSkZFP3Zg3txWQp6bRfz0PIl
 nBkUyIY58Sf0JriZXDTGIM1mTlOuMsCty+fbZr7MYdtLk6ZnBMaH7pGI0PIPtsI6Z+k9
 VlLA==
X-Gm-Message-State: ACrzQf0sZzDdqGbDiFwDF5TNlIhzD6MlHE25DUZJHFjkmRhry4ouRNWs
 1DkdJ8qdzFI72AgWlmKTujqCr8/LWARw9w8xiSYWTT0pKAQ=
X-Google-Smtp-Source: AMsMyM7W5Thoi4dSscvZtuEgzi972FV6WHrKeEHcVruwMMmYZnVyFIDmpQ9RzNOUntxCNqtUXPJVXiFkCjzxTK+BYEU=
X-Received: by 2002:a67:ec49:0:b0:3aa:6996:4b8b with SMTP id
 z9-20020a67ec49000000b003aa69964b8bmr13929290vso.64.1667421025397; Wed, 02
 Nov 2022 13:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221023090422.242617-1-nivanov@cloudlinux.com>
In-Reply-To: <20221023090422.242617-1-nivanov@cloudlinux.com>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 2 Nov 2022 23:30:14 +0300
Message-ID: <CAAJ4Ao-aa+Gnf_=8THxC4_6cayJJ8QM50bH1MXuM5t+x3CPLYg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Refactoring: expand usage of TFR() macro
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e90cae05ec82b559"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=nivanov@cloudlinux.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e90cae05ec82b559
Content-Type: text/plain; charset="UTF-8"

Hi!
Is there any update on this? I haven't received any comments.

On Sun, Oct 23, 2022 at 12:04 PM Nikita Ivanov <nivanov@cloudlinux.com>
wrote:

> At the moment, TFR() macro has a vague name and is not used
> where it possibly could be. In order to make it more transparent
> and useful, it was decided to refactor it to make it closer to
> the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro
> evaluates into an expression and is named RETRY_ON_EINTR(). All the
> places where RETRY_ON_EINTR() macro code be applied were covered.
>
> Nikita Ivanov (2):
>   Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
>   error handling: Use RETRY_ON_EINTR() macro where applicable
>
>  block/file-posix.c        | 37 ++++++++++++++++---------------------
>  chardev/char-fd.c         |  2 +-
>  chardev/char-pipe.c       |  8 +++++---
>  chardev/char-pty.c        |  4 +---
>  hw/9pfs/9p-local.c        |  8 ++------
>  include/qemu/osdep.h      |  8 +++++++-
>  net/l2tpv3.c              | 17 +++++------------
>  net/socket.c              | 16 +++++++---------
>  net/tap-bsd.c             |  6 +++---
>  net/tap-linux.c           |  2 +-
>  net/tap-solaris.c         |  8 ++++----
>  net/tap.c                 | 10 +++-------
>  os-posix.c                |  2 +-
>  qga/commands-posix.c      |  4 +---
>  semihosting/syscalls.c    |  4 +---
>  tests/qtest/libqtest.c    | 14 ++++++--------
>  tests/vhost-user-bridge.c |  4 +---
>  util/main-loop.c          |  4 +---
>  util/osdep.c              |  4 +---
>  util/vfio-helpers.c       | 12 ++++++------
>  20 files changed, 73 insertions(+), 101 deletions(-)
>
> --
> 2.37.3
>
>

-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--000000000000e90cae05ec82b559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br>Is there any update on this? I haven&#39;t received=
 any comments.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 23, 2022 at 12:04 PM Nikita Ivanov &lt;<a href=
=3D"mailto:nivanov@cloudlinux.com">nivanov@cloudlinux.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">At the moment, TFR=
() macro has a vague name and is not used<br>
where it possibly could be. In order to make it more transparent<br>
and useful, it was decided to refactor it to make it closer to<br>
the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro<br>
evaluates into an expression and is named RETRY_ON_EINTR(). All the<br>
places where RETRY_ON_EINTR() macro code be applied were covered.<br>
<br>
Nikita Ivanov (2):<br>
=C2=A0 Refactoring: refactor TFR() macro to RETRY_ON_EINTR()<br>
=C2=A0 error handling: Use RETRY_ON_EINTR() macro where applicable<br>
<br>
=C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++++++++++--=
-------------------<br>
=C2=A0chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0chardev/char-pipe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++---<br>
=C2=A0chardev/char-pty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
=C2=A0hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++------<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++-<br>
=C2=A0net/l2tpv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++=
++------------<br>
=C2=A0net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++=
++++---------<br>
=C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
6 +++---<br>
=C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----=
<br>
=C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 10 +++-------<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
=C2=A0semihosting/syscalls.c=C2=A0 =C2=A0 |=C2=A0 4 +---<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 | 14 ++++++--------<br>
=C2=A0tests/vhost-user-bridge.c |=C2=A0 4 +---<br>
=C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 +---<br>
=C2=A0util/vfio-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++------<br>
=C2=A020 files changed, 73 insertions(+), 101 deletions(-)<br>
<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--000000000000e90cae05ec82b559--

