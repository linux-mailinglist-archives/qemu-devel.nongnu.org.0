Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA63F84B6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 11:43:49 +0200 (CEST)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJBvI-0002Hm-9g
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 05:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJBu6-0001bK-Ep
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 05:42:34 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJBu4-0007DT-Hc
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 05:42:34 -0400
Received: by mail-ed1-x52b.google.com with SMTP id s25so3803587edw.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h+jzmOTR8AERWsxwbvSmLSLd5obtPlGREJm8FbHeNCI=;
 b=Lrb+sq72zmEjTLa205ak3F3MewX4M/T638qmhB2C00ATLJM7lINqDfU++cqih+o9Uu
 wdbaGbfSth9LFLlWXfD/Vl1Fn0Trqoko9IuEf/bKw4WkO7jZnlP+Awv/QXNe45Em3ReR
 Hx4T5a8ankUg11iGiG3BlcbZzc4lmBKl8RvkoAKnCZIqFivVHGSyhCADVPkjogMTWF5F
 WKLAdoLRYqtUtSRY2YNUv82X09z2jxgOA2VWmmp65fDjkpIdmBaFZ/M8jjAQ0X8dWThA
 Tzmfj8EXK9Zyo9OWqJXfdL0Pz0qxNUIUvHz/EG6I2XCYi/UAu2AYtfFekE9CUlXqQIJF
 ZDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h+jzmOTR8AERWsxwbvSmLSLd5obtPlGREJm8FbHeNCI=;
 b=rOQmPXYD4bIXL+GTfA+ixo25skjDRM7/1S7kV88FBxtQHZEq+ElIxKB4uyIRJIVPUa
 3DxRQ2AikuM2E7ulSQfpz1EuqvMS4t+D+YmkysMX4vH1s75ouF4P9o9sLnww4dX+8EmO
 QmEB8fi2UhQEJVKE9lJx9AhrCXkTXJ4lIEg1CqBFK5gdl1TAUIJvlf5lppvwQWfopahY
 kuQ/4atmGuLU/yqx+WoQLwdz8K8sheWjqcBkVYsux6NChaIn1mx6+K+xwf+i3+30Hr+6
 4xW7nfDJk9fWzoXliTy+tlqu8iVQ1gubDt5Il6v15WyMCPLloSWqsFcJszqhkbdO0Pz6
 FfLQ==
X-Gm-Message-State: AOAM531TMScnI/wTftlIQPR25asPXsN2UcIhL5cTfv9GK09Y/HWTSbVF
 Af97DVbfso2Rkfdh/2RdzN9a/EPPkGzRkS93FjSXeg==
X-Google-Smtp-Source: ABdhPJyJf8DFbOdO+jvH3RqSmCHSOGnLlLL1UybNZr06OjOnKpRQd9jfPd2xkNbMmEw/7p2zY6+ZKDO431oRDBZIKuo=
X-Received: by 2002:a05:6402:157:: with SMTP id
 s23mr3295562edu.36.1629970950761; 
 Thu, 26 Aug 2021 02:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210825130211.1542338-1-f4bug@amsat.org>
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 10:41:43 +0100
Message-ID: <CAFEAcA-mgT7zL2-HBAgfMeF-DxAU7xpcrvMB-y57u-K5tOhjWA@mail.gmail.com>
Subject: Re: [PULL 00/28] MIPS patches for 2021-08-25
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 14:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit d42685765653ec155fdf60910662f8830bdb2c=
ef:
>
>   Open 6.2 development tree (2021-08-25 10:25:12 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210825
>
> for you to fetch changes up to bf78469cc8ddb117b6db4a353e59fb4664a96de4:
>
>   target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian() (2021=
-08-25 13:02:14 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - minor simplifications in PREF / JR opcodes
> - merge 32-bit/64-bit Release6 decodetree definitions
> - converted NEC Vr54xx extension opcodes to decodetree
> - housekeeping in gen_helper() macros
> - replace TARGET_WORDS_BIGENDIAN #ifdef'ry by cpu_is_bigendian()
> - allow Loongson 3A1000 to use up to 48-bit VAddr
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

