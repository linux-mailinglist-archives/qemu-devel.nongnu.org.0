Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD33701ED1
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 19:56:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyFvp-0004tR-Ok; Sun, 14 May 2023 13:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1pyFvn-0004tD-4s
 for qemu-devel@nongnu.org; Sun, 14 May 2023 13:54:51 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1pyFvl-00059p-TJ
 for qemu-devel@nongnu.org; Sun, 14 May 2023 13:54:50 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so54607875276.0
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684086888; x=1686678888;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HeZzagxYAx7Ra8RFaEO1RT18FQmyLfqRv6LFAAB3Q/w=;
 b=EId17DZuDD8tnOfPz5yxcoY67WdWNBcfUaxldeur/NWLloJunztFuHIcTpHIoHVIEB
 NoDpvpikCgqljLkUAbqNOBvP29Cqq0HmEWAGwZ2j8PJWMAQKeBB5++26ZIpHLdQ2OzEY
 wFU1qd0i+9udkPITNhgbbguHS0YTVsqEqiRo2e8MIc905V/LcTSQv9rzCW36I78DLuv2
 3pOrapptU6lO/jqC+mCp8U6UysKRYouibv07KaU5gf9F1TodzyMmJx4vZQ5+UBxFfD4+
 wQ4zrxCQrdO5hkKJFTRvCFIATZO9jNQMzeOosjAXDDAkfpXh04Vx2MOo5FicirPCHe2h
 LBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684086888; x=1686678888;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HeZzagxYAx7Ra8RFaEO1RT18FQmyLfqRv6LFAAB3Q/w=;
 b=CNwyODZ3xz051RvXh61MKWSP+6me7uIQoQwjAGfn8FP8M9L8O4cPyNRJxUo/tQ+9dK
 cdiPyssbzbB2KtdNvGZD2yLLdCdMToCLvHM3ZVjGNfb+UNYDm6Yka7CFdFb8wtpRe7Wm
 13F2mC2M65NtGtSzvWaJc1pHPeG1RGJFDFYmiekzqvGZHhkA/yutWCbj2SV7SV8Loe+7
 PYZ9g+FD4DHHuRwnH7/2MWzrqpM4iy7zaVwjAS54AI1/5sPh2C1wSDWSZuqE/254Fzqv
 chcp2NoTp9F6+fedz/WzivqVvIKenChexLrqCrRsHV73C57KgLEswbfsb2DOn12xTrli
 +uYg==
X-Gm-Message-State: AC+VfDy5ZGoqc0X4zcKxEUFzNajvI+M0maIJjsjLnKwrugqi7m/YCg7C
 xJW0NNIhoyjNmExEbhxq/IWWb63b6f5RPkz7YYGcDuAj
X-Google-Smtp-Source: ACHHUZ6Ex2FlkxLEa6ZP10JgIEiM63Sd/wjU4oT9rnkkmQQshXVeWDzPTlCBqj5cwYHzqG3DDN73NLDAVTuiKd43AGg=
X-Received: by 2002:a81:1cd0:0:b0:55d:a851:1aab with SMTP id
 c199-20020a811cd0000000b0055da8511aabmr28838388ywc.17.1684086887956; Sun, 14
 May 2023 10:54:47 -0700 (PDT)
MIME-Version: 1.0
From: Gautam Bhat <mindentropy@gmail.com>
Date: Sun, 14 May 2023 23:24:37 +0530
Message-ID: <CAM2a4uxjURNAUcMemWj+mJOvNjgHbXQ-KgiRdRghByM7pBVROw@mail.gmail.com>
Subject: Resources on deeper understanding of Translation blocks
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=mindentropy@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

I am going through some translation code for existing targets.

I would like to know if there are any good resources on deeper
understanding of translation blocks? Also some advice on the best way
to read code related to translation in Qemu and trying it out maybe
using the debugger, printing etc? I am getting lost trying to make
sense of the translation code.

Thanks,
Gautam.

