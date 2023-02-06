Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D055768BA45
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOypj-00024G-1m; Mon, 06 Feb 2023 05:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <extrapowernosugar@gmail.com>)
 id 1pOypQ-00021k-JV
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:34:28 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <extrapowernosugar@gmail.com>)
 id 1pOypO-0003Tn-Tn
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:34:28 -0500
Received: by mail-ed1-x532.google.com with SMTP id i38so95393eda.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l8ZIVt/0CwWtjPyxlMCJ3Fj8U0QHV4EcgeMGzHWq8d4=;
 b=gQcs/RZzq7cf88PGd7DAVbvALtAkzBQTwquWgXymti/6tjp7boBebtDTsPZbisaKPQ
 4KXKmXDQB+WW2V+fO5BQMDu4bZE0FBgfaFsT59GAvdNGzrA8B0ykedHd2ZY/hgCTa7vt
 S+yZo6rFsCpUxkqSEcTnxzrKPVQVCnOSWcD0RzH1Wy2b2dxUV9U7f1vG96MfV+h0/Rb5
 5Mx/gClbHT1VbgDNSmwSXR3jySwgb+XYu/oFuQBFWMbAQHbU4Cvht71ZKpeyPCwDiPhw
 bsgviZD60qNEZVjjK6PzXYLG6DfCPvI2+0+ERdHtdz80YLRVCJhrf7lahrrqrBNJZC0U
 TvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8ZIVt/0CwWtjPyxlMCJ3Fj8U0QHV4EcgeMGzHWq8d4=;
 b=ebEZOb5SrL/TwrKmoyegI9Y2suAEQ1WvnX7TVnPI7GiNS9SIvNF7Y0ZtBDcRd/MPsA
 Kh/3ULOveRjYl9MB7vSN8uN+G797Lgzbmjrwq7KzBV7G0JgOdqWn7jduZ9+sD6F38Qyw
 SUQ13pMznXca9g7qIbNNxmp2eYRaLt0WeKilwNBlMb7YsqvnSMFP0y/iRLPTDZ6vSyc5
 AIVGywNzxvUa8OkjbmdT1QudR0XC7ro7g7ntKgJIfxXrKEA0cfIymSL7oTk0b4kGe4nZ
 oo2Ih9CseIKw91HZrBrILCXvp5rNDoq/y74hb2ERbGbmI8oJYZoDAq4B+FfoQw2Y/2f4
 Obow==
X-Gm-Message-State: AO0yUKWvRr5LAEuZeTehWoxjZyTxAXA59qyvqBrupQaQXXdsn4uUT7mi
 /JrHqOlxFeqDozIKeAwGNlU+/Fzd9EuH149ZQ9kACWcOa8KbEQ==
X-Google-Smtp-Source: AK7set90eyIwZzxWN4FOEnRUgrHL14DzAFJU88eV+4Vk7+Uu+Zd/FNqUglsPPhrF254e+yM2CAZA/Zysk9uOe0chha0=
X-Received: by 2002:aa7:d906:0:b0:4a2:5487:80 with SMTP id
 a6-20020aa7d906000000b004a254870080mr5530629edr.72.1675679665488; 
 Mon, 06 Feb 2023 02:34:25 -0800 (PST)
MIME-Version: 1.0
References: <CALj-+m3GVB8s60wMbQuZVEHm2kJRLaYxoveQg_wg=hV6MYcS_A@mail.gmail.com>
 <9d13db25-0ee3-4eaa-227a-dd3ca909a1ba@linaro.org>
 <CAEUhbmWNeOEJLkkCQ=jCRP9A3MzdQMRW-A_pGTwEfRGGqC3vVA@mail.gmail.com>
In-Reply-To: <CAEUhbmWNeOEJLkkCQ=jCRP9A3MzdQMRW-A_pGTwEfRGGqC3vVA@mail.gmail.com>
From: Jacob A <extrapowernosugar@gmail.com>
Date: Mon, 6 Feb 2023 11:32:17 +0100
Message-ID: <CALj-+m0jo4Zj5cDrqHOeDok7Mv-MzroddJHC2fd_fPmdrTsYeQ@mail.gmail.com>
Subject: Re: Qemu - how to run in Win?
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Yonggang Luo <luoyonggang@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003806e305f405933c"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=extrapowernosugar@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003806e305f405933c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, thanks. Will stick to GUI app.

On Mon, 6 Feb 2023 at 11:19, Bin Meng <bmeng.cn@gmail.com> wrote:

> On Mon, Feb 6, 2023 at 5:55 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org>
> wrote:
> >
> > Cc'ing Yonggang & Stefan.
> >
> > On 5/2/23 13:01, Jacob A wrote:
> > > Hello,
> > >
> > > After installing Qemu on Win, I don't see any shortcut to run it? The=
re
> > > is only a link to 'uninstall'. launching exe files doesn't do anythin=
g.
> > > Can you please explain how to launch this application?
> > >
>
> QEMU is a command-line utility so you need to run QEMU with some
> parameters from a Windows shell.
>
> Regards,
> Bin
>

--0000000000003806e305f405933c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood, thanks. Will stick=C2=A0to GUI app.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 6 F=
eb 2023 at 11:19, Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.=
cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, Feb 6, 2023 at 5:55 PM Philippe Mathieu-Daud=C3=A9 &lt;=
<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Cc&#39;ing Yonggang &amp; Stefan.<br>
&gt;<br>
&gt; On 5/2/23 13:01, Jacob A wrote:<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; After installing Qemu on Win, I don&#39;t see any shortcut to run=
 it? There<br>
&gt; &gt; is only a link to &#39;uninstall&#39;. launching exe files doesn&=
#39;t do anything.<br>
&gt; &gt; Can you please explain how to launch this application?<br>
&gt; &gt;<br>
<br>
QEMU is a command-line utility so you need to run QEMU with some<br>
parameters from a Windows shell.<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--0000000000003806e305f405933c--

