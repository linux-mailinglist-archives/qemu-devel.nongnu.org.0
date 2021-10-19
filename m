Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FBA433B7A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:01:18 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrYD-0004HR-9l
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcqNn-000664-7c
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:46:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcqNl-0005To-If
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:46:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id o20so48322210wro.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=w0reicUlypJJ8pL5z+/IU3MQ7oEbbDpBQZe35uLI0A8=;
 b=CdhQsY+dQCDeDNe8hrZ2NsKS96UuwzkKSRYHEOX3fi4j+6S2ia6BK++U2avW4kKLkr
 OvTP2pLUyK6EFgWhIL+r4L1SJDhfXnxAHwlOuiYJvmQ9Px0Cl4bmaCtv9qNkI28R/5po
 zAIXJE7kaug/7yVL8dxPNCFM42jw9FScvUhq9IPlS5JvBx6CU4SBW01u0Jgb+ayTSdLV
 49JiPsDZfLrPg2yopJZPWd+5d1Z3oEHrMvVgi8cOGuv0n6XiXu8g6wFnnM40mFf6MLQQ
 DaSYN7OwUXc94t3IlNnYdDOZ+1NPfqCZbd2k0gtHZr3zorjyO1kUI2RKVuwc91bdz4Hs
 RZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=w0reicUlypJJ8pL5z+/IU3MQ7oEbbDpBQZe35uLI0A8=;
 b=whzZSPccDxE1aUQ6CcsLvYywAwZ2lg2ANnSq+8ScucliJNoPJxFURoCeefsunVb7MB
 6gTbHAdpGlAOy+0ImajEXX/ZHvN9VAJMhriNPhRWrUc5YGYDoAnvc7CE6h+y+iJDJeM1
 l2hR0Z1rjX1uSv+iVZR2+w1cHlImp2Y4d3nWtxaVnqydNCIkHMpiLrfc4QuJB/nk621u
 ojWLlawsFR1gbPKuu96abnkCMbbKtlME400/BlZBJKRVz5iS1hke5Q0Riuv/Y+CTHG1o
 CGgf0GA2Va4Q9xAiRMyzlS3X9vjAJGK1kDaLYXzHi/JpBImxCVAXzZalGR8rBLzfdcKG
 QS8g==
X-Gm-Message-State: AOAM533wyc5z/ItYZBXG8oZ52IgFodBYZ837lrrCmDxbt2jPKrfjgNts
 mKeRHpH8GpXSjCibLRsNYOzkcBxwMO5pIA==
X-Google-Smtp-Source: ABdhPJz54lzlVDDcMDBjc1E/hgEre6LrmRDegDp4GqcxaLWvGVuYE/mRKXDa5bUtMNIRYA6vpB9O1A==
X-Received: by 2002:adf:a3da:: with SMTP id m26mr43847702wrb.336.1634654779496; 
 Tue, 19 Oct 2021 07:46:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i24sm2422276wml.26.2021.10.19.07.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:46:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACBCA1FF96;
 Tue, 19 Oct 2021 15:46:17 +0100 (BST)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/7] tests: docker images for hexagon, nios2, microblaze
Date: Tue, 19 Oct 2021 15:46:11 +0100
In-reply-to: <20211014224435.2539547-1-richard.henderson@linaro.org>
Message-ID: <87bl3lysw6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> I've refined Brian's outline [1] into a proper patch.
> I've updated my nios2 docker toolchain build based on Alex's feedback,
> then added another toolchain build for microblaze.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

