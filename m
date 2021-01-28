Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFD3079CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:33:38 +0100 (CET)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59If-0007Rj-Sj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59E1-000441-W2
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:28:50 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59E0-0007Y0-Gc
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:28:49 -0500
Received: by mail-wr1-x435.google.com with SMTP id p15so5791997wrq.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=mSI98ThzDinimZnHJns27Jdov5XlA7pDTPCmID6xoVneJ2sGtCZ2g16wGT92oGpJUU
 J800g3FVnJNwj0cZDjCxcdd6TY56AYnwhxZboNeQnMuJ93KzRn1bfeQ1leClfvIO4QQw
 E/dnthfXBKDoZKPwUwmE9AnChfJ9uO23m+O0naABOijA55rawnhpREwBABWXVw8abrus
 53n/PJyY5P+vE84pXqs4gzDH9I+2vwgT389typUvVPANStzjnFBmGFeREGJwEcAYwv8m
 rOyYM/IhxN0zAU/Pwx7Nh70KgYGfoxUjHqvG5cv+ZNbPJlfLapVCouMhtskmUY4kcPrh
 2fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=VWeHWT5mSF8d3+DnygG/WvHsHzOW9FSNCO3w1KNED6Uac2HmMViUYDxzKd6daoyXHf
 xMI0dkSU3UUeJD7M0woQm5WXRvzXA/RVCwoVRvX23rEV8VJRSARSyw5ywjszCerhGyRN
 9PaxGxaY5e5qQuoPwfbQ/WvfBUC9wGg/UlKztxs54tAEf+GsgBUyrRi5cN2pasasNS/+
 6h/C8a9NA+Mv0Nt6m9wme49ykN4Ovoqwe3MHGVBgVy9a1edJU+AHoyhgwbcwhNkj5nD8
 6vZVr+mAyqU45MbU33/n9PMmZ147JYgkHStdMmfzMVZI7i12F2JlFJg120I43OpLbXQS
 QFEQ==
X-Gm-Message-State: AOAM532ZOGhcmSzK0WW/xxbGcnxXBJ/l86vwrjutraVFFmHYFFu9dilw
 iA4xpKCzAcDEudxWbajfEJyZ8w==
X-Google-Smtp-Source: ABdhPJzruPr1l4xTXTial8k3Bbkx87IcB+2v7HO61RhMNZG715miXIhsFrTRkpKHRUaOqzPetgDewA==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr16581898wrb.378.1611847727035; 
 Thu, 28 Jan 2021 07:28:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u142sm6587530wmu.3.2021.01.28.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:28:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C1CB1FF7E;
 Thu, 28 Jan 2021 15:28:45 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/23] tcg/tci: Inline tci_write_reg32s into the only
 caller
Date: Thu, 28 Jan 2021 15:28:40 +0000
In-reply-to: <20210128082331.196801-7-richard.henderson@linaro.org>
Message-ID: <874kj1w05u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

