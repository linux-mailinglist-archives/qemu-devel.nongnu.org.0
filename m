Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7C6EE93E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:50:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPbH-0004WY-Ig; Tue, 25 Apr 2023 16:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1prPbF-0004M8-BW
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:49:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1prPbD-0005YN-TA
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:49:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5062c6aed59so7037a12.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682455757; x=1685047757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1GkCe639wVFgBuKcU9lMq8Dhrnoc9RqNORPOb1jtTPw=;
 b=jMYheMKmb+9nE6PPrGwsKE2hGOBBM9OqBwcQ8vBMxVMP3rl6Gq3dxmfEZUc1PuvUXZ
 tVs+U1aOhPc4hlffPebPFwDVwXNjh5C0/4zNHGhArOIVqWuB1Jg+XcIdWX84RHH+di0L
 ld3m/Na3PuZJucf+z1QiHyAVUwC3yHWG1YzTdEOgAYjIeES8N7ujNNeJPfbvFHS4QDn9
 0mwkig3mWSVT2O0IGFUwS9c0wR9UhHM1JZ8ItgoaJTmK/Q5gdkOyxa35B/nu26AEGWa8
 Mk9bhoQDM2DqLmmWgB93vtw4LkSm0AsDa61M1sZXWrj1IYEomw1YYr8HJY9PkK+I2g3p
 jYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682455757; x=1685047757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1GkCe639wVFgBuKcU9lMq8Dhrnoc9RqNORPOb1jtTPw=;
 b=NTZIP5b1GEo9751/cQ5Yg4Xyc+8VgSj9bRjJsnDea/6/WZoAPTR4YUKD0fac1s0sGf
 jka212ZDZTJKMYzHjeAnZtP3jgwlybnI+YnUt5wQf1QacUvn/oGT0JJxfBtHibWiSmAN
 Lz0QCvqd/8cFyyaMSgMeoPkL2oarhCcJbAxqGaUXllhuJKVA2GyrZ+8k2EqEPufOd5mP
 pX94TBzwJNEDSgFqA3HvQZwliFw4rjvUJwIgBYcJBvRP49Q1u+/PtKS8xaOCeW5F665J
 RgfUIXhIMwkW0hXcpTYE9F4g6MtRJONRhviOxMTaao+ZPtb6zlN4b5xer9bGTuLxRpMg
 WPkQ==
X-Gm-Message-State: AC+VfDyD7FoBzcgM8ICvA5nU2D5TXROQ5n3M2uafOSYBrZn3Jso9lkj9
 ZqF1rcCPL2ThBZWjKKHKVrGfqymwB6V/sVt+RQr7Bg==
X-Google-Smtp-Source: ACHHUZ48pvxjctiMqW39jZZlTUqCUAdXQS0z8HWh61j1Z/wqPrELiymbSNtn4hii6ahJLiFn2amsOM/0eJOQbPJs62Y=
X-Received: by 2002:a05:6402:524d:b0:506:90c4:b63b with SMTP id
 t13-20020a056402524d00b0050690c4b63bmr21880edd.4.1682455757426; Tue, 25 Apr
 2023 13:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
 <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 25 Apr 2023 13:49:06 -0700
Message-ID: <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000c5e8a705fa2f4163"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=venture@google.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--000000000000c5e8a705fa2f4163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 6, 2022 at 6:18=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
> >
> > The MAC address set from Qemu wasn't being saved into the register spac=
e.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> > v2: only set the registers from qemu on reset
> >     once registers set, only read and write to them
>
>
>
> Applied to target-arm.next, thanks.
>

I think this was missed.  Please take a look.


>
> -- PMM
>

--000000000000c5e8a705fa2f4163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 6:18=E2=80=AFA=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, 3 Oct 2022 at 18:38, Patrick Venture &lt;<a href=3D"ma=
ilto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; The MAC address set from Qemu wasn&#39;t being saved into the register=
 space.<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: only set the registers from qemu on reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0once registers set, only read and write to them<br>
<br>
<br>
<br>
Applied to target-arm.next, thanks.<br></blockquote><div><br></div><div>I t=
hink this was missed.=C2=A0 Please take a look.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--000000000000c5e8a705fa2f4163--

