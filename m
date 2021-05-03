Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1091337226D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:30:47 +0200 (CEST)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldg9N-0003lY-LA
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1ldg73-0003I6-MY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:28:21 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1ldg70-0000eT-To
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:28:21 -0400
Received: by mail-vs1-xe36.google.com with SMTP id b4so3673468vst.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=utLTQd09c7makxLsakeR+iYRmWcPjuqHMuQ5L+Wqv54=;
 b=ZVPFWjCFnXpKLJLb86IUYhkLKyh1OTyebuAWmMtsritdwGsbizMID1Ff3diE0A/EjZ
 XyiafW5b7AfkKaFh+VqgeNknCL1OR06wSI8pzRN9Mphe+sY6RACjCDoid5zPU6byjFJL
 CxpXmeN/leeQ1zqf1RZDj3xppxx+5zriDa+ijWCj4UJhu1tZJgV3ZQ85nI9Nrc2jaZBx
 WLJCOqt6MD+QcjVpTAKwdmAUeTNohiTZ6dQHz53oAS+nG7wPR0w1l9OPOHFaJcK2qcYr
 V0X/e36XUph2juxNEVL53/sMg4n662knYphGsr3GqSDkiUOxIdLDmc3egh6YLrNLsO+k
 eP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=utLTQd09c7makxLsakeR+iYRmWcPjuqHMuQ5L+Wqv54=;
 b=JgrIC02Ciaq0Tx1DcM92xM2bFTChcb+yxovW2WuWgiyfQH9hzpWuwjWP8LjeOdyzGl
 IPrsHF7Kv5DIpaGroA0q/MqEvmDsRm99DwUp1Qq8WTbUgEiPl5EuJpXMGLfAxW3Cufir
 MPTwPEtAIucH8xWOuLKMh+M8nI9nuiiCJvhe3rtk99hhWr+5ITJ/n8Nw/Ohv2ECUIuDv
 KchfhvwliQbEKd5Rvyoi010IT52Qur3ADRSwNVJU1RaQRccy6mRuSxBRE2VdUld+j+qG
 SUSiACajR3wIUaDyjPhEkhQ1ZGQ4Prq9FzSOWXgTknY2jrRwkncoI3jwGQyIqcKRUnwL
 FVmQ==
X-Gm-Message-State: AOAM533DO0NzMhUb24UGGMSBVNwZi6JT+MjWwyUn6v59TDXLn1/rjDzL
 vxq5Q4oA/lpqIZhY5nm8mElWOULsxt7AjTCcRuB+QQ==
X-Google-Smtp-Source: ABdhPJw4xjQlBbApZpB+42lQuutn4l1bW7sbZejdju0+Xh28DL0KocCphUj8hvgO0qNY18AKZsp2UctEgoB7D7J6c7M=
X-Received: by 2002:a67:6184:: with SMTP id v126mr14926038vsb.52.1620077296591; 
 Mon, 03 May 2021 14:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADPb22QnVowGz2oCWk8mBtjZz-4Cuzu0z=LmfvwotG_QjbuPzQ@mail.gmail.com>
 <20210427073053.ny6fiwxdb6jkhmd2@sirius.home.kraxel.org>
In-Reply-To: <20210427073053.ny6fiwxdb6jkhmd2@sirius.home.kraxel.org>
From: Doug Evans <dje@google.com>
Date: Mon, 3 May 2021 14:27:39 -0700
Message-ID: <CADPb22Qz3E-nyvkQSaiPPpghd1bYy_+_Qm0o7DnUPXdcrv+gxw@mail.gmail.com>
Subject: Re: Ethernet-over-usb with linux guest using USB Device Controller ?
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c67a9205c173a364"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=dje@google.com; helo=mail-vs1-xe36.google.com
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

--000000000000c67a9205c173a364
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 12:31 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > Questions: Is this support in QEMU and if so got any pointers to source
> for
> > existing examples?
> > If not, any guidance on how to proceed?
>
> qemu has only usb host controller emulation, not any usb device
> controller emulation.  So you are entering new territory and there are
> no existing code exsamples, sorry.
>


Thanks. Any suggestions on how you would do it? Even just high level design
points would be helpful.

As far as implementation goes:
1) Is there a "libusb" kinda thing for devices?
  [any sort of utility library that takes the device's point of view]
2) Would it make sense to use the usbredir protocol for speaking USB over
sockets?
  [where in this case QEMU is the device and not the host]
  ref: https://www.spice-space.org/usbredir.html
3) Would it make sense to use the parts that one can from the usbredir
library?
  [ibid]

--000000000000c67a9205c173a364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Tue, Apr 27, 2021 at 12:31 AM Gerd Hoffmann &lt;<a href=3D=
"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">=C2=A0 Hi,<br>
<br>
&gt; Questions: Is this support in QEMU and if so got any pointers to sourc=
e for<br>
&gt; existing examples?<br>
&gt; If not, any guidance on how to proceed?<br>
<br>
qemu has only usb host controller emulation, not any usb device<br>
controller emulation.=C2=A0 So you are entering new territory and there are=
<br>
no existing code exsamples, sorry.<br></blockquote><div><br></div><div><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Thanks. Any su=
ggestions on how you would do it? Even just high level design points would =
be helpful.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">As far as imp=
lementation goes:</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">1) Is there a &quot;libusb&quot; kinda thing for devices?</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 [any sort of utility l=
ibrary that takes the device&#39;s point of view]</div><div class=3D"gmail_=
default" style=3D"font-size:small">2) Would it make sense to use the usbred=
ir protocol for speaking USB over sockets?</div><div class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 [where in this case QEMU is the device a=
nd not the host]</div><div class=3D"gmail_default" style=3D"font-size:small=
">=C2=A0 ref: <a href=3D"https://www.spice-space.org/usbredir.html">https:/=
/www.spice-space.org/usbredir.html</a></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">3) Would it make sense to use the parts that one ca=
n from the usbredir library?</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 [ibid]</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0=C2=A0</div></div></div>

--000000000000c67a9205c173a364--

