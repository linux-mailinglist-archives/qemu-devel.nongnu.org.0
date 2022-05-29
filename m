Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722D53710B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 15:06:30 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvIcm-0002tr-Rv
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 09:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvIZa-0001b5-Mf; Sun, 29 May 2022 09:03:11 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvIZY-00067P-6L; Sun, 29 May 2022 09:03:10 -0400
Received: by mail-qk1-x72e.google.com with SMTP id p63so9072463qkf.0;
 Sun, 29 May 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rm3dtgCDheb8nmJvzsOlXakuPQK1yJcVufSR174umek=;
 b=czByNxCE8eb6dQfsq6hEQArHAUhxiivYZRu8PuZ4VA1ICjC/QPzvaHccNMZdOMyXdx
 6mCdSbtKRwRYSkGdJPweG1xVHuyNZL8ZDESRvLe87R3FpZKoutfu6ZSuR1knZ4Yv1yDw
 c84ws/EcPc/IMNnUn1E/HmXKcJkMF2CER5zSHIe0Jglyy8trfc8q5Ng9dx+b1vda1H0Q
 hehYTEQ5FdhTG/rV0jYegmefVDl9kTxmqyjqMPrTXevOb1943eGHMuvjpQOgxx+uEniI
 58RxbSNZd3xYt+77llug5/v+4ydFM0EYXZkfYqAn9Dy4JQ/FrOBl8bmYtRVPs1QvtHl+
 E7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rm3dtgCDheb8nmJvzsOlXakuPQK1yJcVufSR174umek=;
 b=qDGpTTtI83Z4XKUaWId593HCAytZVh3f864e5LSnpz/F6YsftrN7kuU8p37icUwTgK
 DkUAqH3aD+3FAebzl3ydKZ4Id69vfWXh1DengR9TBX7IatTKWiVFcADIwvjAXai7yaWp
 hzhUTNIUgV86zZBtM8pwuhTK8VJFJW+kEV3v3jiWscXWTLOC0wHymhAHERRdb9oPZMW4
 /SRQJ5dArJsgJ4/OkiyHltnJaSuih5KYQW1QMdIzkRBxGiBB1j/nL4rJ5wS14qTnH8a0
 TsVvoyzppyMzb5YdK8ShnJ2YJFd76d7lRisUe6gBFJwZHp0PKXl58kq41hl8Ujvem8VS
 eY2A==
X-Gm-Message-State: AOAM532RPkBjpY4RcDxXDPST6YT1Tau/mzTnTjsfQ8Wc7IEsGfB8Hw1R
 J7pX3dUFEg7Ll3dZv+ei8WsoLC/aFU3QtV3M915KUhyugv5ZAgQx
X-Google-Smtp-Source: ABdhPJxe0vzefFEFDfCW5nnS5Mqf7r32+kMMY7bE2XDOK2DPTJ6opa5MDdn4JnoQkhyUM+6rn2bHDIGmL27YgZ1CAY4=
X-Received: by 2002:a05:620a:444a:b0:6a3:ae32:ee9d with SMTP id
 w10-20020a05620a444a00b006a3ae32ee9dmr21319275qkp.457.1653829385639; Sun, 29
 May 2022 06:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220528192057.30910-1-shentey@gmail.com>
 <110e160e-19bd-dd7a-1b4e-1a0e7437b782@ilande.co.uk>
 <ac5d95b2-8be5-1585-3076-deabe749e926@ilande.co.uk>
In-Reply-To: <ac5d95b2-8be5-1585-3076-deabe749e926@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 29 May 2022 15:02:43 +0200
Message-ID: <CAG4p6K7DzHVsp8425-O4uvb46XT9nzw-A2CK_jK8Nm+Xt8wsbw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] QOM'ify PIIX southbridge creation
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000cdbac05e0262958"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x72e.google.com
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

--0000000000000cdbac05e0262958
Content-Type: text/plain; charset="UTF-8"

