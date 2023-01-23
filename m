Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBD678BEA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 00:18:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK63n-0001is-EL; Mon, 23 Jan 2023 18:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pK63S-0001g2-Nj; Mon, 23 Jan 2023 18:16:53 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pK63N-0002JE-GN; Mon, 23 Jan 2023 18:16:45 -0500
Received: by mail-ej1-x62a.google.com with SMTP id bk15so34584766ejb.9;
 Mon, 23 Jan 2023 15:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V1OPVeScUTRfFomm8grkqrzIOn2S7duoMd+ZP2upMeI=;
 b=I/SblwICh7IgpJdQUqql17LiiVvd9cvcdhL/gntAgeFYDnIB9A+NyVED5yeBzf9x4C
 h88o/feNLKmDlGqUg8IoKfYkfm8G+JOYVUnwBgPMMqYrBldu2SSLi/8SW4bH3vTOL+GW
 n8mlHLFSPPn4ppwD7ngJAKlToYK9EJt5etxf3Qfvg4WigShyMd751UFk7sDT2Y2d2OJQ
 6Vv+UuAwZCEu+7sdXGIUiYPG+rzrrRgRtf5BV6wIdttlzcKmE5RyQ9A0jg0JeYQYGhGf
 WC+3oul/YV76r4g/2LWTn2raeErg6U3SCdKZTjWv+SUYT7h/iiktbkalFhvCL09ZSA+V
 RR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V1OPVeScUTRfFomm8grkqrzIOn2S7duoMd+ZP2upMeI=;
 b=szMmpWKnrN6NWy5gHIbnlAQ30neXJlOHnO2Q7e51VkaAwYyr0yYijC7ispHronteil
 whwTL3QF5MIYxDgyUNhl6tOPso1yN3framggVsk5pdqaWc29Ouh92jE71WwHcP9Ekvl5
 U3cnZTuosJDw2W8GGZi5Fk0g84Ht/0nZPHHArZRr4HwM7pf5O6gMYGchVwi+jwD7Fitf
 SjrRJ2gK+Emh4VvuG1++wja98bTfuydg6rNQQbArQ1gnXphXhV9P26KuSso310rdrXBE
 sFlEjWp2Vly0seGFEd3qfX0nVEjtKiWpBr3voOzqS0rYBrluH6d6SFGgjH6nNV0Hfm2O
 8Vkg==
X-Gm-Message-State: AFqh2kqqKSqEn0PPs3+HB1OYCnuc3hAJeaqapKMeOB1PpUMvBVd45ZMT
 LDHlSi3gqnAR8+KVX9mxpBimtOy2iJ2lt1SsDmk=
X-Google-Smtp-Source: AMrXdXuA++D3xedzXryrt9hpNkaeBxGXI7OGgh4po0CSPL47AKIY333TssNoqz0KeMJYfGhId825Bfak6B/i0N3XCgs=
X-Received: by 2002:a17:906:449:b0:872:3ad1:2077 with SMTP id
 e9-20020a170906044900b008723ad12077mr3853204eja.427.1674515797545; Mon, 23
 Jan 2023 15:16:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
