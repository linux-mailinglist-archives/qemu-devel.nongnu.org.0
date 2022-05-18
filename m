Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3EC52B1CB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 07:13:54 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrC0P-00085t-0U
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 01:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1nrBwy-0007CU-JN
 for qemu-devel@nongnu.org; Wed, 18 May 2022 01:10:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1nrBww-0003zj-Fh
 for qemu-devel@nongnu.org; Wed, 18 May 2022 01:10:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id t6so988804wra.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 22:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZBuAbEZEYrCBcq6gTSxvqqQjx3m6CxlK4Ti8lkE/HI=;
 b=L7S7APDU3209febB2pYeprlE1ycH+uJ8WzKGGLvPvZug4EwSQEERMVB/o+YA5UgIJI
 WJzETlpsDDYu/X41W5v83SkHSWbfC1w2NNrSmyLpi5rMMj+slXG+vv7eVYvYukPn5jY1
 VSYRJMGX4eMwKlnPZjcyvPZ32UV7OljRknS9Ysqb8XWsJuhCf2+rbP50xFdmqQBSYMK7
 vtlvWVVQmcAdVyiLZiVCDBMy3Iy3vqEieJBoFy9bsngW8hzljKhQAnGnJy27La7PT4Kw
 jvjoEe1oO9eSJEOIsMD5/hPR2ENbO5zPgT+wftuT4o6vho8L62vEszTX/5wODjv+MtUI
 zAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZBuAbEZEYrCBcq6gTSxvqqQjx3m6CxlK4Ti8lkE/HI=;
 b=wRK4MSKsd8Saq+M08swEJMSO+8Qy2JmsfRGvfLtgXBvdVKzwf9QJ0pdeaNqVrDHZWK
 sDf/F9OlllRjRgYRAKKu1ztQy20FQiiLHZtzVx+tjYMQ3QqMUyCDNiKQc9AUE/Pzg22q
 0uvZXLZZxZY6/eIsLcpE4QZyCzRKcm/aIAQwKOlQEVM5fa8/kIwIwSZA7qsPYzr/L1qh
 EDHlkKU7oh0xIgg98JjGsim1Hc1djmyljvapeSbQxSm3IjX83p/EjgZwy5l3x1YK1OdI
 cWNvdX4nJAPUwCubm38h6Oe7DfzMaBFqjCc47ant7kXCS2vmqTShnzBaxtmwmSyRxMX9
 BjPg==
X-Gm-Message-State: AOAM532v1/6SuoM57sv52WOGaVbPDWcfxi8bCbPTC1Zd7CZSIIt7EtDn
 0E2KbXS2ZOaiIg6PSFipgC1Xa2VYtZsDAqFjIIk=
X-Google-Smtp-Source: ABdhPJyQgDHwLMYkiWelaWmizRyCMMQs30bJPDrAngrh8/5oMPg/UvG3GtcMZwwOkPYeO9b9jCmUp+gOGMMWGBczTA0=
X-Received: by 2002:adf:e5cf:0:b0:20d:80e:1624 with SMTP id
 a15-20020adfe5cf000000b0020d080e1624mr11511186wrn.365.1652850613862; Tue, 17
 May 2022 22:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <41ad928a29254bde80bef091fef72d36@baidu.com>
In-Reply-To: <41ad928a29254bde80bef091fef72d36@baidu.com>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Wed, 18 May 2022 13:10:02 +0800
Message-ID: <CADak6y4iuNvG6jkTrKQs6sJ-SxHxq7Ct0NmfmoEmHAmCha388w@mail.gmail.com>
Subject: Re: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
To: "Wang,Liang(ACG CCN01)" <wangliang40@baidu.com>
Cc: "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b4c2cd05df424555"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=wlfightup@gmail.com; helo=mail-wr1-x435.google.com
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

--000000000000b4c2cd05df424555
Content-Type: text/plain; charset="UTF-8"

pin

On Mon, May 16, 2022 at 9:54 PM Wang,Liang(ACG CCN01) <wangliang40@baidu.com>
wrote:

