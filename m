Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5763AF681
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:54:44 +0200 (CEST)
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQ0J-00047w-6L
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPyR-0003PF-D7
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:52:47 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPyP-0000PP-LY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:52:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id s15so20573158edt.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gvZ9LRq73yA4qZeMjyxbCN8ii4M966OXYu1lti/JIso=;
 b=gNGzSRgFGB18fg/yIXjilzJj7vpvgcjJQ1CV6YZ71UsiFSO0Ib2aVRO8nLWcMCJaS5
 1xeTmsSo94bp4WNCODKhz8Tr6FBbDBDm2i/ZOGvTB7Q1KJ0ZMudYCecExLp2CV1L6TkZ
 hVC+A16CwPw6qqN0czbZlw9eXS84hEvFB+HXA77+sPOyZQVDALdBOfwzrE+4XJqAfM4X
 GpzG7z8tkTbuMSiaXLjCpuJImL9aty1t2cU3diG2MmQdgIeb/E7nwYdpM+aQcy4vuVOZ
 ThYO2FgUv4ualYj5jViQsE0LK0PPXOvoPR3kyagu4LKNXkW0D9wAiIdYrYuv/kQK8zjq
 rENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvZ9LRq73yA4qZeMjyxbCN8ii4M966OXYu1lti/JIso=;
 b=FnaUNy6d5kOQFsY5AqlXxw7sv7OsQ+eRDVI3j5e1vQOHbFfplxC8XjZTpQMcXzUrc2
 1Vd77yOcbtUbivy6/xWS237BR2J9PAwE9T+rCF6aEeF0y4Yx2af7irKbDV6o7OZf5C3C
 bxR7QQq/2a0RSMNTDKFhl5fovqNGo6mJwICh++KauHgaStrJnfLq8Srci/UYV1uNCJQ1
 CQtT14Vzz+oPf/nR2PXojyzd6GSVss+53EqUVbxKxSEt3SEjEENbnnSvtI8lVOJlQFG1
 oAox9YCYfRy6xpbkIWh8QYn10Bvl7/2cDNsI88Y2/02s8IIubn0zeHUm2X5GU03DAB8L
 eGHQ==
X-Gm-Message-State: AOAM5318ZY3aLW9Fh3wspi5i+eFQm145qWLsBUTQtm0g44iPxClTlyTl
 BVFSClBIm9WZZ6gRRAVqG22li0oD5dmHtYzl84D2qw==
X-Google-Smtp-Source: ABdhPJztBg+XxC04WtRejRGH7TJXotCgKlD9ZTxlv0w5AXXoH9Fr7RNrvEZlb5kpUd2VJlcnCNCdx2L2xWc2AisGJRw=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr101129edy.146.1624305164049; 
 Mon, 21 Jun 2021 12:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
 <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
 <5a03a209-567a-df86-1b47-9cc39d82eb7b@linaro.org>
 <CAFEAcA--+n5aJVM9nv53v5cUCGxjPB7GPCNxxGCy02Dm6a77yA@mail.gmail.com>
 <48f4da88-7b3e-5ebb-7e10-c8d6528ac880@linaro.org>
In-Reply-To: <48f4da88-7b3e-5ebb-7e10-c8d6528ac880@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 20:52:08 +0100
Message-ID: <CAFEAcA-87+WwAFAE50vuWpEWHKrdHDZx_9e_m7r23hhyDNRFJQ@mail.gmail.com>
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 20:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/21/21 12:40 PM, Peter Maydell wrote:
> > On Mon, 21 Jun 2021 at 19:12, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 6/21/21 7:01 AM, Peter Maydell wrote:
> >>> Side note: it's rather confusing that tcg_out_rev32() doesn't
> >>> emit a REV32 insn (it emits REV with sf==0).
> >>
> >> Which is REV with SF=0 also has OPC=10, which is REV32.
> >
> > No, REV32 has SF=1. The two operations are different:
> >
> >   REV <Wd>, <Wn> -- swaps byte order of the bottom 32 bits
> >                     (zeroes the top half of Xd, as usual for Wn ops)
> >   REV32 <Xd>, <Xn> -- swaps byte order of bottom 32 bits and
> >                       also swaps byte order of top 32 bits
> >                       (ie it is a 64-bit to 64-bit operation
> >                        which does does two bswap32()s)
>
> Ignore the assembler mnemonic and look at the opcode:

...but the point is that tcg_out_rev32() is not doing the
thing that the assembler insn REV32 does, so ignoring the
mnemonic is missing the point.

> REV   Wd,Wn   = SF=0, OPC=10
> REV32 Xd,Xn   = SF=1, OPC=10
> REV   Xd,Xn   = SF=1, OPC=11
>
> REV(Wd,Wd) = (uint32_t)REV32(Xd,Xd)
> i.e. the usual interpretation of sf=0.

You could look at it that way, but that's not the way
the insn mnemonics have been defined...

-- PMM