In-Reply-To: <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 24 Jan 2023 00:16:26 +0100
Message-ID: <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004898c005f2f6979d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004898c005f2f6979d
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 11:06 PM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 22/01/2023 22:07, BALATON Zoltan wrote:
>
> > On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:
> >> On 12/01/2023 23:51, BALATON Zoltan wrote:
> >>> On Thu, 12 Jan 2023, Howard Spoelstra wrote:
> >>>> On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >>>>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
> >>>>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
> >>>>>>> Setting emulated machine type with a property called "via" is
> >>>>>>> confusing users so deprecate the "via" option in favour of newly
> added
> >>>>>>> explicit machine types. The default via=cuda option is not a valid
> >>>>>>> config (no real Mac has this combination of hardware) so no machine
> >>>>>>> type could be defined for that therefore it is kept for backwards
> >>>>>>> compatibility with older QEMU versions for now but other options
> >>>>>>> resembling real machines are deprecated.
> >>>>>>>
> >>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>>>>>
> >>>>>> I believe that people do use -M mac99,via=cuda to run some rare
> versions
> >>>>> of
> >>>>>> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so
> we
> >>>>> would
> >>>>>> want to keep this option somewhere.
> >>>>>
> >>>>> The idea is that after previous patches we now have machine types
> for all
> >>>>> other via option values (that also match real Mac machines) other
> than
> >>>>> via=cude but that is the default for mac99 so after the reprecation
> period
> >>>>> when the via option is removed mac99 (which is the same as
> mac99,via=cuda)
> >>>>> can remain for this use case (and for backward compatibility) until
> the
> >>>>> other machines are fixed to not need this any more. So all via
> options are
> >>>>> still available but as different machine types.
> >>>>>
> >>>> My 2 cents about naming:
> >>>> It seems less important how the machines are named when their name is
> not
> >>>> covering their definition. F.i. the powermac3,1 never had adb, could
> not be
> >>>> equipped with a G3 cpu, did not run at 900Mhz. The closest possible
> >>>> qemu-options based definition of a powermac3,1 (via=pmu) will not run
> Mac
> >>>> OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
> >>>> already needed.
> >>>
> >>> What does that mean? Should we aim to emulate real Macs or are we
> happy with the
> >>> Franken-Mac we have now? The names also show what we intend to emulate
> even though
> >>> the emulation may not be complete or have bugs (this is also true for
> other
> >>> machines in QEMU where a lot of them are not fully emulated, only well
> enough to
> >>> boot guest OSes).
> >>>
> >>> Looks like everybody has forgotten the previous discussion and not
> read the docs
> >>> and deprecation patches where this is explained so I summarise the
> proposed change
> >>> here again:
> >>>
> >>> - qemu-system-ppc -M mac99 is unchanged and works like before it just
> warns for
> >>> the via option and when using it in qemu-system-ppc64 suggesting using
> new
> >>> machines instead so these could evetually be removed next year.
> mac99,via=cuda is
> >>> just mac99 so you can continue to use that, mac99 is not deprecated
> and don't want
> >>> to remove it.
> >>>
> >>> - qemu-system-ppc64 -M mac99 -> powermac7_3
> >>>
> >>> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
> >>>
> >>> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2
>
> FWIW this information would be useful in the cover letter once we decide
> the way
> forward. Also as a reviewer, it is hard to keep track of all the changes
> if the
> series are constantly changing and with no changelog on the cover letter,
> which is
> why it takes me a while to review them.
>
> >>> The last one is one of the rare Macs that had adb and pmu, all others
> with pmu
> >>> usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99
> hardware
> >>> but more similar to g3beige and no ADB ports according to
> >>> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
> >>>
> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
> >>>
> >>> The PowerMac7,3 seems to be matching the PCI device listing in the
> comment at the
> >>> beginning of mac_newworld.c and also this article:
> >>> https://www.informit.com/articles/article.aspx?p=606582
> >>>
> >>> What is the 2 USB devices problem? Is it the one we've debugged before
> and found
> >>> that it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c?
> That could be
> >>> fixed if there was somebody interested enough to provide a patch.
> >>>
> >>> But this series does not remove the mac99 and does not even deprecate
> it. What it
> >>> deprecates are the via option to select different machine types and
> the automatic
> >>> detection of ppc64 to emulate something different which are hard to
> understand for
> >>> users and caused several misunderstandings. It's much more clear to
> have a
> >>> separate machine type for each machine we emulate even when they
> aren't yet
> >>> complete but at least we know which way to go and can compare to real
> hardware and
> >>> fix the missing parts later. Also introducing powermac7_3 to split the
> ppc64 mac99
> >>> would allow to remove qemu-system-ppc if we wanted and only have one
> executable
> >>> for all machines but even without this it's clearer to have separate
> machnies for
> >>> G5 and G4 macs than mac99 silently behaving differently.
> >>
> >> Ultimately the issue you are trying to solve is this, which is that -M
> mac99 is
> >> different for qemu-system-ppc and qemu-system-ppc64. Perhaps the best
> way to start
> >> is to create a new "g5niagara" machine type (including OpenBIOS) and
> make it a
> >> clone of mac_newworld.c, and then issue a warning on qemu-system-ppc64
> for -M mac99.
> >
> > I don't get what you mean. Patch 4 introduces a new machine type called
> powermac7_3
> > (or g5niagara if you want) which is a clone of mac99 and then issues the
> warning to
> > deprecate qemu-system-ppc64 -M mac99 in patch 5. Did you actually test
> these patches
> > at all?
>
> More specifically, what I'm suggesting as well as creating a new machine
> name is that
> we clone mac_newworld.c into a separate file for the 64-bit Mac machine,
> declare it
> as compiled for PPC64 only, and put the deprecation there. By creating a
> separate
> file and separate machine type for OpenBIOS, it gives you the freedom to
> make changes
> to mac99 to move it towards a G4 AGP without having to worry about
> affecting any
> existing 64-bit users.
>
> >> The reason for suggesting this is that the number of users of
> qemu-system-ppc64 -M
> >> mac99 will be much smaller than those using qemu-system-ppc, which
> means there will
> >> be a lot less breakage for users. In
> >
> > Except those who mean to use ppc mac99 but think that they should use
> > qemu-system-ppc64 on 64 bit Windows which is probably the highest number
> of users
> > currently. I've cc'd you on the last instance of this but can dig up
> some more from
> > last year and look at the emaculation.com forum or ask Howard how many
> times that
> > happens. So after these patches users can still use qemu-system-ppc -M
> mac99 as
> > before without a warning but will get warned for qemu-system-ppc64 -M
> mac99 to use
> > powernac7_3 instead.
>
> We're saying the same thing here, no?
>
> >> the meantime we don't need to make a final decision re: machine names,
> yet it still
> >> gives you the freedom to work on -M mac99 for 32-bit Macs and move it
> closer
> >> towards the G4 AGP model.
> >
> > That's a different issue you're mixing in here. One issue is mac99
> emulating
> > different machines with ppc and pcc64, this is solved as above. Another
> issue is that
> > ppc mac99 is not a real mac, to get the hardware to match the device
> tree OpenBIOS
> > tells the guest it is you have to use mac99,via=pmu which no user can
> guess. I want
> > to rename this to simply powermac3_1 and get rid of the via option
> eventually and
> > make these separate machines which is much more clear to the user. The
> implementation
> > remains the same, but we're free to change that later once the naming is
> resolved. So
> > I think we should decide on naming now and start deprecating old names
> (which are
> > ppc64 mac99 and macc99 with via option so we only leave mac99 as before
> and all other
> > variants will become -machine options). What part of this is not clear
> to you. I feel
> > like despite trying to explain it for the third time we're still not on
> the same page.
>
> The default was set to mac99,via=cuda since that was the original
> implementation and
> via=pmu broke booting some images (unfortunately I can't remember the
> detail right
> now). Ultimately my aim was to fix the remaining bugs and switch the mac99
> default to
> via=pmu, but due to various changes in the past couple of years my
> available time to
> work on QEMU is considerably reduced.
>
>
From a Mac OS guest perspective, via=cuda is needed for Mac OS 9.0.4 due to
the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would be
that these suffer the same usb issue)
The real powermac3,1 AGP has no adb.

