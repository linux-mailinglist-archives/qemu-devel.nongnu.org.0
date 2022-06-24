Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DA559CFD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:07:27 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ku5-0005tX-RP
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kqF-0000b2-9z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:03:27 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kqD-0002Ug-QD
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:03:27 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3178ea840easo27117947b3.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMgcQP3SDdix/uL5DAxBOxf5bx/7mqKOZjDxOAb8Pcg=;
 b=zMohoIigwHquNYd7LAcCtmXnb8FNNEaCCx1bE8uhazMByclv/47AQpkkVXBi1SGS76
 Mc2QKw9lAVNKX9yehka3J6a3tzcoGpfN2e0HctL5UBsskzlU0SLgFzvtCjG2zwhvZxEZ
 S5H+5pBRnAt+VBFwQZvn+5qt6RRQ8B5IpP5iHYWpYhaCID9H7Wc89nPtT18kURnmXUCz
 D6HXlGb7tFKKSzYurLfDXsBeMYmgbV1Nn67L+n6ar83/IdUvzbSp4KRaqEYKaFhzKbh+
 Yrdd23OdGe7PSdJmnDiLsdFbzT1XKzMi9RWmj1A2uWENw96l8bN6Z8gazLjZwJaYo4V0
 kPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMgcQP3SDdix/uL5DAxBOxf5bx/7mqKOZjDxOAb8Pcg=;
 b=vCIUN+w59wRx3L9tcOa7MqrhpvaGBylqPQ/lrS6DqmS3JAY9SGzu4ny2WDj2k5B+O0
 ZCT12Jn4+uI7hxV3ydmWXwKEbt7hEhuxmSM47/7bSW3tkhgxlna8WymyzoTaDB3yAvSc
 sP2KfvYALylyCXtY9Xl6zWHVNekB/GnWmReDJVklvpkQsIbvQ1/GUnvnaRCX+3HxGHDl
 bZR2wxy/O/aqjsC5j9sz7Q8DtUPIFaKjmhtU9gdJ+N3oKYbCXYc0SNJf8JnopTM2zS5N
 +fpKcjrFMqHM9cnNYY8cS8nND5eYg5/oG+dfWTaivnMqE33BViY2iFHaBufo4WEe9uo6
 nv9A==
X-Gm-Message-State: AJIora/fXHzGjAGuP7FuwaiYZC2+NUPMn75GMiIduCFiKA4PYlraezO4
 h0AHiWUxHQ0FGXR5m23z3Zcpnkn7ebEZrEBpocwHZQ==
X-Google-Smtp-Source: AGRyM1spin938+4NDWI98TUSCo6WF3oP8vevMT68nqaWKLhiYLiwX5XNn8JCobmfm+BpxXGVyB/jAtZvshIht6teeNk=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr17529235ywb.10.1656083004803; Fri, 24
 Jun 2022 08:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:02:47 +0100
Message-ID: <CAFEAcA_V=W_G1MFnaL9DkOMDouiqT-eqc-daJnqUunqWqKTMDg@mail.gmail.com>
Subject: Re: [PATCH v3 00/51] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Mon, 20 Jun 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * Rebase on mainline (20 patches upstreamed; new conflicts resolved).
>   * Test bit 31 before disas_sme.
>
> The first 21 patches, excepting 17, have been reviewed.

I'm applying patches 1-20 to target-arm.next (with the comment
change for patch 9).

thanks
-- PMM

