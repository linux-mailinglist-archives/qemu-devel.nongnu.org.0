Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D630B5BEE0E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:55:43 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajLL-00043F-2p
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf4v-0007wy-Ip
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:22:30 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf4s-0007I6-RR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:22:29 -0400
Received: by mail-ej1-x634.google.com with SMTP id dv25so6919748ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=URVMmKnCA0+G97ZAMzwPJmH66Bscm1vweKnh139K8WI=;
 b=fFujuAEc6KbE5DjRcUenWMBELLEfH1YF2T+SjFuu5p6YbKJJDv9c60ih9AjtW9kRm4
 Et376KPU7pYJ0Psta8sr2+gAus0nFxHPNXmGzTBVcAlJi9GdIRRoUtkraL5dBrc2Flrl
 BtLBqcEQqr2zt9d2dE3GGagqH0KBBUo1R1Wv5KSeZ/Xw9xoEPNyYjegUmdzlxbQgYd/A
 aliSp4KZqvvhxEkaq+dmUGz2vyqPctexuehvEMc8v0g46XnQxbtYfSuTQUM0hnWZcfdE
 vSXzRAjFlIzW8IPtMvtt+y39epBq+9uZDKj9RRZwAflC2hg/otPpPDw/uGBJWz7FUKYQ
 Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=URVMmKnCA0+G97ZAMzwPJmH66Bscm1vweKnh139K8WI=;
 b=rzKR5bOkJ0w9YdIN+0j+Ez75hDqW0NELyyh7iNM0gPg/89YCLPgv69CqXzBTlcI3sD
 IbUCAlEeFg7I5zKGQ8U/wUVghVE3R/S4xVellhhaBfhPZHofQ5jOeTgG72Hs2xkMwwEm
 4laF9Wl29fcuUNmnGs2LVE7eU0i8mG5rRfc2u2iI6Sw6XzgCnbfDI+JKJkNTDwEedbbB
 X1Y47tQ1qVYpFKsX0xpSlRVldkUvm/S39y4TuqTXN+mVweQ3WZ44jWO8sMFL7ozgekGd
 hdtKhDh9TSZB2d8SAjB34YYaqgRnUHZHQ1wXwYV6y+b9vfllGIRDjtsRumDvwKEWQyLR
 Fy0w==
X-Gm-Message-State: ACrzQf1IUe9kT4tegCSCF8HnbD66Gm2AqN2lQ68nqmcxp2DX0UWP5dK1
 hb73zWI/dkBB+163PiwSI1e7oLmP0TG53s+sP2MxeA==
X-Google-Smtp-Source: AMsMyM4M/UGHtoZDvKqLXibBQSuDgvrlY3xBBuQtesyAbGXkP01p1lOKJKGcK75LN10MgvuMO9d4ED77aWo+0nL1NL4=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr15394325ejc.365.1663687345323; Tue, 20
 Sep 2022 08:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-23-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:22:13 +0100
Message-ID: <CAFEAcA9xXUpO4ZZ0WGWySZLN4hi1fpdPmktagXkdrgOHqmR84A@mail.gmail.com>
Subject: Re: [PATCH v2 22/66] target/arm: Add is_secure parameter to
 v7m_read_half_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Mon, 22 Aug 2022 at 17:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from v7m_read_half_insn, using
> the new parameter instead.
>
> As it happens, both callers pass true, propagated from the argument
> to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
> but that is a detail of v7m_handle_execute_nsc we need not expose
> to the callee.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