via=cuda supports Mac OS 9.0.4 up to OS X 10.4. via=pmu is strictly only
needed for Mac OS X 10.5 guest (for which the speed reported was hacked to
900Mhz to fool the installer), but should support all Mac OS/OS X that are
now supported.

via=pmu-adb seems only needed to trick mac os server installations that
would later run on the g3beige.

To my knowledge 32 bit Linux guests all require via=pmu
See here: https://wiki.qemu.org/Documentation/Platforms/PowerPC

Best,
Howard


> What I see you are effectively asking for is a new machine which is
> currently
> equivalent to -M mac99,via=pmu that you wish to diverge towards a real G4
> AGP
> machine, right?
>
>
> ATB,
>
> Mark.
>

--0000000000004898c005f2f6979d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 23, 2023 at 11:06 PM Mark=
 Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk" target=3D=
"_blank">mark.cave-ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 22/01/2023 22:07, BALATON Zoltan w=
rote:<br>
<br>
&gt; On Sun, 22 Jan 2023, Mark Cave-Ayland wrote:<br>
&gt;&gt; On 12/01/2023 23:51, BALATON Zoltan wrote:<br>
&gt;&gt;&gt; On Thu, 12 Jan 2023, Howard Spoelstra wrote:<br>
&gt;&gt;&gt;&gt; On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan &lt;<a href=
=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;=
 wrote:<br>
