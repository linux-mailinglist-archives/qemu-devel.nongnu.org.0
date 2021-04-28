Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2636D053
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 03:38:54 +0200 (CEST)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbZAD-0004ki-Nr
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 21:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbZ9A-0004KD-QA
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:37:48 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1lbZ97-0005XL-QU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 21:37:48 -0400
Received: by mail-ej1-x634.google.com with SMTP id u17so92266164ejk.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 18:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=k/JshcvO2BRCtWwrO1IVLzcCYSawU2AeyCoVQGhw8g4=;
 b=sqBSEBC2crSCxiczO9QJlV27PLU3cZ5EKkKbS0p/NP+++pmsQd/vWMeGQz2tb+mG0S
 k5p9F/TEaEpw9k3Fxzb4EVPb8+RYC1PYeSLtF7SWjd2Rn1Se9/DSfctL8wT0GSN5WYwh
 Qir0kYELIHHGbMixgaQTm6dQ/EDyo/JaizrCotVW7lQ5Y0W+5scq0qL9NmvagYprluDh
 sTRiVXesHDXxE7FOdH6OySUmZB1ewPuSkYQl+Mu54H0hGDJR7BWMSdz4zn+wcvlZeR6A
 0KgSyDb+KU1dkYtrm/BUfweZZNUmj/7H3HPffmB1HDHTkIsbRGKIsck9+xSkEcCl0Zzy
 ZbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=k/JshcvO2BRCtWwrO1IVLzcCYSawU2AeyCoVQGhw8g4=;
 b=p3xTGk771v+mwaTU0pUtWRGJ48eM7WuRGZm9MT4f4cJYXhLGoIHZ8Cf864qVtjehnp
 X3m2tGOrs1UssgyGi3tRf981uryyLC4qherdsbF6mmjWy85A5efmS35J951V0HxrFqZj
 jXrgTPFl5VgZuudTKFg8GIDEX83yPLCoSP/TKA8bS76oPwDuIc5ClYFg9SVXatsA3Awr
 +RvvM/dn7vp/FzgkifyHUln5/CkJIhH22H+KZUXP1wYDyd2QCyfcKFJdxm/KWM1QAYtU
 KmtqeonTtBm+s2ntZH8/CHmqk1/Bf8t9NSNyi1t6D10aglxD+jWSZ5j9kJ9Dlb15gayD
 qKvw==
X-Gm-Message-State: AOAM533gucXqWSCELnsOmXw/hLGLiuz9OllF0AgJg2FcRnZCfzDpNEID
 Q1yl+vdQDCA0a91wEUbJVKKgCYIyuNxiTpsvTjc=
X-Google-Smtp-Source: ABdhPJysx76tcjMigf+7u1kK0l6adGuDezhiQ9iZrT9IFoZ0R/rAUC99nnqZxwc7Qz4sTiVR24kiMSOHZtvcWeo+eac=
X-Received: by 2002:a17:906:9244:: with SMTP id
 c4mr619779ejx.293.1619573864088; 
 Tue, 27 Apr 2021 18:37:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:389b:0:0:0:0 with HTTP; Tue, 27 Apr 2021 18:37:43
 -0700 (PDT)
In-Reply-To: <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
 <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Wed, 28 Apr 2021 04:37:43 +0300
Message-ID: <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
Subject: Re: X on old (non-x86) Linux guests
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000db497b05c0fe6c22"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=randrianasulu@gmail.com; helo=mail-ej1-x634.google.com
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

--000000000000db497b05c0fe6c22
Content-Type: text/plain; charset="UTF-8"

On Wednesday, April 28, 2021, Andrew Randrianasulu <randrianasulu@gmail.com>
wrote:

>
>
> On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> Hello,
>>
>> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>>
>>>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>>> under QEMU which was pretty neat.  But I failed to find a succesful
>>> combination to get X working; has anyone any suggestions?
>>>
>>
>> Adding Andrew who has experimented with old X framebuffer so he may
>> remember something more but that was on x86.
>
>
>
> Sorry, I still away from my desktop (with notes/logs), not sure when
> return..
> I do not think I tried something that old.. Kernel 2.2 i guess, before any
> attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
> attempted to use that (as it tries by default in much newer distros)
>
> I tried Last debian for alpha, (5.0.x?) on qemu, it had bugs in cirrusfb
> in 2.6.26 Kernel so i compiled like 2.6.32.last inside emulated system..
> This made fb works, But still there was no X for me... (can't recall exact
> error - May be even sigabort or sigbus - but do not count on my memory on
> this... /)
>
> Notes i used for launching qemu -
> https://virtuallyfun.com/wordpress/2014/02/19/alpha-linux-on-qemu/
> But Sadly pre-compressed disk image from that post really gone (it uses
> funny error Page telling you to use login/password, yet file can't be
> downloaded...)
>


Upd:
https://web.archive.org/web/20191021110430/https://vpsland.superglobalmegacorp.com/old/install/linux/DecAlpha/alpha-linux.7z

This May give you kernel/initrd/disk image..

>
>
>>  That distro was from around 2000; the challenge is since we don't have
>>> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
>>> doesn't want to play with any of the devices.
>>>
>>>  I also tried the ati device, but the accelerated mach64 driver
>>> didn't recognise that ID.
>>>
>>
>> The ati-vga partially emulates an ATI Rage128 Pro so it won't work with
>> mach64 driver that is older and while functionally similar has different
>> registers. You probably need to load aty128fb and then set a mode with
>> fbset then may need to edit X conf but I forgot which option was neded,
>> something about UseFb or similar so it won't try to change mode itself but
>> use the already set Linux FB because otherwise it did not detect the card
>> properly but I don'r remember the details so may be wrong. Also some 2D
>> accel is emulated so may work without disabling it but I think has some
>> bugs so it may have glitches.
>>
>>  Has anyone found any combo that works?
>>> I suspect using one of the existing devices, lying about PCI ID, and
>>> then turning off all accelerations might have a chance but I've not got
>>> that far.
>>>
>>
>> Changing the PCI ID may not help as these ATI chips have different
>> registers so only compatible with the right drivers. I've tried to use
>> current ati-vga with a Mac ROM that expects mach64 but it did not work.
>>
>> It may help to add -trace enable="ati*" and maybe also enable some debug
>> defines in ati_int.h to see if it accesses the card at all but with the
>> right driver that works with Rage128Pro it should produce some picture at
>> least in fb console and we could run X with it on x86 before.
>>
>> More info on ati-vga is here: https://osdn.net/projects/qmig
>> a/wiki/SubprojectAti
>>
>> By the way, last time I've experimented with it I've found that mouse
>> pointer getting out of sync and jumping around is probably a result of
>> mouse acceleration on the host is not taken into account when tracking
>> guest pointer position. Is that possible and is there a way to fix it?
>>
>> Regards,
>> BALATON Zoltan
>>
>

--000000000000db497b05c0fe6c22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, April 28, 2021, Andrew Randrianasulu &lt;<a href=3D"m=
ailto:randrianasulu@gmail.com">randrianasulu@gmail.com</a>&gt; wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br><br>On Monday, April 26, 2021, BALATON Zol=
tan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik=
.bme.hu</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
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
f=3D"https://virtuallyfun.com/wordpress/2014/02/19/alpha-linux-on-qemu/" ta=
rget=3D"_blank">https://virtuallyfun.com/<wbr>wordpress/2014/02/19/alpha-<w=
br>linux-on-qemu/</a></div><div>But Sadly pre-compressed disk image from th=
at post really gone (it uses funny error Page telling you to use login/pass=
word, yet file can&#39;t be downloaded...)=C2=A0</div></blockquote><div><br=
></div><div><br></div><div>Upd:=C2=A0</div><div><a href=3D"https://web.arch=
ive.org/web/20191021110430/https://vpsland.superglobalmegacorp.com/old/inst=
all/linux/DecAlpha/alpha-linux.7z">https://web.archive.org/web/201910211104=
30/https://vpsland.superglobalmegacorp.com/old/install/linux/DecAlpha/alpha=
-linux.7z</a></div><div><br></div><div>This May give you kernel/initrd/disk=
 image..</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
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
</blockquote>

--000000000000db497b05c0fe6c22--

