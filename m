Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD21589CC7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:36:49 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJb1r-0004hJ-QE
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJau1-0003lf-Ge
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:28:41 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:54182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJatz-0004qn-Jl
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:28:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 475C7617E9
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70716C433D6
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:28:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Oh0IjWgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659619714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPRUR1d6C2o6R/GtiyamMys3pOb0dun1S6OPApUp3Js=;
 b=Oh0IjWgRw2Ed78mxBMIz5B/I/JXVCiYW9W/ahaeImg15bicUrZ1yntnNXixnTP+mTQ8rqn
 m40w1PcGgxfMgizh0o3CDlqyZ71Lk//snUe/0Y7IK/lbW+8/+tCDJq6iM+Q56s64aKr73c
 UAvfA4Iq2i/NYQrDb2hwQRBRRoGZxqM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6fbcf2c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 13:28:33 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-31e7ca45091so200733877b3.3
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 06:28:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo0mN24k3QDH0SK94j8VpZyGcyr1Mxf/JA8IFu7L1WlMcH5wfeZn
 wGNJLnfPIv5rz0B3fC52IXRti/uj8ovMfAoelGE=
X-Google-Smtp-Source: AA6agR40k1E4YmnnhSWG7HXjl6FctLL8NnSVBGu7WbqOWvWx/bLc6aRclXaBoeM+Y+q9XVpFXTCXPnOpcSr5urg8JCo=
X-Received: by 2002:a0d:c003:0:b0:325:314c:9924 with SMTP id
 b3-20020a0dc003000000b00325314c9924mr1591061ywd.259.1659619712489; Thu, 04
 Aug 2022 06:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
 <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
In-Reply-To: <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 15:28:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
Message-ID: <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 4, 2022 at 3:25 PM Laszlo Ersek <lersek@redhat.com> wrote:
>
> On 08/04/22 14:16, Ard Biesheuvel wrote:
> > On Thu, 4 Aug 2022 at 14:11, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >>
> >> On Thu, Aug 04, 2022 at 02:03:29PM +0200, Jason A. Donenfeld wrote:
> >>> Hi Daniel,
> >>>
> >>> On Thu, Aug 04, 2022 at 10:25:36AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> >>>> Yep, and ultimately the inability to distinguish UEFI vs other firmw=
are
> >>>> is arguably correct by design, as the QEMU <-> firmware interface is
> >>>> supposed to be arbitrarily pluggable for any firmware implementation
> >>>> not  limited to merely UEFI + seabios.
> >>>
> >>> Indeed, I agree with this.
> >>>
> >>>>
> >>>>> For now I suggest either reverting the original patch, or at least =
not
> >>>>> enabling the knob by default for any machine types. In particular, =
when
> >>>>> using MicroVM, the user must leave the knob disabled when direct bo=
oting
> >>>>> a kernel on OVMF, and the user may or may not enable the knob when
> >>>>> direct booting a kernel on SeaBIOS.
> >>>>
> >>>> Having it opt-in via a knob would defeat Jason's goal of having the =
seed
> >>>> available automatically.
> >>>
> >>> Yes, adding a knob is absolutely out of the question.
> >>>
> >>> It also doesn't actually solve the problem: this triggers when QEMU
> >>> passes a DTB too. It's not just for the new RNG seed thing. This bug
> >>> isn't new.
> >>
> >> In the other thread I also mentioned that this RNG Seed addition has
> >> caused a bug with AMD SEV too, making boot measurement attestation
> >> fail because the kernel blob passed to the firmware no longer matches
> >> what the tenant expects, due to the injected seed.
> >>
> >
> > I was actually expecting this to be an issue in the
> > signing/attestation department as well, and you just confirmed my
> > suspicion.
> >
> > But does this mean that populating the setup_data pointer is out of
> > the question altogether? Or only that putting the setup_data linked
> > list nodes inside the image is a problem?
>
> QEMU already has to inject a whole bunch of stuff into confidential
> computing guests. The way it's done (IIRC) is that the non-compressed,
> trailing part of pflash (basically where the reset vector code lives
> too) is populated at OVMF build time with a chain of GUID-ed structures,
> and fields of those structures are filled in (at OVMF build time) from
> various fixed PCDs. The fixed PCDs in turn are populated from the FD
> files, using various MEMFD regions. When QEMU launches the guest, it can
> parse the GPAs from the on-disk pflash image (traversing the list of
> GUID-ed structs), at which addresses the guest firmware will then expect
> the various crypto artifacts to be injected.
>
> The point is that "who's in control" is reversed. The firmware exposes
> (at build time) at what GPAs it can accept data injections, and QEMU
> follows that. Of course the firmware ensures that nothing else in the
> firmware will try to own those GPAs.
>
> The only thing that needed to be hard-coded when this feature was
> introduced was the "entry point", that is, the flash offset at which
> QEMU starts the GUID-ed structure traversal.
>
> AMD and IBM developers can likely much better describe this mechanism,
> as I've not dealt with it in over a year. The QEMU side code is in
> "hw/i386/pc_sysfw_ovmf.c".
>
> We can make setup_data chaining work with OVMF, but the whole chain
> should be located in a GPA range that OVMF dictates.

It sounds like what you describe is pretty OVMF-specific though,
right? Do we want to tie things together so tightly like that?

Given we only need 48 bytes or so, isn't there a more subtle place we
could just throw this in ram that doesn't need such complex
coordination?

Jason

