Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C93144AC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:12:55 +0100 (CET)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GeE-00088R-Bq
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Cdl-00025H-Tw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:56:09 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Cde-00024M-U8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:56:08 -0500
Received: by mail-ej1-x635.google.com with SMTP id jj19so27194521ejc.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktXrJZk9F1oPuPCHKsEyaf8kydPZDRE+zL4ywdoUOn0=;
 b=QoATW9NzrLu6Mi7kyVuMYO5DgpKgw82Zmq3uTlihlJju07dnkqOWiym5SJ52hgr2sz
 4327WGuehBWq44eNuHSDO7jbi9lMnTHF6i/CHLyJW00ysMT1usTw11Lj/PIKdqi509YY
 eGQm8+K6m7uYROHrodzyj0DCR5fjRSypcDYn8b9OU/IPu2ASS0CemkVw+zKlxW00LER3
 b3R323Pv0SbpAuVdQi3GOwcBLpvfdBh+T36//V2gGnNRVuwhdGWANEl0ofLslF7EOP0j
 ECqkgFPZsydVyUH65xKKoOdV6y0HrL/ERV+fwtjsdgddIG2RT11f5DVBPAocj4oFqikx
 TDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktXrJZk9F1oPuPCHKsEyaf8kydPZDRE+zL4ywdoUOn0=;
 b=fDvZ2BlMM66rG0SnJLiZjimrj5Xesf5UHseoXYk7XVaxZXoHi6ux4wDI7xfVirfafM
 31sM0Sg+MgtYN9PdKM5ZB0Nw0IhrB9AZFynHh4T2r5XdirM0u7bVWbtG58CvxGs2tKFA
 n8HBpnl5kl1X/5KvqduRtQ6CT6YuUMgqn1qfnlxXFYjBE9Dqo5JVWaq+HjvteP+5bWle
 Adj36KVRQDOWNtvDEF/54KDo98ne4yeJKnmg87mgO2bKogdyrnVAKvFF5S7OZk1YJpHM
 obslebBqO2sJKHFrI1WjIgDuqcjtN02INUzAffR/W2xkfrLbxqTtn+Ttbd3WHCOgs2ey
 ayaQ==
X-Gm-Message-State: AOAM531a7kaYEycpDbvRrBbWo8O/iJL47oP1ss/it3xe/GY68T3XZZRK
 QySYcN+k3t6vE3K52Tkt3jx+QHPCGSeg4OpzY7iUpQ==
X-Google-Smtp-Source: ABdhPJyohxzMV/uDxZssz/i0xzAgKknTji0id5rfWT8ll7bbFBSkzmGH0lI1sM/ZUCw70DlbINkQB5TStL4h5DCFF7U=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr18528261ejd.4.1612814160352; 
 Mon, 08 Feb 2021 11:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-13-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:55:49 +0000
Message-ID: <CAFEAcA-iapdprn+tN1T31XisEMa6k1WgkLnobSMCru0mRUOhDw@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 8 Feb 2021 at 04:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> NEON has 3 instructions implementing this 4 argument operation,
> with each insn overlapping a different logical input onto the
> destination register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> @@ -2899,6 +2904,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>          }
>          return;
>
> +    case INDEX_op_bitsel_vec:
> +        a3 = args[3];
> +        if (a0 == a3) {
> +            tcg_out_vreg3(s, INSN_VBIT, q, 0, a0, a2, a1);
> +        } else if (a0 == a2) {
> +            tcg_out_vreg3(s, INSN_VBIF, q, 0, a0, a3, a1);
> +        } else {
> +            tcg_out_mov(s, type, a0, a1);

Side note: aarch64 tcg guards this tcg_out_mov with "if (a0 != a1)",
which if I understand correctly is superfluous and could be removed.

> +            tcg_out_vreg3(s, INSN_VBSL, q, 0, a0, a2, a3);
> +        }
> +        return;
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

