Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A3B592355
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 18:07:32 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNG9C-000836-GK
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 12:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNG24-0002wO-7r
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 12:00:08 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNG20-000857-Es
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 12:00:05 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-32a09b909f6so48906327b3.0
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rtWnNRG8jjzV6XSInPdCf2G2JvPGaEUi4u4vl5EJ+vs=;
 b=FHhbOIBXAzt1fqIEkWhd5WoXgWpa+Ch0wYVLDSzP2abvyRtM06MmBKXZbFvC11L2eH
 c8wmYJS4g+IBqnV4ZUDLZ/XsvVf70QAkn0/VImHTEA7Tgs23sy64sJQi/T/CfWCQavi9
 dlkoNhbFMbZf/dRkZzvhwI6ewjlTr2fuPOH00u6Bc/WF0MIWPRI3gL4ATcR6HRWTuQU4
 6eA5QXkFE3yLjStpAOVMh74OaY7semMzMNk4m0UBzLXeM3suXXWfy+ghGt8AOri8fmM3
 acFpPYJGVh9FZ2LMDeERuORhAly2HdFZxLD/djuaC0t7ndOTDaw1WpjIoa3CeRAp7ET2
 uujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rtWnNRG8jjzV6XSInPdCf2G2JvPGaEUi4u4vl5EJ+vs=;
 b=jGMb8hlypWNbTvMgH3e72HIhYYmamieCUhxjV97SDb8Lwm661FRZ+2ATkZqvXZebDD
 lC7uQRUqDPocExgg1Ie/BT+e9PFQRkqPce4DQvoJ73tAsZ/NQM6lncUKIcH/+S3stqQj
 RgDNhugDDH4in2VS+TeZYkzTLYqQv+epiyHU5nqctIofzi+VJq+thxOgSf98FPmJZ3zN
 Ugv09YpdkXKLTL4LkVEt89e4MLppqiyt3JGvyZIYP5jSFuEccxgmlvOiT2FB9r1Upf1O
 R1P9eMcmQW84TUFNM1w4+TC/rEQ81D3tm0gMIarl7PSnxssg8f/HqCfdXEjJSmUIIiz9
 bLdw==
X-Gm-Message-State: ACgBeo3/+z06fGIEXuc+vn4avDIfjb3DN3fh+aFSIj+WaPV2x/R2GF/v
 VsHc4mPhKrpxpu9tKIcbh6ApOyb8idwmwBvLNJ4=
X-Google-Smtp-Source: AA6agR596DDaf4HkvdETAxmCCzgOssFXM5N5jM+BAbFmZmInTOhGOqVtVgRzYC+OQzUY/S8vVIpUFT+xl4Zoyec2crY=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr10863921ywd.138.1660492803435; Sun, 14
 Aug 2022 09:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <CADak6y5OdAgSwCmsdghy9JarwFqeR7GtaK2pz+TSLvSiAy8PQA@mail.gmail.com>
 <20220814064705-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220814064705-mutt-send-email-mst@kernel.org>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sun, 14 Aug 2022 23:59:51 +0800
Message-ID: <CADak6y6J9hZV48im8Jknb+JtDNuWRK3HsNiHi1aL8kda-Gnpkg@mail.gmail.com>
Subject: Re: [PATCH] xio3130_upstream: Add ACS (Access Control Services)
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: marcel.apfelbaum@gmail.com, fam@euphon.net, kwolf@redhat.com, 
 stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, its@irrelevant.dk, 
 xypron.glpk@gmx.de, imammedo@redhat.com, qemu-devel@nongnu.org, 
 armbru@redhat.com, kbusch@kernel.org, hreitz@redhat.com, ani@anisinha.ca
Content-Type: multipart/alternative; boundary="000000000000b36f8505e6359bd8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x112b.google.com
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

--000000000000b36f8505e6359bd8
Content-Type: text/plain; charset="UTF-8"

What's wrong with not disabling the old version?


On Sun, Aug 14, 2022 at 6:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Sun, Aug 14, 2022 at 03:47:49PM +0800, Paul Schlacter wrote:
> > If it is a pcie device, check that all devices on the path from
> >
> > the device to the root complex have ACS enabled, and then the
> >
> > device will become an iommu_group.
> >
> > it will have the effect of isolation
> >
> >
> > Signed-off-by: wlfightup <wlfightup@gmail.com>
>
> I don't think we can do this unconditionally. Has to have
> a property and disabled for old versions.
>
> > ---
> >
> >  hw/pci-bridge/xio3130_upstream.c | 3 +++
> >
> >  1 file changed, 3 insertions(+)
> >
> >
> > diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/
> > xio3130_upstream.c
> >
> > index 5ff46ef050..2df952222b 100644
> >
> > --- a/hw/pci-bridge/xio3130_upstream.c
> >
> > +++ b/hw/pci-bridge/xio3130_upstream.c
> >
> > @@ -37,6 +37,8 @@
> >
> >  #define XIO3130_SSVID_SSID              0
> >
> >  #define XIO3130_EXP_OFFSET              0x90
> >
> >  #define XIO3130_AER_OFFSET              0x100
> >
> > +#define XIO3130_ACS_OFFSET \
> >
> > +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
> >
> >
> >  static void xio3130_upstream_write_config(PCIDevice *d, uint32_t
> address,
> >
> >                                            uint32_t val, int len)
> >
> > @@ -92,6 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d,
> Error
> > **errp)
> >
> >          goto err;
> >
> >      }
> >
> >
> > +    pcie_acs_init(d, XIO3130_ACS_OFFSET);
> >
> >      return;
> >
> >
> >  err:
> >
> > --
> >
> > 2.24.3 (Apple Git-128)
> >
>
>

