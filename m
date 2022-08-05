Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FB58A857
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:54:50 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJt6X-0005aA-2h
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJt25-0002BM-6s; Fri, 05 Aug 2022 04:50:14 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJt23-0001od-Cd; Fri, 05 Aug 2022 04:50:12 -0400
Received: by mail-lf1-x136.google.com with SMTP id bq11so2508757lfb.5;
 Fri, 05 Aug 2022 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=FHOviojBuhvoBH80LC0YJri+yZTfteCWruWa3NTkVxA=;
 b=aYL9lp2bRDFas52CUOsjBaY3RNx7Sef+dIeC3qF7oKPPqYTholHtIqIRswihP/WUom
 0seEG/jH8+Wj10cTqM88x97L/B+v8HvJA3Fav3CvTV3iN1cYlAzJYE/tf8Nt5ND3DfVJ
 MbGIZOchX1HmdxzFbD2t9RB5yLc7Ty2qdO+sDEPKfB5jvJ1MX6TuiVwsjUB9TlA0ciUN
 XRzBl3KQtvBlzGLM5GGKxubIqJl/ka4JQdjjXgUMhRjXlsOQ4JPcyiosIXT/y2hyzYsg
 cwMmxIpXKwFpbEl4VpIGd6pX9biifInbshxZhTB1bhk5pOdzlBRzZZw2qMVh/e95etE2
 buLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FHOviojBuhvoBH80LC0YJri+yZTfteCWruWa3NTkVxA=;
 b=SXLA6PtezQixJrPc2wg5uVIrZ3wSfwujiTUzq/+yb4xtoZ2oeP81tz5YKbNnbuWYMq
 1HtWj+AvptLW+NikJ/di9htKMnMM9/lEnr3yorDbgCYijZRP0T/yWoG6xUCMZTFx4BoP
 VzV7r3PwEj/tVyWPRutkD7QGxYdMFOEkQXBw4G+Mt8F5cAdRQ9AkEf8p4atv2A6S65Zd
 +Cl3HbAN9J+59mwg4cbLiw0GL71lvv8PS//RioBsSAB/WX7fwF9RWxaySsMixAicA3Dt
 El+75kj4GFrwRR9d16PXwGw3eZ9+QY3emwJFsl5zh7JUcf0giFnAMIaIr2fpnTA4XQdZ
 mR2w==
X-Gm-Message-State: ACgBeo0uFYb9llVqfQDKd2qzsg4DrdqQhfXPQ9r1gTlRY2Qd87BW4it6
 ZWUqiaV6OE8rJcEj02wK7Fa2457Ych/06HGgoqQ=
X-Google-Smtp-Source: AA6agR47D/vCAKCNEYsNwJ76RFXng259j+ARXpxjnMfr5l2GnsuicCTlv4IKrImMDUYCS+K/xRBu8ZfkadUxML8XmdI=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr1862405lfb.121.1659689407119; Fri, 05
 Aug 2022 01:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
In-Reply-To: <87pmhf86ew.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 5 Aug 2022 12:49:55 +0400
Message-ID: <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Warner Losh <imp@bsdimp.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008c87ac05e57a8d60"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--0000000000008c87ac05e57a8d60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This is just moving qapi-gen.py and related subdir to qemu-common, to
> > ease review and proceed step by step. The following patches will move
> > related necessary code, tests etc.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> As moved files tend to become low-level annoyances for a long time, I'd
> like to understand why you want to move them.  The commit message says
> "to ease review", which I suspect isn't the real reason.  Perhaps you
> explained all that elsewhere already, but I missed it.
>
>
>
The end goal is to split some projects, such as qemu-ga, to standalone
meson projects/subprojects. We will be able to build them independently
from the rest of QEMU, and later on perhaps handle them outside of QEMU
main repository. To achieve this, I first introduce a qemu-common
subproject, where qapi and common units are provided. You can check
https://gitlab.com/marcandre.lureau/qemu/-/commits/qga for a sneak peek at
current end result.

I said "to ease review and proceed step by step" simply because there are
no other changes: I don't move the rest of the qapi code & tests all
together, it's in the subsequent series.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008c87ac05e57a8d60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 5, 2022 at 12:12 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This is just moving qapi-gen.py and related subdir to qemu-common, to<=
br>
&gt; ease review and proceed step by step. The following patches will move<=
br>
&gt; related necessary code, tests etc.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
As moved files tend to become low-level annoyances for a long time, I&#39;d=
<br>
like to understand why you want to move them.=C2=A0 The commit message says=
<br>
&quot;to ease review&quot;, which I suspect isn&#39;t the real reason.=C2=
=A0 Perhaps you<br>
explained all that elsewhere already, but I missed it.<br>
<br>
<br></blockquote><div><br></div><div>The end goal is to split some projects=
, such as qemu-ga, to standalone meson projects/subprojects. We will be abl=
e to build them independently from the rest of QEMU, and later on perhaps h=
andle them outside of QEMU main repository. To achieve this, I first introd=
uce a qemu-common subproject, where qapi and common units are provided. You=
 can check <a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/commits/qg=
a">https://gitlab.com/marcandre.lureau/qemu/-/commits/qga</a> for a sneak p=
eek at current end result.<br></div></div><div><br></div><div>I said &quot;=
to ease review and proceed step by step&quot; simply because there are no o=
ther changes: I don&#39;t move the rest of the qapi code &amp; tests all to=
gether, it&#39;s in the subsequent series.<br></div><br>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008c87ac05e57a8d60--

