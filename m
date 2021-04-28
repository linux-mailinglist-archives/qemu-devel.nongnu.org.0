Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F536D82C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:19:28 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbk6B-00081n-IM
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbk51-0007ZU-4G
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:18:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbk4z-00010E-4k
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:18:14 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u17so94689502ejk.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/LvSbKZj1cm2TRrCe0Gb+aH9jx9NWBWERgn4NKzNYRs=;
 b=TK4YDQtdxQ9mkYlq37+xtlonXZ9psAGY4MvWC26QpbnDOM9it7GhBaqruJMsGXs3wM
 ImS1x/z9CGfdiy353EkeGg0ZVKdBinaSHXIErgvn3QlPIjXax09J+5oGFSrxwcsqmmjo
 njv4dXwXsBW0TQkZYhz5oBta7dTab7FRqQgkT3SVN+R/AdI8kdLn6NLfEjVcFLeVyVnd
 HaBsW/0DvWcTB5BUGed0tvdy53XtgWTVcZq933nGS8JdnrOpmUjz0cM9ZFziSE+X7196
 RHoLAj1R6Yg+ZSHVqR1O0UAkxnJo2MrCsD8EKv5UZNZeoCcPlFCHXduaEGYIAMTJQm4s
 Fd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/LvSbKZj1cm2TRrCe0Gb+aH9jx9NWBWERgn4NKzNYRs=;
 b=nCC+z1fSimRNzInpQs3YKrzwpyV6hLb+uHOfdelJkp+gvVgvAKo0iVxXPMvriXL/o3
 Ey5cIZ7+J024g/EodNA2vJNoipq5/9k6cY+/WfcIEd3/nkRCDToE5eWo5GNThN8qdYHM
 546yWs0tQfwNzanJ9lA6CkNw1EI6qdLC6aueW6F/KgLbYmJbVKiYRL+lbHACS4ywpUdv
 on4+I3OG6EhGCalLy4Gpa5W9fTKj5EAJrdu13rApCyIpiLUyACn+qs/znBFdOFYBs00h
 xKNJ08dTryDZyvMYLlR2NSSeTjgnrP3IjIaHLcUWm/xuwR4z0HGjVzknAeEYlkMJSxJn
 Xzdw==
X-Gm-Message-State: AOAM532ubSVUjKjM2OYWgt4ohm3wX1ilJ99b/T05xDGXcVKEKLp61cNA
 cyRiWCmdYIkcR3e7UkObhyzuPX/lohThxKqUgXM=
X-Google-Smtp-Source: ABdhPJzy91Mz0hfwpomL/nc0Y9M2OdMQdi5ISL6kbxcv/FMA3fBm1UIloocH0a180yxXiXd+N7O6v9EiJHINtoOOMGw=
X-Received: by 2002:a17:906:f41:: with SMTP id
 h1mr29366557ejj.399.1619615891570; 
 Wed, 28 Apr 2021 06:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:389b:0:0:0:0 with HTTP; Wed, 28 Apr 2021 06:18:10
 -0700 (PDT)
In-Reply-To: <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
 <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
 <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
 <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Wed, 28 Apr 2021 16:18:10 +0300
Message-ID: <CA+rFky7Qt51B=cKtX6BhTiJDfhmH5SRxuktXktB0YnmCbynS5g@mail.gmail.com>
Subject: Re: X on old (non-x86) Linux guests
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000e3c40d05c108356c"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=randrianasulu@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e3c40d05c108356c
Content-Type: text/plain; charset="UTF-8"

