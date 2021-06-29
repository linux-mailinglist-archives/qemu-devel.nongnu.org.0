Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C13B760B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:57:57 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyG7Y-0006td-Cw
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyG6Z-0005uK-46
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:56:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyG6X-0007fK-0G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:56:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id w17so16469915edd.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P3KcIrhSWcSf8wXx42x1OWdOMEZCI3OBkhHevGPtBnk=;
 b=ox/zXMUglL6z00lJAkRsuumKi7h7VLYGzBkbbl0TfPX96OrZ1atoAEErc25MQHwn/I
 gXT4Ivctu6aAI+LbVNwdBuE58GypDTTPog43EYxfpbr+WvcXTp5BEl6N/9ZNYxMopqVj
 zANxp7HBgfmvs0wFxTnS50Kr9IMUMERWaSBQCit9ibglgk6aXqFQZbBkxTXmCdRR57hp
 ae0BM6Ik0FBjnv5neNULXS+wiVeW3o1cdu7Wr54Z5IeLUqGAd7/IbeaHxv51HmXLOWJc
 VihpbUzZTgY1LRa38dykFLjHelQWv4qwyYQ9U3oQ66Yt4yfxJfsNjoN914KvBjUTPzaM
 RtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P3KcIrhSWcSf8wXx42x1OWdOMEZCI3OBkhHevGPtBnk=;
 b=t71c493R3q5ws0Dwwshf6SeRdZTYW2hTAvCdwgouOtNzm6O+BO6AT/yIE2DX3mWh3M
 kFFoMviGqFvbZWt0wlrjr4mf2Xj5jGrTTikF199jAH7dCZcpzlmT/4l/Zh2xUh5j4Lp6
 X0KjFFj/rPAhsEL34cN+G8vJND70TLx8MvujDI9bS+n9LUi6qtf1O3IKsVaMDDW1r8l1
 SAy8+vi9xIfFxNvIUCAYVg+o+KHDk9SizsdcBfMu0lfvuT7ihpoF6AgWOddVBLwwQtjY
 vA5oPmQKDRvrQT/nslsdzkMFT6+28v2qp4zBG9t30wKtDGLfGtt9Cs/012PQZxX0iVg0
 Xj7A==
X-Gm-Message-State: AOAM532w4929hQrSwMm5S9laaquzhl04GJbuhnE6xYmVlMmcW2x7LCwK
 ronYavONI2P3twcW5abwnZZMlnHvyNGKhWqtECMbWg==
X-Google-Smtp-Source: ABdhPJwufr6V7JgJMhJk+saFQ9fTlkd9D6co4JgNT2Jx76Re8LNAWT0ajHxnqdSHiiRApNlcEfRnf3nMW5idEk6jBHk=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr40753241edz.36.1624982211154; 
 Tue, 29 Jun 2021 08:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
 <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
 <42d6f71c-6d91-1ae2-bc13-39cb5a70b1cc@linaro.org>
In-Reply-To: <42d6f71c-6d91-1ae2-bc13-39cb5a70b1cc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 16:56:14 +0100
Message-ID: <CAFEAcA_9Ss6LffwquHbssZ=XUSWAsL6KkKCPs1N3q44aG5m3Hw@mail.gmail.com>
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 18:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 9:54 AM, Richard Henderson wrote:
> > On 6/28/21 6:58 AM, Peter Maydell wrote:
> >>   {
> >> +  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
> >> +  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
> >> +  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
> >> +  # they explicitly call unallocated_encoding() for cases that must UNDEF
> >> +  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
> >> +  # the rest fall through (where ORR_rrri and MOV_rxri will end up
> >> +  # handling them as r13 and r15 accesses with the same semantics as A32).
> >> +  LSLL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
> >> +  LSRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
> >> +  ASRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
> >> +
> >> +  UQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
> >> +  URSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
> >> +  SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
> >> +  SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
> >> +
> >
> > Could perhaps usefully be nested under [ ].
>
> Actually, it looks like there could be a couple of groups that sort [0:3] into 1111 and
> 1101 with { }, then further into a couple of groups with [ ].

I added the groupings, and the final result is:

{
  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
  # they explicitly call unallocated_encoding() for cases that must UNDEF
  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
  # the rest fall through (where ORR_rrri and MOV_rxri will end up
  # handling them as r13 and r15 accesses with the same semantics as A32).
  [
    {
      UQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 00 1111  @mve_sh_ri
      LSLL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
      UQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
    }

    {
      URSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 01 1111  @mve_sh_ri
      LSRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
      URSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
    }

    {
      SRSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 10 1111  @mve_sh_ri
      ASRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
      SRSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
    }

    {
      SQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 11 1111  @mve_sh_ri
      SQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
    }

    {
      UQRSHL_rr    1110101 0010 1 ....  ....  1111 0000 1101  @mve_sh_rr
      LSLL_rr      1110101 0010 1 ... 0 .... ... 1 0000 1101  @mve_shl_rr
      UQRSHLL64_rr 1110101 0010 1 ... 1 .... ... 1 0000 1101  @mve_shl_rr
    }

    {
      SQRSHR_rr    1110101 0010 1 ....  ....  1111 0010 1101  @mve_sh_rr
      ASRL_rr      1110101 0010 1 ... 0 .... ... 1 0010 1101  @mve_shl_rr
      SQRSHRL64_rr 1110101 0010 1 ... 1 .... ... 1 0010 1101  @mve_shl_rr
    }

    UQRSHLL48_rr 1110101 0010 1 ... 1 ....  ... 1  1000 1101  @mve_shl_rr
    SQRSHRL48_rr 1110101 0010 1 ... 1 ....  ... 1  1010 1101  @mve_shl_rr
  ]

  MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
  ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi

  # v8.1M CSEL and friends
  CSEL           1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
}


Unless you would prefer otherwise, I plan to put the adjusted patches
into a pullreq later this week, without resending a v2.

thanks
-- PMM

