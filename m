Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0DD5A7D95
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:39:29 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTN0B-0007Q2-SO
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTMu0-0001Mg-T5
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:33:10 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTMty-00061P-Ak
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:33:04 -0400
Received: by mail-io1-xd2f.google.com with SMTP id q81so11729410iod.9
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=db5u7MoT2yxtd2eUKLd+WvQKmr7O5WLjxDzUPMuD/Nk=;
 b=vADEi+ZZkvfKqfbPbSVU4euCdC8CRb9f8H0GQY/gh7G6/LY4EH6N5LjtMl+lHkL5r4
 c8U1U2+yeObt8XX3M2wD8VQ69+RwTlPSvGYpmkBDLetkp1SSUQDJWWTwNUxtRnkPCyle
 SSDc0S5frEIatkdlLMvAnb5E7g+Yad5+sk4MKK4Oy8ATRXaft239Bb9ujHilfh1Mi+Fs
 +LqFVT4bMjkxoinNqeuYn1a0yT9YORswqVvwfAY+HEEIF6XOE4etDE94LBOdRHJJTJO0
 8dfNcgLmo0WFv6AynzXRK0BXuwvm+886iJXUQ/RbcrthRqIfZ8AyMXADwZBPF3PiwzNk
 ukbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=db5u7MoT2yxtd2eUKLd+WvQKmr7O5WLjxDzUPMuD/Nk=;
 b=MXyxr4KeY9bAxo/RZGJsB7G9DHoJZBPglgUAwc1WtnvRaVef8TY6iL9rEQ1w1LXd7n
 sqtH43BY9aEEDF8OnSlgJyCQ9E7x2iXqyvPKU+I+enHgeiq3JPkDSLwwqJ6wKbGkATge
 552x+KttjVFLljtm9A1wg9XlwvpDPZ1/bTT6kamW3UfKaoH8ipSGOZwi+3le6wvedEsx
 9hSfeLBVsxl7qC6oC2xpDQnxb/SSePWQ0t10SbiYL63rddhsqzlKAjSswdvVngdi6GTN
 IJ1TGLyaHzcG5KIZ6WI58mXVpnKSL/53RBA+hHYbhpBjD+c1q10/xKoTaEoU3qU852I2
 eVXQ==
X-Gm-Message-State: ACgBeo3/kzGIsIAIbtj4VRkCWK+6HTNwOXr/hCUM9vUuVXZDRQzzhIgd
 IM8CABFfeKnI55AHuMK/2+iw/p5O2ZkFC0kbByPBgw==
X-Google-Smtp-Source: AA6agR6f0ezweXbrRxaJ04Zq5xHkglulGTeCFYc147hwt66hImRNybCFwoTeqWuhjYq9x4jg3TGN49EnmbzkfQXwsW8=
X-Received: by 2002:a05:6602:2751:b0:68a:af60:c9d2 with SMTP id
 b17-20020a056602275100b0068aaf60c9d2mr12597435ioe.91.1661949181030; Wed, 31
 Aug 2022 05:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220829084417.144739-1-akihiko.odaki@daynix.com>
 <874jxuhshs.fsf@pond.sub.org>
 <20220830120014.55f55b24.alex.williamson@redhat.com>
 <87y1v4ddwx.fsf@pond.sub.org>
In-Reply-To: <87y1v4ddwx.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 31 Aug 2022 21:32:50 +0900
Message-ID: <CAE=JJXfU=kT6-pchk1iQrqv3__mwNbWomhaKH5uOT4PdPh84cA@mail.gmail.com>
Subject: Re: [PATCH] pci: Abort if pci_add_capability fails
To: Markus Armbruster <armbru@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 John Snow <jsnow@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 31, 2022 at 5:18 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Alex Williamson <alex.williamson@redhat.com> writes:
>
> > On Tue, 30 Aug 2022 13:37:35 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >>        if (!offset) {
> >>            offset = pci_find_space(pdev, size);
> >>            /* out of PCI config space is programming error */
> >>            assert(offset);
> >>        } else {
> >>            /* Verify that capabilities don't overlap.  Note: device assignment
> >>             * depends on this check to verify that the device is not broken.
> >>             * Should never trigger for emulated devices, but it's helpful
> >>             * for debugging these. */
> >>
> >> The comment makes me suspect that device assignment of a broken device
> >> could trigger the error.  It goes back to
> >>
> >> commit c9abe111209abca1b910e35c6ca9888aced5f183
> >> Author: Jan Kiszka <jan.kiszka@siemens.com>
> >> Date:   Wed Aug 24 14:29:30 2011 +0200
> >>
> >>     pci: Error on PCI capability collisions
> >>
> >>     Nothing good can happen when we overlap capabilities. This may happen
> >>     when plugging in assigned devices or when devices models contain bugs.
> >>     Detect the overlap and report it.
> >>
> >>     Based on qemu-kvm commit by Alex Williamson.
> >>
> >>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>     Acked-by: Don Dutile <ddutile@redhat.com>
> >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> If this is still correct, then your patch is a regression: QEMU is no
> >> longer able to gracefully handle assignment of a broken device.  Does
> >> this matter?  Alex, maybe?
> >
> > Ok, that was a long time ago.  I have some vague memories of hitting
>
> Indeed!
>
> > something like this with a Broadcom NIC, but a google search for the
> > error string doesn't turn up anything recently.  So there's a fair
> > chance this wouldn't break anyone initially.
>
> I like your careful phrasing.
>
> > Even back when the above patch was proposed, there were some
> > suggestions to turn the error path into an abort, which I pushed back
> > on since clearly enumerating capabilities of a device can occur due to
> > a hot-plug and we don't necessarily have control of the device being
> > added.  This is only more true with the possibility of soft-devices out
> > of tree, through things like vfio-user.
>
> Valid point.
>
> When an compiled-in device model asks for overlapping PCI capabilities,
> it's a programming error.
>
> When an assigned device (be it physical or virtual) has overlapping PCI
> capabilities, it's bad input.
>
> Abort on programming error is okay.  Abort on bad input isn't.
>
> I think callers of the former sort should pass &error_abort to
> pci_add_capability(), and callers of the latter sort should handle the
> error.

Looking at vfio's implementation, it seems it makes its own effort to
make capabilities not overlap. Taking account of that, I have sent a
new version titled "[PATCH v2] pci: Assert that capabilities never
overlap", which has an updated message and removes the comment in
pci_add_capability().

>
> > Personally I think the right approach is to support an error path such
> > that we can abort when triggered by a cold-plug device, while simply
> > rejecting a broken hot-plug device, but that seems to be the minority
> > opinion among QEMU developers afaict.  Thanks,
>
> I'm in the "aborting on programming errors is okay" camp.
>
> Recovery from certain programming errors is possible.  However,
> different programming errors can manifest themselves the same way, and
> not all need permit safe recovery.
>
> Say we detect overlapping PCI capabilities when hot-plugging a virtual
> device model.
>
> If this is because the programmer passed an incorrect literal offset, we
> can recover safely by failing the hot plug.
>
> But perhaps the offset comes from a table, and some other bug scribbled
> over it.  Continuing the process is *unsafe*, and may increase the
> damage and/or obstruct the root cause.
>
> The former kind of bug is unlikely to survive even cursory testing.
>

Whatever kind of programming error it is, it is dangerous to attempt
to recover from it using an error handling code path untested for a
long period. I think it is better to have some common code to recover
from assertion failures. For example, we may have some option to print
"oops" just like Linux does when an assertion fails and let the user
handle it. That is quite out of scope of this change though.

Regards,
Akihiko Odaki

