Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367441AD1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:37:46 +0200 (CEST)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAUb-0002mi-3R
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mVAT3-00021s-K3
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:36:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mVAT0-0006Si-Aq
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:36:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so57225114wrb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CFdlpVeUOXEg/zbH7BA0CIyT++FiDHly+vDp5PMGBuU=;
 b=CeMIZBvZgysuSzUbpbKdTi/BxsmBEIAQWRCWx0qdM9jw482NQlgULWj9DhCI/T4Ohk
 eWHqkRXRH41ivPfD8MGe6BvPyvLKNfo44QPHJxssjOG18QBP7jqq/R0LVbYF/xcC3iUn
 fs1P80FJ28IyypgA9qx3BPI+cqNizp8KHzC7vjfOmcj1viCHhYzi2OF1DswApYt3XxRg
 jsC2z8yo/N0MyczX095jGlJGn4KEQg+cxkhukBnd4uYzx3pS5R39pAso6e2Xvr03egVT
 0u7sNdXQ/bHHVJQ7KO1xugYKtUR9gxXW6KzTJ4BmghiX6rz8KtikMJSrA0Srm1kkU4Ma
 pOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFdlpVeUOXEg/zbH7BA0CIyT++FiDHly+vDp5PMGBuU=;
 b=8O724Ucu9zbtdXPGLrEWjrH6h+iHDqg+WP1A0t+laYfzS1kr3JKyy5Bjhd/3W7W7Il
 6EhqHrDFQAkY+DmlW1RhRQX2NaGwIzLJxqSV2hwrtrwdDIrW4qxwBG6Ujq9HuU8a9ADd
 kcczk2tTgz1obFEbQtqUxYJCRV6W8m8F4aEthU8jy9xumVrg6w2hvALXzYm+Vk9zuh+B
 ZQZ4ES02QNHCxA651dyZz19nyFsw3vk0nXAC2VRANn0qZNcTxKyejud/TOfUhwViu/xd
 YqUePeO29uZsnVuIBanjNpOjcYBEv0dJxLiQSyjrjPOC8nyyMdEPGQCt4C+QfCFohM/K
 5Gqg==
X-Gm-Message-State: AOAM531yHgLN3q25ooYPixUGnJ31UOiY/VE5yy1ad0I5v+YLFx5fvRxy
 lBkvxuHOTTIGDJ+bfXjH7oFxKe5Ax6MeKb2CDgfvcg==
X-Google-Smtp-Source: ABdhPJz4o2b1DlFE/FfzKh4Knr2lIF35ZlT4Jp/+ks4lD2mKjPzb6vN99p+nw8zYL6U40/Pogm4NTxPKZlJhlQnbo04=
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr5432540wrs.55.1632825364583; 
 Tue, 28 Sep 2021 03:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210921093227.18592-1-kevin.townsend@linaro.org>
 <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
In-Reply-To: <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Tue, 28 Sep 2021 12:35:53 +0200
Message-ID: <CAFPHj6OFoYkcoQYM-LAW9gfgYpp8HY-87HXREbJ_M9B7gk=czQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d62ea605cd0bc7f4"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d62ea605cd0bc7f4
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Mon, 27 Sept 2021 at 18:39, Peter Maydell <peter.maydell@linaro.org>
wrote:

> I thought we'd agreed to implement the whole of the auto-increment
> logic, not just for specific registers ?
>

Thanks again for the feedback. Dealing with one register value at a time
(versus a buffer of response values) does simplify the code flow.

The following code appears to handle multi-byte reads correctly. I just
wanted to confirm this is what you were looking for before moving on to
the test code?

/*
 * Callback handler whenever a 'I2C_START_RECV' (read) event is received.
 */
static void lsm303dlhc_mag_read(LSM303DLHCMagState *s)
{
    /*
     * Set the LOCK bit whenever a new read attempt is made. This will be
     * cleared in I2C_FINISH. Note that DRDY is always set to 1 in this
driver.
     */
    s->sr = 0x3;
}

/*
 * Callback handler whenever a 'I2C_FINISH' event is received.
 */
static void lsm303dlhc_mag_finish(LSM303DLHCMagState *s)
{
    /*
     * Clear the LOCK bit when the read attempt terminates.
     * This bit is initially set in the I2C_START_RECV handler.
     */
    s->sr = 0x1;
}

/*
 * Low-level slave-to-master transaction handler (read attempts).
 */