&gt;&gt;&gt;&gt;&gt; On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 04/01/2023 21:59, BALATON Zoltan wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Setting emulated machine type with a property =
called &quot;via&quot; is<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; confusing users so deprecate the &quot;via&quo=
t; option in favour of newly added<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; explicit machine types. The default via=3Dcuda=
 option is not a valid<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; config (no real Mac has this combination of ha=
rdware) so no machine<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; type could be defined for that therefore it is=
 kept for backwards<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; compatibility with older QEMU versions for now=
 but other options<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; resembling real machines are deprecated.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: BALATON Zoltan &lt;<a href=3D"m=
ailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I believe that people do use -M mac99,via=3Dcuda t=
o run some rare versions<br>
&gt;&gt;&gt;&gt;&gt; of<br>
&gt;&gt;&gt;&gt;&gt;&gt; MacOS in QEMU (I think possibly OS X DP and Workgr=
oup Server?), so we<br>
&gt;&gt;&gt;&gt;&gt; would<br>
&gt;&gt;&gt;&gt;&gt;&gt; want to keep this option somewhere.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The idea is that after previous patches we now have ma=
chine types for all<br>
&gt;&gt;&gt;&gt;&gt; other via option values (that also match real Mac mach=
ines) other than<br>
&gt;&gt;&gt;&gt;&gt; via=3Dcude but that is the default for mac99 so after =
the reprecation period<br>
&gt;&gt;&gt;&gt;&gt; when the via option is removed mac99 (which is the sam=
e as mac99,via=3Dcuda)<br>
&gt;&gt;&gt;&gt;&gt; can remain for this use case (and for backward compati=
bility) until the<br>
&gt;&gt;&gt;&gt;&gt; other machines are fixed to not need this any more. So=
 all via options are<br>
&gt;&gt;&gt;&gt;&gt; still available but as different machine types.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; My 2 cents about naming:<br>
&gt;&gt;&gt;&gt; It seems less important how the machines are named when th=
eir name is not<br>
&gt;&gt;&gt;&gt; covering their definition. F.i. the powermac3,1 never had =
adb, could not be<br>
&gt;&gt;&gt;&gt; equipped with a G3 cpu, did not run at 900Mhz. The closest=
 possible<br>
&gt;&gt;&gt;&gt; qemu-options based definition of a powermac3,1 (via=3Dpmu)=
 will not run Mac<br>
&gt;&gt;&gt;&gt; OS 9.0.4 ;-) due to the 2 USB devices problem. To run that=
 via=3Dcuda is<br>
&gt;&gt;&gt;&gt; already needed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What does that mean? Should we aim to emulate real Macs or are=
 we happy with the <br>
&gt;&gt;&gt; Franken-Mac we have now? The names also show what we intend to=
 emulate even though <br>
&gt;&gt;&gt; the emulation may not be complete or have bugs (this is also t=
rue for other <br>
&gt;&gt;&gt; machines in QEMU where a lot of them are not fully emulated, o=
nly well enough to <br>
&gt;&gt;&gt; boot guest OSes).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Looks like everybody has forgotten the previous discussion and=
 not read the docs <br>
&gt;&gt;&gt; and deprecation patches where this is explained so I summarise=
 the proposed change <br>
&gt;&gt;&gt; here again:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - qemu-system-ppc -M mac99 is unchanged and works like before =
it just warns for <br>
&gt;&gt;&gt; the via option and when using it in qemu-system-ppc64 suggesti=
ng using new <br>
&gt;&gt;&gt; machines instead so these could evetually be removed next year=
. mac99,via=3Dcuda is <br>
&gt;&gt;&gt; just mac99 so you can continue to use that, mac99 is not depre=
cated and don&#39;t want <br>
&gt;&gt;&gt; to remove it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - qemu-system-ppc64 -M mac99 -&gt; powermac7_3<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - qemu-system-ppc -M mac99,via=3Dpmu -&gt; powermac3,1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - qemu-system-ppc64 -M mac99,via=3Dpmu-adb -&gt; powerbook3_2<=
br>
<br>
FWIW this information would be useful in the cover letter once we decide th=
e way <br>
forward. Also as a reviewer, it is hard to keep track of all the changes if=
 the <br>
