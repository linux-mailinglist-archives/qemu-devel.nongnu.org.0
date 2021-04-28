Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E436D03A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 03:20:45 +0200 (CEST)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbYse-0001x6-2B
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 21:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbYrI-0001W6-7b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:19:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbYrG-0002mB-89
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:19:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id r9so92139396ejj.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ovy0SKrcU5ktV8qyPxciB6K+4WmKYaH63NRmrN5vuBA=;
 b=UIlw/aUwkh3OE2Aagm7FmkpTJoOyEZ/0zDyIhmJv1df4+SpqkAlmMVym6RDtTG2w/i
 njsmo0rh2jpNbqJz3rMY+U9R0DKuUVStiRT9ZZRnCkK6OZITTdUwzi2jc/Y61V5X6Syq
 /OpvU0VrMz8QFe6NcjIcRboDTe6y+bMcwrSBTV85vFjEZSXAc27YUV33B3p2lhHaVG2c
 VVAbcmroyNpyBlxOOmY8cr2MGSMo0CUeywFMbTXDtybKkqQmRXhlqlpypP2iYDiAexlj
 jScMozjRbiYuawtoxYCpvU9yPYqQb5b1cAVla/TnPfjgmueXO7PkfELL02etvibHDH4G
 Ygpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ovy0SKrcU5ktV8qyPxciB6K+4WmKYaH63NRmrN5vuBA=;
 b=ZbI/H3P5Ep2dGwpfxOhaHwjsHWl7pdO9xrFDZ11O6fP0JLOKoDlRffks+u67ZvcFt5
 DdvrhiREyGsh3N3lLG8evoCDtWB6tXUI7nJbJTb36Ftz2RzMcmtpz1K45x2DYwshOS0n
 A9OLoIEFtQogo2o8HZ/HKm4alGKGyFngmQwrdo1+R0qzX0c7UWK+G1dRIj7CpQNDW3FV
 ft/Iv82wzYYgGHUNXxx0A5qOUPf3TLUSKC+Ui/fW2EtvQFBMwJhEIFB8ZKzxSgAqq1r2
 XFEPrElEAz1jGnZ8fhqQ6avGzLGQkbKhuSebtsAGStjDX9+IXuVUmM7OJZZ5f84SYWJw
 Bxdg==
X-Gm-Message-State: AOAM531NzKD3X2YJYTmCwRZsoSllqjuPppviyw8aVMQ/0FOeQanNHrns
 RIqe42jbLu4nqFhva9/N2qrqHw+Di7xsDZtBemA=
X-Google-Smtp-Source: ABdhPJzUVal2lFIGD78ZJbNHF5j2u81YIpjmos4bvTdocl1t0Zokl4Kb/R2wyUX2vh2PaJVGV43rXQiKHDJjBD8EWsk=
X-Received: by 2002:a17:906:858:: with SMTP id
 f24mr19281629ejd.347.1619572756284; 
 Tue, 27 Apr 2021 18:19:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:389b:0:0:0:0 with HTTP; Tue, 27 Apr 2021 18:19:15
 -0700 (PDT)
In-Reply-To: <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Wed, 28 Apr 2021 04:19:15 +0300
Message-ID: <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
Subject: Re: X on old (non-x86) Linux guests
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000d3862305c0fe2a97"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=randrianasulu@gmail.com; helo=mail-ej1-x633.google.com
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

--000000000000d3862305c0fe2a97
Content-Type: text/plain; charset="UTF-8"

On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> Hello,
>
> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>
>>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>> under QEMU which was pretty neat.  But I failed to find a succesful
>> combination to get X working; has anyone any suggestions?
>>
>
> Adding Andrew who has experimented with old X framebuffer so he may
> remember something more but that was on x86.



Sorry, I still away from my desktop (with notes/logs), not sure when
return..
I do not think I tried something that old.. Kernel 2.2 i guess, before any
attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
attempted to use that (as it tries by default in much newer distros)

I tried Last debian for alpha, (5.0.x?) on qemu, it had bugs in cirrusfb in
2.6.26 Kernel so i compiled like 2.6.32.last inside emulated system.. This
made fb works, But still there was no X for me... (can't recall exact error
- May be even sigabort or sigbus - but do not count on my memory on this...
/)

Notes i used for launching qemu -
https://virtuallyfun.com/wordpress/2014/02/19/alpha-linux-on-qemu/
But Sadly pre-compressed disk image from that post really gone (it uses
funny error Page telling you to use login/password, yet file can't be
downloaded...)


