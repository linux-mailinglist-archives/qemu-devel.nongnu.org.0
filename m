Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81631485B37
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:02:39 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EMg-0008Mm-3b
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n5CLT-000855-0Y
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:53:15 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:45507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n5CLM-00047v-6K
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:53:14 -0500
Date: Wed, 05 Jan 2022 19:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infinite-omicron.com; s=protonmail2; t=1641412371;
 bh=HNzV2x8OdbpEE6EPa2DamExFXbAS8mtLmLUOjHLPwR0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=fdndZW1yRlkEPG7vCgjq77FEAa7hB/NoM251LK+nys2MRL24NFF889mntPwHA/2iU
 YmMJCtMGXoTMiNtAjHxQfQg9cgJzNj9IJP0yv5p8ONPrcUrBROydUuyl6IhGvFHY0C
 2sst+bYSOlP2HH/1nGyCcq/tnnc19ttB5N7I4xDEid/NyMl9AKKHlVxqjxEUvzWBRM
 g2sX0ssX5c7hBZkKwGN38uJg0XmGzqSQt64zWd1b3H9lLxs+SFsuBzGVoRYUDx3bFx
 HG6IFx4BjCIBMjCHIEwSLUURQoNKpL196sHyaMsAxzorPqCqLd827yxZh25DvbKTtt
 SAJeNeJ8KyEIg==
To: Thomas Huth <thuth@redhat.com>
From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
Message-ID: <UzkASXLpdM1kPkwP0fy-YM9n_cqQD5FJcSpZLwil4YCIZNm8XXWF8D18XU4cxjiOwfDf4oDILe-HmF3WcLKaifLTuT4Lq9V5cF-8LBQJ5MM=@infinite-omicron.com>
In-Reply-To: <9311d288-22bc-fb94-ad64-ddbd1c5e32f8@redhat.com>
References: <20211217212146.2573-1-oxr463@gmx.us>
 <9311d288-22bc-fb94-ad64-ddbd1c5e32f8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139;
 envelope-from=lucas.ramage@infinite-omicron.com;
 helo=mail-0301.mail-europe.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jan 2022 17:00:01 -0500
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
Reply-To: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Cc: oxr463@gmx.us, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

I intentionally sent the email via my gmx address. But I want my commit und=
er the infinite-omicron email address.

I had a few warnings on my end, but it builds fine with Sphinx v3.4.3 on De=
bian Bullseye. I can clean up the warnings in the new patch.

Yeah, it renders fine.

Let me submit a new patch for the rest of these changes too.

Regards,

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Wednesday, January 5th, 2022 at 4:11 AM, Thomas Huth <thuth@redhat.com> =
wrote:

> On 17/12/2021 22.21, oxr463@gmx.us wrote:
>
> > From: Lucas Ramage lucas.ramage@infinite-omicron.com
>
> Hi!
>
> Thanks for your patch! This looks like a good idea, but I think there are
>
> some minor issues which should be fixed...
>
> First: Please check your mailer setup. The mail has been sent via @gmx.us=
,
>
> but the Signed-off-by uses @infinite-omicron.com ... not a big issue, I
>
> guess, but it might be better to use the same address for both.
>
> Second, it does not work here, at least not with Sphinx 1.7 which I have
>
> installed on my system:
>
> docs/can.rst:39:Enumerated list ends without a blank line;
>
> unexpected unindent.
>
> Does this render correctly on your system?
>
> Also there are paragraphs in this file which should be clearly marked as
>
> pre-formatted text (use "::" for those), e.g.:
>
> diff --git a/docs/can.rst b/docs/can.rst
>
> --- a/docs/can.rst
>
> +++ b/docs/can.rst
>
> @@ -122,7 +125,7 @@ is setup according to the previous SJA1000 section.
>
> -device ctucan_pci,canbus0=3Dcanbus0-bus,canbus1=3Dcanbus0-bus \
>
> -nographic
>
> -Setup of CTU CAN FD controller in a guest Linux system
>
> +Setup of CTU CAN FD controller in a guest Linux system::
>
> insmod ctucanfd.ko || modprobe ctucanfd
>
> insmod ctucanfd_pci.ko || modprobe ctucanfd_pci
>
> > Bug: https://gitlab.com/qemu-project/qemu/-/issues/527
>
> Please use "Buglink:" instead, it's more common in the QEMU project.
>
> > Signed-off-by: Lucas Ramage lucas.ramage@infinite-omicron.com
> > -------------------------------------------------------------
> >
> > docs/{can.txt =3D> can.rst} | 14 ++++++--------
>
> While you're at it, I think this file should be moved into one of the
>
> subfolders as well, likely docs/system/ I guess.
>
> > docs/index.rst | 1 +
> >
> > 2 files changed, 7 insertions(+), 8 deletions(-)
> >
> > rename docs/{can.txt =3D> can.rst} (97%)
> >
> > diff --git a/docs/can.txt b/docs/can.rst
> >
> > similarity index 97%
> >
> > rename from docs/can.txt
> >
> > rename to docs/can.rst
> >
> > index 0d310237df..995134d079 100644
> >
> > --- a/docs/can.txt
> >
> > +++ b/docs/can.rst
>
> [...]
>
> > @@ -196,3 +193,4 @@ Links to other resources
> >
> > http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-dr=
iver.html
> >
> > (11) Integration with PCIe interfacing for Intel/Altera Cyclone IV base=
d board
> >
> > https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd
> >
> > +
>
> This look like an unnecessary addition of an empty line.
>
> > diff --git a/docs/index.rst b/docs/index.rst
> >
> > index 0b9ee9901d..beb868ca7f 100644
> >
> > --- a/docs/index.rst
> >
> > +++ b/docs/index.rst
> >
> > @@ -18,3 +18,4 @@ Welcome to QEMU's documentation!
> >
> > interop/index
> >
> > specs/index
> >
> > devel/index
> >
> > -   can
> >
> >     --
> >
> >     2.32.0
>
> Thomas

