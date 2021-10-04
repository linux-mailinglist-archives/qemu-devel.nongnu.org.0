Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C24205EE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 08:41:18 +0200 (CEST)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXHf3-0005ev-8r
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 02:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mXHd3-0004mm-TZ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:39:13 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:33617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mXHd2-0002ZG-9S
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:39:13 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 i26-20020a4ad09a000000b002a9d58c24f5so5060241oor.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7rTL7cZtQloBs0nST7Zo/Es5qvRMjqmHymGaqwTKjk=;
 b=R0z9rr6nIv67azByPICe9JqqCjyPMOUwbXCTadNNnqI65FllpfDJBzYH1y9xT3KN6z
 kr0AByJQyZ8Urk1IdJSm8UdRCNFdroSZRPlIpk33Il/ZZ/lfQfjFOQfay2so+XsAwtu0
 XLaXF4bic5d8lXkIFCMq6eSwkrxx05tqThFjSxLJhMy6pY4zPeWxp5lsd6EO0ulNiOK6
 VX/D1ZYPzrSSwHivDOA6W2qvzQzXS7EqZZTvfPHJJA1Mnuz2sj0BSg/Rl9EGAnfLSPjC
 ScyZUjlqZ4iGo5rSSzP5A9saDXR/X/7Vtm+l+gCdpug0BOmpF13vpar3l0ULHsudVqPb
 YSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7rTL7cZtQloBs0nST7Zo/Es5qvRMjqmHymGaqwTKjk=;
 b=FqF8ktZ4rGbvU6xCnr2zYKMLcrwvGhUI43VDnqTM+/q7iEBMpdc8Mya/AGG6lNr4SS
 YwzQFmQkuYXtogbciCOd7332//FwNdSxE20rs00HjsFpatT4YQmzy0lpRd5yEBdRgDff
 I2D0gdqjFKr0k9gYI4WNGN8FarsVc8sXYCzsklQyTqeWHK+N19rnustk5ShdKdhgUUaX
 z5RcZpsTOCDgE+WUsaA5Ro2C23bCS4JXwBWwzNxyzKA1g4FEzeu1r5cnrcVRAJzJ7HWl
 sWfE8XcO4r6rRE8/ninjgzHoKMy9B9PnXkJSS4zHRTN239V1RK2mefrOZB19VD42vLz4
 gYyg==
X-Gm-Message-State: AOAM5334zdeMMO1/Q7+FWQHxbwEhNvYwp8OgJtab0q0+ZLqPXgg23vJe
 Pmknrfd6TZA2NIl5Fev6knQm/K21Dwge8qj0nPY=
X-Google-Smtp-Source: ABdhPJx8tM0rEvuBVeg0+BZGQTMW/UDcwFKKqMjVY5KQ/bEZEffJp5o8l20zYn4wLeeuTAYf94mAAnBfo4n0mIB6Tsc=
X-Received: by 2002:a4a:d30f:: with SMTP id g15mr7809736oos.32.1633329550514; 
 Sun, 03 Oct 2021 23:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
 <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
 <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
 <c541324-ed75-e6d2-d9b8-2742baed30da@eik.bme.hu>
 <CABLmASHZqTrON_MG_tw9D6C_eo++8VZEJduce3WRfPY0u=+9rQ@mail.gmail.com>
In-Reply-To: <CABLmASHZqTrON_MG_tw9D6C_eo++8VZEJduce3WRfPY0u=+9rQ@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Mon, 4 Oct 2021 08:38:59 +0200
Message-ID: <CABLmASHcv95aKY+5mJ9rbEFPvXQrT3YOjOcO5QtV0=WR4kqmLw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000a8dbb305cd812b64"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8dbb305cd812b64
Content-Type: text/plain; charset="UTF-8"

Hi all,

One more observation: When running Mac OS  guests with -mac99,via=pmu, the
guest is presented with a usb-mouse and usb-kbd, while -mac99 provides cuda
mouse/kbd.

If I run with via=pmu, the mouse/kbd will not work when passing through the
usb headset.
Only when I keep interrupting by pressing a volume button on the headset,
the mouse moves. So it seems Qemu does not iterate getting interrupts over
multiple devices.

Best,
Howard

>

--000000000000a8dbb305cd812b64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>One more observation=
: When running Mac OS=C2=A0 guests with -mac99,via=3Dpmu, the guest is pres=
ented with a usb-mouse and usb-kbd, while -mac99 provides cuda mouse/kbd.<b=
r></div><div><br></div><div>If I run with via=3Dpmu, the mouse/kbd will not=
 work when passing through the usb headset. <br></div><div>Only when I keep=
 interrupting by pressing a volume button on the headset, the mouse moves. =
So it seems Qemu does not iterate getting interrupts over multiple devices.=
 <br></div><div><br></div><div>Best,</div><div>Howard<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
</blockquote></div>

--000000000000a8dbb305cd812b64--

