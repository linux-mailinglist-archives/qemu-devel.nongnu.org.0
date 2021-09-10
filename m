Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419A40671A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 08:13:25 +0200 (CEST)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZmu-0002en-Cx
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 02:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mOZm4-0001zL-Fe
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:12:32 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mOZm2-0007hr-So
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:12:32 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 a20-20020a0568300b9400b0051b8ca82dfcso899351otv.3
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 23:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RoBp6CxifrDNXcNRuz4X/7dfhbjzxiCmVTnLqBebQho=;
 b=MoQB7K4SVysyNA/avh0ix8vrccuJro7zRfpRzNKeTkOL9WBNqxpuBc30806GezOaF4
 5XUAYXRM+YDsnBjJ7TAv82CEO0OlyKeGA7/v0owRHsmQLIaUII8b9pOlmYC+Ps57J4c7
 iIjdqTx5KQUN40Zl5GC6h07Vtjg91GTSAg/lg9T2LMk9NwPFBJuWbEYRvP/70bvIFZMJ
 MhdGf36kHTh88vg4VV12w9WeYLRRTdltyHHuV6ujooyZnxr3X459qdAbXfHcVFdGmzzg
 Ixr/LxzQMqxKz9kmxo13HfP8w/S0R6jR5/WF7AYr1cq4L/wjMKy2n+rAqFp8MWs5RsFn
 GqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoBp6CxifrDNXcNRuz4X/7dfhbjzxiCmVTnLqBebQho=;
 b=rjw9ivwHycYbwtcSngHnT4GBGQlaLoFJ6pCJjmVLsE4OiBSrAXloJYG/SC/xhdyc/z
 4yilWIckoUq45k5inhuOnlBFfAlOJ2Mp7CdsyEYk2Ej221Oo/8gHQi+ONjsQohY8J1J3
 FfNwlDzxLFgTshCjbYbrIaECsWShlhbwuYSDVJiHIfgSiB0+y8LlT2cXKfu907RqrbYN
 SAS9EFS93ktmlLjH6Ha1nWSCUve44jSfGp5T/p9hnAYTLCjpa+7Eav8nE3cme7T4c8nF
 hAOdgHhixKEglwdeM0FSb7N0at2huWVu0+MtjP6CpnHv++75C/tGUdePh3I7CmsX53vu
 5cuQ==
X-Gm-Message-State: AOAM533kF+HNKnuy3qy+pBouxrNLQTMhinsp/4/oJQKMMkIxjRf3UBeN
 bVXR3B0H9CCMtAc1F1l6p+/vsieLYhXbryGEHyI=
X-Google-Smtp-Source: ABdhPJwEEYPj1MtGlmrZ9XhdeQFmqMyCI9fzbeA1Hi3h0CaSEV7s4kqRTrl5wge5kZX/v0URBVetKCVxSeLhO+c6Qf0=
X-Received: by 2002:a9d:12f:: with SMTP id 44mr1958900otu.342.1631254349212;
 Thu, 09 Sep 2021 23:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
 <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
In-Reply-To: <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 10 Sep 2021 08:12:17 +0200
Message-ID: <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005f07505cb9e0068"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x333.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005f07505cb9e0068
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 7:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Thu, Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:
> > Hi Gerd,
> >
> > Howard and I were talking about USB audio problems with Mac OS guests.
> We think the issue might be with frames being sent to the USB audio card
> too soon. My guess is only one frame is suppose to be transmitted every 1
> millisecond. I was also reading the todo notes in the file hw/hcd-ohci.c.
> This is what it says:
> >
> >  * TODO:
> >  *  o Isochronous transfers
> >  *  o Allocate bandwidth in frames properly
> >  *  o Disable timers when nothing needs to be done, or remove timer usage
> >  *    all together.
> >  *  o BIOS work to boot from USB storage
> > */
> >
> > Do you think implementing isochronous transfers would fix the audio
> problems Mac OS guest are experiencing?
>
> Most likely yes, audio devices typically use iso endpints.
>
> take care,
>   Gerd
>

Hi,

Below I pasted the first lines mentioning isochronous traffic from a pcap
file when running fedora12 with the usb-audio device and the first lines
from a pcap file running Mac OS 9.2 with the usb-audio device

Fedora:
91 56.715001 host 0.5.1 USB 256 URB_ISOCHRONOUS out
92 56.715018 0.5.1 host USB 64 URB_ISOCHRONOUS out

MacOS:
143 56.031989 host 0.16.1 USB 256 URB_ISOCHRONOUS out
144 56.032026 0.16.1 host USB 64 URB_ISOCHRONOUS out

The usb-audio device works for the fedora guest, so would this not indicate
that the iso endpoints are already working?

The usb-audio device also work (for a limited amount of time) when running
MacOS. Looking at USB logging in the Mac OS guest, to me it seems the MacOS
side runs into timing issues when packages drift too far apart. It then
finally gives up trying to keep the stream open.

Best,
Howard

--00000000000005f07505cb9e0068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2021 at 7:07 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:<br>
&gt; Hi Gerd,<br>
&gt; <br>
&gt; Howard and I were talking about USB audio problems with Mac OS guests.=
 We think the issue might be with frames being sent to the USB audio card t=
oo soon. My guess is only one frame is suppose to be transmitted every 1 mi=
llisecond. I was also reading the todo notes in the file hw/hcd-ohci.c. Thi=
s is what it says:<br>
&gt; <br>
&gt;=C2=A0 * TODO:<br>
&gt;=C2=A0 *=C2=A0 o Isochronous transfers<br>
&gt;=C2=A0 *=C2=A0 o Allocate bandwidth in frames properly<br>
&gt;=C2=A0 *=C2=A0 o Disable timers when nothing needs to be done, or remov=
e timer usage<br>
&gt;=C2=A0 *=C2=A0 =C2=A0 all together.<br>
&gt;=C2=A0 *=C2=A0 o BIOS work to boot from USB storage<br>
&gt; */<br>
&gt; <br>
&gt; Do you think implementing isochronous transfers would fix the audio pr=
oblems Mac OS guest are experiencing?<br>
<br>
Most likely yes, audio devices typically use iso endpints.<br>
<br>
take care,<br>
=C2=A0 Gerd<br></blockquote><div><br></div><div>Hi,</div><div><br></div><di=
v>Below I pasted the first lines mentioning isochronous traffic from a pcap=
 file when running fedora12 with the usb-audio device and the first lines f=
rom a pcap file running Mac OS 9.2 with the usb-audio device<br></div><div>=
<br></div><div>Fedora:<br></div><div>91	56.715001	host	0.5.1	USB	256	URB_IS=
OCHRONOUS out</div><div>92	56.715018	0.5.1	host	USB	64	URB_ISOCHRONOUS out<=
/div><div>=C2=A0</div><div>MacOS:</div><div>143	56.031989	host	0.16.1	USB	2=
56	URB_ISOCHRONOUS out</div><div>144	56.032026	0.16.1	host	USB	64	URB_ISOCH=
RONOUS out</div><div><br></div><div>The usb-audio device works for the fedo=
ra guest, so would this not indicate that the iso endpoints are already wor=
king?</div><div><br></div><div>The usb-audio device also work (for a limite=
d amount of time) when running MacOS. Looking at USB logging in the Mac OS =
guest, to me it seems the MacOS side runs into timing issues when packages =
drift too far apart. It then finally gives up trying to keep the stream ope=
n.<br></div><div><br></div><div>Best,</div><div>Howard<br></div><div><br></=
div></div></div>

--00000000000005f07505cb9e0068--

