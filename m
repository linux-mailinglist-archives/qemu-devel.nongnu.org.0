Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5C566516
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:34:19 +0200 (CEST)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e0g-0000vS-VC
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8dlx-0007P5-2g
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:19:05 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8dls-0001me-9S
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:19:04 -0400
Received: by mail-yb1-xb32.google.com with SMTP id 76so4924287ybd.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHUPEM7gJ+wdHtbdsYxoMIaCeLyiGHSP0yAN6tjEB8U=;
 b=Sl6DLSojWOIU3jwCkr79I3BBkdUGdk6mxm9X1OPytjiYynt6Y85nNKfUiWdDT72o3j
 zX+MLB3tXpRsOxNk+o3HRWJ3lw83OvVF6Eo7qnqSZL8pHN1ZxLOtXzSzJ+zdihc+GMgM
 l+cx8LMfUSbXw4+e8ix362LJcg2YDAhbn6ghE7q7Mqk1YIzNTWPq0IwWZFm0HwyorcmW
 MM0UHGJTusNbvinHf08cL1/71dsv6j6wGPmxd89JvjhtNGuae64EjsU2LSg6ks0WLx7j
 ArUJNNi0RYe3aMj1HCx9Gl9U6bdpIJhZxpfMJl3YuGo64Ith89KTedHVKXoKcK2udNVW
 hDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHUPEM7gJ+wdHtbdsYxoMIaCeLyiGHSP0yAN6tjEB8U=;
 b=UjJz2qsEHCe0mTWT+2GzS9e2p0Yhiiw+3oWaAU0qEOmibOY4OsQ76+eg0qTTWabbCE
 oZhIglcRpXHMNLpMQn8T4V8q8G/rBT9draas/y2Snau4zlFjOZJs5aj6TxDfA26OMd76
 wdeo02HnMXFkw1Go+Zdv7OY5XxTivGMpwdnPr4EkPFIYxJS738v0CS7bM4+qPkD7Ssym
 MY6xREEC5S1fhoLsAiwKbRDnax4mXvWAOqmg7POYMiS+IrhUsJXX0xDh8B8XDc+nkeV3
 /HKFZd5qJzu1EzuuCZKfGUDQeeVddBtGHXbW/Ln/JBIuQolJNHLYQQ/SUPLaMj4LhIam
 QoEg==
X-Gm-Message-State: AJIora8bhEZnx3FesWTgICVYAMz1UpgnvgqrceXKOsXTru0sEsJmV62I
 +JMNYp9Cp880qfAA2kXlfdT3bLHk8WjLCUkunWTZ9w==
X-Google-Smtp-Source: AGRyM1tsNOqTFt8ps7+Ijn7iubAMG45taM/qwHgR3IcqHAVAUXq+rFdYejQLvePIzNEUMAtWEYTdooI5qe1Xsfz5CEY=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr36084343ybr.288.1657009139187; Tue, 05
 Jul 2022 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA-D6GhmGA=Det6PGvXC-sup7pKa3KoBsUHtBkK5e1K_Eg@mail.gmail.com>
 <becf7d89-3d40-b40a-aeeb-9d99c79ef7a0@ilande.co.uk>
In-Reply-To: <becf7d89-3d40-b40a-aeeb-9d99c79ef7a0@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 09:18:21 +0100
Message-ID: <CAFEAcA-uTpGWoRqDOwW+W8gifbGrywt-ofY31RiiCvwEb0Yo+w@mail.gmail.com>
Subject: Re: [PATCH 34/40] lasips2: update VMStateDescription for LASIPS2
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 5 Jul 2022 at 07:48, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 04/07/2022 14:38, Peter Maydell wrote:
>
> > On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> Since this series has already introduced a migration break for the HPPA B160L
> >> machine, we can use this opportunity to improve the VMStateDescription for
> >> the LASIPS2 device.
> >>
> >> Add the new int_status field to the VMStateDescription and remodel the ports
> >> as separate VMSTATE_STRUCT instances.
> >>
> >> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> ---
> >>   hw/input/lasips2.c | 25 +++++++++++++++++++------
> >>   1 file changed, 19 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> >> index e602e3c986..ea7c07a2ba 100644
> >> --- a/hw/input/lasips2.c
> >> +++ b/hw/input/lasips2.c
> >> @@ -35,15 +35,28 @@
> >>   #include "qapi/error.h"
> >>
> >>
> >> +static const VMStateDescription vmstate_lasips2_port = {
> >> +    .name = "lasips2-port",
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >> +    .fields = (VMStateField[]) {
> >> +        VMSTATE_UINT8(control, LASIPS2Port),
> >> +        VMSTATE_UINT8(buf, LASIPS2Port),
> >> +        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
> >> +        VMSTATE_END_OF_LIST()
> >> +    }
> >> +};
> >> +
> >>   static const VMStateDescription vmstate_lasips2 = {
> >>       .name = "lasips2",
> >> -    .version_id = 0,
> >> -    .minimum_version_id = 0,
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >>       .fields = (VMStateField[]) {
> >> -        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
> >> -        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
> >> -        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
> >> -        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
> >> +        VMSTATE_UINT8(int_status, LASIPS2State),
> >> +        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
> >> +                       vmstate_lasips2_port, LASIPS2Port),
> >> +        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
> >> +                       vmstate_lasips2_port, LASIPS2Port),
> >>           VMSTATE_END_OF_LIST()
> >>       }
> >>   };
> >
> > The set of things we were migrating and the set of
> > things we now migrate don't seem to line up ?
>
> Yeah I should probably have documented this better in the commit message. The
> existing VMStateDescription isn't correct since it misses both the buf and
> loopback_rbne fields which are accessed across port reads and writes, and the port id
> is not required because it is hardcoded to 0 for the keyboard port and 1 for the
> mouse port.
>
> Rather than have the extra code churn throughout the series, I went for doing the
> minimum to vmstate_lasips2 to make the patch compile and then fix up everything
> (including add the new int_status bitmap) in this one patch. I think this is fine
> since as we're introducing a migration break in the series, there are no concerns
> over backward compatibility.
>
> Would an updated description for this commit message be sufficient? A quick skim over
> the emails indicates that the only queries during review were related to the handling
> of the VMStateDescription.

Yeah, if you comment this in the relevant commit messages that should be
good enough.

-- PMM

