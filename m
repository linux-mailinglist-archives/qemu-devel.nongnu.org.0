Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9363C2508
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:33:45 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qdV-0003dv-0L
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1qZr-0008Na-Iv
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:29:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1qZo-0002OY-Os
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:29:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id l26so5469632eda.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4QMhBs4vswzZhyrDzB9ckUohMSBccFZMlPNpw0SDK7o=;
 b=zUN5cEmeLC1jgOxEV3dMDKuXRzWEqaOnhX1fETTSLTzop9XMsEe5PZwayFo8UDMRir
 YkBPUM1cVpJhQvXWkTfM3uqx9BQbS9pGEhQ+bbJwbcGTVuIEX0aPmQJC80n5sNCtkFLV
 aTn49BlykYUkXyjWqYutAtGIuR60EUZ1DtV22UfWgIpANb54k1ciWof9W2WsNI02x7Bd
 jVdVpxrtNDJknzey+/p/2BNbXO5ue6Ae34u7j07l0is0pbGC5/irdfKCo9XYr8e6EpIa
 oFf8VKX9+34HLGYTR5Ql/iEoseJIIHyZtmdKcQakUwfGoUFTyW9Aw+l1ugcihslLocHL
 RSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QMhBs4vswzZhyrDzB9ckUohMSBccFZMlPNpw0SDK7o=;
 b=bFlI7KXptS9NzwfNO5Cr3EHwTk07LD5Y3oar7ciJvrSwkPkD/MKpXUb6Q0UMUW6v5K
 uJyr6zrheuGHQZwjgZgD9trVonOw5qfnNRiM9wNGRjnoyUjDfjKBS9GEn3rmwuz4LXK4
 fVqOTuqKFXF+u2mcqBUD7oDChrhD2A0h0Z9nfiePY5BFHbUa8v4wL/Toi4cnTBAnbrgW
 ElfHhw3GdFXkVCUNc9ZMZmqIabW72J+Ky29T5w90RfN1Loo4P/dc3Qede4fa8kcMC4J+
 w+OAs2eFnomoj+x+NnTo7WLI4inffVHykEfTTFtzSabBD0nPX/fLMhejapiLljaHnMAs
 zsFw==
X-Gm-Message-State: AOAM530ntXi73Ny3lsrnoRHr16nU5Mr7GujgnK4A1ss0iNgGQ1xH1QF7
 isPbyYuRkwcBe+zmOx/PJPBfM2pHT4qRyZMZeXNrwQ==
X-Google-Smtp-Source: ABdhPJxgjMiF1IuRfoYamXJk5vJIZ1fpnai2NtTU1wDM22TIUebIDqBsOEG+P/OY4DEQfGCPR1BxxI2+QUnFbaCnJp0=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr15320350edp.251.1625837395076; 
 Fri, 09 Jul 2021 06:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210708131143.240647-1-stefanha@redhat.com>
In-Reply-To: <20210708131143.240647-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 14:29:16 +0100
Message-ID: <CAFEAcA8M+WjzBDaYf8n3Eh0JzDgh4H171eQU4aMzTwOHB1s9zQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 14:11, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 9f460c64e13897117f35ffb61f6f5e0102cabc70:
>
>   block/io: Merge discard request alignments (2021-07-06 14:28:55 +0100)
>
> ----------------------------------------------------------------
> Pull request
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

