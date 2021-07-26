Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C73D59B4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:45:36 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zzC-00012H-HK
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zxC-0007wW-1S
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:30 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zxA-0007dn-Eu
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:29 -0400
Received: by mail-ej1-x632.google.com with SMTP id nd39so16243615ejc.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZ5D/xIJ7nJcwLj4uwIq/XuR1cv1Hnm4hbKAZbIHcdI=;
 b=jwCkiG1mANM3wvPDIOqYo9EkAR3ZZ8JfQwai7yNskNEQYN0oSPSpnMl5GVhT1YKVJf
 F307+a16i0Kj5CS11W3SBLBpWEOYx3Ht6hIDLWub/jdrOw/ptOX98cX5rzeLT7AzRyk1
 m7FT2DDRcNvpAtZDDsWN2fr4DpuyDwiR6ZW2aDpA6h2dMe8xqQ3dCFc82j/w+61mC3A/
 CIg3nVGSHIGpq1qjEMEBnurkOdu5OBTziDSBUOZKdslO9aaenR+CYWPrEx7WQekrX3zL
 3RxhtjGneGxRRhD9yVjM1/NEQ0D1VR3Ex9hCpPuzgFzdsMc2iYR5N36buwqBffnOOC69
 prWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZ5D/xIJ7nJcwLj4uwIq/XuR1cv1Hnm4hbKAZbIHcdI=;
 b=qF0vDAbeyEGNJ1JMmSuU+Liu4c4MHiJ8earfE5siCCA2C3CWlTWIyrSC8/0JViAJ7J
 jycjWZFl/dWk/J6z7AKlLgJf5v1y4gkYAr4wt9gFkhJ1jEodCW68yFKHm1op7/KbeWQ4
 56YAaSn7zGOcASFDjry1XV15fBIKAkbiMchs4QLn1ABPaaxD61MaFwkqBMGUI4lTdNER
 MDP8vDo96uTVgHSL/fjy6L9oYZ/3uS4ERgqfvRHgFX8cE3PrvbDFMw3D1n4A8NODXfgc
 mxINbQkWlGRtqFPof9Q9Ob3UL81iznUflme+mPnvjPIv9UHm7sox4FDh6Uw7+AJN13mN
 T4PQ==
X-Gm-Message-State: AOAM532mYtbuafeMZHc5OOJ7Q081a+VltlhjUrLSq8tOPVa1vQ+aGfJD
 JgZ5asSKhGpG9yvvHCQSdYoZLYA1DPbx4WGxIbiDSg==
X-Google-Smtp-Source: ABdhPJzxpyAxlDNrnnejhZ7OYpkTT3mG8ShPKZ2Sy00RC7hJhK1lgIF2Mrq/P3q/EFWqBggzOtA8L5qO4IGg48B4W1c=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr3603170ejb.382.1627303406886; 
 Mon, 26 Jul 2021 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 13:42:45 +0100
Message-ID: <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is intended to resolve #482.
>
> Changes for v2:
>   * Split out length bounding fix to new patch.
>   * Use byte units for sve-default-vector-length.
>   * Support undocumented -1 "maximum".
>   * Add documentation.

I'm going to apply this to target-arm.next with the following
docs tweak squashed into patch 3:

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 4ff36cc83f0..7b97df442aa 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
uses of the properties.
 SVE User-mode Default Vector Length Property
 --------------------------------------------

-For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
+For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
 defined to mirror the Linux kernel parameter file
-`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
-is in units of bytes and must be between 16 and 8192.
+``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
+is in units of bytes and must be between 16 and 8192.
 If not specified, the default vector length is 64.

 If the default length is larger than the maximum vector length enabled
-with `sve<N>` properties, the actual vector length will be reduced.
+with ``sve<N>`` properties, the actual vector length will be reduced.
+
+If this property is set to ``-1`` then the default vector length
+is set to the maximum possible length.

thanks
-- PMM

