Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D61EC290
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 21:17:45 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgCPw-0000Hk-Sc
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 15:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgCOU-00073o-Dr
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 15:16:14 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgCOT-0002gt-Ei
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 15:16:14 -0400
Received: by mail-ot1-x342.google.com with SMTP id e5so4464967ote.11
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RjD6OtN4vvs5nkYvtmO7Sx2gfqZ3byHez4MyXmyEDP4=;
 b=vqKccGL9DPkpP4imFGx7hwWRe/KlPboio9bGCCmdKV+deDfmVdWjxk32S3yVoLixez
 1nVUJptIFw/LFMaI9xac11t6ty0yPp54Hy1YPnwWEhkFM5Loa3/6bjB43H+KCqVv0LUE
 TlQ9SwhCln/tozxRmCrPluPqZU5WYxvnM3QvkNE/Zs81KmNht//5DrM3trdU4kXgb9VA
 eWtvgiCIac+O3fxMaEmZSoothZr7e1t78t3L0r61JlD4J4stjmjmqpYeClPc/eKAuMKN
 ceOEnmrd9K2Cy8tRCsLoHTvUeLImIVMiZLm4wunpKdUplwimhpsFBM9TG9Y9y2wsCn62
 m6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RjD6OtN4vvs5nkYvtmO7Sx2gfqZ3byHez4MyXmyEDP4=;
 b=cJ0+Jkikz5UaLaVZ/3buvX1p2gyPalTY7YGR4Uj9tH6b5ONLJubldzoRRbjv265kM6
 GoBUCyFWC9/fER128OALgtOjCasp6ez0eASGtNfA1MyEcBXu4vVJShhvbwdGXdkzXEmm
 akhkj5rFfsOBzQjK0Y8ttKmRLg5PYk/6MxRRVRhEU8Vb4zJ1NucnFPU7ZzOZNqgJJsTq
 FcWkyi16Nyq6l0doVAbDtiHO3TiJyVC2bUCi7Vv8QaWrCkCzXNMSB93eDW9/zSyM+dgb
 qCtCda9Q3koIDjAi+Y+46lCVga4LNg2TpKpdQosKvxVzPQfL5TbnaytcBPsCOuAkRmb5
 xmRg==
X-Gm-Message-State: AOAM530Upu4/8aLYnvMPp4qWmtLzWkqn/ayZuHWy/Tskjzy3FFzfCPkN
 SFGXlRzCAxqgUD82BC9Mt0Cr1SJ1Y8Geg7mrjMg6SKjDvls=
X-Google-Smtp-Source: ABdhPJze/VTBDXe+6jt0xAh/oZmugsa8vAZarPx5utmxXHbbp1d6wEuIaxN0X113l9X/epfxPbttWZ3DSMcPukg5vnY=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr571972ote.135.1591125372034; 
 Tue, 02 Jun 2020 12:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200602170151.321389-1-richard.henderson@linaro.org>
In-Reply-To: <20200602170151.321389-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2020 20:16:00 +0100
Message-ID: <CAFEAcA_ZtVDU=ncFshfMKmWvXjZuVCkBEdXLmJ9STQ6x5SmAbw@mail.gmail.com>
Subject: Re: [PULL 00/12] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jun 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
>
> I have not been able to prod reviews of all of the rotate patches
> in 4 weeks, but let's not let that block ARM work forever.
>
>
> r~
>
>
> The following changes since commit cccdd8c7971896c339d59c9c5d4647d4ffd9568a:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/machine-next-pull-request' into staging (2020-06-02 10:25:55 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20200602
>
> for you to fetch changes up to 71b04329c4f7d5824a289ca5225e1883a278cf3b:
>
>   accel/tcg: Provide a NetBSD specific aarch64 cpu_signal_handler (2020-06-02 08:42:37 -0700)
>
> ----------------------------------------------------------------
> Vector rotate support
> Signal handling support for NetBSD arm/aarch64
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

