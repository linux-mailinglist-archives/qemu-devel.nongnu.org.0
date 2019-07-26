Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DA6762F6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:01:37 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwsy-0006Gy-2c
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55439)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwsi-0005uT-2S
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwsg-0001XW-3S
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:51:18 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36981)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwsf-0001EQ-Uu
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:51:18 -0400
Received: by mail-ot1-x341.google.com with SMTP id s20so54735703otp.4
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PCiGOH2vGt3268bPGg5gjlycDePgi+EMiOCq8SixbU=;
 b=H1gqulCTeptLH3/sG/ZRPrpRqjytKhBmEzZnhXl+/kYCvmf0A7v01NNdAfmphjvQ+v
 i6GjiWH33h5s8KeMF+ovRlqomWsocvA0sYU1s38AsPOO7lWWY35XJO+5cJTHw8YuKbbg
 l555MlIl+4PJqKVRO2hkBNHUa58SweSZWLX2JPuFnVdLMniyaHWbcbCZGLIOOcOX4PmO
 WmoX8JtO0uVs1Ot4T7VmjheEQkoP+iuY4htm4iUhtqeB0fxb/5kvZvLvbfLYSwAty7vd
 /lNeEksd2LVMQehOCVZzJ44qHy9hoBOtkG93cp6EZ0YtLlMrAAxosEk8JIXX0CXCEVBr
 DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PCiGOH2vGt3268bPGg5gjlycDePgi+EMiOCq8SixbU=;
 b=uAAlebgtOh2FLbgBnRy29fwnMWxjtCmmYivUw6izwKZFhz2JRFbGNtukj7hrdDovKk
 NSDwbph4F+vu21k//YkKnp1dPJ1FjyG9G4ooR5+kmZvtoXq+a1EUELw5TyX3Psuw4pfR
 0P/rrt80uG1L/VWvChgaH3apCB33BUe6nxvAaWoOzFH79VFHyuvgjLhe5adlEZ05PAMv
 sAIMWWLH1ihVnfirZ4FvFoaPLq5/gRE7MkLRpceupUArrZF0UaFw7YWFKE9SBCQ4GJ/T
 tvUrjCOPfJwhdpoxQNFWTDLFl/tYWPeiVsfSkhHZ55UQNr5ZL4sd/uwuXc1ydC+1opAY
 Ga4Q==
X-Gm-Message-State: APjAAAWUVUWiTWaNmzZ4AO4of8/LpeTKHbrF/3VSNhhdZg6pQFFsj5f8
 A8ABxfIRhvQ9X2r3CCbmww93TkCIaROHnwzpIiwwEzqnK2Y=
X-Google-Smtp-Source: APXvYqw5W/g3TVU2isZ8O48K8plfBrTfHTMMIH1afgOGs8HHmSFG0Barg7Vvg/ZogyCS4+O2cNmmforYoytJUnIe+2U=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr21050879otk.221.1564134672931; 
 Fri, 26 Jul 2019 02:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
 <CAFEAcA_KW329Hzi-fm7RnxZsjdUDz=qmCd69YeO6ar9i+MZTJA@mail.gmail.com>
In-Reply-To: <CAFEAcA_KW329Hzi-fm7RnxZsjdUDz=qmCd69YeO6ar9i+MZTJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:51:01 +0100
Message-ID: <CAFEAcA_jQEpNrNPq-6ysmY+v4ZhVgy9kwdwxC-=SNgGKFNguuw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for 4.1?] pl330: fix vmstate description
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Jul 2019 at 17:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 24 Jul 2019 at 15:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > Fix the pl330 main and queue vmstate description.
> > There were missing POINTER flags causing crashes during
> > incoming migration because:
> > + PL330State chan field is a pointer to an array
> > + PL330Queue queue field is a pointer to an array
> >
> > Also bump corresponding vmsd version numbers.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > I found this while working on reset with xilinx-zynq machine.
> >
> > I'm not sure what's the vmsd version policy in such cases (for
> > backward compatibility). I've simply bumped them since migration
> > was not working anyway (vmstate_load_state was erasing critical part
> > of PL330State and causing segfaults while loading following fields).
> >
> > Tested doing migration with the xilinx-zynq-a9 machine.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next for 4.1.

thanks
-- PMM

