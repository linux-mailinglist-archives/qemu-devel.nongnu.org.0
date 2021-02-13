Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D031A8D3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:36:30 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAivF-0006TJ-DI
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lAitV-00060f-Ob
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:34:41 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:34744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lAitT-0003PG-Q3
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:34:41 -0500
Received: by mail-ua1-x92d.google.com with SMTP id 67so513416uao.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wgrUowX1rnKP1a2a5D/RK9weMVlGh686R5oOXiMhg/4=;
 b=irFMwwqvjl0jYmB70AW7w7pgmrmsehChF+aL7pzwckT1YGbbCOKgJfxWK+aoLydAX7
 nuyIZqYb+w8tqQAnYURNA8SDSKV66Mp9uTmkUIMOuDA2AhE8OyE3DDsddhPtNe2Trw3Y
 kWxAyXMabcUbSaK+23ILaRNAgmzTnQK/YnaqQPda3v/OJ+LaESBHmoHwIo4j5cvAPc8x
 CMLwoBiS7iCfuqi5SiDvnB2V5lED0Pl3lAbZymB8JfVQ+GfqmltqFZzvngdKKAtBtgoW
 5MIfLSCblyKw+ULDX7q404Cz5LTHP1s3qm9uJWPcZ0t/rr2+77oe2eRTE3+UgUadSTVR
 eHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wgrUowX1rnKP1a2a5D/RK9weMVlGh686R5oOXiMhg/4=;
 b=Ff1lt5ZLZFNf/e3utl2E3ls1AhMUI+KSKl8kQO90O4GTTqi7VlcvkP4pTo0sBAz13k
 sevjOWklYuDVSVbvt668L+f1iKNaHLUjaSsj/6/f5NrAEOD5qdFfpsYUciuV0KYpgz8M
 PravnbFkKvkw9H+NHhg8SczCLJeWXp8M0QlBd9DrOrgamPL47Y9+le1q1svPVk4zyX1W
 2C6/M7XOVp/sXlu0Gbl1+elm/GSZh5/7jI3VhTJ2FiEUOltUGnSv6LjQRsTxjulfbroC
 cDNMOmKKNYnz2ONfYmAXqlbI0hlj6wc6uljnQlPgGDj+1y3emTMEUFggAPhkds81bxsh
 6EmQ==
X-Gm-Message-State: AOAM530y0VqigSojRQ+ikO2LSkQcbgGTPrwIHaeCAHDYCgP/wNevgFAT
 K+XLAJJo5EppOLNqjpw6B9q+g13GJsniv9bxHltBkw==
X-Google-Smtp-Source: ABdhPJwNPs5x6JE+I3OsDZmc2Jd4iGhyeksyFz20y0ojNjTPRxBmTyu4wRsp6AFVFd+STU71duxUJ4PKKegmqwfYilY=
X-Received: by 2002:ab0:2b95:: with SMTP id q21mr3758344uar.22.1613176476451; 
 Fri, 12 Feb 2021 16:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20210209015541.778833-1-dje@google.com>
 <CAFEAcA-h_w9j3nEKo-1aBdM-XNFKx+-bn33=5vzWd5FJ6Ly+TA@mail.gmail.com>
 <CAFEAcA_FHPco660spQKKma4m8V1ZCky-hGBZvWOsWaJ4yvwOtA@mail.gmail.com>
In-Reply-To: <CAFEAcA_FHPco660spQKKma4m8V1ZCky-hGBZvWOsWaJ4yvwOtA@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Fri, 12 Feb 2021 16:33:59 -0800
Message-ID: <CADPb22Q7V4Y39adkoD8KsY=-Byp_sZ9r9vQunKAcCtM9VAiX5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add npcm7xx emc model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000d726bb05bb2cea1a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=dje@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000d726bb05bb2cea1a
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 11:48 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 11 Feb 2021 at 11:34, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Tue, 9 Feb 2021 at 01:55, Doug Evans <dje@google.com> wrote:
> > >
> > > This is a 10/100 ethernet device that has several features.
> > > Only the ones needed by the Linux driver have been implemented.
> > > See npcm7xx_emc.c for a list of unimplemented features.
> > >
> > > Doug Evans (3):
> > >   hw/net: Add npcm7xx emc model
> > >   hw/arm: Add npcm7xx emc model
> > >   tests/qtests: Add npcm7xx emc model test
> > >
> >
> >
> >
> > Applied to target-arm.next, thanks.
>
> Dropped again; the new tests fail on big-endian hosts (s390x, ppc64):
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-arm tests/qtest/npcm7xx_emc-test --tap
> -k
> PASS 1 qtest-arm/npcm7xx_emc-test /arm/npcm7xx_emc/emc[0]/init
> **
> ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:
> assertion failed ((result_desc.status_and_length & expected_mask) ==
> expected_value): (0x00000000 == 0x00080000)
> ERROR qtest-arm/npcm7xx_emc-test - Bail out!
> ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:
> assertion failed ((result_desc.status_and_length & expected_mask) ==
> expected_value): (0x00000000 == 0x00080000)
>


Fixed in V4:
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg04529.html

--000000000000d726bb05bb2cea1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Feb 11, 2021 at 11:48 AM Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<b=
r></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, 11 Feb 2021 at 11:34, Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 9 Feb 2021 at 01:55, Doug Evans &lt;<a href=3D"mailto:dje@goog=
le.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is a 10/100 ethernet device that has several features.<br>
&gt; &gt; Only the ones needed by the Linux driver have been implemented.<b=
r>
&gt; &gt; See npcm7xx_emc.c for a list of unimplemented features.<br>
&gt; &gt;<br>
&gt; &gt; Doug Evans (3):<br>
&gt; &gt;=C2=A0 =C2=A0hw/net: Add npcm7xx emc model<br>
&gt; &gt;=C2=A0 =C2=A0hw/arm: Add npcm7xx emc model<br>
&gt; &gt;=C2=A0 =C2=A0tests/qtests: Add npcm7xx emc model test<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Applied to target-arm.next, thanks.<br>
<br>
Dropped again; the new tests fail on big-endian hosts (s390x, ppc64):<br>
<br>
MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}<br>
QTEST_QEMU_IMG=3D./qemu-img<br>
G_TEST_DBUS_DAEMON=3D/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh<br>
QTEST_QEMU_BINARY=3D./qemu-system-arm tests/qtest/npcm7xx_emc-test --tap<br=
>
-k<br>
PASS 1 qtest-arm/npcm7xx_emc-test /arm/npcm7xx_emc/emc[0]/init<br>
**<br>
ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:<br>
assertion failed ((result_desc.status_and_length &amp; expected_mask) =3D=
=3D<br>
expected_value): (0x00000000 =3D=3D 0x00080000)<br>
ERROR qtest-arm/npcm7xx_emc-test - Bail out!<br>
ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:<br>
assertion failed ((result_desc.status_and_length &amp; expected_mask) =3D=
=3D<br>
expected_value): (0x00000000 =3D=3D 0x00080000)<br></blockquote><div><br></=
div><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">F=
ixed in V4: <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/202=
1-02/msg04529.html">https://lists.nongnu.org/archive/html/qemu-devel/2021-0=
2/msg04529.html</a></div></div></div>

--000000000000d726bb05bb2cea1a--