On Sun, May 29, 2022 at 12:06 PM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 29/05/2022 10:46, Mark Cave-Ayland wrote:
>
> > On 28/05/2022 20:20, Bernhard Beschow wrote:
> >
> >> v3:
> >> * Rebase onto 'hw/acpi/piix4: remove legacy piix4_pm_init() function'
> (Mark) [1]
> >> * Use embedded structs for touched PCI devices (Mark)
> >> * Fix piix4's rtc embedded struct to be initialized by
> >>    object_initialize_child() (Peter) [2]
> >>
> >> Testing done:
> >>
> >> 1)
> >> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
> >> Result: All pass.
> >>
> >> 2)
> >> * `qemu-system-x86_64 -M pc -m 2G -cdrom
> archlinux-2022.05.01-x86_64.iso`
> >> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
> >>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1
> console=tty0"`
> >>
> >> In both cases the system booted successfully and it was possible to
> shut down
> >> the system using the `poweroff` command.
> >>
> >>
> >> v2:
> >> * Preserve `DeviceState *` as return value of piix4_create() (Mark)
> >> * Aggregate all type name movements into first commit (Mark)
> >> * Have piix4 southbridge rather than malta board instantiate piix4 pm
> (me)
> >>
> >> Testing done:
> >>
> >> 1)
> >> `make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
> >> Result: All pass.
> >>
> >> 2)
> >> Modify pci_piix3_realize() to start with
> >>      error_setg(errp, "This is a test");
> >> Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom
> >> archlinux-2022.05.01-x86_64.iso`.
> >> Result: qemu-system-x86_64 aborts with: "This is a test"
> >>
> >>
> >> v1:
> >> The piix3 and piix4 southbridge devices still rely on create()
> functions which
> >> are deprecated. This series resolves these functions piece by piece to
> >> modernize the code.
> >>
> >> Both devices are modified in lockstep where possible to provide more
> context.
> >>
> >> Testing done:
> >> * `qemu-system-x86_64 -M pc -m 2G -cdrom
> archlinux-2022.05.01-x86_64.iso`
> >> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
> >>    debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1
> console=tty0"`
> >>
> >> In both cases the system booted successfully and it was possible to
> shut down
> >> the system using the `poweroff` command.
> >>
> >> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html
> >> [2] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html
> >>
> >> Bernhard Beschow (7):
> >>    include/hw/southbridge/piix: Aggregate all PIIX soughbridge type
> names
> >>    hw/isa/piix4: Use object_initialize_child() for embedded struct
> >>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
> >>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
> >>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
> >>    hw/isa/piix4: QOM'ify PIIX4 PM creation
> >>    hw/isa/piix{3,4}: Inline and remove create() functions
> >>
> >>   hw/i386/pc_piix.c             |   7 +-
> >>   hw/isa/piix3.c                |  98 ++++++++++++++-------------
> >>   hw/isa/piix4.c                | 120 +++++++++++++++++-----------------
> >>   hw/mips/malta.c               |   7 +-
> >>   include/hw/isa/isa.h          |   2 -
> >>   include/hw/southbridge/piix.h |   6 +-
> >>   6 files changed, 127 insertions(+), 113 deletions(-)
> >
> > Hi Bernhard,
> >
> > I've spotted a couple of small things, but once those are fixed this
> series looks
> > good to me so I'm happy to give a:
> >
> > Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >
> > Thanks for your patience with these series too: you've done some good
> work here,
> > however patchsets like this can sometimes take a while to get reviewed
> because they
> > both i) touch legacy code/APIs and ii) cut across multiple machines and
> maintainers.
> > I'd really like to get this work, along with your RTC updates, merged
> soon as it is a
> > great improvement.
> >
> > One reason that you may not get many reviews is because you've not added
> the relevant
> > maintainers on To/CC. Due to the large volume of emails on qemu-devel,
> quite a few
> > maintainers will filter based upon their own email address so it is
> definitely worth
> > adding them in.
> >
> > Fortunately you can easily find the relevant maintainer email addresses
> by running
> > "./scripts/get_maintainer.pl <path-to-git-patch-dir>" on your git
> format-patch
> > directory. I'd recommend doing this, and also dropping qemu-trivial
> since I would say
> > these patches are now beyond the trivial threshold.
>
> Oh wait - I see now it's just the cover letter which is missing the
> additional
> maintainer addresses :)  If you could add them into the cover letter for
> your next
> revision that would be great, since it gives context for maintainers to
> help with the
> review process.
>

Hi Mark,

Thanks for your great work you put into reviews and the useful insights! It
seems to me that the time it takes for patches to be queued depends on the
subsystem - some are faster, some are slower...

