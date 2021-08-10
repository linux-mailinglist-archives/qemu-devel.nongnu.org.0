Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD13E5E74
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTCj-0001xD-Fv
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDTBC-0007nO-4j
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:56:34 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDTBA-0002A2-Hr
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:56:33 -0400
Received: by mail-io1-xd2d.google.com with SMTP id h1so32518989iol.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mFlXUVgBL0+E/eS4rcvm7AWWRLaA8po7dzzDBhyuKrs=;
 b=LfDP+0c1nI0SdsOwxCF42GcHFipJGBiqNX09IaMOiL2552eKxmN3iBR3F6sVyVJo/O
 D8FvYYOeZzldr9DI4ZR0/yUt50Ss7bppiBZV7px0CADK1XRiiLWgkWlu0012HejwKMos
 ZLqKxHGCjIAOeWP5h5JMzuLH17BkMAL2BrkkX6eCBPBv/nmoaEX39Ic8SvprAnZzLDcU
 giqJc4gVWvdIuMf6BncB41d+nNJ63UF/9m7hpqVP6XYt5V3vfeOmcdcr93fBzuaBGU7v
 3njBmdJEdthuXn+w64zoj7E8jx/D9NPw0m5P6TZD5y0lSm6QwsRvWvanApVu0xXnzDwM
 b/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFlXUVgBL0+E/eS4rcvm7AWWRLaA8po7dzzDBhyuKrs=;
 b=KO6/nGGHJX52pJipqY1hhGGOMH+k/LQzEPef1h5oWNYWBYJgA3c4gRY72TUvCY0tpo
 isLiq5S16zzh4Xz5+vKrQz6s2Kqculf5TBrbfGVWo8aJnZqIFU61PyagurZNXMxRKGrE
 YIzg9WVcuEpOCrhk/MML8Du1+3SQvT1S/ccHF8Mz4uMyPmD6fH+noDLdtLt1UB0ZME8p
 +6KW75CNVBXVapZKYWyKlshZozQdz1+V4cX4pfhEzdMaG9xJ5y7uItt7qNujCzfRaxO7
 teag2dJ4ZQIzWrWZYuL6xZP8IHUwhArK8fPFRQaxZyykTXtBTP+6XO9pHA8EjoRGJyd4
 BCiA==
X-Gm-Message-State: AOAM533YLYcAYk8UR1WYOp0KFRFiM5LylvLE8SxQ8A+RYeky3Y52AzUy
 hLK80s9VyJaM8d6Kxcz2JBOl623e+vKdgVo/S4nWp3QWXFo=
X-Google-Smtp-Source: ABdhPJzl/ORHbUQdjQVL1+oh78mRpYhNFgHwqN4CpdynUY/80rDYHDhEz2y5D/7r0SyqXcOg9eL+oPxrwL6KsvnjudA=
X-Received: by 2002:a5e:8d16:: with SMTP id m22mr35348ioj.60.1628607391104;
 Tue, 10 Aug 2021 07:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Tue, 10 Aug 2021 16:56:20 +0200
Message-ID: <CAD-LL6iEXWWcho6wU3EYV8y6aQvU6QeWqnZzhiLxY1Q2BqJ9rQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] plugins/cache: L2 cache modelling and a minor leak fix
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000685f605c935b58e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2d.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000685f605c935b58e
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 3:48 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Hello,
>
> This series implements a simple L2 unified per-core cache emulation, the L2
> cache is not enabled by default and is only enabled on specifying so using
> the
> plugin arguments. L2 cache is only accessed if L1 does not contain the
> wanted
> block. If a miss occur in L1, the block is "fetched" to L1, and then L2 is
> interrogated. This effectively mean that on a cache miss, we bring the
> data to
> all the cache hierarchy, which is quite reasonable.
>
> Note: Some +80-column lines are left as is, since they're all 81~83 cols
> and I
> thought that it's so important to break them since breaking a line usually
> looks
> ugly when not sufficiently long(?) LMK if I need to fix this :)
>
>
Based-on: <20210730135817.17816-1-ma.mandourr@gmail.com>
since it uses `qemu_plugin_bool_parse` and based also on the changes done
in the plugin docs in the same series.

This can hopefully be applied cleanly to plugins/next since it has all my
multicore
cache patches and also the new arg-passing scheme patches.


> Mahmoud Mandour (5):
>   plugins/cache: freed heap-allocated mutexes
>   plugins/cache: implement unified L2 cache emulation
>   plugins/cache: split command line arguments into name and value
>   plugins/cache: make L2 emulation optional through args
>   docs/tcg-plugins: add L2 arguments to cache docs
>
>  contrib/plugins/cache.c    | 318 ++++++++++++++++++++++++++-----------
>  docs/devel/tcg-plugins.rst |  22 ++-
>  2 files changed, 244 insertions(+), 96 deletions(-)
>
> --
> 2.25.1
>
>

--0000000000000685f605c935b58e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 10, 2021 at 3:48 PM Mahmoud Mandour &lt;<a href=
=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
This series implements a simple L2 unified per-core cache emulation, the L2=
<br>
cache is not enabled by default and is only enabled on specifying so using =
the<br>
plugin arguments. L2 cache is only accessed if L1 does not contain the want=
ed<br>
block. If a miss occur in L1, the block is &quot;fetched&quot; to L1, and t=
hen L2 is<br>
interrogated. This effectively mean that on a cache miss, we bring the data=
 to<br>
all the cache hierarchy, which is quite reasonable.<br>
<br>
Note: Some +80-column lines are left as is, since they&#39;re all 81~83 col=
s and I<br>
thought that it&#39;s so important to break them since breaking a line usua=
lly looks<br>
ugly when not sufficiently long(?) LMK if I need to fix this :)<br>
<br></blockquote><div><br></div><div>Based-on: &lt;<a href=3D"mailto:202107=
30135817.17816-1-ma.mandourr@gmail.com">20210730135817.17816-1-ma.mandourr@=
gmail.com</a>&gt;</div><div>since it uses `qemu_plugin_bool_parse` and base=
d also on the changes done</div><div>in the plugin docs in the same series.=
=C2=A0</div><div><br></div><div>This can hopefully be applied cleanly to pl=
ugins/next since it has all my multicore</div><div>cache patches and also t=
he new arg-passing scheme patches.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Mahmoud Mandour (5):<br>
=C2=A0 plugins/cache: freed heap-allocated mutexes<br>
=C2=A0 plugins/cache: implement unified L2 cache emulation<br>
=C2=A0 plugins/cache: split command line arguments into name and value<br>
=C2=A0 plugins/cache: make L2 emulation optional through args<br>
=C2=A0 docs/tcg-plugins: add L2 arguments to cache docs<br>
<br>
=C2=A0contrib/plugins/cache.c=C2=A0 =C2=A0 | 318 ++++++++++++++++++++++++++=
-----------<br>
=C2=A0docs/devel/tcg-plugins.rst |=C2=A0 22 ++-<br>
=C2=A02 files changed, 244 insertions(+), 96 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000685f605c935b58e--

