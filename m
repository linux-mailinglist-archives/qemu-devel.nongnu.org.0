Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A576C3348C2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:20:11 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5JS-0003Cd-On
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK5Gx-0002WO-Ld
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:17:35 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK5Gw-0001cu-5b
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:17:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id l12so30100599edt.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Et6g2EknvSpnTHDTUjefAvf0e8/zcWUVVOPwgYez+04=;
 b=Plh7gBYzyYVEBWoL+FEZxa8Mekt1YtHRVZOS2X5hWbNUAhMtXEnp31GPZe0BBDn30K
 V5dqtn8Hgx2Be0o3eNjjCp9Vdn5o5G/8DmQkY94sTDo++QWslJ2aq5GT6SWvNmZYXihM
 OQcMT4ZxoL5pzjVZ745JhBEnR/B+g0HPpXomSJuozgZEpcTyyA4S3qDmD1cV/+tfMQjH
 Fzyul24YIrz/iZkpyx8T21wrmeCajIVhTGoYNCon4zPrDEfTr+XGNF124SCBcrqGDOY3
 EtCcuzW76jFbAG142rlCHKNErqKNZX/dl/R8uFwP6uNg9/vBUafWAO/uAkS/r9B0UKHv
 10Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Et6g2EknvSpnTHDTUjefAvf0e8/zcWUVVOPwgYez+04=;
 b=duhABfOtwGddS1AT+H39KBTVcfwp4T/SQtPENmeNHo4bGci1+dxCAA2Pz4FsIFF4Cq
 5n7jD6+aKrikk1VWAjOhlQ2YvhPZ3bjaEwQkCLMJ3+igVQJb2r4WahrsLOcDdf2sL+dx
 Ia7h/jdDlem9OKil4l7fiyqCZRINtprBQL2fYlCT4mfyNNZLqE/nFdIq1iUWoYfF7U2x
 eA/eF1TlIaZHmbEEz0KKNGQxpdpPc3VwCjZ/d3+9WJhNJxU3NELwrADaQ4H0vCYkqanE
 yTYFtjpth7Al4JgzHVAEw7oSBNxJYKJX+tWme+CGURw5wZlLE77rvE/+aT3kRnWyjJLT
 MsTw==
X-Gm-Message-State: AOAM531LEQuQga6/v7o5hW9j4TfgokFCY057HfQUUQYiNwfm6NsMvSoa
 bT7jtp7sbQOpqKv8j0gBwS1t0bHiFJ3ABbtzrnJjTg==
X-Google-Smtp-Source: ABdhPJwHJ2Zg+fvb3FPqRfPe/TMMnXuW+uxACDaxX8pdRJh8aIPFi071X2vp+7R8/lzh/MfjkBTEdiwsFydaRvjKD/c=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5153090edv.44.1615407452682; 
 Wed, 10 Mar 2021 12:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20210309162041.23124-1-richard.henderson@linaro.org>
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 20:17:14 +0000
Message-ID: <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/78] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 16:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> After a 6-month hiatus, sve2 is back.  This time, with RISU
> testing vs FVP 11.13.36.
>
> Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
> ("target/arm: sve1 fixes")

Are you hoping to squeeze this into 6.0, or can I delay
review of it in favour of for-6.0 stuff ?

thanks
-- PMM