I've automated my setup as described in [1]. However, it doesn't seem to
work for the cover letter which I'd expect to be sent to the union of all
reviewers of all patches. Any idea how to fix this?

Best regards,
Bernhard

[1]
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer

>
>
> ATB,
>
> Mark.
>

--0000000000000cdbac05e0262958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, May 29, 2022 at 12:06 PM Mark Cave-Ayland &lt;<a href=3D"mai=
lto:mark.cave-ayland@ilande.co.uk">mark.cave-ayland@ilande.co.uk</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 29/05/20=
22 10:46, Mark Cave-Ayland wrote:<br>
<br>
&gt; On 28/05/2022 20:20, Bernhard Beschow wrote:<br>
&gt; <br>
&gt;&gt; v3:<br>
&gt;&gt; * Rebase onto &#39;hw/acpi/piix4: remove legacy piix4_pm_init() fu=
nction&#39; (Mark) [1]<br>
&gt;&gt; * Use embedded structs for touched PCI devices (Mark)<br>
&gt;&gt; * Fix piix4&#39;s rtc embedded struct to be initialized by<br>
&gt;&gt; =C2=A0=C2=A0 object_initialize_child() (Peter) [2]<br>
&gt;&gt;<br>
&gt;&gt; Testing done:<br>
&gt;&gt;<br>
&gt;&gt; 1)<br>
&gt;&gt; `make check-avocado` for --target-list=3Dx86_64-softmmu,mips-softm=
mu<br>
&gt;&gt; Result: All pass.<br>
&gt;&gt;<br>
&gt;&gt; 2)<br>
&gt;&gt; * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_=
64.iso`<br>
&gt;&gt; * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -=
hda<br>
&gt;&gt; =C2=A0=C2=A0 debian_wheezy_mipsel_standard.qcow2 -append &quot;roo=
t=3D/dev/sda1 console=3Dtty0&quot;`<br>
&gt;&gt;<br>
&gt;&gt; In both cases the system booted successfully and it was possible t=
o shut down<br>
&gt;&gt; the system using the `poweroff` command.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; v2:<br>
&gt;&gt; * Preserve `DeviceState *` as return value of piix4_create() (Mark=
)<br>
&gt;&gt; * Aggregate all type name movements into first commit (Mark)<br>
&gt;&gt; * Have piix4 southbridge rather than malta board instantiate piix4=
 pm (me)<br>