series are constantly changing and with no changelog on the cover letter, w=
hich is <br>
why it takes me a while to review them.<br>
<br>
&gt;&gt;&gt; The last one is one of the rare Macs that had adb and pmu, all=
 others with pmu <br>
&gt;&gt;&gt; usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not wi=
th mac99 hardware <br>
&gt;&gt;&gt; but more similar to g3beige and no ADB ports according to <br>
&gt;&gt;&gt; <a href=3D"https://en.wikipedia.org/wiki/Power_Mac_G4#1st_gene=
ration:_Graphite" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia=
.org/wiki/Power_Mac_G4#1st_generation:_Graphite</a><br>
&gt;&gt;&gt; <a href=3D"https://en.wikipedia.org/wiki/Power_Macintosh_G3_(B=
lue_and_White)#Hardware" rel=3D"noreferrer" target=3D"_blank">https://en.wi=
kipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The PowerMac7,3 seems to be matching the PCI device listing in=
 the comment at the <br>
&gt;&gt;&gt; beginning of mac_newworld.c and also this article:<br>
&gt;&gt;&gt; <a href=3D"https://www.informit.com/articles/article.aspx?p=3D=
606582" rel=3D"noreferrer" target=3D"_blank">https://www.informit.com/artic=
les/article.aspx?p=3D606582</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What is the 2 USB devices problem? Is it the one we&#39;ve deb=
ugged before and found <br>
&gt;&gt;&gt; that it&#39;s noted in a comment marked with ??? in hw/usb/hcd=
-ohci.c? That could be <br>
&gt;&gt;&gt; fixed if there was somebody interested enough to provide a pat=
ch.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But this series does not remove the mac99 and does not even de=
precate it. What it <br>
&gt;&gt;&gt; deprecates are the via option to select different machine type=
s and the automatic <br>
&gt;&gt;&gt; detection of ppc64 to emulate something different which are ha=
rd to understand for <br>
&gt;&gt;&gt; users and caused several misunderstandings. It&#39;s much more=
 clear to have a <br>
&gt;&gt;&gt; separate machine type for each machine we emulate even when th=
ey aren&#39;t yet <br>
&gt;&gt;&gt; complete but at least we know which way to go and can compare =
to real hardware and <br>
&gt;&gt;&gt; fix the missing parts later. Also introducing powermac7_3 to s=
plit the ppc64 mac99 <br>
&gt;&gt;&gt; would allow to remove qemu-system-ppc if we wanted and only ha=
ve one executable <br>
&gt;&gt;&gt; for all machines but even without this it&#39;s clearer to hav=
e separate machnies for <br>
&gt;&gt;&gt; G5 and G4 macs than mac99 silently behaving differently.<br>
&gt;&gt;<br>
&gt;&gt; Ultimately the issue you are trying to solve is this, which is tha=
t -M mac99 is <br>
&gt;&gt; different for qemu-system-ppc and qemu-system-ppc64. Perhaps the b=
est way to start <br>
&gt;&gt; is to create a new &quot;g5niagara&quot; machine type (including O=
penBIOS) and make it a <br>
&gt;&gt; clone of mac_newworld.c, and then issue a warning on qemu-system-p=
pc64 for -M mac99.<br>
&gt; <br>
&gt; I don&#39;t get what you mean. Patch 4 introduces a new machine type c=
alled powermac7_3 <br>
&gt; (or g5niagara if you want) which is a clone of mac99 and then issues t=
he warning to <br>
&gt; deprecate qemu-system-ppc64 -M mac99 in patch 5. Did you actually test=
 these patches <br>
&gt; at all?<br>
<br>
More specifically, what I&#39;m suggesting as well as creating a new machin=
e name is that <br>
we clone mac_newworld.c into a separate file for the 64-bit Mac machine, de=
clare it <br>
as compiled for PPC64 only, and put the deprecation there. By creating a se=
parate <br>
file and separate machine type for OpenBIOS, it gives you the freedom to ma=
ke changes <br>
to mac99 to move it towards a G4 AGP without having to worry about affectin=
g any <br>
existing 64-bit users.<br>
<br>
&gt;&gt; The reason for suggesting this is that the number of users of qemu=
-system-ppc64 -M <br>
&gt;&gt; mac99 will be much smaller than those using qemu-system-ppc, which=
 means there will <br>
