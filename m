Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE0341EC7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:52:04 +0100 (CET)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFXn-0006q1-SA
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNFTD-0002sP-H8
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:47:19 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNFTA-000726-QH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:47:19 -0400
Received: by mail-io1-xd2c.google.com with SMTP id x16so6134019iob.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Hx0oewVIdb++1wTuuUit5ZZl9+wRbl7ICpEspNHIgb4=;
 b=smiZdvoDY+4Jx8Z2e8wqKEynmjlEFsO3EuwOMh+XCReNtnoIF5L1fAOAaN+vUiFhAh
 iG9hhbgGYtlfcdHvHXMK4LTf+dBoo46F52uMkjrWQe0fFxv9Y40RLYjcRc3nl5KMTlBg
 slzOqjb15irhY8jIuUNG7TGCa1zMvEQP4eq3elApSHJugfjyzSimpvj93RkqeF9b97RN
 DsuugCiUBqLMLcVo7thm9cxkUDDaRWDBH6EZB3V8TdhNUiQ9+FTSBHOHuD90fbozLGPT
 thprR/FOalh2yMq2ZnjiStnDbsPiN0TiqyWIM1eg62Kb55MWX80jTyJ9LSxxO1AMG48W
 SKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Hx0oewVIdb++1wTuuUit5ZZl9+wRbl7ICpEspNHIgb4=;
 b=BQbAQWALvUdX4Nd5ObQB8mBAfaV2qpuggjU26H6XvnBFveY5OuGCR2w3rBA/rFel9R
 hDjfPL1/2xWiIByA0CdFV+epB+ws4YeS3dvUWdO1/YlvCiYbxQMEX1AJ8d9U0ml3TSAh
 eJYJXmbJYIRj0+Kt6uAQKRsD6qorE9L1BvaSCTn4F/Xr0abb02Ufoig25F+Gge300f8r
 v4dI9n0vjWOqEuAmM9Ohkh4jTr05ofeiox4z5YHVLoywDqDFOvUxV8QxqJmdS+9UvjqN
 ldiH/kRxY/xo+Cx0YQiW1Ja+fF32bb+2mragBbmW8gS/lNJbRVd93WnB2Ece05HbFI2G
 n9BA==
X-Gm-Message-State: AOAM530PVk1eMI4Oye4QzehlJELDCuBMKGlSDjlBuRPvdquB7/vbH1Q4
 JpP6JWdpPPFdCd3oCsHgSBLizxnLRe1UO1XCIjt5ydSVsaA=
X-Google-Smtp-Source: ABdhPJyIwb5dMCWVWeLc0lFkdb4FJ8EpCcY53RfmVqzLiHXaWafz1frBr7yDcPPSuLWgMdI98IXkKYUg9MA2B8ZgyTM=
X-Received: by 2002:a6b:4109:: with SMTP id n9mr2739746ioa.43.1616161633600;
 Fri, 19 Mar 2021 06:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 19 Mar 2021 15:47:03 +0200
Message-ID: <CAD-LL6hpUObLT-sQcDPnLt4m406TBv_SDUYgT346ZDc8eWsSig@mail.gmail.com>
Subject: Re: [PATCH 0/8] virtiofsd: Changed various allocations to GLib
 functions
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000012099305bde3f44d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000012099305bde3f44d
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 3:25 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Replaced allocations done using malloc(), calloc(), and realloc()
> to their equivalent functions in GLib.
>
> Memory that is allocated locally and freed when the function exits
> are annotated g_autofree so that the deallocation is automatically
> handled. Subsequently, I could remove a bunch of free() calls.
>
> Also, tried to keep the semantics of the code as is, but when the
> allocation is a small one, or a crucial one, I replaced the
> NULL-checking mechanisms with glib's functions that crash on error.
>
> This is related to a patch that I had submitted as a part of a
> previous series. The previous patch had some errors. Also, I thought
> that it's better to split the patch into smaller pieces.
>
> The previous patch can be found here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.html
>
> Mahmoud Mandour (8):
>   virtiofsd: Changed allocations of fuse_req to GLib functions
>   virtiofds: Changed allocations of iovec to GLib's functions
>   virtiofsd: Changed fuse_pollhandle allocation to GLib's functions
>   virtiofsd: Changed allocations of fuse_session to GLib's functions
>   virtiofsd: Changed allocation of lo_map_elems to GLib's functions
>   virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
>     functions
>   virtiofsd/passthrough_ll.c: Changed local allocations to GLib
>     functions
>   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib
>
>  tools/virtiofsd/fuse_lowlevel.c  | 43 +++++++++++---------------------
>  tools/virtiofsd/fuse_virtio.c    | 34 ++++++++-----------------
>  tools/virtiofsd/passthrough_ll.c | 21 ++++++----------
>  3 files changed, 34 insertions(+), 64 deletions(-)
>
> --
> 2.25.1
>
>
Hello,
For some reason, my get_maintainers script auto cc-filling did not work, so
I had to manually cc
you.
Sorry for the inconvenience.

Mahmoud

--00000000000012099305bde3f44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 19, 2021 at 3:25=
 PM Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandour=
r@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Replaced allocations done using malloc(), calloc(), and realloc(=
)<br>
to their equivalent functions in GLib. <br>
<br>
Memory that is allocated locally and freed when the function exits<br>
are annotated g_autofree so that the deallocation is automatically<br>
handled. Subsequently, I could remove a bunch of free() calls.<br>
<br>
Also, tried to keep the semantics of the code as is, but when the <br>
allocation is a small one, or a crucial one, I replaced the <br>
NULL-checking mechanisms with glib&#39;s functions that crash on error.<br>
<br>
This is related to a patch that I had submitted as a part of a <br>
previous series. The previous patch had some errors. Also, I thought <br>
that it&#39;s better to split the patch into smaller pieces. <br>
<br>
The previous patch can be found here: <br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2021-03/msg05153.html</a><br>
<br>
Mahmoud Mandour (8):<br>
=C2=A0 virtiofsd: Changed allocations of fuse_req to GLib functions<br>
=C2=A0 virtiofds: Changed allocations of iovec to GLib&#39;s functions<br>
=C2=A0 virtiofsd: Changed fuse_pollhandle allocation to GLib&#39;s function=
s<br>
=C2=A0 virtiofsd: Changed allocations of fuse_session to GLib&#39;s functio=
ns<br>
=C2=A0 virtiofsd: Changed allocation of lo_map_elems to GLib&#39;s function=
s<br>
=C2=A0 virtiofsd: Changed allocations of fv_VuDev &amp; its internals to GL=
ib<br>
=C2=A0 =C2=A0 functions<br>
=C2=A0 virtiofsd/passthrough_ll.c: Changed local allocations to GLib<br>
=C2=A0 =C2=A0 functions<br>
=C2=A0 virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib<br>
<br>
=C2=A0tools/virtiofsd/fuse_lowlevel.c=C2=A0 | 43 +++++++++++---------------=
------<br>
=C2=A0tools/virtiofsd/fuse_virtio.c=C2=A0 =C2=A0 | 34 ++++++++-------------=
----<br>
=C2=A0tools/virtiofsd/passthrough_ll.c | 21 ++++++----------<br>
=C2=A03 files changed, 34 insertions(+), 64 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div>Hello,<div>For some reason, my get_maintain=
ers script auto cc-filling did not work, so I had to manually cc</div><div>=
you.=C2=A0</div><div>Sorry for the inconvenience.</div><div><br></div><div>=
Mahmoud=C2=A0</div></div></div></div>

--00000000000012099305bde3f44d--

