Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A66510E6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:06:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7JZo-0008FG-Oa; Mon, 19 Dec 2022 12:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7JZm-0008F5-KU
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:05:18 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7JZl-0007bf-5H
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:05:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w20so3041307ply.12
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yAyMTMpEIGYsbphytWB70w93Ba0I3JUPy3p/l64pgs=;
 b=L+ZX7DOqE3n/iZRPZMF9QbdndzfNfFmvOXxghwdvQrWYt8PvK/p/QRnGy2kzufGZsb
 8x7scEiD7ZbDRfQKe8wi5n4V6GEzvgWNpfIOwtGs3Rim5IVc2qoGeN5rj1cw5VD0ZKcf
 kwJJOuC86OmLtAkyf2lQMKJbDpyQckFUu1vHntmgq/IxpA0NQ2ILQBm0Dz9cULj8xbeQ
 j3F6tgtIBdFMYsaOOr4M2E6H8bUDloedkH3lG5wEtftSZtLjK758Fe2z9UFU+nrZxSzI
 NH2Ew9aFpoew6WWS/3fNDgekeZ7Ykmv5SDXi9p/oND1uth9R+++DmCDuxD31dnfNU10M
 VJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3yAyMTMpEIGYsbphytWB70w93Ba0I3JUPy3p/l64pgs=;
 b=27ZdiHH2mixQFVVuT4qe+lQaGAQMzdntq/MScxoOm6hlHdh8mX4FnwSmlrFhV82vUD
 aMRGvdh5TCPkWIeca4pRfJVqFkElkFtUJqLdAGHLN+kmdO458/VCIIWqR0fXK2y3LIo6
 fxUT4M9uBkIS4zI93wBFqSiIBd970hZMWmOTY5P+1O2/Xc2vSEEgFVLc69WmUasEiRaC
 PscFfNPWqgOlc6uMlMBVhSN+J+vRR9VeJB9r3d/dYVWGssFD6QMwG+Z9oRE7XCy/s0n/
 rFj0qEqQFobyTVDw98ftIyBaW6/fpVzUKjof6R+SHJ0bY1JeYNsH8XBUiWWEfrPYWUhG
 y1IA==
X-Gm-Message-State: AFqh2ko/3GxqSQ1VWVIQGqkFvOJoEn6F7Yzizpg4gmKv8/EOzTZKwYaa
 RNnVCR2nMRXCCodgQ+omvvlEYhk/TCh9/iQDyRgiVg==
X-Google-Smtp-Source: AMrXdXuKV+sWfUr0j3rq9J0Ux5nYgsjR7fzerPIVwthTAxa0msuFoKCdmfGmDUKdTf8w2PEnttDoRSJZdxUslEaO3jQ=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr2017005pjb.19.1671469514220; Mon, 19
 Dec 2022 09:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 17:05:03 +0000
Message-ID: <CAFEAcA9AoyxpnCG2wBq1LOAZQ7=7i31TmgsuOW6bYkix==MbzA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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

On Tue, 6 Dec 2022 at 10:25, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Sorry for the "Reviewed-by" messup. I missed that on the explanation
> page. Thanks again for the review :)
>
> v6:
> patch 5:
> - I also changed HPRENR from ARM_CP_ALIAS to ARM_CP_NO_RAW.
>   Its state is also present in the HPRLAR registers,
>   but it doesn't make sense to access it raw. (I think)
> - I'm freeing the PRBAR/... strings explicitly now since
>   I don't know how to use autofree in this setup correctly.
>   Maybe {} around the part were the string is created/used,
>   such that it is dropped at }?
>

Applied to target-arm.next; thanks for your efforts in getting
this patchset through the code review process.

-- PMM