On Wednesday, April 28, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Wed, 28 Apr 2021, Andrew Randrianasulu wrote:
>
>> On Wednesday, April 28, 2021, Andrew Randrianasulu <
>> randrianasulu@gmail.com>
>> wrote:
>>
>>> On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>>> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>>>>
>>>>>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>>>>> under QEMU which was pretty neat.  But I failed to find a succesful
>>>>> combination to get X working; has anyone any suggestions?
>>>>>
>>>>>
>>>> Adding Andrew who has experimented with old X framebuffer so he may
>>>> remember something more but that was on x86.
>>>>
>>>
>>>
>>>
>>> Sorry, I still away from my desktop (with notes/logs), not sure when
>>> return..
>>> I do not think I tried something that old.. Kernel 2.2 i guess, before
>>> any
>>> attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
>>> attempted to use that (as it tries by default in much newer distros)
>>>
>>
> Maybe it would work better with newer RedHat than 6.0? I think I've seen
> images up to at least 7.1 that supported alpha but I don't know how to boot
> them. I could get kernel and installer running with -kernel -initrd but did
> not find the CD on the defailt CMD646 controller (seems to only have driver
> for one SCSI controller) so I'm not sure how to try this. Trying to just
> boot from the CD without -kernel -initrd it just stops after displaying
> "Hello" in top left but that could be something about alpha firmware I
> don't know how to use.


I think alpha firmware is incomplete, not like real Alpha firmware..

I found you can try to install rh 7.1 on alpha from Hard drive or network
(ftp/http)

https://web.archive.org/web/20011120235248/http://www.redhat.com/docs/manuals/linux/RHL-7.1-Manual/alpha-install-guide/s1-guimode-sel-method.html

But this requires network boot disk... Not sure from where you can get
it...

>
> Regards,
> BALATON Zoltan
>

--000000000000e3c40d05c108356c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, April 28, 2021, BALATON Zoltan &lt;<a href=3D"mailto:=
balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, 28 Apr 2021, Andrew Randrianasulu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wednesday, April 28, 2021, Andrew Randrianasulu &lt;<a href=3D"mailto:ra=
ndrianasulu@gmail.com" target=3D"_blank">randrianasulu@gmail.com</a>&gt;<br=
>
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Monday, April 26, 2021, BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik=
.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting<br=
>
under QEMU which was pretty neat.=C2=A0 But I failed to find a succesful<br=
>
combination to get X working; has anyone any suggestions?<br>
<br>
</blockquote>
<br>
Adding Andrew who has experimented with old X framebuffer so he may<br>
remember something more but that was on x86.<br>
</blockquote>
<br>
<br>
<br>
Sorry, I still away from my desktop (with notes/logs), not sure when<br>
return..<br>
I do not think I tried something that old.. Kernel 2.2 i guess, before any<=
br>
attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx<b=
r>
attempted to use that (as it tries by default in much newer distros)<br>
</blockquote></blockquote>
<br>
Maybe it would work better with newer RedHat than 6.0? I think I&#39;ve see=
n images up to at least 7.1 that supported alpha but I don&#39;t know how t=
o boot them. I could get kernel and installer running with -kernel -initrd =
but did not find the CD on the defailt CMD646 controller (seems to only hav=
e driver for one SCSI controller) so I&#39;m not sure how to try this. Tryi=
ng to just boot from the CD without -kernel -initrd it just stops after dis=
playing &quot;Hello&quot; in top left but that could be something about alp=
ha firmware I don&#39;t know how to use.</blockquote><div><br></div><div>I =
think alpha firmware is incomplete, not like real Alpha firmware..=C2=A0</d=
iv><div><br></div><div>I found you can try to install rh 7.1 on alpha from =
Hard drive or network (ftp/http)</div><div><br></div><div><a href=3D"https:=
//web.archive.org/web/20011120235248/http://www.redhat.com/docs/manuals/lin=
ux/RHL-7.1-Manual/alpha-install-guide/s1-guimode-sel-method.html">https://w=
eb.archive.org/web/20011120235248/http://www.redhat.com/docs/manuals/linux/=
RHL-7.1-Manual/alpha-install-guide/s1-guimode-sel-method.html</a></div><div=
><br></div><div>But this requires network boot disk... Not sure from where =
you can get it...=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote>

--000000000000e3c40d05c108356c--

