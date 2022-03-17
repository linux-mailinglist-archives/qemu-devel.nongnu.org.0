Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3ED4DCB85
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:34:27 +0100 (CET)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt50-0007Au-PW
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:34:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt0X-0002Oh-KT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:29:53 -0400
Received: from [2607:f8b0:4864:20::b35] (port=41507
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt0W-0004Vq-8A
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:29:49 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l2so11193772ybe.8
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Av7bUTXVdYozmEx1TkOLPfwDZhFEIQb787ol92RHHek=;
 b=GeElak2+D1HNF91n77ByDuVXqw+V60hdPK50hY5/i/aK7pTZT7DTuTMqSVVO43TNq2
 8/mm21UtPz0FErN3QIoGCS9AxUAp/yqxb8J7xEZjmM/XHS1vhXcGZ3N3rI6MC7f1F8Gt
 CZsIP7byHXbxj03ZTuT16AuupPuvPudYSoibaG31/HH/+8ebUDHlWkpkgbR4yYO1KwHB
 TuanM1thRW+TqssGcfPOwDzxyWJOYJuGVa/5lTvPw9s3GjbyCCJJPC++5qrwNg5zVuQz
 j8kv8iszAdWyvqIBh8qUsuL9ceggbOw5PCSe6lFkk/El/NmitrQrvzIv8MT4FBFTVyXW
 06jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Av7bUTXVdYozmEx1TkOLPfwDZhFEIQb787ol92RHHek=;
 b=52hzF/hcEnaPZzyQoMRUV7iErgMyizr9+FCaW01QaNzIC/QIUXFs92/RRUvRlx/ykZ
 c4WUkjbpHjCFuV+G5uAEi+2na/nrC6OgjD0avPpI8/Q2jzexV1pbKzy/JIKNwPQUSCxW
 RsuVpNk7oXVYmqluBl2k2M/52o/b1g2JncdN7VEcgtgUJP8ld8MkRrQDw4gaL/GvGUpB
 xNBVtalV5onnE9BGsJxpnaxM/9vIKbwWEcBNo4CjmhDUy+csNQyCVeT1ULSBzF0XBpr1
 B0R+2Uz85VGTGsgwB5QcmzDVNKbdn2zc8OdgCxXfTqVteXlkuDSCv+vuSVmNhC2+0rg+
 TSqQ==
X-Gm-Message-State: AOAM531VHN9rdPw8qzAsGzioDsANvjZ1shQM8nqFbHiauKGkaEM/vqRN
 b2qNiYyOugj2fEAPbYiIZ2z0km4TEJ/ZLJaagK/xjg==
X-Google-Smtp-Source: ABdhPJxmt98tJdwvd2wQ3isf33MEfWzPtLHK+iQnFAk2GW1NUGHCyuBMwit0X0IsLwFgZjMskzwzWMoaj5iks5FrlBI=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr5720984ybt.193.1647534587287; Thu, 17
 Mar 2022 09:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-39-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:29:35 +0000
Message-ID: <CAFEAcA-kXccgTmDMG690yF0t7HLWpFmomPoT=502dE3fP0-Fcw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 38/51] target/nios2: Use
 tcg_gen_lookup_and_goto_ptr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use lookup_and_goto_ptr for indirect chaining between TBs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

