Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8C52E8E7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:35:03 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrz2E-0005yh-2g
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryzL-00043u-Iy
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:32:06 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryzH-00083W-SR
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:32:03 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f1eafa567cso6278674fac.8
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cAvbg5XLwWV258fHW0fxO8WsltNK4deVnaNFewOabcQ=;
 b=nV1lfrC0JeXSCMnwVeJ92mD92dWxHWeI5g2JPMPoeTrws/Oom8PErxn2Hjfozs1H9D
 7bmi4wF8CWNLLoy/rB5LCeicj4Yy+8REcctZO5Y1TN1UvECdZ6qDlZaHjXkBUF5fyCew
 EA76h6t2/V6i3zgsAbU8fRJZGIwd6UIsoddqLZ7BdUFsj/i9qPmsicwbJpf/A7KdLWgq
 ljKOQ2RUaA5C5zAeTtrV4STP0dBwBVcImL9yyYLg2D3hjfrNoFrwNo/WqQRRPoHu47Gn
 NxpYlscm5II0Ss0tVvj0r55edGKY28Lu7yaVfUpZNQRMXiUsxxLG7gInRPQap7FYevOj
 eSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cAvbg5XLwWV258fHW0fxO8WsltNK4deVnaNFewOabcQ=;
 b=HT20GcdDgGbLQXNPmrj6vRTbz177QcNfyGcqQTT+aSDX9Foz3vAPSXfwSYs8y9khv3
 GzKLFqrfjEOPx/tAE0pYjjVabq49rjW/ry4rg67GBtyCKyhAn6Y6PZFNZGY4t0fokZaV
 SLLL7c3pUgMUQoCkAgSNV63WLukq0ftw6A0w1GvES3PqSreCP0slWBZQ/DsxoIbIiMhW
 uPMGNI3ABwiujS8EaWooZbr9kVunjMC19xhRchoOmq2Jy9LSmZZs02A3dq/xaEeKDebD
 r1S71lzIHeN2MXNLXsp2Bj02rreONo0lvlRR+DvFShMUqAfTGRRS3Pv46GVLLsbBJp4f
 qUWw==
X-Gm-Message-State: AOAM530Oq8Vsj5pAkZdn9GqQEG8JwFBhxnDuJM2nX30aSgeSCgpQQcyd
 lUiQavuxSnzC22+VCNSj8tJnQlqu1t+gXOw3ytU=
X-Google-Smtp-Source: ABdhPJxneWPr7zDcwsN/Fabq4CpNjMd7vAl8PTxEXxdPubXXWGWnIVsbZTBnSE+H44l+NYyFZ0QJIAIivML5bZ69RSg=
X-Received: by 2002:a05:6870:a79c:b0:e6:30d9:c7fc with SMTP id
 x28-20020a056870a79c00b000e630d9c7fcmr5354716oao.248.1653039117874; Fri, 20
 May 2022 02:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
 <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
 <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
 <CANW9uytx_ocywwRVBLbze32-Vp1qR8FGMWx1691_ji_J8Ngfhw@mail.gmail.com>
 <CAFEAcA_4oqeQTLqi=KE3vgCH-BeSRDLsBxSLCanvQX0s6irc=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_4oqeQTLqi=KE3vgCH-BeSRDLsBxSLCanvQX0s6irc=Q@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 20 May 2022 18:31:46 +0900
Message-ID: <CANW9uysep-A29wHhB6XZnL2q4TkZHYrYqikd-WTzokpwsGiWYw@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006bb9ab05df6e296a"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-oa1-x2f.google.com
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

--0000000000006bb9ab05df6e296a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve verified only a57 and a72 boot on sbsa ref board, but not N1 a=
nd
=E2=80=98max=E2=80=99. As I said, I=E2=80=99ll try to figure out how CPU in=
it is done in QEMU for
those not working CPU types.

On Fri, May 20, 2022 at 18:27 Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 20 May 2022 at 10:02, Itaru Kitayama <itaru.kitayama@gmail.com>
> wrote:
> >
> > By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I =
can bring up
> > the sbsa-ref board with the latest kernel.
>
> I'm not sure exactly what you're doing, but this sounds like
> a workaround for something -- we should find out exactly
> what is going wrong and why.
>
> -- PMM
>

--0000000000006bb9ab05df6e296a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99ve verified only a57 and a72 boot on sbsa ref b=
oard, but not N1 and =E2=80=98max=E2=80=99. As I said, I=E2=80=99ll try to =
figure out how CPU init is done in QEMU for those not working CPU types.</d=
iv><div dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, May 20, 2022 at 18:27 Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 20 May 2022 at 10:0=
2, Itaru Kitayama &lt;<a href=3D"mailto:itaru.kitayama@gmail.com" target=3D=
"_blank">itaru.kitayama@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I=
 can bring up<br>
&gt; the sbsa-ref board with the latest kernel.<br>
<br>
I&#39;m not sure exactly what you&#39;re doing, but this sounds like<br>
a workaround for something -- we should find out exactly<br>
what is going wrong and why.<br>
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000006bb9ab05df6e296a--

