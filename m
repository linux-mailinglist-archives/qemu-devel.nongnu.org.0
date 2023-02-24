Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A766A1CE1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXyH-0000uU-JB; Fri, 24 Feb 2023 08:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXyF-0000uA-Nc
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:18:43 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXyE-0002k9-3L
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:18:43 -0500
Received: by mail-pf1-x42f.google.com with SMTP id a7so8046892pfx.10
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7mOScT118HWLdKvbSEDKSYtPbUv8rfQOUTAQbxJi3g=;
 b=SStqIpitRnQ+LlJV2COnPCHd9Igd/K3gDJX11eF92WMq2j6iS8XwsvMPwuuwlaYQ7h
 F110dNuQJHDwQXwAifnnxV7IotFOoBBhrdcPpRUJD2BqQkIxSKn2moS9S5+rybczyKnW
 XzuJuMT1zNDSNXz3jCuFCIV1m0Qp1e1gC1rawjL/m4C0fl0f3TRnY0RlboImNjb4Q4DO
 3sl6ZVjCsjtO/fWrxxihE/S1xl1QKPEiM6QvvBz6bOaUyquPcClmqT4+G9t5DEJnDwvJ
 ABhbsPbz1V/beYNrCJMlINd5RiJKLts+4gRHV0a6PqDu8UZwOeJLb5iZmmYXsNpaNa2M
 uCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7mOScT118HWLdKvbSEDKSYtPbUv8rfQOUTAQbxJi3g=;
 b=1VMQAmf2HKtcSZrTJmS2BMm4zpXScoPtaHILmqcihvY4eR6XxBE4lPxWK2kL2t3+um
 WCZaYk+xtd1cnxnwUj0Roi3chLpLAauYE20dd75H4XN0fsmrAE6AygCeVg1979Pn2krZ
 1ySDRxX8EU/tRXPNjqV3JSTiZ5fZFsbfP6mYKESDmQW1DuKQfRdxnZuaBcy2EibyQ5lM
 oWiFJSjRqlQdSPiG0gW/YNhoJlrzWnTh1lyOUnbYZt3nzY/i+QFf8eFdZ8rjkx0YOdux
 obuqOBn0fI9ESyLU+T/8DMuQf3fO7/aEs7gNzf4pcvhyWcfIth91lMgTJTJV5RRRfHaN
 4WNw==
X-Gm-Message-State: AO0yUKV5X1Jw7pvN2ucISwaPWKzgDrIVnVnnM3lkwJU7LU8VJID0fBRi
 lUj3FgOYHDUSW4y16IKiT18AEcRYmusaagX0Yd9+sg==
X-Google-Smtp-Source: AK7set/D+CjOiiidRf7nJrBdmWRDeF6e7duKMC70sfO0OByAWDUlA9d7pl5nJxmdypbG61FISbeOtW4ESaJVeFJ+WUk=
X-Received: by 2002:a63:7555:0:b0:4fd:4602:1b9a with SMTP id
 f21-20020a637555000000b004fd46021b9amr3048315pgn.9.1677244720616; Fri, 24 Feb
 2023 05:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-14-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:18:29 +0000
Message-ID: <CAFEAcA8FrgfPm4K7es0TxZ_294D17ZO2FiKukfAqS8Sa+2f5OQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/25] target/arm: Remove __attribute__((nonnull)) from
 ptw.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This was added in 7e98e21c098 as part of a reorg in which
> one of the argument had been legally NULL, and this caught
> actual instances.  Now that the reorg is complete, this
> serves little purpose.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

