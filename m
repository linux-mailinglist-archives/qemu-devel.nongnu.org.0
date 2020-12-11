Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF802D7841
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:54:05 +0100 (CET)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjo4-0001gF-9A
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjlu-0000Nz-9O
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:51:50 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjls-0002bZ-Om
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:51:50 -0500
Received: by mail-ej1-x644.google.com with SMTP id n26so12700251eju.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SdE1nP/Fjn5tnjTUQcE7M1jl0Cw9oeIDGSnKk/3Ukt8=;
 b=Y92IQHpcWsWF4yNkKIt3/tqIdelNYR514444/vMz4zsdNPMXNCLQfrrtegLLG/vKWU
 L4nv+XB65mjPiql5dvZM5I2mVtsPHdtmDNXdfgDIsXah7OSB2ycPf1J1aLoz2LI6Ifue
 XLDJPuv/DlyHtPvlRKy26deh0iUl77+vGvuQkYBYyarqS2b4v8l6FaTwqSWuCduf9MpH
 O5RggVT91CpQMyQKGX/EYrolbmfv2MLUnHZUEwAcR5V9jjpHIagpUIn9IDmi4a7pbc0Q
 IAQQrUn74JWUk7pAqro4s7Qd3B7YqtETrAIqtwGGeimcEpAqFF00TMloa5UOVwgufiQM
 2xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SdE1nP/Fjn5tnjTUQcE7M1jl0Cw9oeIDGSnKk/3Ukt8=;
 b=prQrrg5hOMPg5cuiCGrEbUOHI+Dl74pwIC7KUyVI1YDR/uQMcmJWn+0UWuToa8VsHm
 HJc8Bq0ad7knvVdmNVLEqSJWJGwJyHlRy/F1KYiTdnudKfWGhzWq4F/NBcIHlUVDohyi
 5Me4qk+rk/YvUhX3+P+m6fSpeT+TBj9+Q847HweDFfaUNUjZZtvBTI9tutMXHfDS/c0S
 MSKve3KoWzTc/QGf0Ujqepnnq+KBDmV1/PVPzj66u3owUBT1sdLEAI3wRU9h8vlJGypr
 TXD0vPSsN1B/hdjDm2Jp86Gvomjyhmjx9nTlUCz/27NCIA8PLIXrWkVh7xcAXd8cPwHY
 xYWg==
X-Gm-Message-State: AOAM530EgIcuLDa5Bo4qwyyv3etyWezxTw4zRVjUqHGBxmZGxflFw+tV
 BHC//18u/VFTmsEy0ofUVP+wLJzjs0Ew9/EpBWVOpw==
X-Google-Smtp-Source: ABdhPJyRfasSvKQGT1RLuaORuvQCA/DZmUbJOpwrNqJRzqnKGvupV9bj6XwDeHs7F1p+lLobIuLTuxH1iTPKRU/YnQA=
X-Received: by 2002:a17:906:4bc6:: with SMTP id
 x6mr11193883ejv.4.1607698307401; 
 Fri, 11 Dec 2020 06:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-2-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-2-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:51:36 +0000
Message-ID: <CAFEAcA-Ojn9a6As4oo+PWyLPr3LH-JmZnJFJDaW_vD+yprKA5Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> SBSS -> SSBS
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