> When vfio-pci devices are attached to the downstream, pcie acs
>
> capability may be needed, Consistent with physical machine.
>
>
> It has been tested in our environment, and pcie acs capability
>
> is required in some scenarios.
>
>
> Signed-off-by: wangliang <wangliang40@baidu.com>
>
> ---
>
>  hw/pci-bridge/xio3130_downstream.c | 4 ++++
>
>  1 file changed, 4 insertions(+)
>
>
> diff --git a/hw/pci-bridge/xio3130_downstream.c
> b/hw/pci-bridge/xio3130_downstream.c
>
> index 05e2b06c0c..6ab13b47e2 100644
>
> --- a/hw/pci-bridge/xio3130_downstream.c
>
> +++ b/hw/pci-bridge/xio3130_downstream.c
>
> @@ -40,6 +40,8 @@
>
>  #define XIO3130_SSVID_SSID              0
>
>  #define XIO3130_EXP_OFFSET              0x90
>
>  #define XIO3130_AER_OFFSET              0x100
>
> +#define XIO3130_ACS_OFFSET \
>
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>
>
>  static void xio3130_downstream_write_config(PCIDevice *d, uint32_t
> address,
>
>                                           uint32_t val, int len)
>
> @@ -111,6 +113,8 @@ static void xio3130_downstream_realize(PCIDevice *d,
> Error **errp)
>
>          goto err;
>
>      }
>
>
> +
>
> +    pcie_acs_init(d, XIO3130_ACS_OFFSET);
>
>      return;
>
>
>  err:
>
> --
>
> 2.24.3 (Apple Git-128)
>
>

--000000000000b4c2cd05df424555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">pin</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, May 16, 2022 at 9:54 PM Wang,Liang(ACG CCN01) &=
lt;<a href=3D"mailto:wangliang40@baidu.com">wangliang40@baidu.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div id=3D"gmail-m_-1673446777185389786divtagdefaultwrapper" style=3D"font-=
size:12pt;color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif" dir=3D=
"ltr">
<p></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">When vfio-pci de=
vices are attached to the downstream, pcie acs</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">capability may b=
e needed, Consistent with physical machine.</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">It has been test=
ed in our environment, and pcie acs capability</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">is required in s=
ome scenarios.</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">Signed-off-by: w=
angliang &lt;<a href=3D"mailto:wangliang40@baidu.com" target=3D"_blank">wan=
gliang40@baidu.com</a>&gt;</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">---</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>hw/pci-bridge/xio3130_downstream.c | 4 ++++</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>1 file changed, 4 insertions(+)</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">diff --git a/hw/=
pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c</span>=
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">index 05e2b06c0c=
..6ab13b47e2 100644</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">--- a/hw/pci-bri=
dge/xio3130_downstream.c</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">+++ b/hw/pci-bri=
dge/xio3130_downstream.c</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">@@ -40,6 +40,8 @=
@</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>#define XIO3130_SSVID_SSID<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
</span>0</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>#define XIO3130_EXP_OFFSET<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
</span>0x90</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>#define XIO3130_AER_OFFSET<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
</span>0x100</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">+#define XIO3130=
_ACS_OFFSET \</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">+<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0
</span>(XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>static void xio3130_downstream_write_config(PCIDevice *d, uint32_t addre=
ss,</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
</span>uint32_t val, int len)</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">@@ -111,6 +113,8=
 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)</spa=
n></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0
</span>goto err;</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0=C2=
=A0 =C2=A0
</span>}</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">+</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">+<span>=C2=A0 =
=C2=A0
</span>pcie_acs_init(d, XIO3130_ACS_OFFSET);</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0=C2=
=A0 =C2=A0
</span>return;</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo;min-height:13px">
<span style=3D"font-variant-ligatures:no-common-ligatures"></span><br>
</p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0</sp=
an>err:</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">--</span></p>
<p style=3D"margin-right:0px;margin-left:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo">
<span style=3D"font-variant-ligatures:no-common-ligatures">2.24.3 (Apple Gi=
t-128)</span></p>
<br>
<p></p>
</div>
</div>

</blockquote></div>

--000000000000b4c2cd05df424555--

