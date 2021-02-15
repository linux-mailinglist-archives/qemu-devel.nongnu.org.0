Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF931C309
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:33:26 +0100 (CET)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkYf-0006Rj-Ae
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lBkWS-0005sA-9M; Mon, 15 Feb 2021 15:31:08 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lBkWQ-0000bC-9b; Mon, 15 Feb 2021 15:31:08 -0500
Received: by mail-il1-x131.google.com with SMTP id e1so6556759ilu.0;
 Mon, 15 Feb 2021 12:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=78fwAa+Rsw01RxG2wWugKvlSZtpYHUe6+3hnhVfYDCw=;
 b=dBmHsztun12FVOFpF17R10e1VYCMWEoXBvlw8Z8j0AN0FJfejEV32fZT+Z2JR5zqVN
 mrDmFCBmq9sneXUbG4nb/opxppy2C59ct0e/b4XfdDuL8qYZUdSi4QN65vNIyUMTaBlR
 O1HjeBVukFmRisuWTxMtWl1QOozRgO9MCf+PDhUgg65mfeZm1V9HZ+S4q+LNjmdNG6De
 Kno5bokmRLKtqgltOmF99L5tQ4bhjcckC+QiD8zb4oR0XmbaA0xGKxW4cze3azYrnAGO
 sjn3A2TN7UX7DcRdoMvbKnoroFEIxMu9y7s8cxpevHK5Y94plmrIG7+8MaHsnF8Vn9JG
 KeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78fwAa+Rsw01RxG2wWugKvlSZtpYHUe6+3hnhVfYDCw=;
 b=ivmhehC0/9NMqvZ2RK5LZwn716fXipJhMwROFws+iV74sLwX2nQw+FGDlsau8UKY+C
 nz7an2ZJ2QTk6h8vPFwdz18qrX3STM3hgqPadGJVI1PgqJxQ2dPlOym/AT41ItjQHLU7
 v3oYDEWHLZRDGUC4EcUwrRQx5SG3GlGtknAcWg8w9ufgeKEJfMwM/D8hSCJ44ijZ/o9y
 hrcJFhGRu0F8bOPYfR15mabiQaNyvd6L3Db3U1d3k76cZdZIrOjVe/2Vj9TIULEg8GcX
 bJL+XDlFbyrIR+n6lI8brNq3Jj2IcZ8U3F9ubFd7MTDONOOo0bASRj7u8C8mtXaZVo75
 zQ/g==
X-Gm-Message-State: AOAM532YDd9snkRlX9NHV5WcN1d7wcAQjavlhISRMLQdafu9p0WRxBKE
 xYbvGEL3HV4d/BS31ENPRk+i89HaYWrzbB6hvW0=
X-Google-Smtp-Source: ABdhPJwzVKUpmn3bDjEe/zsrPx9tWHxoe/D3cCpjlQGJFjzzpriQX7+HxtVGjMrL7gmr93UBHC9N3nJWhz6lb7ovhZ4=
X-Received: by 2002:a92:cc03:: with SMTP id s3mr13278062ilp.45.1613421064003; 
 Mon, 15 Feb 2021 12:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
In-Reply-To: <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 15 Feb 2021 21:30:52 +0100
Message-ID: <CAPan3WqGAzWE+gCqo0Rggu70GpQAbWYyA2thH6LX=oTxhnvRfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000064a2cb05bb65ddfe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-il1-x131.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Pavel.Dovgaluk@ispras.ru,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, crosa@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000064a2cb05bb65ddfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op vr 12 feb. 2021 15:10 schreef Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>:

