Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEE557EB0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:34:37 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Oqq-0008Qc-BF
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4OlF-00048H-SN
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:28:49 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4OlC-0000jh-UM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:28:49 -0400
Received: by mail-ua1-x92d.google.com with SMTP id 75so6011422uav.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/al4SC9ETDnXMlQMUYXIugxttS8K4Odi6fLvPdUCb0=;
 b=i3HGxgF2I0Fsgzfp/3vJACIWuRMt4ccNuSHn9Cyd4fPgXbl18jGdeo7iVm7HubnOLP
 TpudPUW7EIUdhu3JVVXd3Uuq1gPRwSNQQf1oKyLm/GxoayGVBQk/qOsX0Mz1a6YxsPT8
 hKgoofdUc5sV1Y7WiXX4jgPEo4L6vZtgJGmSGVyFrFUpW34AX+UExZ5u+QRFOpKwpC3r
 fdNM0QJTWyGjt+3xFz10Bz9z7Zg2VIIsZh6kEUscubn8mv3atY1eZ8Xuv2eKhUTsytH/
 Ieb9vfRpZVzdB5QJZbQeZOdpZR4Vj6HkWd7+M2NnQP3idABAFcvvd6WbDx8qebshfTBo
 YauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/al4SC9ETDnXMlQMUYXIugxttS8K4Odi6fLvPdUCb0=;
 b=UtdDqmmJAx2N6GAX5CIwZu0PP/4ZRQ5RgBWOvGc0EN9ky48uHfGfB+UnavjN8DPnDH
 KmUSI0n/oB3E9ZnVNjPPKsGmvZzLmzYPlUrtP8GWgo34UlmaFNKnOrw2Jktr2yGDDon2
 3xnkqy01BlncZQyeRY40h2cw4MQo5PNCXS1kmVsV7qiO4r11yiQXZI1z3QaTIExTJfl0
 IQ/2bF0GOi4BTTCz2DuKpC00sgB35gNznbOzIOd70PSsK8fmKGPRWk+JagHeJMA6j1bW
 ulO7vBCgzDTH0C8L6MSC0tcI/WtjRzOT68ddATo71hbT3wjdBYEpgGARNYmffoyJ398U
 jevw==
X-Gm-Message-State: AJIora/Fo4lZTJz5QIurmc1t/uUlpg7GQVwQX8phA7qN1LRDz/U6CAua
 2b0aKdA6xMarF17tfwMoblz0Tv334Qz/qIYkkbjLhw==
X-Google-Smtp-Source: AGRyM1uTYK4YX25OTOROXi55pLVIpr6p8aTtOhEKpJwuhj44nMy5uGmGAT6AJRjIluMRTc5y6DsPM/Q4m9aX8ZHvcso=
X-Received: by 2002:ab0:1e08:0:b0:37f:1f74:3084 with SMTP id
 m8-20020ab01e08000000b0037f1f743084mr5089903uak.39.1655998125147; Thu, 23 Jun
 2022 08:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 23 Jun 2022 08:28:34 -0700
Message-ID: <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Hao Wu <wuhaotsh@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000000037505e21f1cc2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000037505e21f1cc2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
wrote:

> From: Graeme Gregory <quic_ggregory@quicinc.com>
>
> The FRU device uses the index 0 device on bus IF_NONE.
>
> -drive file=$FRU,format=raw,if=none
>
> file must match FRU size of 128k
>
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> ---
>  hw/arm/aspeed.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 785cc543d046..36d6b2c33e48 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>       */
>  }
>
> +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t
> rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    /* Use First Index for DC-SCM FRU */
> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
>

We've sent a similar patch up for the at24c but in its own file -- but
looking at this, we could likely expand it to suite our cases as well - is
there a reason it's named qcom_dc_scm_fru_init?  Presumably that's to
handle the drive_get parameters.  If you make it use `drive_get(IF_NONE,
bus, unit);` You'll be able to associate a drive via parameters like you
aim to.


> +
>  static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105",
> 0x4d);
>
> -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
> -    if (eeprom_buf) {
> -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
> -                              eeprom_buf);
> -    }
> +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 *
> 1024);
>  }
>
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
> --
> 2.25.1
>
>
>

--00000000000000037505e21f1cc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 22, 2022 at 10:48 AM Jae =
Hyun Yoo &lt;<a href=3D"mailto:quic_jaehyoo@quicinc.com">quic_jaehyoo@quici=
nc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Graeme Gregory &lt;<a href=3D"mailto:quic_ggregory@quicinc.com"=
 target=3D"_blank">quic_ggregory@quicinc.com</a>&gt;<br>
<br>
The FRU device uses the index 0 device on bus IF_NONE.<br>
<br>
-drive file=3D$FRU,format=3Draw,if=3Dnone<br>
<br>
file must match FRU size of 128k<br>
<br>
Signed-off-by: Graeme Gregory &lt;<a href=3D"mailto:quic_ggregory@quicinc.c=
om" target=3D"_blank">quic_ggregory@quicinc.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/aspeed.c | 22 +++++++++++++++++-----<br>
=C2=A01 file changed, 17 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
index 785cc543d046..36d6b2c33e48 100644<br>
--- a/hw/arm/aspeed.c<br>
+++ b/hw/arm/aspeed.c<br>
@@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)<b=
r>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0}<br>
<br>
+static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize=
)<br>
+{<br>
+=C2=A0 =C2=A0 I2CSlave *i2c_dev =3D i2c_slave_new(&quot;at24c-eeprom&quot;=
, addr);<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(i2c_dev);<br>
+=C2=A0 =C2=A0 /* Use First Index for DC-SCM FRU */<br>
+=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get(IF_NONE, 0, 0);<br>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;rom-size&quot;, rsize);<br>
+<br>
+=C2=A0 =C2=A0 if (dinfo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(dev, &quot;drive&quot;, bl=
k_by_legacy_dinfo(dinfo));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 i2c_slave_realize_and_unref(i2c_dev, bus, &amp;error_abort);=
<br>
+}<br></blockquote><div><br></div><div>We&#39;ve sent a similar patch up fo=
r the at24c but in its own file -- but looking at this, we could likely exp=
and it to suite our cases as well - is there a reason it&#39;s named qcom_d=
c_scm_fru_init?=C2=A0 Presumably that&#39;s to handle the drive_get paramet=
ers.=C2=A0 If you make it use `drive_get(IF_NONE, bus, unit);` You&#39;ll b=
e able to associate a drive via parameters like you aim to.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AspeedSoCState *soc =3D &amp;bmc-&gt;soc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt=
;i2c, 15), &quot;tmp105&quot;, 0x4d);<br>
<br>
-=C2=A0 =C2=A0 uint8_t *eeprom_buf =3D g_malloc0(128 * 1024);<br>
-=C2=A0 =C2=A0 if (eeprom_buf) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 smbus_eeprom_init_one(aspeed_i2c_get_bus(&amp;=
soc-&gt;i2c, 15), 0x53,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eeprom_buf);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, 15=
), 0x53, 128 * 1024);<br>
=C2=A0}<br>
<br>
=C2=A0static bool aspeed_get_mmio_exec(Object *obj, Error **errp)<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000000037505e21f1cc2--

