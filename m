Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFF332F21
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:37:50 +0100 (CET)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiAv-0003IX-DP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfne-0004Yb-BD; Tue, 09 Mar 2021 12:05:38 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:35972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfnc-0000np-KG; Tue, 09 Mar 2021 12:05:38 -0500
Received: by mail-ot1-f47.google.com with SMTP id t16so13499162ott.3;
 Tue, 09 Mar 2021 09:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q1XNEE0z/hqszFiJ0f9cCvphhpMbw6AgpQTG7xmgIAc=;
 b=WoCsQRaBJwERrZUcKkwkNM5GkHwghGbHQyrbKVFc8vxkMb91tMwIToCbCcC5Kp6oAJ
 1xp3Pc4qHqwRcK9u6m7KEJfLQiJof1ee2uOwqrQlKf57ouny4FWNfgAK8gbzWP6GFxMZ
 GK1f3Oya0Xcr9tG6XAtyhzQgoPKMouklFelU82w+OHOWOpd3oToBLbTkrULllrWPYbcL
 NC8iqSoWrK/BwQ2OJextbZAN03YYHDSu54pdLDz0EzR8kZ7miMlM4Xr0v7s2REV45d/i
 ZtGmITWOCDEgdR2oni9ohb0MliGQXVJGZS2wYJjcho1cvP7W8n5sp9wR0NQ2/uHTgjVK
 biRQ==
X-Gm-Message-State: AOAM533VDnQM7l/wuTkc+DKmPSnqvntBZNWJ0R1YUNKwyV8JN6uySMmR
 F+/H+EAAesjfD+JgGCzU3KFF3ZkGYvwYMsj4U/U=
X-Google-Smtp-Source: ABdhPJza5Q1dLXOYGLGZU5PfIRm9kG0uWYLLrn8xfnLER5+lz+tqL1mJBZ4H0XNRV0+IvwyrvMGmJgwIzZBHD0M4dYo=
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr25059422otf.37.1615309534965; 
 Tue, 09 Mar 2021 09:05:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box>
 <YEebhGGvGeWpK5+x@work-vm> <f8f3f750-b9b5-8a99-4df7-93bb7daf0cb6@amsat.org>
In-Reply-To: <f8f3f750-b9b5-8a99-4df7-93bb7daf0cb6@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 9 Mar 2021 18:05:23 +0100
Message-ID: <CAAdtpL7+ev=e15xpG1Bsg4KbFDUUaRFzZY=gMxcZ9V7yzw5nyw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 6:03 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> +Gerd
>
> On 3/9/21 5:00 PM, Dr. David Alan Gilbert wrote:
> > * David Gibson (david@gibson.dropbear.id.au) wrote:
> >> On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
> >>> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
> >>>> On Thu, 4 Mar 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> >>>>>> To allow reusing ISA bridge emulation for vt8231_isa move the devi=
ce
> >>>>>> state of vt82c686b_isa emulation in an abstract via_isa class.
> >>>>>>
> >>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>>>>> ---
> >>>>>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++-------------=
-----
> >>>>>>  include/hw/pci/pci_ids.h |  2 +-
> >>>>>>  2 files changed, 40 insertions(+), 32 deletions(-)
> >>>>>>
> >>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>>>>> index 72234bc4d1..5137f97f37 100644
> >>>>>> --- a/hw/isa/vt82c686.c
> >>>>>> +++ b/hw/isa/vt82c686.c
> >>>>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info =
=3D {
> >>>>>>  };
> >>>>>>
> >>>>>>
> >>>>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
> >>>>>> +#define TYPE_VIA_ISA "via-isa"
> >>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
> >>>>>>
> >>>>>> -struct VT82C686BISAState {
> >>>>>> +struct ViaISAState {
> >>>>>>      PCIDevice dev;
> >>>>>>      qemu_irq cpu_intr;
> >>>>>>      ViaSuperIOState *via_sio;
> >>>>>>  };
> >>>>>>
> >>>>>> +static const VMStateDescription vmstate_via =3D {
> >>>>>> +    .name =3D "via-isa",
> >>>>>
> >>>>> You changed the migration stream name, so I think we have
> >>>>> a problem with migration... No clue how to do that properly.
> >>>>
> >>>> I don't think these machines support migration or state description =
of
> >>>> vt86c686b was not missing something before these patches that would =
make
> >>>> it not work anyway so I did not worry about this too much. I doubt
> >>>> anybody wants to migrate a fuloong2e machine so this should not be a
> >>>> problem in practice but maybe you can mention it in the release note=
s if
> >>>> you think that would be necessary.
> >>>
> >>> Maybe just add in the description:
> >>>
> >>>  This change breaks migration back compatibility, but
> >>>  this is not an issue for the Fuloong2E machine.
> >>
> >> Hrm.  If migration was never supported, why is there a vmstate
> >> description there at all though?
> >>
> >> That said, I don't think breaking compat is a problem: that's only an
> >> issue where we actually have versioned machine types, which covers
> >> only pc, pseries, arm virt and a very few others.  I don't think this
> >> device was used on any of them.
> >
> > Except 'vt82c686b-usb-uhci' is a generic PCI device that anyone can
> > instantiate, so it's not actually Fuloong specific.
>
> I tend to see this as a bug, as this is a function specific to the
> southbridge chipset and isn't meant to be used apart...
>
> If this isn't a feature but really a bug, a simple way to clean this
> is to make struct UHCIInfo and usb_uhci_common_realize() public, and
> type_register "vt82c686b-usb-uhci" elsewhere.
>
> Gerd would that work with you?

Or is it too late, we can not make this device kconfig-selectable now?

