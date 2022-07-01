Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C5563421
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:11:02 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GQH-00086D-PN
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GNK-0004NQ-IB
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:07:59 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GNH-0007uP-0I
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:07:58 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c1d580e4bso23267317b3.3
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkzF54IB/3iibPcE5a4H88V+0dRJ8X/tvMNJ4w7r4zQ=;
 b=LP7zzuVP5+EKmfiwAhe+MmdOlachpkCqGdiO8GriJZNr2l9VDLyoOJO6RZRkAtgjif
 cvwO+93wGBiZelPXq4kbf7Ysz5uDDtBPmiEJzLlVnAnNmNRbx7rji+G3Hxy+dj3qfXen
 UeK8VLndK5Mxtgq5oJmv2CKEs3O9MNr2FNm8drDy75pLtDmJbUcdfMkeDMn7dTWi8BDL
 HuWFIi6XmIMu39qcCgLJYfj7uRUkXhBwx3IMrbZD72Y7vyjnrUX2TbeVTzvpaR97W0dp
 d9OjFsywJRhiNDzfokR8CQpedjD+BUjArQ9cPNK5+AT+bIPTiONuKs/JcRajTMXVe/x8
 Q4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkzF54IB/3iibPcE5a4H88V+0dRJ8X/tvMNJ4w7r4zQ=;
 b=6ngc4izVDXX9J++HP7oNfQiywC838TXlVXQ+b5JyztGJO0jGW9iJtFt9NcC6QMa0Je
 Ma3QdiI2X8lp1/3zShCB8XfvrUacaZhRzSpjv/UR5lJR1BA4VqOVk2G9Ddy0vDRVG81l
 imn/ri423re519jhFtlLnytMlyyPGk6qby3LoM8JhT+FLxPkPqz5ixnVllS/QspvGKYO
 srot9BW0C2uoY1E5mXQdLOo603tlJh5MU+xBp/ry1R+etgDPkHa4o4dBChAjYmZ7owjr
 0ihDLwdbiiELRMLkG5q6UrB6iwCDr+qo9HAObDoUkKXtCyKPcoOr8rB1S8Day07GgvrO
 A/zA==
X-Gm-Message-State: AJIora9GBPo1ncQ831vit+1GdQHX0a41ujxaEvb9i1poeOOs1VnDncyS
 /DGj/ekXZB6Sh6Yn8ms7j8Pg2RRNbKCHAlFBMOg9KQ==
X-Google-Smtp-Source: AGRyM1sfMvbt7pDbGWtnyLhhbmI70frUf9nlb3UHpQ8+ERRc6ac9UNR7rXYOdcbKdHmQdPW6lGgSrF2GHgF392GtusE=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr16881404ywd.64.1656680873840; Fri, 01
 Jul 2022 06:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-17-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:07:15 +0100
Message-ID: <CAFEAcA8qAf2Y7uRT_+j2QGCXpX0m+OGaNP09XFWp9OGQ-4Q7PA@mail.gmail.com>
Subject: Re: [PATCH v4 16/45] target/arm: Handle SME in sve_access_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 28 Jun 2022 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The pseudocode for CheckSVEEnabled gains a check for Streaming
> SVE mode, and for SME present but SVE absent.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

