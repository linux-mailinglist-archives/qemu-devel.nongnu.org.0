Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5F43B725
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:27:12 +0200 (CEST)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPI7-0002B4-I8
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPDk-0004pJ-KQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:22:41 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPDi-0002z0-Ng
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:22:40 -0400
Received: by mail-lf1-x134.google.com with SMTP id x27so18325649lfu.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=M5fazq90K1eAXLItLpSy/5VSbVO3pSAu3hTw12lVBmU=;
 b=Sv2+V4CcWwaOy5K0m3LJR8RrxtfsEfpHKLuSqXJLsFCfIOogBO1uXsH5bHrjOZCRYB
 ta5BmOW2r0NakzL2mUjP8ymOEWWxEljYqZTkHsSm5Z9Jk6e29rz6ZKBjfLFHovzv7hw2
 6f08y022qA94juFuqYfcbjiIHzf9lAXCmLGecMp0Nq311VaTA65SM7fW2iC3rQcBuKhD
 aA0yw8WHSkkc+oRioY97/exKLaZXJtytBpHB+CQwr0u6WX8sD32g2SYpMhOhhbKjGwD8
 vXfP2XWSPnK+cdlEkB2DiNzcuwTkHql6/HESMfUZRtKs1ZizCpToMmf9KJCuxwgyqkvv
 PGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=M5fazq90K1eAXLItLpSy/5VSbVO3pSAu3hTw12lVBmU=;
 b=bcSyzRcb6LUoO790ezfwEREBSshWE152j0egMHxs6y37Z23sURjsMUTz+ujCNOA1lX
 smueKsjMNaUcrMKr1v/mUEatjCMwcMpy3DdHtAPpK+zj+/JOT4RvZlKmSRDHimnEgEVa
 ZLyAljmW7XN2UVEKjnJdsjnOCagOEocrozqP1URi3co5xMVkKLqREJ7lwonbaIp5UiTC
 kc14ZvnOSmjlQeH9XsDjDzgZVdN8vLvNV5buBmDnpg2p+jgqaijRdsrs55543btl0te+
 /ELrAsljHthkD1cEQaEcvQH3JL6470cfkyTdy6z2mwm1ydQCkBr1KMv4TsCyknjApJIo
 zx6Q==
X-Gm-Message-State: AOAM532dc2HJnBVH205ghB56H0VkkIuT2yfieCyfBLc2nmO10cji91zt
 I0Rr854dDvYhedOy1yOow2MVctPEf69VlQ==
X-Google-Smtp-Source: ABdhPJx1nn0xgRDv94As+xMDoKP530X/DbKJTWma8rnfrZyE6bEC+UqNwuYvTpOxLy7hBKTxj8tFUg==
X-Received: by 2002:ac2:52a1:: with SMTP id r1mr21916811lfm.473.1635265356705; 
 Tue, 26 Oct 2021 09:22:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g18sm832105lfr.286.2021.10.26.09.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:22:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D5FF1FF96;
 Tue, 26 Oct 2021 17:22:34 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-43-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 42/48] tcg/optimize: Add more simplifications for orc
Date: Tue, 26 Oct 2021 17:22:30 +0100
In-reply-to: <20211021210539.825582-43-richard.henderson@linaro.org>
Message-ID: <87sfwnzrg5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x134.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Two simplifications that were missing from before the split
> to fold functions, and are now easy to provide.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

