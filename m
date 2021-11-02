Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48882442F2C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:42:18 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhu3M-0002pe-JV
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhu09-0008O1-KG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:38:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhu07-0005Bw-FM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:38:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id i5so25731998wrb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LPKZ/q+pdE3fsJLVC7OAp5e29wExJ2IRrv6lWtf8aJg=;
 b=V/pBq0gzWHqeoazWIk6bWGBmfJVCSh5F3fDrnCqMCGXsSBE3JBn9sikqrjdSH/dB7e
 ROKbCK6KJ2snGuUA1wDXAs+IzmMORIcsSmPixBduwAmkEjayinI+AES+tDNWnPrs3uSa
 DWcTs0rzLd+DkeSilu1mRhVsVNFcsECiiABFdQOFOIY9G9/vjV69JHGiKdXsnPjxWF96
 mU6StJ7fEqC+K0CumwtgvMnwoMyYWcvK7kxsgK7T3I6Bsshkq0YydKqUS5/q4cn+1Lt8
 RdPeQgGpu7EK4YtnNCgEvhkgddG+qBH1l+h5IapnB30ePMdUBAOfmPjR6VcVvY4oKN/8
 2ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LPKZ/q+pdE3fsJLVC7OAp5e29wExJ2IRrv6lWtf8aJg=;
 b=kPzgt5SU7OtC8HJJua6For0tDQlX8wFzeP5ao1sVTZzQg827V/zlPN1elhtvdOnCSr
 9L4isVmtfcX6Xl/PDE37Fw5yGoypkqotrkBdaR1jA1PW/bIaVmPtTuiEjQhlOYmuX9Rj
 Pf4RMy/64xSEAVKuAK8vHu/TdGcTXyRF+pIsblNEm7bd2+P96o7uauFvKtU44G4z0+hx
 S2p8W1puAuXyYZQZ2MNHxGr61FtHmG54cXNaOOKgPYqHdCJVjL394UWqryB5uOG+5AnU
 iGj1ym2ozYm4ExGx5BOv/rsiOV140Nqi8fj7tLC2Bfml9+qsfPF8LD9rm/Qt1MLP5SVH
 NIGQ==
X-Gm-Message-State: AOAM531yoMrPkiUiogdJn6wJjkp72GjLKd/6g2jqLpUhS1OZUMG46u0z
 w0jfSnbKUdENNnUFLN2UofnQv+dxBkyfOUqiH7vDShULJb3rsg==
X-Google-Smtp-Source: ABdhPJygJzoLbaLe8UVFU8N+Jz0YDUKa9DhD+udqOF9yOqB6tqfSnVAJzW/9cTyZmDpA3sZbfH+wiVQJmbPfGphYsKw=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr39564884wrt.275.1635860333983; 
 Tue, 02 Nov 2021 06:38:53 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 13:38:42 +0000
Message-ID: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
Subject: more bogus meson warnings
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried my static-system build config today; meson bogus
complaints include:

WARNING: Static library 'pulse' not found for dependency 'libpulse',
may not be statically linked
WARNING: Static library 'pulsecommon-11.1' not found for dependency
'libpulse', may not be statically linked
WARNING: Static library 'asound' not found for dependency 'alsa', may
not be statically linked
WARNING: Static library 'spice-server' not found for dependency
'spice-server', may not be statically linked
WARNING: Static library 'cacard' not found for dependency 'libcacard',
may not be statically linked

We asked for static linking, this should result in
"OK, no static library present, ignore optional feature",
not "decide we found the library and emit a warning message".

Has header "snappy-c.h" : YES
Library snappy found: YES
../../meson.build:1141: WARNING: could not link libsnappy, disabling
Has header "lzo/lzo1x.h" : YES
Library lzo2 found: YES
../../meson.build:1158: WARNING: could not link liblzo2, disabling

meson should just decide it doesn't have snappy and lzo2,
without emitting the warning.

thanks
-- PMM

