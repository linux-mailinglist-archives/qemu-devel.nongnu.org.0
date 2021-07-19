Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541B3CD4AB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:23:02 +0200 (CEST)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SIX-0000MW-Eh
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SGa-0006dC-IE
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:21:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SGW-0007zd-Sm
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:20:59 -0400
Received: by mail-ej1-x629.google.com with SMTP id go30so28344794ejc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cvN8oX+XTEQJSJbkKADD6k+g585sMEYsQ7TJqBBXfcw=;
 b=YDwptl/RYwK7lJbrl+8IMUaRKpTrWHSvxSPgs5BSsFBYnkfqGO8UlHUPYX/vEyWJKL
 Q72vlnrHgopaz7OldbzOEDgJaEYPhdJRk4x2Nk2J/nBnni5CgZdBknbz37Iwvd6YuGcQ
 Rirp80r59xyUTOSdL5MIjv5maZpkgzMAcmMmr9Mmn7uETwC3VE5Z0Nb976wDRrNwt4Yt
 6bXLTopNpuZ18REEzBjzDDb9r2aJHGJ9P92JYBDIunwHRiKljGdB6iWnOS06bjxgs9nK
 OIsNRdi/+FlNu23vWoklNTabpJDOOn9Au8L6YgaxIjyiaIiY/05s/80ksXsjcPZY4m4T
 X74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cvN8oX+XTEQJSJbkKADD6k+g585sMEYsQ7TJqBBXfcw=;
 b=mdL+hsPCABotIN8Xo8zqF56BC4Z9R2e970PALskCxr+3iEYZSNl4/bLhOPFBgxptt2
 TIenMHHpmQW7PXm2IwedMcojBT36+lC/1yJRT8cpE6QtIaa+N6jeEpZk5coUD3rsNuS7
 Afl82mp5AFE1h6no+v1jqfa34GPxD1vHuvFsECwSw/mFaYn0qZZpd4874wB8ZmNANsrm
 9HwCNyU8f92aTcSwqqrU4kLt0CmwmEfwYHMNeuKWHBdlZIZlKsLvffyLuBcg+av0GQUv
 TCXjyhO8IxxBWQwziNoCZaZQZtoQbPzLbR2kK0TfLCwfM5dCQuET6+h77O1H74x4zRfZ
 /wbg==
X-Gm-Message-State: AOAM531tXol2CigLr8UfrPHiEtxsIc840QS7ZjFqMll+OYXTAzKOLm9g
 EP+6q5LgeiFsq8Dzom3Buap5igPthQeEFs2o5V8X8Q==
X-Google-Smtp-Source: ABdhPJx+iNiV98/i59uHVBrvKDEDWV3TJD/yjomXbqWUqrhE2ds9q7FYdYDDDvZS+J8x6HM5tqOITCSpHY2CrgSyIjU=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr27488288ejd.250.1626697255611; 
 Mon, 19 Jul 2021 05:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-8-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:20:15 +0100
Message-ID: <CAFEAcA8S0HaC5fTfYC4mPwmeFk3URSY5RJUnx0vubS5jSR6q8g@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] accel/tcg: Remove ATOMIC_MMU_DECLS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All definitions are now empty.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

