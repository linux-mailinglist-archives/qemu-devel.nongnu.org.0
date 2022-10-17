Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BD600F8C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:54:19 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPdK-0000I2-N5
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okPYy-0001Ee-S7
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:49:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okPYx-00043X-8F
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:49:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so10911672pjl.0
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fUjZYkb6/ANakj9ydHI1gVMvMtu/fFtDZpL8n7svyeQ=;
 b=k+05r8t1Kd7vaOHT8Y2aGn7WSemBNQf3TKg1GlQuoqXz9Ri+KefWf/vPHi+YE9tbgM
 gpn3Ux8x7+ygbrIOwwC/PbFUrFrGhsfRKTO+yTxEtgPvJYPd6hbz5hRPBCQFGgkj7+tp
 8z80GP4F3ULEMYxKqYnicseV+0ehyJFnGeHgnI3z9J0bWFt0KBgKpFPhnM0k13zGFEMf
 hN7OFPiYNGFDBKF1zl7Iy62tgY4jo2qsDDHp7J1rsotDuflQ+d+TkjeeuayqcHVs5zU8
 e2sCwTfpwTEHrIsZxLAssI9tryAWeob6BlKBuluONeTehsO0FkwSXvSl0j0+VpDXF1Jj
 wXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUjZYkb6/ANakj9ydHI1gVMvMtu/fFtDZpL8n7svyeQ=;
 b=Q8HjU1nsz/i5ErmUeJjBFzH8cEsTk+jalz4KNEZvNq7Z044lK8ooW2XLuVmWdO+YWj
 bSeAWhIHCSvo5CsdV35VKZjFgpAejg2dUtRCapVwHAOpU00mBptz2lsSPF2DF7OOZoUX
 jasF22XVae/hxnW1ux+R9LHXndkjtvJoW1PRaS8h/7b2WisZFCX3FwkOkziOznyYdyJw
 VirbKHCW0LZrebZdvaYIb2tblNGjJDt7m6Tt0Cvwmd3xo/xkSHPQw1JFfN7PsJEbuYuL
 yBgfUGfIxWfaSG/Pj2t/pNap5YFU+3tRNe5V0INFaxvSACiOIj+25H1rMb3rLEKUWrF7
 zYfg==
X-Gm-Message-State: ACrzQf37679N7jTE47fkuqaGKSPA6Ga68MoY4l2AiZ1dxSBNk7GMpkeY
 09LSVTdpUhs70xU1Z2RPVWgEVkJevQfk/3aRBqj/Xg==
X-Google-Smtp-Source: AMsMyM7Javo9AAsa2d5HLCJhErlXoPRmy35kh3uAZ4mnGrLDUwOhvghAS3nCktbdZxZD/ONJqsvgIlyeQBIiUv7KJ44=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr11900381plb.60.1666010985450; Mon, 17
 Oct 2022 05:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 13:49:33 +0100
Message-ID: <CAFEAcA-Ehruh02RtPz3a1Hi5zVp1BMJU4j_657gqxSXYiu7gJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 11 Oct 2022 at 04:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Rebase on today's target-arm.next pull, including 21 patches.
>   * Split AF and DB enablement into two patches.
>   * Perform only one atomic update per PTE.
>   * Raise Permission fault if atomic update reqd to read-only PTE.
>   * More use of S1Translate struct, which is perhaps now mis-named but
>     more generally useful/used; suggestions for better naming solicited.
>   * Other minor updates per review.

I'm taking patches 1-12 into target-arm.next.

thanks
-- PMM

