Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC142DA5D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:53:34 +0100 (CET)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozWt-0002px-6K
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozSE-00013C-9p
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:48:42 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozSC-00056S-S7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:48:42 -0500
Received: by mail-il1-f194.google.com with SMTP id t9so17741465ilf.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7B/acPYByU+nuYEOBCmp5CSWKeQvXDGWgSHhnt4Hc4M=;
 b=e82CNKMEMKJ6u4CCf1d9Dcttlzw3g/vDCgbBrxzRBcsuK0oSQswg+nM+DmOsfdV2VV
 4cMeXSkvQOiIhmFpE/ORwRUI2oKjyGj8IMCMx1YpauiBgm0UwLiTATsXEwOxEUJ2OUOx
 a1SGAMmgS95BeUaEbmv5y16c7y0WKB/usG3lHyNoG/dJ0lLGLcYixC4+4hEu+G0+DTRE
 mKQKFgvUGd2/zbSPQqFfDrZEonMKosJcVa06cSmpVP5dJrVVg+7SjRPS0V19iQObuhu4
 tecg7M4B87meQn3OMhH+dXrGBbr0ZRNDlDZdf9GCGbkF3Rqjmc/LvOsDSjaNn0pzB3ER
 l75Q==
X-Gm-Message-State: AOAM532xHzKEgf574NNbw6yCz4Y8o7q+pSPNsMhHWMwhR73rlch4muVZ
 UN1VqiuC4pifvYiy3SBz4MXaw3rQOUM=
X-Google-Smtp-Source: ABdhPJztvz07Y3L+KeLG7w3C4zl+BJMWrUQ68kNmUlDLducOmVk8cwtkXD+DEUANJEaZeEpjUvrOVQ==
X-Received: by 2002:a92:d151:: with SMTP id t17mr39761585ilg.108.1607996919794; 
 Mon, 14 Dec 2020 17:48:39 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id t14sm438613iof.23.2020.12.14.17.48.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 17:48:39 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id m23so4114968ioy.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:48:39 -0800 (PST)
X-Received: by 2002:a6b:5d07:: with SMTP id r7mr36075439iob.84.1607996919493; 
 Mon, 14 Dec 2020 17:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-6-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-6-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 17:48:28 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBzU4VEi==b3w72RwOOsPC_fAF2XTt7aVnsGknBxo6cdQ@mail.gmail.com>
Message-ID: <CA+E+eSBzU4VEi==b3w72RwOOsPC_fAF2XTt7aVnsGknBxo6cdQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/43] tcg: Move tcg prologue pointer out of TCGContext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.194; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f194.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is constant across all thread-local copies of TCGContext,
> so we might as well move it out of thread-local storage.
>
> Use the correct function pointer type, and name the variable
> tcg_qemu_tb_exec, which means that we are able to remove the
> macro that does the casting.
>
> Replace HAVE_TCG_QEMU_TB_EXEC with CONFIG_TCG_INTERPRETER,
> as this is somewhat clearer in intent.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 9 ++++-----
>  tcg/tcg.c         | 9 ++++++++-
>  tcg/tci.c         | 3 ++-
>  3 files changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

