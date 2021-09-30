Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C091E41DF4A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:41:01 +0200 (CEST)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVz7E-0002L0-Qk
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVz4l-0008Ox-6K
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:38:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVz4i-0007dB-DJ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:38:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q2so1244634wrc.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRjZxwUCNKhGMZ/o8n6AuxVQxum0ABk7seQXqQRb40Y=;
 b=p7FBD/UmocRz0r62DP+WbWlWC903c6JXCq635oFqDsJv6iIIwPogZUXLJpLEfaZony
 lowPR3HftAUWevXLqOTYfkQtCmwBahKVLggk3QM0CcflvcXUGyIDlLvgysnHkHERSe3U
 VrXGgjuKYRB4eA9xPGg28VEHnxVqGvWEADb11NiYzphzhQJps2Xfkn8ukZe7WmBGeaL1
 i7DluRTJ7tGI9JZqRErCnO0/vJJZG6SZp7+fHzQji98wFzRcFduIh9pDKnU2GHVmrfHn
 7EK/QbBfdsSBiF/r5oVNtLE4zgl7Hjphy8mxt2CKs41DEoM7xlB0O9EG2m/sT1T55UN+
 Mz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRjZxwUCNKhGMZ/o8n6AuxVQxum0ABk7seQXqQRb40Y=;
 b=ojr2cT3LKsCLY4MRqltifP0BIg22UBFnZSq8czL21fnThqEdJh+SH9PjC2cfa2fufW
 3+3XGNcOprOdO4OLOolyfchpzvCZ4N4MHk59R4z9wo6JO/aMm4omv4i3yMqrXcmqGKi9
 YOApFnnEvoKtkcGtsZNXrxsfHFjdL5j6na1QXc7vTp/ugslgWdep3ZepiBCCTFxLI2CO
 rV9QuK4cSVIOIY1JBd6Bmii09TA2ZUSU5XBOh74sO3y2bbWd4/VhudybTZe6BjTcZuTo
 Iol0bpKfHvhPU77JWEIeiPIfVfk7xpO3by5wp39P3aFfZRKEt1l3DnD5aANrRDnQBdNG
 AJJw==
X-Gm-Message-State: AOAM530FZ5OB+aKvS/k8Eci5pirzc5DQOT0Cs3BZAPgoUc+rhQheMwMY
 f5x5QDLcBKZKE4wqCwgBA6MjKqjvwIe1tgPFKcxsdg==
X-Google-Smtp-Source: ABdhPJy2BvJJoirtHvGh3T5fLz2s4FeSfwuQxWt34OJ1QC4PAGESCVmYd0n7EpRwXMyh3wxECuqnHaRBmBT4h87eHNk=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr7439289wrr.149.1633019902466; 
 Thu, 30 Sep 2021 09:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 17:37:28 +0100
Message-ID: <CAFEAcA-t4kc6PiRoYOom=8z6LvSUFEv1DqKOQTsryyYm=HU5ww@mail.gmail.com>
Subject: Re: [PULL 00/44] ppc-for-6.2 queue 20210930
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 06:44, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2021-09-28 13:07:32 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20210930
>
> for you to fetch changes up to 85d887be82905aa81b5d3d6c483ff0fa9958382b:
>
>   MAINTAINERS: Demote sPAPR from "Supported" to "Maintained" (2021-09-30 12:26:06 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-09-30
>
> Here's the next batch of ppc related patches for qemu-6.2.  Highlights
> are:
>  * Fixes for several TCG math instructions from the El Dorado Institute
>  * A number of improvements to the powernv machine type
>  * Support for a new DEVICE_UNPLUG_GUEST_ERROR QAPI event from Daniel
>    Barboza
>  * Support for the new FORM2 PAPR NUMA representation.  This allows
>    more specific NUMA distances, as well as asymmetric configurations
>  * Fix for 64-bit decrementer (used on MicroWatt CPUs)
>  * Assorted fixes and cleanups
>  * A number of updates to MAINTAINERS
>
> Note that the DEVICE_UNPLUG_GUEST_ERROR stuff includes changes to
> files outside my normal area, but has suitable Acks.
>
> The MAINTAINERS updates are mostly about marking minor platforms
> unmaintained / orphaned, and moving some pieces away from myself and
> Greg.  As we move onto other projects, we're going to need to drop
> more of the ppc maintainership, though we're hoping we can avoid too
> abrupt a change.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

