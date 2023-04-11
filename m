Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB576DE073
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 18:05:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmGTa-0003wL-6o; Tue, 11 Apr 2023 12:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmGTX-0003vr-Hu
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:04:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmGTV-0005Jc-Vf
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:04:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50489d1af35so2323783a12.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681229044; x=1683821044;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EkYGptQdRc+NrhtfDbT7x2/U8sJO3bfFyS0rALhSROk=;
 b=mnPFkmR6tJV1IOsjRfC08boevB4W9ukJfFZZSkMA7uw/bvsEseWwCRhUopeBbrJDS6
 ZFyqC6Bc1kUDzJ8Lkz+5QGj0GgSSPSpb+twbMmdW+BKMBKG/PHHuyWJxCb1rtct8hUnF
 1Fjj0+DZYhhcQt6LGKzpP9m7xgx6OLQnbyhS9aPDUG5gyV6cGAY6cO+OU3QDz8quBfP7
 MVEsVX/ulICR1MXa6vK4k0bkgtUTjODCB8oI9oagcaGoCa0deWeSeRd93+sFwuQDQSc6
 3JY7dqEQjDXqCFFhUplB4vJ1e9Wr8x2SpwzHnZ6YS7ClPXvlk8hCHiZWRbaWaKvfFr9X
 90bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681229044; x=1683821044;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EkYGptQdRc+NrhtfDbT7x2/U8sJO3bfFyS0rALhSROk=;
 b=1MQaPLJQX2YvG+Sp/NrNnAi0e5KZFq7ObcNftuNzD73OL/6lfY7SZQgaVXuTzkQVd1
 8OgL21ZpoCYuQaRVTwCRhF3+j/y428g3mMYqhvESn17IKcbDXfBYhgh3nyV3nNdaVwU3
 b0i1iDj3I6LcDsoAyueZ/JBaZB+V4vA6wFyC2uYTTA55gC8sFQQbrED1+jHVrDs6gAs0
 QXbexiWTz2VT2NNzBCox5MIBC7E4D9BszKiVfq8c8XU47XLozoVVDXHtIsjG/y+RvQ6G
 tgi2OUnmBC1tP6uKFTBg3Moi89dQTh3lW5oh6fKiROULG++eKBz9k+3l18ezNarKGFX/
 Hk+Q==
X-Gm-Message-State: AAQBX9colcplQ+8U86aNqNuMHJkjOJ867ECz84SI0QAl9bRNg7Gb4M2v
 BpfY2qxA69PAtHfF1TBqVUcwr3u2f9hWilmHhSL5QnWtdoAU8jF8
X-Google-Smtp-Source: AKy350adXco80Ti1Jxbf1WMrOFawv4jDtXV86AezqQZE/cIImWC806+jhEg2qq1d6oG8cewIXQVT9aRoCzyQme0b9dY=
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr1501280edf.6.1681229043988; Tue, 11 Apr
 2023 09:04:03 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 17:03:53 +0100
Message-ID: <CAFEAcA9XdcFtr5hnwDMxc=3CkOMboQSJ4FZT-vyz9V3C3J1z9w@mail.gmail.com>
Subject: final call for anything for QEMU 8.0
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

Given that this has been a holiday weekend for many people, I'm
going to postpone tagging rc4 until Wednesday evening UK time.

Could anybody who has any further release-critical bugfixes they want
to get into this release make sure they are in pull requests on
this list by about 1500 UTC tomorrow, please ?

thanks
-- PMM