--000000000000b36f8505e6359bd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-MachTrans__textWrap__1NtxT gmail-MachT=
rans__textWrapSmall__26E1Q" style=3D"padding:0px 10px 0px 0px;min-height:70=
px;max-height:none;overflow:overlay;font-size:16px;line-height:24px;color:r=
gb(0,0,0);font-family:&quot;PingFang SC&quot;,Arial,&quot;Hiragino Sans GB&=
quot;,STHeiti,&quot;Microsoft YaHei&quot;,&quot;WenQuanYi Micro Hei&quot;,s=
ans-serif;font-variant-ligatures:no-common-ligatures"><div class=3D"gmail-M=
achTrans__text__duH8w" style=3D"margin:0px;padding:0px 5px"><p style=3D"mar=
gin:0px;padding:0px"><span class=3D"gmail-MachTrans__hl__6hdYK" style=3D"ba=
ckground:rgba(255,171,25,0.3)">What&#39;s wrong with not disabling the old =
version?</span></p></div></div><div class=3D"gmail-MachTrans__textWrap__1Nt=
xT gmail-MachTrans__textWrapSmall__26E1Q gmail-MachTrans__textWrapCal__Bh8V=
h" style=3D"padding:0px 10px 0px 0px;min-height:auto;max-height:none;overfl=
ow:overlay;width:370px;opacity:0;font-size:16px;line-height:24px;color:rgb(=
0,0,0);font-family:&quot;PingFang SC&quot;,Arial,&quot;Hiragino Sans GB&quo=
t;,STHeiti,&quot;Microsoft YaHei&quot;,&quot;WenQuanYi Micro Hei&quot;,sans=
-serif;font-variant-ligatures:no-common-ligatures"><div class=3D"gmail-Mach=
Trans__text__duH8w" style=3D"margin:0px;padding:0px 5px"><br class=3D"gmail=
-Apple-interchange-newline"></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 14, 2022 at 6:48 PM Mic=
hael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun,=
 Aug 14, 2022 at 03:47:49PM +0800, Paul Schlacter wrote:<br>
&gt; If it is a pcie device, check that all devices on the path from<br>
&gt; <br>
&gt; the device to the root complex have ACS enabled, and then the<br>
&gt; <br>
&gt; device will become an iommu_group.<br>
&gt; <br>
&gt; it will have the effect of isolation<br>
&gt; <br>
&gt; <br>
&gt; Signed-off-by: wlfightup &lt;<a href=3D"mailto:wlfightup@gmail.com" ta=
rget=3D"_blank">wlfightup@gmail.com</a>&gt;<br>
<br>
I don&#39;t think we can do this unconditionally. Has to have<br>
a property and disabled for old versions.<br>
<br>
&gt; ---<br>
&gt; <br>
&gt; =C2=A0hw/pci-bridge/xio3130_upstream.c | 3 +++<br>
&gt; <br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; <br>
&gt; diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/<br>
&gt; xio3130_upstream.c<br>
&gt; <br>
&gt; index 5ff46ef050..2df952222b 100644<br>
&gt; <br>
&gt; --- a/hw/pci-bridge/xio3130_upstream.c<br>
&gt; <br>
&gt; +++ b/hw/pci-bridge/xio3130_upstream.c<br>
&gt; <br>
&gt; @@ -37,6 +37,8 @@<br>
&gt; <br>
&gt; =C2=A0#define XIO3130_SSVID_SSID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0<br>
&gt; <br>
&gt; =C2=A0#define XIO3130_EXP_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x90<br>
&gt; <br>
&gt; =C2=A0#define XIO3130_AER_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x100<br>
&gt; <br>
&gt; +#define XIO3130_ACS_OFFSET \<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0static void xio3130_upstream_write_config(PCIDevice *d, uint32_t=
 address,<br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t val, int len)<br>
&gt; <br>
&gt; @@ -92,6 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d, E=
rror<br>
&gt; **errp)<br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 pcie_acs_init(d, XIO3130_ACS_OFFSET);<br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 return;<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0err:<br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; 2.24.3 (Apple Git-128)<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000b36f8505e6359bd8--

