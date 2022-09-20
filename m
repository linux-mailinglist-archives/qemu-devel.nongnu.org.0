Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556275BE733
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:35:54 +0200 (CEST)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadPl-0004ik-Ef
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaai9-0000Ls-IH
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:42:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaai8-0006hO-1d
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:42:41 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lh5so5053158ejb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BFreB8CgG9frSIJFElpXXgflD+kZaqEYROP9PN8+gHQ=;
 b=lVw35sDg0No1OgkXhjsIpHmKwtcx3MxMUh7MtpeGecvQLOrsdadSBKi1szDRna1gTV
 4obi797haHS+Hd9ajYn2M/hQYK/q/cB863maqtKDRb76mhxF90uhtwTyrP65rLoRTiyA
 LB3pC2tUUF7oPhprxssWnk4BF9ptpshmxKbdXOPV59nbJiCG+8oq94n4s6N0QtPO0OBy
 zXwtj/3IxcHFcgmqFPHkIXvtYG+8iIp0C7TNoeQcDnbU0mLKtNEicKkM4PGNBh/EfWZI
 2boZiuBxzMHGqygUkr9R+ULeaB1AgKaIL0jat6YNJsg2qi/l3W5lsg3DNKFr7VOK0sb5
 o07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BFreB8CgG9frSIJFElpXXgflD+kZaqEYROP9PN8+gHQ=;
 b=vgY2+jtT8poYdUfei076UJuJQ5o/MsgAyltJsoi9SmuTmE+EttA1bNhcYCsAUH/DBt
 GM4AlJRZ5YXHLoz2I4JPS9yIZp0Jv5Q+1Oo5JBizXJ4vrQZ1gk1MdbGFo6VeDKhtDt5V
 HqW/1tjMRYBXHcSgOgZRNl5M4omiXCIelK8RWhn68SEK3lPmFd0TM1g2f01EFSPtZOFt
 cHJt3QK3Xu/f1LVH2vqQG92mthYsqZ4FVhzPo4lz7ZDnrisq/zj0p6wpco667MUT2EPW
 RQNg9TYenXlxnooOWXIOK8L3AX3/7hA5SKN09FNDkE2Z0Whr2HtKw5aTgzxv5jwaKv7K
 xX3A==
X-Gm-Message-State: ACrzQf1iIAvdimLb38HG6syrXDv+v4NiILou5Bq9JSBTZovDT+Vg9WEG
 O5QlqCJoQu7Gkk68kAIWYeEqUmf/RNOCHfxNLVv0mw==
X-Google-Smtp-Source: AMsMyM5ZAwcr4mY/Tc1+YTvrlDekD0k2AClHtMHjTlMLrlP6K7ilKdnKEQ8QQ2gP11+aedQTd+3+nqlDofZSgy0XDzk=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr14381326ejc.365.1663670557426; Tue, 20
 Sep 2022 03:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-2-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:42:25 +0100
Message-ID: <CAFEAcA8fGAzhJTyYEYQ2EYUS=Z0jZtDNScy=26xgX4LwUZQb-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Sept 2022 at 21:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This structure will shortly contain more than just
> data for accessing MMIO.  Rename the 'addr' member
> to 'xlat_section' to more clearly indicate its purpose.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

