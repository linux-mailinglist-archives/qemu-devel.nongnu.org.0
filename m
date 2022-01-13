Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0648DAAD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:28:18 +0100 (CET)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n821R-0003Wg-Rm
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n8204-0002WH-0U
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:26:52 -0500
Received: from mail-4317.proton.ch ([185.70.43.17]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n8200-00085D-HR
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:26:51 -0500
Date: Thu, 13 Jan 2022 15:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infinite-omicron.com; s=protonmail2; t=1642087603;
 bh=PKdqd3oq1m+1Y0bXLUSkRZPESlnKP7RSzXtBUUf6FD0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=OK2fk7r/9ezoY1gRjWwbi+HHvHJXpmSzbMpH7dZZieROkuEzSpbd5DWf08PD3BRW7
 SmkHNVzqedIC2PMujqViVnBN3+mveYV2E3JsQp/nTcKWuwe806VWoommgiRloHmLmr
 TC5dBPMtfhT3lA9/P437fb8ULzK5Bez9k+K4skqb+6gSOUFuMU3FYwSas4rWfCR3k5
 +CxLZ2IHBOvamyB6YOsrlwqlrcZnLkZ03PPTD0aLUj/LjzOhDu/bmZuaJRegmAzrWj
 qQP22mDnTjVwNUNI04hmTve5/S2kdptsxSFGRBaRukbzHh3pkU0VHI8YShsiEztzuN
 /Ow/QA5o2km5A==
To: Peter Maydell <peter.maydell@linaro.org>
From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
Message-ID: <j1qGqi5somTrN_l7NlnO4O5sgwVeMYkdDQpTeSA_4yCJIfkWQiTTknlJTNc3CZXhvStUz749KLloYnHDmhA7kEIbRf-cA-3nHGXy0qjsIAY=@infinite-omicron.com>
In-Reply-To: <CAFEAcA8cY0R-jU8zH_QY4PehRnFCpJSo07VBQeXtxHKhMxjpZA@mail.gmail.com>
References: <20220105205628.5491-1-oxr463@gmx.us>
 <CAFEAcA8cY0R-jU8zH_QY4PehRnFCpJSo07VBQeXtxHKhMxjpZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17;
 envelope-from=lucas.ramage@infinite-omicron.com; helo=mail-4317.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Cc: oxr463@gmx.us, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Thanks for that.

The next on the list is docs/ccid.txt, should this go in the same "Device E=
mulation / Emulated Devices" section? It mentions USB at the top.

Regards,

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Thursday, January 13th, 2022 at 6:37 AM, Peter Maydell <peter.maydell@li=
naro.org> wrote:

> On Wed, 5 Jan 2022 at 20:56, oxr463@gmx.us wrote:
>
> > From: Lucas Ramage lucas.ramage@infinite-omicron.com
> >
> > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
> >
> > Signed-off-by: Lucas Ramage lucas.ramage@infinite-omicron.com
> > -----------------------------------------------------------------------=
--------------------------------------------------
> >
> > docs/{can.txt =3D> system/can.rst} | 92 ++++++++++++++-----------------=
-
> >
> > docs/system/index.rst | 1 +
> >
> > 2 files changed, 42 insertions(+), 51 deletions(-)
> >
> > rename docs/{can.txt =3D> system/can.rst} (68%)
>
> Hi Lucas; thanks for this docs-conversion patch. It looks
>
> good to me, except that I think that rather than putting
>
> the new document in the top-level index of the system manual
>
> it would fit better in the "Device Emulation / Emulated Devices"
>
> subsection, where we already document things like USB devices.
>
> Rather than ask you to respin the patch again for what is
>
> basically just a "git mv", I'm going to take this patch via
>
> my target-arm tree and make that change there.
>
> Thanks
>
> -- PMM

