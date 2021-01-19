Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505F2FB5AA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:29:21 +0100 (CET)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pCK-0003bh-B6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pBM-000322-Nh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:28:20 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pBL-0007WW-4c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:28:20 -0500
Received: by mail-ej1-x635.google.com with SMTP id 6so27990648ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+TcLFw/uO2ce2majfh9q8JMObqRCpJz3IWRacF/D5U=;
 b=yO0jdxizQ2aa++R1xr+g1v+MuyQ9l2ojTkZsgOJ/ja/AgOltglH9qI83IcpUocqa+C
 MAnuWzNqbbKjqjROcmhkVM6tqeMh/AKm/I3sDDEhxYz1OEwjO3mBDuxBGRf7GlZkG9Nb
 fIym6HsRbiYTcFWhluAUSC35c+2kOvZV5eYsvcbpcpPWG7a5Aq6RkxMV2L3sV/SmW8zY
 qDIoblZjnTIZtb+NDCx41+Pw3/Ty4XAxxY90IBn2jGDNNZChhb0XP3cW1OHGnIjM7a29
 bKwXNVNJTCZ3XHhIz02KP/d6Vp4IzfaFCPmGJmLdu08lhaEcr2mKxcwdkE2GX7Lj8ACr
 SGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+TcLFw/uO2ce2majfh9q8JMObqRCpJz3IWRacF/D5U=;
 b=kqJYX3K8D9pNjtefpUKUiJqvRtTGNIVVObw+mL7mAsONSCSZiF0C+bDlBsDPZzps1q
 0vvkpDnTYWQ12gEl2Az9zDVrekdO7ZeOeh4gTC91wOFsHwoRU5KCJ7ktb9PSYBlWy47e
 lzGzjJMWgIr6JONMmouoUbVbMhaRzpLmmn3wsPoaY5orZJ9kawbYPR7MGM8m/c87ILMU
 WnHX0UKVpvHelR0AN1MsrEY2bN79ZkxsT07YLTylfopfT8RQwM2CH0BXxf4twP+IVwzK
 gF4OHn0F33KDDMSr2akhFH39+26+ZAafx91DOyym6+g81Y52HH6hfWmfEgkXkjAbU7hl
 hvFA==
X-Gm-Message-State: AOAM532pKHnomvNtDCeC1tR9u8U/md3ppgAKuiP6Mfzgd8jexBdlH6Vv
 G6oul+M84kkujnvNjG/Szh3uSNTUOp6jJkOAsj7KIw==
X-Google-Smtp-Source: ABdhPJx6t7IX9Ox7VQfxrQj8QJBXKvUUR+oGNJQZFeTv0Rf69wgYo9rc9PqhXOF5LN+D0s55R6+ywVP1vU1KtSZMWCg=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr2641017ejv.4.1611055697533; 
 Tue, 19 Jan 2021 03:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20210113062650.593824-1-richard.henderson@linaro.org>
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:28:06 +0000
Message-ID: <CAFEAcA-t6FDkR3FMoRUaQYQHwmo2-hLE12tOYvBd0hknTpshzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm: Fix sve pred_desc decoding
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 06:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was an inconsistency between encoding, which uses
> SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
> This happened to be ok, until e2e7168a214, which reduced
> the size of SIMD_OPRSZ_BITS, which lead to truncating all
> predicate vector lengths.
>
> Changes in v2:
>   * Introduce and use PREDDESC field definitions, rather
>     than abusing a different SIMD_* macro.
>
>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Introduce PREDDESC field definitions
>   target/arm: Update PFIRST, PNEXT for pred_desc
>   target/arm: Update ZIP, UZP, TRN for pred_desc
>   target/arm: Update REV, PUNPK for pred_desc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM

