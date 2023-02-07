Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B968DB8F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP0r-0000Nr-4Q; Tue, 07 Feb 2023 09:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP0o-0000NQ-Gr
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:31:59 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP0m-0007lS-Tp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:31:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so18777161pjd.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XyuUJQWcyA317robqzqS8Jqa83mjxA021KAvB6HguNM=;
 b=reu1gXvOW6QvQ9/sk10t5Z20Jviv/XUQKVQUp+tb+CGvgko9vDuTJNj07nCZrbbh5F
 2smBOdnzUjCs47C+SpT00NgU+MYXBi0s6ohRlmC/XXLzFNcm4hWQfAX9XJIk1HHZYpif
 zEJSEQjgStHEaBJ6PV670L694GOQC6JFGL0d4MpBkEsqowQyITzjgALZov6Tpllb+kmT
 yjlL74h5rpUD9CMzacFUFv+VA5Vscs2xZ1XlZlg0YyOCigm+srMoROehKbqCycXyNb9/
 AveBFcY4e8vahHvqfma8FeCuc1zctYZ6a6DKauMaF4Q5wjYrQcow3ac/Q/0/OMoCWKah
 4D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XyuUJQWcyA317robqzqS8Jqa83mjxA021KAvB6HguNM=;
 b=M80lkuDRhWK0cGjdxltaDzWhZFE7oMbumYTTcqGI/4p8HSS2Xm4bpO0YE1MGW26ImO
 gFXBmc5WawELw3NA9jP3BTTOn2c4Up+eX+YDOPhKiQtHNS2XTEJ8krFVZvF7r52U4uKj
 KAJ1s45OeGyuy23tmDPacBG8/dvKouphO+SYbLyYI4ZZBLVGQxJB/ceoOfWWObZuLT5U
 1329RiTCuJ2yaHznAC5npxNys9Mhs0jmlb8g4OahvUMltIWQQ1yrZJfOAu63VldL33E0
 1UAJ/WsafuHt8m7inz4wvi37OpfhB+WoNM0CbtwKA4li7L1f125/KkZhHP7eu1r0GQ8W
 FS5g==
X-Gm-Message-State: AO0yUKXBGdhcydNzXUExf60b6EQvJIxj0eWUIS7PBg4uaarQrybKrnKM
 ssMbBuS0F8T16s0+1m5M2kxCRxgvSJIHqVkmSRRX0Q==
X-Google-Smtp-Source: AK7set+HIoa10PqjHr7G/wI25PEHCyRBewVziT4ssQvoUZHwgXqOPMkqD6PP2mS0p88Mnn2/DRw0eAYHkIHaRH1JDzM=
X-Received: by 2002:a17:902:dac3:b0:199:f31:49fc with SMTP id
 q3-20020a170902dac300b001990f3149fcmr847810plx.9.1675780314930; Tue, 07 Feb
 2023 06:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-4-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:31:43 +0000
Message-ID: <CAFEAcA-01NKKQ511YcTwvjbLiBRe4d_V0-Tn3rw3D4CRxnsvTQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] target/arm: Add isar_feature_aa64_rme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the missing field for ID_AA64PFR0, and the predicate.
> Disable it if EL3 is forced off by the board or command-line.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

