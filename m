Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050058021F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:45:37 +0200 (CEST)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG0H2-0004eU-5D
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG0Fp-0003Cw-6T
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:44:21 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG0Fl-0007sb-IC
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:44:20 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31e64ca5161so114583417b3.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBo7bITbK+UKNPEmD0UYn6nvqKmD1el2oTN8LwNBIHg=;
 b=FBxMXkjnhwGNF/nuhSAAcQv5nACWstquOCPqyvb1r9ZhY3E7qtyg95Ehr0uiPmyFSK
 XsSNqETqSBW+E33hSltL6MwHb/SMQuk8jDBbh2NOzsRvFuDwyBCdrjYAP/T+HyyVLgm0
 hG7izVDcoP+oHnEQRJcFbrlD8ewEngOYTrb1S4fVdS0CdJvxTbIP6E0eZ1Z+8hM5Kpzq
 DlAgoCAasrK08ZDXdhnLxGh22YX+vGfdI73LAc+31mMIG+n6V3nBhhltU1ALIHuQhvkb
 pg8BWDQzb2kWxRNZDQ+HQkvWbTB/f/62mO05pTBLTQixS45SthFJIur2+fnKNkEbmTGz
 TZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBo7bITbK+UKNPEmD0UYn6nvqKmD1el2oTN8LwNBIHg=;
 b=Vmi7zJi/18MdXTs5LWo0rfgwgiGrblMCOpqZZDdiIq4Y7CuVRyg0miuotmu4VEor9m
 3shG3N3rMKNoEEzPWPsKJQicKCZK375svk2LCgx89Ca3PYJOLmH6Piqlhb4skxB3EBq5
 Vu5X4HXjnT4230NrTGGxaOK0yXC0oAcHaxTCUtTf4VxE+h4qdgALPZ72xaSmp1G4a3xJ
 AgO7j6sfopThSuwolffqNOA0KjScvnuSGz5YXFrscy8B5v0C69TmEh3YoA3Dob0+5kbG
 XinYc5Nje7E8DExjYfBu5exPk68hGeGZhiES3sPEDZs8y9rkuFLzGaE8oRtawYCJyf+P
 rTBQ==
X-Gm-Message-State: AJIora/aFearJndzKKSGIunY79wP3mNZ77TA1sezAkEeaMTXjgJdBXvG
 Lis8314TAHTv4K2Zf1LncBIh+3DLtm8O9Z15jyU/zDuve1/O8Q==
X-Google-Smtp-Source: AGRyM1s5zig+tHKKvkT6mf0M3FK8QSUke71vkRQy++qx/JByCGrIFhg/kumJDd6TcXYHGV4ffqO5xjmlHXrVrLRsN+M=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10199852ywg.329.1658763838357; Mon, 25
 Jul 2022 08:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
In-Reply-To: <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 16:43:18 +0100
Message-ID: <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 3 Jun 2022 at 07:17, Liviu Ionescu <ilg@livius.net> wrote:
> > On 2 Jun 2022, at 21:36, Liviu Ionescu <ilg@livius.net> wrote:
> >
> > ... SYS_HEAPINFO...
> >
> > 0x04000000 - heap base
> > 0x08000000 - heap limit
> > 0x08000000 - stack base
> > 0x0 - stack limit
>
> For Cortex-A72 I see similar values:
>
> 0x44000000
> 0x48000000
> 0x48000000
> 0x40000000
>
> just that in this case the memory is writable, and the startup proceeds as expected.
>
> Any idea why in the Cortex-A15 case the memory below 0x08000000 is not writable?

Sorry I didn't get back to this before -- I marked it in my email client
but then forgot about it :-(

Anyway, the memory map for the 'virt' board doesn't change for the a72
versus the a15. In both cases, the memory from 0x0 to 0x08000000
is the flash memory. So QEMU is incorrect to have reported that as
the place to put the heap in SYS_HEAPINFO.

I'm not sure why the A72 gives different results, but the heuristic
that tries to figure out where the heap goes is basically trying to
do "find the biggest lump of memory which doesn't have some bit of
the guest code in it", so it's going to be sensitive to things like
just how big that guest binary happens to be and where it's loaded.
Perhaps that is why it's ended up different.

I suspect the fix to this bug is going to be "make sure that
SYS_HEAPINFO doesn't consider memory regions that are rom-devices"
(we already ignore read-only memory, but flash devices are
technically not read-only).

You don't mention which QEMU version you are using. We
rewrote the whole SYS_HEAPINFO handling in commit 5fc983af8b20d6927
(Feb 2022, should be in 7.0.0) because the old implementation
could produce some completely wrong results. Looking at the code
I guess this was with the new implementation, though.

Do you have a test binary I can reproduce this with? That would save
me a little time.

thanks
-- PMM