&gt;&gt; be a lot less breakage for users. In<br>
&gt; <br>
&gt; Except those who mean to use ppc mac99 but think that they should use =
<br>
&gt; qemu-system-ppc64 on 64 bit Windows which is probably the highest numb=
er of users <br>
&gt; currently. I&#39;ve cc&#39;d you on the last instance of this but can =
dig up some more from <br>
&gt; last year and look at the <a href=3D"http://emaculation.com" rel=3D"no=
referrer" target=3D"_blank">emaculation.com</a> forum or ask Howard how man=
y times that <br>
&gt; happens. So after these patches users can still use qemu-system-ppc -M=
 mac99 as <br>
&gt; before without a warning but will get warned for qemu-system-ppc64 -M =
mac99 to use <br>
&gt; powernac7_3 instead.<br>
<br>
We&#39;re saying the same thing here, no?<br>
<br>
&gt;&gt; the meantime we don&#39;t need to make a final decision re: machin=
e names, yet it still <br>
&gt;&gt; gives you the freedom to work on -M mac99 for 32-bit Macs and move=
 it closer <br>
&gt;&gt; towards the G4 AGP model.<br>
&gt; <br>
&gt; That&#39;s a different issue you&#39;re mixing in here. One issue is m=
ac99 emulating <br>
&gt; different machines with ppc and pcc64, this is solved as above. Anothe=
r issue is that <br>
&gt; ppc mac99 is not a real mac, to get the hardware to match the device t=
ree OpenBIOS <br>
&gt; tells the guest it is you have to use mac99,via=3Dpmu which no user ca=
n guess. I want <br>
&gt; to rename this to simply powermac3_1 and get rid of the via option eve=
ntually and <br>
&gt; make these separate machines which is much more clear to the user. The=
 implementation <br>
&gt; remains the same, but we&#39;re free to change that later once the nam=
ing is resolved. So <br>
&gt; I think we should decide on naming now and start deprecating old names=
 (which are <br>
&gt; ppc64 mac99 and macc99 with via option so we only leave mac99 as befor=
e and all other <br>
&gt; variants will become -machine options). What part of this is not clear=
 to you. I feel <br>
&gt; like despite trying to explain it for the third time we&#39;re still n=
ot on the same page.<br>
<br>
The default was set to mac99,via=3Dcuda since that was the original impleme=
ntation and <br>
via=3Dpmu broke booting some images (unfortunately I can&#39;t remember the=
 detail right <br>
now). Ultimately my aim was to fix the remaining bugs and switch the mac99 =
default to <br>
via=3Dpmu, but due to various changes in the past couple of years my availa=
ble time to <br>
work on QEMU is considerably reduced.<br>
<br></blockquote><div><br></div><div>From a Mac OS guest perspective, via=
=3Dcuda is needed for Mac OS 9.0.4 due to the 2 usb devices (mouse/kbd) iss=
ue. And for 10.0/10.1 (my guess would be that these suffer the same usb iss=
ue)<br></div><div>The real powermac3,1 AGP has no adb.<br></div><div><br></=
div><div>via=3Dcuda supports Mac OS 9.0.4 up to OS X 10.4. via=3Dpmu is str=
ictly only needed for Mac OS X 10.5 guest (for which the speed reported was=
 hacked to 900Mhz to fool the installer), but should support all Mac OS/OS =
X that are now supported.<br></div><div><br></div><div>via=3Dpmu-adb seems =
only needed to trick mac os server installations that would later run on th=
e g3beige.<br></div><div><br></div><div>To my knowledge 32 bit Linux guests=
 all require via=3Dpmu<br></div><div>See here: <a href=3D"https://wiki.qemu=
.org/Documentation/Platforms/PowerPC" target=3D"_blank">https://wiki.qemu.o=
rg/Documentation/Platforms/PowerPC</a> <br></div><div><br></div><div>Best,=
=C2=A0</div><div>Howard<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
What I see you are effectively asking for is a new machine which is current=
ly <br>
equivalent to -M mac99,via=3Dpmu that you wish to diverge towards a real G4=
 AGP <br>
machine, right?<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000004898c005f2f6979d--