static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
{
    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);

    switch (s->pointer) {
    case LSM303DLHC_MAG_REG_CRA:
        s->buf = s->cra;
        break;
    case LSM303DLHC_MAG_REG_CRB:
        s->buf = s->crb;
        break;
    case LSM303DLHC_MAG_REG_MR:
        s->buf = s->mr;
        break;
    case LSM303DLHC_MAG_REG_OUT_X_H:
        s->buf = (uint8_t)(s->x >> 8);
        break;
    case LSM303DLHC_MAG_REG_OUT_X_L:
        s->buf = (uint8_t)(s->x);
        break;
    case LSM303DLHC_MAG_REG_OUT_Z_H:
        s->buf = (uint8_t)(s->z >> 8);
        break;
    case LSM303DLHC_MAG_REG_OUT_Z_L:
        s->buf = (uint8_t)(s->z);
        break;
    case LSM303DLHC_MAG_REG_OUT_Y_H:
        s->buf = (uint8_t)(s->y >> 8);
        break;
    case LSM303DLHC_MAG_REG_OUT_Y_L:
        s->buf = (uint8_t)(s->y);
        break;
    case LSM303DLHC_MAG_REG_SR:
        s->buf = s->sr;
        break;
    case LSM303DLHC_MAG_REG_IRA:
        s->buf = s->ira;
        break;
    case LSM303DLHC_MAG_REG_IRB:
        s->buf = s->irb;
        break;
    case LSM303DLHC_MAG_REG_IRC:
        s->buf = s->irc;
        break;
    case LSM303DLHC_MAG_REG_TEMP_OUT_H:
        /* Check if the temperature sensor is enabled or not (CRA & 0x80).
*/
        if (s->cra & 0x80) {
            s->buf = (uint8_t)(s->temperature >> 8);
        } else {
            s->buf = 0;
        }
        break;
    case LSM303DLHC_MAG_REG_TEMP_OUT_L:
        if (s->cra & 0x80) {
            s->buf = (uint8_t)(s->temperature & 0xf0);
        } else {
            s->buf = 0;
        }
        break;
    default:
        s->buf = 0;
        break;
    }

    /*
     * The address pointer on the LSM303DLHC auto-increments whenever a byte
     * is read, without the master device having to request the next
address.
     *
     * The auto-increment process has the following logic:
     *
     *   - if (s->pointer == 8) then s->pointer = 3
     *   - else: if (s->pointer >= 12) then s->pointer = 0
     *   - else: s->pointer += 1
     *
     * Reading an invalid address return 0.
     */
    if (s->pointer == LSM303DLHC_MAG_REG_OUT_Y_L) {
        s->pointer = LSM303DLHC_MAG_REG_OUT_X_H;
    } else if (s->pointer >= LSM303DLHC_MAG_REG_IRC) {
        s->pointer = LSM303DLHC_MAG_REG_CRA;
    } else {
        s->pointer++;
    }

    return s->buf;
}

--000000000000d62ea605cd0bc7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Sept 2021 at 18:3=
9, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayd=
ell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">I thought we&#39;d agreed to implement the whole of the auto-=
increment<br>
logic, not just for specific registers ?<br></blockquote><div><br></div>Tha=
nks again for the feedback. Dealing with one register value at a time</div>=
<div class=3D"gmail_quote">(versus a buffer of response values) does simpli=
fy the code flow.</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">The following code appears to handle multi-byte reads correctly=
. I just</div><div class=3D"gmail_quote">wanted to confirm this is what you=
 were looking for before moving on to</div><div class=3D"gmail_quote">the t=