>  That distro was from around 2000; the challenge is since we don't have
>> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
>> doesn't want to play with any of the devices.
>>
>>  I also tried the ati device, but the accelerated mach64 driver
>> didn't recognise that ID.
>>
>
> The ati-vga partially emulates an ATI Rage128 Pro so it won't work with
> mach64 driver that is older and while functionally similar has different
> registers. You probably need to load aty128fb and then set a mode with
> fbset then may need to edit X conf but I forgot which option was neded,
> something about UseFb or similar so it won't try to change mode itself but
> use the already set Linux FB because otherwise it did not detect the card
> properly but I don'r remember the details so may be wrong. Also some 2D
> accel is emulated so may work without disabling it but I think has some
> bugs so it may have glitches.
>
>  Has anyone found any combo that works?
>> I suspect using one of the existing devices, lying about PCI ID, and
>> then turning off all accelerations might have a chance but I've not got
>> that far.
>>
>
> Changing the PCI ID may not help as these ATI chips have different
> registers so only compatible with the right drivers. I've tried to use
> current ati-vga with a Mac ROM that expects mach64 but it did not work.
>
> It may help to add -trace enable="ati*" and maybe also enable some debug
> defines in ati_int.h to see if it accesses the card at all but with the
> right driver that works with Rage128Pro it should produce some picture at
> least in fb console and we could run X with it on x86 before.
>
> More info on ati-vga is here: https://osdn.net/projects/qmig
> a/wiki/SubprojectAti
>
> By the way, last time I've experimented with it I've found that mouse
> pointer getting out of sync and jumping around is probably a result of
> mouse acceleration on the host is not taken into account when tracking
> guest pointer position. Is that possible and is there a way to fix it?
>
> Regards,
> BALATON Zoltan
>

--000000000000d3862305c0fe2a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, April 26, 2021, BALATON Zoltan &lt;<a href=3D"mailto:bal=
aton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hello,<br>
<br>
On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting<br=
>
under QEMU which was pretty neat.=C2=A0 But I failed to find a succesful<br=
>
combination to get X working; has anyone any suggestions?<br>
</blockquote>
<br>
Adding Andrew who has experimented with old X framebuffer so he may remembe=
r something more but that was on x86.</blockquote><div><br></div><div><br><=
/div><div>Sorry, I still away from my desktop (with notes/logs), not sure w=
hen return..=C2=A0</div><div>I do not think I tried something that old.. Ke=
rnel 2.2 i guess, before any attempt at r128 drm Kernel module was written =
(in 2.4?) and so before ddx attempted to use that (as it tries by default i=
n much newer distros)=C2=A0</div><div><br></div><div>I tried Last debian fo=
r alpha, (5.0.x?) on qemu, it had bugs in cirrusfb in 2.6.26 Kernel so i co=
mpiled like 2.6.32.last inside emulated system.. This made fb works, But st=
ill there was no X for me... (can&#39;t recall exact error - May be even si=
gabort or sigbus - but do not count on my memory on this... /)=C2=A0</div><=
div><br></div><div>Notes i used for launching qemu -=C2=A0</div><div><a hre=
f=3D"https://virtuallyfun.com/wordpress/2014/02/19/alpha-linux-on-qemu/">ht=
tps://virtuallyfun.com/wordpress/2014/02/19/alpha-linux-on-qemu/</a></div><=
div>But Sadly pre-compressed disk image from that post really gone (it uses=
 funny error Page telling you to use login/password, yet file can&#39;t be =
downloaded...)=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0That distro was from around 2000; the challenge is since we don&#39;t=
 have<br>
VESA on non-x86, we can&#39;t change mode that way, so generic XF86_SVGA<br=
>
doesn&#39;t want to play with any of the devices.<br>
<br>
=C2=A0I also tried the ati device, but the accelerated mach64 driver<br>
didn&#39;t recognise that ID.<br>
</blockquote>
<br>
The ati-vga partially emulates an ATI Rage128 Pro so it won&#39;t work with=
 mach64 driver that is older and while functionally similar has different r=
egisters. You probably need to load aty128fb and then set a mode with fbset=
 then may need to edit X conf but I forgot which option was neded, somethin=
g about UseFb or similar so it won&#39;t try to change mode itself but use =
the already set Linux FB because otherwise it did not detect the card prope=
rly but I don&#39;r remember the details so may be wrong. Also some 2D acce=
l is emulated so may work without disabling it but I think has some bugs so=
 it may have glitches.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0Has anyone found any combo that works?<br>
I suspect using one of the existing devices, lying about PCI ID, and<br>
then turning off all accelerations might have a chance but I&#39;ve not got=
<br>
that far.<br>
</blockquote>
<br>
Changing the PCI ID may not help as these ATI chips have different register=
s so only compatible with the right drivers. I&#39;ve tried to use current =
ati-vga with a Mac ROM that expects mach64 but it did not work.<br>
<br>
It may help to add -trace enable=3D&quot;ati*&quot; and maybe also enable s=
ome debug defines in ati_int.h to see if it accesses the card at all but wi=
th the right driver that works with Rage128Pro it should produce some pictu=
re at least in fb console and we could run X with it on x86 before.<br>
<br>
More info on ati-vga is here: <a href=3D"https://osdn.net/projects/qmiga/wi=
ki/SubprojectAti" target=3D"_blank">https://osdn.net/projects/qmig<wbr>a/wi=
ki/SubprojectAti</a><br>
<br>
By the way, last time I&#39;ve experimented with it I&#39;ve found that mou=
se pointer getting out of sync and jumping around is probably a result of m=
ouse acceleration on the host is not taken into account when tracking guest=
 pointer position. Is that possible and is there a way to fix it?<br>
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote>

--000000000000d3862305c0fe2a97--

