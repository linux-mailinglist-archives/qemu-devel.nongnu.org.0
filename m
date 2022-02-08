Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F754AE26E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:48:22 +0100 (CET)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWTN-0004Hp-6G
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nHUqI-0003IF-26
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:03:54 -0500
Received: from [2a00:1450:4864:20::236] (port=36856
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nHUqF-0002nh-9C
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:03:53 -0500
Received: by mail-lj1-x236.google.com with SMTP id j14so60051lja.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 10:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvO7aXxHuo4TqNYcWBh9NPbrtlj5hd51105+ivRzLIo=;
 b=nu4qRtt+Q5///hzL9Kh3wEkETq/fI4Dxc+sFsmWHQtCsYUeop1XnSP7ZViMhG2uNj4
 hi6UDvwk97uhBMpDiGF9EI8ooAy+prqHgQRMVsU4AopNByBZFqugZAIGdZ1TLXUMx7ut
 m9gZyy8VrviGOOP86LIHycexSvBOGOhsOxFM1NJ0rs9EMimEsEuI2mBEdikw5Kb5GyMU
 ONqxhpapulmcfHp6C0LWjBj9q8Z8+h0QmF/zi6KN5UsKgGv/lIoaYtC3yIGVknM6oLbH
 /+d839NJNDLV6n8VbajH8w2ukcbvI/rLbQN24v3BTVdcYb7DWTBHxs36XHLyB8qF+FGf
 SVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvO7aXxHuo4TqNYcWBh9NPbrtlj5hd51105+ivRzLIo=;
 b=8Ajkf4p/uFDdfN73om+LwJx4r92dsBtqQzwfHBUnPb29aRU28VoFTe3hoTpkwzNVjI
 XE7lTzwS8OrNLM6q1Ggtz+HCqI4kjkn+rxu2ou91osBT+1WhpKljUrA9qw9EjBkI59Fh
 pt/qqZZdDK8zFudMzBypHRzxaMUM/5MwKg+Lr+MLTE9GhcVubqGpLcL6t3u26mSvqS37
 hGihB/Qp3DXjEitJvxEyYHQORJfKBK5j235sT+9TpP6OVfhXrTqS8nsUejFEWBsRX7CJ
 7+u+qWNUsVwVP4Uf8CKruYEzhmfLl6LYEDPcVoVUt2FxGCd6yYpHbaC4Xkovrp8Z1LwA
 xvpQ==
X-Gm-Message-State: AOAM531zdZWmeExsCK7hiWFYG5kt1KAdYkhPIqI+qBNCzP//AIkRiFS8
 IPD8VdjUGcOu63eJvX77fuvksQN+QVh1YS1WVRu9Ig==
X-Google-Smtp-Source: ABdhPJw3Rx9fztns1SeBRIUDWpNRLeRzbrEwuWkMxs8x6GwhPTDZVIwOf/G3LB61DTFHKiL4X0p804BOjHveSphH7UE=
X-Received: by 2002:a05:651c:1247:: with SMTP id
 h7mr3544346ljh.207.1644343427139; 
 Tue, 08 Feb 2022 10:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
 <20220208155911.3408455-2-peter.maydell@linaro.org>
In-Reply-To: <20220208155911.3408455-2-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 8 Feb 2022 10:03:35 -0800
Message-ID: <CAGcCb10fkz+-Eu1uJG+W74KWtzC9wCqJseCX431QiWRYZ3+Sgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Kconfig: Add I2C_DEVICES device group
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ddc3c905d78589de"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000ddc3c905d78589de
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 9:55 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Currently there is no way for a board model's Kconfig stanza to
> say "I have an i2c bus which the user can plug an i2c device into,
> build all the free-standing i2c devices". The Kconfig mechanism
> for this is the "device group". Add an I2C_DEVICES group along
> the same lines as the existing PCI_DEVICES. Simple free-standing
> i2c devices which a user might plausibly want to be able to
> plug in on the QEMU commandline should have
>    default y if I2C_DEVICES
> and board models which have an i2c bus that is user-accessible
> should use
>    imply I2C_DEVICES
> to cause those pluggable devices to be built.
>
> In this commit we mark only a fairly conservative set of i2c devices
> as belonging to the I2C_DEVICES group: the simple sensors and RTCs
> (not including PMBus devices or devices which need GPIO lines to be
> connected).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
> Feel free to suggest other i2c devices that should be marked
> as in the group; as I say, I erred on the side of not putting
> devices in the group.
> ---
>  docs/devel/kconfig.rst | 8 ++++++--
>  hw/i2c/Kconfig         | 5 +++++
>  hw/rtc/Kconfig         | 2 ++
>  hw/sensor/Kconfig      | 5 +++++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
> index a1cdbec7512..aa5042f1569 100644
> --- a/docs/devel/kconfig.rst
> +++ b/docs/devel/kconfig.rst
> @@ -192,11 +192,15 @@ declares its dependencies in different ways:
>    no directive and are not used in the Makefile either; they only appear
>    as conditions for ``default y`` directives.
>
> -  QEMU currently has two device groups, ``PCI_DEVICES`` and
> -  ``TEST_DEVICES``.  PCI devices usually have a ``default y if
> +  QEMU currently has three device groups, ``PCI_DEVICES``,
> ``I2C_DEVICES``,
> +  and ``TEST_DEVICES``.  PCI devices usually have a ``default y if
>    PCI_DEVICES`` directive rather than just ``default y``.  This lets
>    some boards (notably s390) easily support a subset of PCI devices,
>    for example only VFIO (passthrough) and virtio-pci devices.
> +  ``I2C_DEVICES`` is similar to ``PCI_DEVICES``. It contains i2c devices
> +  that users might reasonably want to plug in to an i2c bus on any
> +  board (and not ones which are very board-specific or that need
> +  to be wired up in a way that can't be done on the command line).
>    ``TEST_DEVICES`` instead is used for devices that are rarely used on
>    production virtual machines, but provide useful hooks to test QEMU
>    or KVM.
> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 8217cb50411..9bb8870517f 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -1,6 +1,11 @@
>  config I2C
>      bool
>
> +config I2C_DEVICES
> +    # Device group for i2c devices which can reasonably be user-plugged
> +    # to any board's i2c bus
> +    bool
> +
>  config SMBUS
>      bool
>      select I2C
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index f06e133b8a2..730c272bc54 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -1,10 +1,12 @@
>  config DS1338
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config M41T80
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config M48T59
>      bool
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index b317f91b7b4..215944decc7 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -1,18 +1,22 @@
>  config TMP105
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config TMP421
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config DPS310
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config EMC141X
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
>
>  config ADM1272
>      bool
> @@ -25,3 +29,4 @@ config MAX34451
>  config LSM303DLHC_MAG
>      bool
>      depends on I2C
> +    default y if I2C_DEVICES
> --
> 2.25.1
>
>
>

--000000000000ddc3c905d78589de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 9:55 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Currently there is no way for a board model&#39;s Kconfig stanza to<br=
>
say &quot;I have an i2c bus which the user can plug an i2c device into,<br>
build all the free-standing i2c devices&quot;. The Kconfig mechanism<br>
for this is the &quot;device group&quot;. Add an I2C_DEVICES group along<br=
>
the same lines as the existing PCI_DEVICES. Simple free-standing<br>
i2c devices which a user might plausibly want to be able to<br>
plug in on the QEMU commandline should have<br>
=C2=A0 =C2=A0default y if I2C_DEVICES<br>
and board models which have an i2c bus that is user-accessible<br>
should use<br>
=C2=A0 =C2=A0imply I2C_DEVICES<br>
to cause those pluggable devices to be built.<br>
<br>
In this commit we mark only a fairly conservative set of i2c devices<br>
as belonging to the I2C_DEVICES group: the simple sensors and RTCs<br>
(not including PMBus devices or devices which need GPIO lines to be<br>
connected).<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div>R=
eviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@goog=
le.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
Feel free to suggest other i2c devices that should be marked<br>
as in the group; as I say, I erred on the side of not putting<br>
devices in the group.<br>
---<br>
=C2=A0docs/devel/kconfig.rst | 8 ++++++--<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0hw/rtc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A04 files changed, 18 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst<br>
index a1cdbec7512..aa5042f1569 100644<br>
--- a/docs/devel/kconfig.rst<br>
+++ b/docs/devel/kconfig.rst<br>
@@ -192,11 +192,15 @@ declares its dependencies in different ways:<br>
=C2=A0 =C2=A0no directive and are not used in the Makefile either; they onl=
y appear<br>
=C2=A0 =C2=A0as conditions for ``default y`` directives.<br>
<br>
-=C2=A0 QEMU currently has two device groups, ``PCI_DEVICES`` and<br>
-=C2=A0 ``TEST_DEVICES``.=C2=A0 PCI devices usually have a ``default y if<b=
r>
+=C2=A0 QEMU currently has three device groups, ``PCI_DEVICES``, ``I2C_DEVI=
CES``,<br>
+=C2=A0 and ``TEST_DEVICES``.=C2=A0 PCI devices usually have a ``default y =
if<br>
=C2=A0 =C2=A0PCI_DEVICES`` directive rather than just ``default y``.=C2=A0 =
This lets<br>
=C2=A0 =C2=A0some boards (notably s390) easily support a subset of PCI devi=
ces,<br>
=C2=A0 =C2=A0for example only VFIO (passthrough) and virtio-pci devices.<br=
>
+=C2=A0 ``I2C_DEVICES`` is similar to ``PCI_DEVICES``. It contains i2c devi=
ces<br>
+=C2=A0 that users might reasonably want to plug in to an i2c bus on any<br=
>
+=C2=A0 board (and not ones which are very board-specific or that need<br>
+=C2=A0 to be wired up in a way that can&#39;t be done on the command line)=
.<br>
=C2=A0 =C2=A0``TEST_DEVICES`` instead is used for devices that are rarely u=
sed on<br>
=C2=A0 =C2=A0production virtual machines, but provide useful hooks to test =
QEMU<br>
=C2=A0 =C2=A0or KVM.<br>
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig<br>
index 8217cb50411..9bb8870517f 100644<br>
--- a/hw/i2c/Kconfig<br>
+++ b/hw/i2c/Kconfig<br>
@@ -1,6 +1,11 @@<br>
=C2=A0config I2C<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config I2C_DEVICES<br>
+=C2=A0 =C2=A0 # Device group for i2c devices which can reasonably be user-=
plugged<br>
+=C2=A0 =C2=A0 # to any board&#39;s i2c bus<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config SMBUS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig<br>
index f06e133b8a2..730c272bc54 100644<br>
--- a/hw/rtc/Kconfig<br>
+++ b/hw/rtc/Kconfig<br>
@@ -1,10 +1,12 @@<br>
=C2=A0config DS1338<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config M41T80<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config M48T59<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig<br>
index b317f91b7b4..215944decc7 100644<br>
--- a/hw/sensor/Kconfig<br>
+++ b/hw/sensor/Kconfig<br>
@@ -1,18 +1,22 @@<br>
=C2=A0config TMP105<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config TMP421<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config DPS310<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config EMC141X<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
<br>
=C2=A0config ADM1272<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
@@ -25,3 +29,4 @@ config MAX34451<br>
=C2=A0config LSM303DLHC_MAG<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 default y if I2C_DEVICES<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ddc3c905d78589de--