> Hi Niek and QEMU community,
>
> On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> > The following are maintenance patches for the Allwinner H3. The first
> patch
> > is a proposal to relocate the binary artifacts of the acceptance tests
> away
> > from the apt.armbian.com domain. In the past we had problems with
> artifacts being
> > removed, and now the recently added Armbian 20.08.1 image has been
> removed as well:
> >
> > $ wget
> https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bion=
ic_current_5.8.5.img.xz
> > Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443...
> connected.
> > ...
> > HTTP request sent, awaiting response... 404 Not Found
> > 2021-02-11 22:34:45 ERROR 404: Not Found.
> >
> > I've now added the artifacts to a server maintained by me. The machine
> has a stable
> > uptime of several years, ~100Mbit bandwidth and plenty of available
> storage.
> > Also for other artifacts if needed. I'm open to discuss if there is a
> proposal
> > for a better location for these artifacts or a more generic qemu
> location.
>
> Thanks for trying to fix this long standing problem.
>
> While this works in your case, this doesn't scale to the community,
> as not all contributors have access to such hardware and bandwidth /
> storage.
>
> While your first patch is useful in showing where the artifacts are
> stored doesn't matter - as long as we use cryptographic hashes - I
> think it is a step in the wrong direction, so I am not keen on
> accepting it.


> My personal view is that any contributor should have the same
> possibilities to add tests to the project.


Hi Philippe,

I see your point. How about I simply upload the artifacts to github
instead? There are already multiple tests right now that use artifacts
stored on github. And github is available to everyone. For me that would
work fine. If you agree, I can respin the patch.

Regards
Niek

Now I am also open to
> discuss with the others :) I might be proven wrong, and it could
> be better to rely on good willing contributors rather than having
> nothing useful at all.


> Regards,
>
> Phil.
>
>

--00000000000064a2cb05bb65ddfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Op vr 12 feb. 2021 15:10 schreef Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Niek and QEMU community,<br>
<br>
On 2/11/21 11:00 PM, Niek Linnenbank wrote:<br>
&gt; The following are maintenance patches for the Allwinner H3. The first =
patch<br>
&gt; is a proposal to relocate the binary artifacts of the acceptance tests=
 away<br>
&gt; from the <a href=3D"http://apt.armbian.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">apt.armbian.com</a> domain. In the past we had proble=
ms with artifacts being<br>
&gt; removed, and now the recently added Armbian 20.08.1 image has been rem=
oved as well:<br>
&gt; <br>
&gt; $ wget <a href=3D"https://dl.armbian.com/orangepipc/archive/Armbian_20=
.08.1_Orangepipc_bionic_current_5.8.5.img.xz" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://dl.armbian.com/orangepipc/archive/Armbian_20.08.=
1_Orangepipc_bionic_current_5.8.5.img.xz</a><br>
&gt; Connecting to <a href=3D"http://dl.armbian.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">dl.armbian.com</a> (<a href=3D"http://dl.armbian.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">dl.armbian.com</a>)|26=
05:7900:20::5|:443... connected.<br>
&gt; ...<br>
&gt; HTTP request sent, awaiting response... 404 Not Found<br>
&gt; 2021-02-11 22:34:45 ERROR 404: Not Found.<br>
&gt; <br>
&gt; I&#39;ve now added the artifacts to a server maintained by me. The mac=
hine has a stable<br>
&gt; uptime of several years, ~100Mbit bandwidth and plenty of available st=
orage.<br>
&gt; Also for other artifacts if needed. I&#39;m open to discuss if there i=
s a proposal<br>
&gt; for a better location for these artifacts or a more generic qemu locat=
ion.<br>
<br>
Thanks for trying to fix this long standing problem.<br>
<br>
While this works in your case, this doesn&#39;t scale to the community,<br>
as not all contributors have access to such hardware and bandwidth /<br>
storage.<br>
<br>
While your first patch is useful in showing where the artifacts are<br>
stored doesn&#39;t matter - as long as we use cryptographic hashes - I<br>
think it is a step in the wrong direction, so I am not keen on<br>
accepting it.</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
My personal view is that any contributor should have the same<br>
possibilities to add tests to the project. </blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Hi Philippe,</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I see your point. How about I simply upload the=
 artifacts to github instead? There are already multiple tests right now th=
at use artifacts stored on github. And github is available to everyone. For=
 me that would work fine. If you agree, I can respin the patch.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Niek=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Now I am also open to<br>
discuss with the others :) I might be proven wrong, and it could<br>
be better to rely on good willing contributors rather than having<br>
nothing useful at all.</blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div></div></div>

--00000000000064a2cb05bb65ddfe--

