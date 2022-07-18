Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE296578127
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:44:58 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPBJ-0004Wj-UU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP7Z-0007l0-TK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:41:06 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP7Y-0003uu-9q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:41:05 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31e1ecea074so27005477b3.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WoldH7qPBX/tCpCzWPmMhnJi44dF0bCbVICIRiNJS9A=;
 b=znSRYzgYAF7AymlDLPfvGpxTfx9881DR4vivHwfbX6ldBDNAmBw91ExJBcYtqr19h2
 d89twRfS3H1a+67U2XzvQLoQBkP4DCd7mHHmTd7pBUNNTXj3wb0GcEMLIClYEXjIwLy0
 2G373G/1wpOfjPph/UKbkWDEXOrJmkvU1x0hiYOBz2jIfGAaFijXjURXQbwW1mYStbKf
 oTOI5ccFhmHqAnK3BWUh9B6w+X/gV7C7Owsm+hviohSDaiLZc5P+X1B0WVCeoirQfunI
 o/SxnMWlpRm7FySLdDsK3NiEkmyR4FwBaHQEzJr/dAZaITL65BTH8Uktj/nnXNUJLEcT
 V5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WoldH7qPBX/tCpCzWPmMhnJi44dF0bCbVICIRiNJS9A=;
 b=qNrwdbz7uWLWWtXnpuFCN4PAGJ3EPImvmdWuphbW05behvxhpoBiaoXIMKiXjjwm+o
 Bs7N0LKvdBfh7qLpGtim71iNrbbOk4PIvac2kNDcRwWWk0fe8uCNsTHflOD46/eOuSXt
 RevgdLBVQ5vovz6yZ/A4a/aOTDKoMVavDpPjx0Gmx8mqi+n4rytx9sACKYZ22y8dMaGF
 WXH7Mq3D8L9pBzC3Gh+B7iUiXt7hShw+hxgjb5zPNj5y80eDpYT8lW4ul3QyWZbOfrpx
 RNF/jRj22sdXzj+WNJwkIxxRhF48S1BeCN2tuj5PUgvULoc8FTLOAT2OvPWceQWG+4ur
 delA==
X-Gm-Message-State: AJIora+cKino2QB4Xdl85HegsV9OLEyARXcI4wqxdx1CA584MSP0pcqL
 pfBnW7Zy3KC3EcbW10FpsIUWPVGgioxoroYqMEdbGQ==
X-Google-Smtp-Source: AGRyM1tEwtAXcOAjhYiI6IwfaKkhBoS8jtf3L8Sw7KLawuEzVRmSQRA8kcOrGiPkvYsu4zlyTTrbqOGdN44KmnijC/A=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr29762027ywg.469.1658144463201; Mon, 18
 Jul 2022 04:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-21-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:40:52 +0100
Message-ID: <CAFEAcA_EquVC8PWCSDbH_WMX7vKXu0MKpoh+7dv+D2=RTYcTfg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 20/29] aarch64: Reorg sve reginfo to save space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jul 2022 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the signal frame by storing all of the registers
> as a lump.  Use the signal macros to pull out the values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  risu_reginfo_aarch64.h |  45 ++++++-----
>  risu_reginfo_aarch64.c | 171 ++++++++++++++++++++---------------------
>  2 files changed, 108 insertions(+), 108 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

