Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A7656559A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:40:50 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LNg-0006Ti-Jm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L4d-00012R-Uv
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:21:07 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L4c-0000KW-AH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:21:07 -0400
Received: by mail-yb1-xb30.google.com with SMTP id l144so4083521ybl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVuNHrUSuKl/7cZufdtsYtzvfEF2T6tVzAeRkCsOZkE=;
 b=Pu9XLbWEt9IiRXRGs9RgCoVBDr1Vi/cvtPjYkX5oByF+QsK6hmgCTwZZ1aLtWszYVK
 g6ieIA4z676fhtCQ/vwYi50dYAOc4L1kSNNIexLC5SPr/2EamMmKSEYqUDBPw0yQ3VwW
 06lpVqGNSfRHHY3bo3H27Wlzn2qB6nZgCHcsPprmxJtgF5aGrsRqob/7LxBx5zmJ5Nl2
 UgIZDSOft1PN4S/YMvc1JEZ1snm6DD7ezIAMMfWSR6b+Omc4O2J/wGI7EYLKEjjBpvTx
 krLDSbXwNlHEJU6pqOXwrqWID0N6rpSsIX8l7ygquBXBplmhyyG3PkJw8A95LEMVAczD
 RkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVuNHrUSuKl/7cZufdtsYtzvfEF2T6tVzAeRkCsOZkE=;
 b=at4GvxvnnA1qj56Fa1wWwyE3fXnhEpG3IRRKShSaYx7nEtQ9ndUHyqMZnUT+PmmiOn
 kcXSyJwUgB1AIykQdMOBqFI8Vd00/I2wTy1c6v758RvN4GeguWk1n+MKDi2t5xlHesCX
 HH034RLDyD+IKpzat+VXt6K/hsVPt+2qWgAjJhiUUMyDRC0c4ue3yavZetEp3FiFzdME
 gmipfgK7acdylkY3lm9fZS9lvuu8egbrlIZzTs6YK6Zl4RWkcxPBrlWX9m9LEa+PC+Z1
 h5cMCgLVVPiy1SxGeR8SatAwa02Jn33RSwY5S5p6z5SeDTju6HYEgS/ysTmNTi3Hkw4s
 EzSQ==
X-Gm-Message-State: AJIora8ZTMijLbtoYv8kBGdoX/JPIEhkFk3nLNlR/pEpd1FsYZs3PGSc
 kNdc3gHUcMV/0fcSe8qz/eMQEPm0bWYV7E4Bil8I0A==
X-Google-Smtp-Source: AGRyM1urOL6ZlQFpaq1owg/3GceQVoMJF3FlcbZ4tJRJ/DlY4fniX1B5M+whsZQXgyXDTEaLy2/sMeaVuZ792red7WA=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr11912646ybf.67.1656937265266; Mon, 04
 Jul 2022 05:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-43-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:20:54 +0100
Message-ID: <CAFEAcA_gw6aH3ziJY4u_GpEhtS7HY_a7zWFB66MYarHBLDFR2Q@mail.gmail.com>
Subject: Re: [PATCH v4 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Tue, 28 Jun 2022 at 05:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl set the Streaming SVE vector length, which may
> be completely different from the Normal SVE vector length.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

