Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1523987C3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:15:32 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOqR-00046d-PW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOpe-0003PF-Q6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:14:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOpd-00055q-86
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:14:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so2533wrt.13
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XNf5N6JWO6+RIgrmjPZynnMuG9pWEUAFRGxP9R7gUpc=;
 b=EO+bT3RqqccjZhoKjsjkVNa0ITEYS3SKXoGIiS7l1vVd0Ye9kC3OSL5H0n91uuwFp6
 hELd32Mb/38wT40sbR8IB5df893a8QjLr1RzymmCsIFeivh00RNWK9lWdZqBo4ca4NJt
 94EkVQHpIjpb4RFJajW1rs+x86anKp/A/aiW52i1iPnbBD8NuwYnbmiYb6wvulxns5EQ
 59sd/6iFOSB/DHWt0QLyp3euWpgG/0zw9unTUA7T3CKM6oWLF503W7GsJyow8aDPvfSX
 dV2iAviWtR0LXxtDTRj7DHtBwuy99u6qcZY/pyOthXioK5yPG0R0dEnLjgb6EqrLb/2o
 8vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XNf5N6JWO6+RIgrmjPZynnMuG9pWEUAFRGxP9R7gUpc=;
 b=cvECOQo/u0FYnltkJeddIffnunVLKT+JoQ4YmUQVkaTqVOlxsTxOfGKEqxr26b9x1K
 gMuPc1fsqL8kR4AuCIAkn5SEtKaBMdz0LbD3OS3+JFk8a08mG3JH4PMXNAiV1Ofzxugv
 7z9LPBuWSQ6vqItdgt0GpkysZjAxAPE07azZNDehk96+LhcRWsf4Bis197+S4+I9EYtN
 wBPUY/z+uvlGMTcqYR5RCbmgVj42wo3BJyIl29neTVtfqtvnfG/mb0If/ylrySh9VYIP
 cAEz9zZrhLuN3zr19skwm8D+KRl99pKYF0L0p7bsdegPuGIq9Q5YfaFtAvCntCz5bw2Q
 GhCA==
X-Gm-Message-State: AOAM532dzE1rwN0rm2X/yoyrAvD+YkLpDCBF/vbOnAKd8JYXf6oSGJuG
 GysKKlATPv5qVAQX7ChKh5oK7Q==
X-Google-Smtp-Source: ABdhPJw68a94QA1rjVzLY1/CLMoWwiYMNxXcsHEyQEcvXN0EYxkNuUAPqbSzwu2f8dCYyEGMFwu3Gw==
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr27347575wri.346.1622632479687; 
 Wed, 02 Jun 2021 04:14:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u18sm2384496wmj.15.2021.06.02.04.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:14:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 078361FF7E;
 Wed,  2 Jun 2021 12:14:38 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/28] softfloat: Move int_to_float to
 softfloat-parts.c.inc
Date: Wed, 02 Jun 2021 12:14:33 +0100
In-reply-to: <20210525150706.294968-3-richard.henderson@linaro.org>
Message-ID: <875yywbjs2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_sint_to_float.
> Reimplement int{32,64}_to_float128 with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

