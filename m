Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD555A2583
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:10:05 +0200 (CEST)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWHs-0001M1-6k
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWAo-0003Gj-Ed
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:02:58 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWAm-0007IN-J9
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:02:46 -0400
Received: by mail-lf1-x129.google.com with SMTP id s6so1331119lfo.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=cPunIMm8UePehABgrnk+njxurHmvnnStFidQ24P6MWs=;
 b=KDeqKdo/lz/WhvpjfwBrkGZrk7HqsIpnfwILtdHF5BDsHgWLLavswRCS5DkzQZrtOX
 VZzMOj6aQgSpP/LHWoW9q4ZxnFC0ysNvGSC2xRVS8R3eMJ66Yn9ZUVRfCzeLGsrw5LcE
 QcWdgDhoDv539p/3pabDZzdBOYvk+FqTun9vGhJrHR8QU1FJ+Ks8lTN+g1eOJERYB3NX
 lOCIjgVnaVzAI/ZmCp9EKx377NiuHmlQ7FV3bVOU2gDc07vbTUEFXsmzJ46HhEIbQX86
 vmmHQM4SBVVNwvBJ73Yt6F894ucXjE9KKTQPVG+ZB1VT+c2AVBzIo1ijBS03/IhsEn11
 sGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=cPunIMm8UePehABgrnk+njxurHmvnnStFidQ24P6MWs=;
 b=3207MmKOQ7MOxZKudl+aOPyMGLMLZ7Fe8HaarMg3+iFbcKaopZGr08TJlDm0IrvjDv
 3uknB9ZuYbJmi7bGSSHyVY3HmiCuCawJ7wi+OdllCIXh5IjXCEb69K/zAqr9AjGRTxqY
 wHVK5vGLhooR3EqElh3FDgvilDXNIbuAYansM0UIttBnTGdYCNh7F7mzcMT24BUfaaNa
 02jrYxHhGffR/4XLm7iVNrufZn4CWF19w+AeCprxEMx6Uds7Y7cuS6uI5jMkID89C2E2
 7lN1tSCCYUwRaQpheDxQdwY83O3Uj5PRP6n9ospMYjPyPI5t3ZunnojoU01zwfer8v8+
 U5Tw==
X-Gm-Message-State: ACgBeo0BATKM2lxA4Px7chOj6kcW2JZCGfpQlPzcz6JcS8XV2/3attHM
 cgbCn1FwFm7X1Eaaz+uvlGNK6nIogBwLs05GxwU=
X-Google-Smtp-Source: AA6agR7eEMw5iZhIp7HATCvpbIajDnaGCUBv6grQ7T9z5KOcOM4IiHGFrNFfSehzfguMjy45H+VGmS1dXiqeNOo9M+E=
X-Received: by 2002:a05:6512:12d6:b0:492:cfab:ffae with SMTP id
 p22-20020a05651212d600b00492cfabffaemr2435720lfg.329.1661508157777; Fri, 26
 Aug 2022 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
 <35072646-3bee-ba0d-4b9d-6aeb117b8431@redhat.com>
In-Reply-To: <35072646-3bee-ba0d-4b9d-6aeb117b8431@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 14:02:26 +0400
Message-ID: <CAJ+F1CJs-s2v1ivdwmwkS86=JU+rrqrov8HZiyEzFGDE-injnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000894a9205e722030b"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000894a9205e722030b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Fri, Aug 26, 2022 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:

> On 25.08.22 15:21, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Rewrite get_next_page() to work over non-aligned blocks. When it
> > encounters non aligned addresses, it will allocate a zero-page and try
> > to fill it.
>
> Could we simplify by using one global helper page (or caller provided
> page) and avoiding the allocation/freeing?
>
>
I don't think that makes a big difference, but certainly doable.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000894a9205e722030b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 2:01 PM Dav=
id Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
5.08.22 15:21, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Rewrite get_next_page() to work over non-aligned blocks. When it<br>
&gt; encounters non aligned addresses, it will allocate a zero-page and try=
<br>
&gt; to fill it.<br>
<br>
Could we simplify by using one global helper page (or caller provided<br>
page) and avoiding the allocation/freeing?<br>
<br></blockquote><div><br></div><div>I don&#39;t think that makes a big dif=
ference, but certainly doable. <br></div></div><br clear=3D"all"><br>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div=
></div>

--000000000000894a9205e722030b--

