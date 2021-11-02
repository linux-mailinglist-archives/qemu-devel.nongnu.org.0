Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CD4430B4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:44:17 +0100 (CET)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhv1M-0001XG-7L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhuZX-0004uc-AP
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:15:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhuZS-0005cg-OD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:15:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id c4so3585362wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lhUOnEUlKyJ0+/rRaeQi6sKpRtrnQAkPQtOF1Hw1z8=;
 b=A73ytFru2ckxUR0qXk0OAuZ2igcdD2kYikw93gcXn3M2kWVV2XSWBdOlRyEkxwT77n
 26ORpLZupHARa44tRCcBHMDI/Kg08FatZvlKbx+DpWoQb3qkEArso5Gr5c2xjrm43ikS
 rs75WvVX9b+4U1/tuAXRyzoJopn2K2l+e2voqp3ivSy5S7JSUVZySq1ulhYGk1lNmSxW
 IgWskHyMLmOZukcGDptu7c+JKDqHBYY3RMB+NXgCi6i3+fXPK8baEYporly//XtM0l2+
 c01w0LBG3HwbiodkZ5CqPy/2r24f9y5zBvwdw9ANj4Qtj0i1zQRVdjDYMIRx1QgcK7yN
 G7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lhUOnEUlKyJ0+/rRaeQi6sKpRtrnQAkPQtOF1Hw1z8=;
 b=NjjMtFIcNVZiAo7OZHuukYUaxDZthRRGmY65tCsUD+8cg5X1D6yk/wqNrrnygwiXah
 +mGieRkL2xYdTQYLhlnAhZfFqtPm4XEut9/cUKg9lXIHuSmQg8S6lz8M1HFdcHcqxm4z
 pGhKIGIQV+wP+OqEB2H0+WghSAJR4FbwqA/Nxi/UgVY6im5wAK6pznfbrNM8ge4Z/RN4
 3ivSPjR4rNBwtZZf6mtQAesfT603pyxF6g7MCrI2US3i7mszkBgUfINAS/uNVhd4Wver
 u53Zbh4tKct0TSziOikmuQx57vRR5vO2pHYGDIVsnJcvsSw30+zL5qunbd72epEZP0jc
 uVIQ==
X-Gm-Message-State: AOAM531oupnI1MmI9UKS+T0CHku5oZ15rNUpn1g6A0Q11Pl/Fv3fbX3W
 y4tHNsCsXOzpCuGSJXMjTLHqED441OgiGbeBC0elaw==
X-Google-Smtp-Source: ABdhPJyfM4hZFBUUBuX124dZt6XnEhxlKpRfwc9Q2KRNPqFiIZIr2hqUj0cg3rjKX5zcQDAfvsMC+A9PZzJ/0XyhgWA=
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr47361780wri.263.1635862524073; 
 Tue, 02 Nov 2021 07:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211026140311.158151-1-damien.hedde@greensocs.com>
 <CAFEAcA_SbBqvPdEsqCVoKGOqwL_a26xn0b6nuniqOA3+Fi3Ezg@mail.gmail.com>
 <090eac13-0b75-8b7f-d90c-8d1bcd8981a5@greensocs.com>
In-Reply-To: <090eac13-0b75-8b7f-d90c-8d1bcd8981a5@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 14:15:12 +0000
Message-ID: <CAFEAcA8WbkD_HiAeykSyFPwoGLmOJce_gqFSmF9q9kXvNtsB4Q@mail.gmail.com>
Subject: Re: [PATCH v2] generic-loader: check that binary file target location
 exists
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 14:04, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 11/1/21 11:53, Peter Maydell wrote:
> > Won't this break the case of loading a file that spans two
> > consecutive-but-different memory regions ?
>
> yes. I did not thought about that.
>
> >                                            I think if we want
> > to catch "we tried to load something to an address not backed
> > by something" we should do that by making load_image_targetphys_as()
> > correctly handle errors from the memory accesses it makes and
> > propagate an error-return to the caller.
> >
>
> The problem is that load_image_targetphys_as() just uses rom_load_...().
> And these macros/functions only put some "rom to load" objects in a list
> without doing any real accesses.

Oh yes, I'd forgotten that this was all using the rom blob
mechanism underneath.

I think in that case that whatever we do we should aim
to be consistent between the different load-image functions;
we shouldn't add a check to load_image_targetphys_as() which
we don't do in eg load_elf_as(). That probably means we should
only be looking to warn or error at the point where we actually
load the ROM blobs into memory.

-- PMM