est code?<br><div><br></div><div>/*<br>=C2=A0* Callback handler whenever a =
&#39;I2C_START_RECV&#39; (read) event is received.<br>=C2=A0*/<br>static vo=
id lsm303dlhc_mag_read(LSM303DLHCMagState *s)<br>{<br>=C2=A0 =C2=A0 /* <br>=
=C2=A0 =C2=A0 =C2=A0* Set the LOCK bit whenever a new read attempt is made.=
 This will be<br>=C2=A0 =C2=A0 =C2=A0* cleared in I2C_FINISH. Note that DRD=
Y is always set to 1 in this driver.<br>=C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =
=C2=A0 s-&gt;sr =3D 0x3;<br>}<br><br>/*<br>=C2=A0* Callback handler wheneve=
r a &#39;I2C_FINISH&#39; event is received.<br>=C2=A0*/<br>static void lsm3=
03dlhc_mag_finish(LSM303DLHCMagState *s)<br>{<br>=C2=A0 =C2=A0 /* <br>=C2=
=A0 =C2=A0 =C2=A0* Clear the LOCK bit when the read attempt terminates.<br>=
=C2=A0 =C2=A0 =C2=A0* This bit is initially set in the I2C_START_RECV handl=
er.<br>=C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 s-&gt;sr =3D 0x1;<br>}</div>=
<div><br></div><div>/*<br>=C2=A0* Low-level slave-to-master transaction han=
dler (read attempts).<br>=C2=A0*/<br>static uint8_t lsm303dlhc_mag_recv(I2C=
Slave *i2c)<br>{<br>=C2=A0 =C2=A0 LSM303DLHCMagState *s =3D LSM303DLHC_MAG(=
i2c);<br><br>=C2=A0 =C2=A0 switch (s-&gt;pointer) {<br>=C2=A0 =C2=A0 case L=
SM303DLHC_MAG_REG_CRA:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D s-&gt;c=
ra;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_=
MAG_REG_CRB:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D s-&gt;crb;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_REG_MR=
:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D s-&gt;mr;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_REG_OUT_X_H:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D (uint8_t)(s-&gt;x &gt;&gt; 8);<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_RE=
G_OUT_X_L:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D (uint8_t)(s-&gt;x);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG=
_REG_OUT_Z_H:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D (uint8_t)(s-&gt;=
z &gt;&gt; 8);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case =
LSM303DLHC_MAG_REG_OUT_Z_L:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D (u=
int8_t)(s-&gt;z);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 ca=
se LSM303DLHC_MAG_REG_OUT_Y_H:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D=
 (uint8_t)(s-&gt;y &gt;&gt; 8);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=
=C2=A0 =C2=A0 case LSM303DLHC_MAG_REG_OUT_Y_L:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;buf =3D (uint8_t)(s-&gt;y);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;=
<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_REG_SR:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;buf =3D s-&gt;sr;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0=
 =C2=A0 case LSM303DLHC_MAG_REG_IRA:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;b=
uf =3D s-&gt;ira;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 ca=
se LSM303DLHC_MAG_REG_IRB:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D s-&=
gt;irb;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303D=
LHC_MAG_REG_IRC:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =3D s-&gt;irc;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_RE=
G_TEMP_OUT_H:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if the temperature se=
nsor is enabled or not (CRA &amp; 0x80). */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (s-&gt;cra &amp; 0x80) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-=
&gt;buf =3D (uint8_t)(s-&gt;temperature &gt;&gt; 8);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;buf =
=3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>=C2=A0 =C2=A0 case LSM303DLHC_MAG_REG_TEMP_OUT_L:<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (s-&gt;cra &amp; 0x80) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 s-&gt;buf =3D (uint8_t)(s-&gt;temperature &amp; 0xf0);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;buf =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 default:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
s-&gt;buf =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 }<b=
r><br>=C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 =C2=A0* The address pointer on the =
LSM303DLHC auto-increments whenever a byte<br>=C2=A0 =C2=A0 =C2=A0* is read=
, without the master device having to request the next address.<br>=C2=A0 =
=C2=A0 =C2=A0*<br>=C2=A0 =C2=A0 =C2=A0* The auto-increment process has the =
following logic:<br>=C2=A0 =C2=A0 =C2=A0*<br>=C2=A0 =C2=A0 =C2=A0* =C2=A0 -=
 if (s-&gt;pointer =3D=3D 8) then s-&gt;pointer =3D 3<br>=C2=A0 =C2=A0 =C2=
=A0* =C2=A0 - else: if (s-&gt;pointer &gt;=3D 12) then s-&gt;pointer =3D 0<=
br>=C2=A0 =C2=A0 =C2=A0* =C2=A0 - else: s-&gt;pointer +=3D 1<br>=C2=A0 =C2=
=A0 =C2=A0*<br>=C2=A0 =C2=A0 =C2=A0* Reading an invalid address return 0.<b=
r>=C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 if (s-&gt;pointer =3D=3D LSM303DL=
HC_MAG_REG_OUT_Y_L) { <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;pointer =3D LSM=
303DLHC_MAG_REG_OUT_X_H;<br>=C2=A0 =C2=A0 } else if (s-&gt;pointer &gt;=3D =
LSM303DLHC_MAG_REG_IRC) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;pointer =3D =
LSM303DLHC_MAG_REG_CRA;<br>=C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;pointer++;<br>=C2=A0 =C2=A0 } <br><br>=C2=A0 =C2=A0 return s-&=
gt;buf;<br>}</div></div></div>

--000000000000d62ea605cd0bc7f4--