&gt;&gt;<br>
&gt;&gt; Testing done:<br>
&gt;&gt;<br>
&gt;&gt; 1)<br>
&gt;&gt; `make check-avocado` for --target-list=3Dx86_64-softmmu,mips-softm=
mu<br>
&gt;&gt; Result: All pass.<br>
&gt;&gt;<br>
&gt;&gt; 2)<br>
&gt;&gt; Modify pci_piix3_realize() to start with<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, &quot;This is a test&quo=
t;);<br>
&gt;&gt; Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -c=
drom<br>
&gt;&gt; archlinux-2022.05.01-x86_64.iso`.<br>
&gt;&gt; Result: qemu-system-x86_64 aborts with: &quot;This is a test&quot;=
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; v1:<br>
&gt;&gt; The piix3 and piix4 southbridge devices still rely on create() fun=
ctions which<br>
&gt;&gt; are deprecated. This series resolves these functions piece by piec=
e to<br>
&gt;&gt; modernize the code.<br>
&gt;&gt;<br>
&gt;&gt; Both devices are modified in lockstep where possible to provide mo=
re context.<br>
&gt;&gt;<br>
&gt;&gt; Testing done:<br>
&gt;&gt; * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_=
64.iso`<br>
&gt;&gt; * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -=
hda<br>
&gt;&gt; =C2=A0=C2=A0 debian_wheezy_mipsel_standard.qcow2 -append &quot;roo=
t=3D/dev/sda1 console=3Dtty0&quot;`<br>
&gt;&gt;<br>
&gt;&gt; In both cases the system booted successfully and it was possible t=
o shut down<br>
&gt;&gt; the system using the `poweroff` command.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-=
05/msg05686.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.or=
g/archive/html/qemu-devel/2022-05/msg05686.html</a><br>
&gt;&gt; [2] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-=
02/msg01128.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.or=
g/archive/html/qemu-devel/2022-02/msg01128.html</a><br>
&gt;&gt;<br>
&gt;&gt; Bernhard Beschow (7):<br>
&gt;&gt; =C2=A0=C2=A0 include/hw/southbridge/piix: Aggregate all PIIX sough=
bridge type names<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix4: Use object_initialize_child() for embed=
ded struct<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix{3,4}: Move pci_map_irq_fn&#39;s near pci_=
set_irq_fn&#39;s<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix{3,4}: QOM&#39;ify PCI device creation and=
 wiring<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix{3,4}: Factor out ISABus retrieval from cr=
eate() functions<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix4: QOM&#39;ify PIIX4 PM creation<br>
&gt;&gt; =C2=A0=C2=A0 hw/isa/piix{3,4}: Inline and remove create() function=
s<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 hw/i386/pc_piix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-<br>
&gt;&gt; =C2=A0 hw/isa/piix3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 98 ++++++++++++++----=
---------<br>
&gt;&gt; =C2=A0 hw/isa/piix4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 120 +++++++++++++++++------=
-----------<br>
&gt;&gt; =C2=A0 hw/mips/malta.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-<br>
&gt;&gt; =C2=A0 include/hw/isa/isa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -<br>
&gt;&gt; =C2=A0 include/hw/southbridge/piix.h |=C2=A0=C2=A0 6 +-<br>
&gt;&gt; =C2=A0 6 files changed, 127 insertions(+), 113 deletions(-)<br>
&gt; <br>
&gt; Hi Bernhard,<br>
&gt; <br>
&gt; I&#39;ve spotted a couple of small things, but once those are fixed th=
is series looks <br>
&gt; good to me so I&#39;m happy to give a:<br>
&gt; <br>
&gt; Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@i=
lande.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
&gt; <br>
&gt; Thanks for your patience with these series too: you&#39;ve done some g=
ood work here, <br>
&gt; however patchsets like this can sometimes take a while to get reviewed=
 because they <br>
&gt; both i) touch legacy code/APIs and ii) cut across multiple machines an=
d maintainers. <br>
&gt; I&#39;d really like to get this work, along with your RTC updates, mer=
ged soon as it is a <br>
&gt; great improvement.<br>
&gt; <br>
&gt; One reason that you may not get many reviews is because you&#39;ve not=
 added the relevant <br>
&gt; maintainers on To/CC. Due to the large volume of emails on qemu-devel,=
 quite a few <br>
&gt; maintainers will filter based upon their own email address so it is de=
finitely worth <br>
&gt; adding them in.<br>
&gt; <br>
&gt; Fortunately you can easily find the relevant maintainer email addresse=
s by running <br>
&gt; &quot;./scripts/<a href=3D"http://get_maintainer.pl" rel=3D"noreferrer=
" target=3D"_blank">get_maintainer.pl</a> &lt;path-to-git-patch-dir&gt;&quo=
t; on your git format-patch <br>
&gt; directory. I&#39;d recommend doing this, and also dropping qemu-trivia=
l since I would say <br>
&gt; these patches are now beyond the trivial threshold.<br>
<br>
Oh wait - I see now it&#39;s just the cover letter which is missing the add=
itional <br>
maintainer addresses :)=C2=A0 If you could add them into the cover letter f=
or your next <br>
revision that would be great, since it gives context for maintainers to hel=
p with the <br>
review process.<br></blockquote><div><br></div><div>Hi Mark,</div><div><br>=
</div><div>Thanks for your great work you put into reviews and the useful i=
nsights! It seems to me that the time it takes for patches to be queued  de=
pends on the subsystem - some are faster, some are slower...<br></div><div>=
<br></div><div>I&#39;ve automated my setup as described in [1]. However, it=
 doesn&#39;t seem to work for the cover letter which I&#39;d expect to be s=
ent to the union of all reviewers of all patches. Any idea how to fix this?=
</div><div><br></div><div>Best regards,</div><div>Bernhard<br></div><div><b=
r></div><div>[1] <a href=3D"https://www.qemu.org/docs/master/devel/submitti=
ng-a-patch.html#cc-the-relevant-maintainer">https://www.qemu.org/docs/maste=
r/devel/submitting-a-patch.html#cc-the-relevant-maintainer</a> </div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000000cdbac05e0262958--

