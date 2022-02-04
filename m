Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA544A9A6B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:57:01 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFz5A-0000ty-Ca
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nFz1H-0007P2-JN
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:52:59 -0500
Received: from [2a00:1450:4864:20::535] (port=36732
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nFz1F-0003Fl-1T
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:52:59 -0500
Received: by mail-ed1-x535.google.com with SMTP id l5so13273461edv.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 05:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HSLaBZfCNKEf76QZsK+ebuKgBeCTAZSW8LC/5sqKFqs=;
 b=kF6zHU46KIPsIwsiWQYZC5S5a6Q46yQ1d/krAfWcgh3Kcujrg2kiXaa1RLpyMI8Uer
 XnExPrjyIgrBKs6gbBjqZKsa+7ErT0hd30p2fGTZIjHibHQYIEEMxlSB/w8Z9eJC7V5o
 iXUvxUwzmCnBta3h/drScF7eag0hEbGTSruV7iHcx0l4nVRBcBa9ACBKAGLy0AaiulBI
 9drerlxtx20CHVebi/V5wm1gvL6BXLNUmO8czejrWE2mXfVT6/vV8h2HZ+aFMCXR1ulD
 rbofASPVPkG1qeaz7ld5+EnleCEltA+y/WfjCIZ350L5F9go0V1iZLjCYZGCCescXAG0
 FNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HSLaBZfCNKEf76QZsK+ebuKgBeCTAZSW8LC/5sqKFqs=;
 b=Xp97TeKS0cU48ygppd1skQBTXyMQUSEJOETSbt4cfte1rgaNK7Li4mGPa1+11RIrRN
 FXe1mUtv0StO2yM1HYv0MmiDTFuFYQDOd07kvQQTl7NXYuNibdAiUNqwFIEcokQChaWJ
 iMJsref95JwRgft0fpxNoQLHa+IIZcBILy7HoHPLkrdRY+EhaY/NsN4kFP+5jVw1azhx
 PkP7vQ43kxnSPing9Xt3sqcREvAh7fMGIicS93nx7lJT2/D21qvVWyNEWFEHDiajVWr5
 mJiVeA9O7pn0c7UxANgU1JKNlivvPr9tDsQScAXTBfSBQj3qZM1+ZtKbuZJyI7EEhlh8
 epkw==
X-Gm-Message-State: AOAM533cnwxVKVNJLfuuHDhrXSDEbnKsMAE4yYiFDjF9Z0UZ7s7HLWUo
 UohE6+9FnFhF/acjA/IcD4I2HGsX3kKo1EK35DQ11A==
X-Google-Smtp-Source: ABdhPJz3XcbwvvSZZ9XTCONGA5FASerA8WpFD73uqV0KyQb0z4o7Vx5N+gOxmu91qlz/hwa0nja/YvB2r+6qgFAcpXY=
X-Received: by 2002:aa7:da07:: with SMTP id r7mr3226071eds.246.1643982774402; 
 Fri, 04 Feb 2022 05:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
 <20220204110558.h3246jyelrvhto5q@sirius.home.kraxel.org>
 <20220204131805.3a225566@redhat.com>
In-Reply-To: <20220204131805.3a225566@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Feb 2022 19:22:43 +0530
Message-ID: <CAARzgwzRRzt_oBaYFbmD+cpGeNgHMq5TcOvWiSVZ8eL159XERQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests due
 to handle overlap
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000049153205d7319130"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, gsomlo@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049153205d7319130
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 4, 2022 at 17:48 Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 4 Feb 2022 12:05:58 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> >   Hi,
> >
> > > Another question is why we split memory on 16Gb chunks, to begin with.
> > > Maybe instead of doing so, we should just add 1 type17 entry describing
> > > whole system RAM size. In which case we don't need this dance around
> > > handle offsets anymore.
> >
> > Maybe to make the entries look like they do on physical hardware?
> > i.e. DIMM size is a power of two?  Also physical 1TB DIMMs just
> > don't exist?
>
> Does it have to be a DIMM, we can make it Other/Unknown/Row of chips/Chip
> to more close to builtin memory that's is our main ram is.


My concern here is even though the spec has provisions for those form
factors I wonder if the guests only expect dimm ? Will it break some guest
operating system?

>

--00000000000049153205d7319130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 4, 2022 at 17:48 Igor Mammedov &lt;<a href=3D"m=
ailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">On Fri, 4 Feb 2022 12:05:58 +0100<br>
Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kr=
axel@redhat.com</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt; &gt; Another question is why we split memory on 16Gb chunks, to begin =
with.<br>
&gt; &gt; Maybe instead of doing so, we should just add 1 type17 entry desc=
ribing<br>
&gt; &gt; whole system RAM size. In which case we don&#39;t need this dance=
 around<br>
&gt; &gt; handle offsets anymore.=C2=A0 <br>
&gt; <br>
&gt; Maybe to make the entries look like they do on physical hardware?<br>
&gt; i.e. DIMM size is a power of two?=C2=A0 Also physical 1TB DIMMs just<b=
r>
&gt; don&#39;t exist?<br>
<br>
Does it have to be a DIMM, we can make it Other/Unknown/Row of chips/Chip<b=
r>
to more close to builtin memory that&#39;s is our main ram is.</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">My concern here is even thoug=
h the spec has provisions for those form factors I wonder if the guests onl=
y expect dimm ? Will it break some guest operating system?</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)" dir=3D"auto"></blockquote></div></div>

--00000000000049153205d7319130--

