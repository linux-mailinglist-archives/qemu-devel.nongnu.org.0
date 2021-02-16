Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313331CC44
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:42:52 +0100 (CET)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Yx-0000vP-7R
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Xu-00085j-KA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:41:46 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Xr-0003hE-P9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:41:46 -0500
Received: by mail-ed1-x530.google.com with SMTP id y10so7617002edt.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+BXXGTBnnyOcq2GIbsNl0vKC+tWCnaZqIpqSlEls2rg=;
 b=GTJ3cdwg2gz+ByUOmATTVyEnGntSx8W4i65Y/EwtKqBN4UjvfJwXuF7bHNLvvaClJ5
 kjppgnuYJZWUO5svb2qxx6KHA4GztuduRCJn3fhY6xhX70lksP47gCm9+96ONULRdB7W
 +jQ1TIwV7EbpB+Hj4cvcM0+1DOqXsDhcUl87HEzBVeQpe/Rpb3pg8gfZpbb7DDeQmtQD
 e/McSbvZEh/Nqv/m1eOdc5vyo+n8+2qI/pO4YNQ5jGBCPQ8pcVwL2+r8z5CXBjc7+nSI
 +0cidLX2U/8KYdF8/i+xaX9JAHIvsggXkczdwbT7beYSIGrgyGg5X12m3YeDH1NOVpgf
 /A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+BXXGTBnnyOcq2GIbsNl0vKC+tWCnaZqIpqSlEls2rg=;
 b=qErMSafRHlsYUOiYFBsFhvFBFELSY2JQKoK6Q7pKrx0SAb7hIXwsusPaF0GISP06rb
 C0iyMM4W57xa7eHzQFpcpUmesekS1rk0IvDLdaYvfZTxrCfpxUfTMYz2O8WU0vVq0nA9
 bTLp8dPRGtyfIi0u46nes7uGS8h6ARAQIz6doYENAea7hydEBbMvKH2cJJPoUAz2OEko
 NJbyqbEJCQ2oiHdortufLMlsKBlTDx1Kp+wSPcOfgrkRYbYCZAHe9CpIkWaxbfcwEHR7
 MeDMAa+8XSY7axorL7zH5UGHm3NBV+jZjKtb68+9gFFQW2OQ5v77TNcr8uTEHa5eWgNu
 oTLg==
X-Gm-Message-State: AOAM533VaNXNniqadxCvcnOiYmbf2xrk+vE/UFU0n2vv0qfQOFvVWq+e
 WVegieg2jOeStUoH7vdctx0LUeB4PEbgHJ4ALJIaZg==
X-Google-Smtp-Source: ABdhPJzgpR6nDpE6zaPKN+QzF27+Uxe/JcFSthwLw+HHLyyms5TRvGnG1JCNN9SUrLVa4kSa3C4jZON6VqKIBKYPGmE=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr21155786edd.52.1613486502214; 
 Tue, 16 Feb 2021 06:41:42 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-OE+NGfbgjEuydjCfpiR_kuFVsSxYwE-PfvQSX-rzHLQ@mail.gmail.com>
 <2D7F6EA4-5525-4F48-ACA7-B157E8A02A2A@icloud.com>
In-Reply-To: <2D7F6EA4-5525-4F48-ACA7-B157E8A02A2A@icloud.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:41:31 +0000
Message-ID: <CAFEAcA9L__t-qLX0aDs9fjEWy=Yh2upoTyLRy=nb1vZuOBd=uA@mail.gmail.com>
Subject: Re: Fill tlb for data and io address
To: =?UTF-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 14:39, =E6=B2=88=E6=A2=A6=E5=A7=A3 <shen.mengjiao3@i=
cloud.com> wrote:
> > =E5=9C=A8 2021=E5=B9=B42=E6=9C=8816=E6=97=A5=EF=BC=8C=E4=B8=8B=E5=8D=88=
7:48=EF=BC=8CPeter Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=
=BC=9A
> >
> > =EF=BB=BFOn Tue, 16 Feb 2021 at 11:28, =E6=B2=88=E6=A2=A6=E5=A7=A3 <she=
n.mengjiao3@icloud.com> wrote:
> >> Look at the store/load helper, it will use the tlb entry to do the add=
ress translation(from guest virtual address to host virtual address) but wh=
ere the tlb is filled for the data ram and io address, I know where the cod=
e ram is filled(tb_find->tb_lookup__cpu_state...)
> >
> > The common QEMU code calls the target
> Thanks Peter. But what=E2=80=99s the common code? I mean in which case th=
e tlb_fill will be triggered, the generated code will trigger or something =
else? Thanks in advance.

"git grep tlb_fill accel/tcg" will tell you the call sites.
Basically if the guest code tries to access an address and
we don't already have that in the QEMU TLB, then we call
tlb_fill.

> > CPU tlb_fill function, which tries
> > to translate the guest virtual address to a physical address (usually b=
y
> > walking the guest page tables). If it succeeds then will update the QEM=
U
> > TLB by calling either tlb_set_page() or tlb_set_page_with_attrs().
>
> > If it
> > fails then it arranges to deliver a suitable exception to the guest.
> This should be page fault, guest code will update page table, am I right?=
 Thanks

It depends on the guest architecture, but yes, that's the usual thing.

-- PMM

