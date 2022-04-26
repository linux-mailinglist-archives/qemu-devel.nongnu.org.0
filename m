Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A068750F9EB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:13:06 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIBt-0001qm-N7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHnL-000077-2m
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:47:47 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHnJ-0000aT-JR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:47:42 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r189so31928025ybr.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbAp+wa7wdKRANmxA6FVZGbJxk+Z/7xmmDdEPzlE9WQ=;
 b=xPS42D2pD0+1dDR48MSZLzE+g+kwU21Y3fWFFMpBY/iIysduGtSM/zlz1HesPt5kNJ
 Q7/8rv2WLp8H10UyNp/vy5oHcc9dYXJxmhOueLxfSEaoImyoAlrEeUZuZmV5UoxVPQBr
 Ex04fRY5tfAB/4FgyB26OIMUUwlNixq5gIPlj/xLw8H7zsXhbdv31O0tFjabTF3TSori
 lr0Mq/NomqJZdYQm9LyNXm39W8yTlgrWNBDXOQFvBetnnD46yprcG9u6LQcKJcN+icfB
 TyIy02Cyd+O6rc37yR3BvNMs/CD5dRm+A0HRrPftZVGtdVF0wAmBHfH6CghDCONit9kv
 7coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbAp+wa7wdKRANmxA6FVZGbJxk+Z/7xmmDdEPzlE9WQ=;
 b=hpX+wPicnxzRRxcaHE5m/cEHc6Z3d+QIZZFTZhAg3jHHGtQ1iGIk1v3DWZEtIbjbuY
 9u4VNCPP2ywdcSq06vmWMsdxH7IJbAYFfWf6Ri0iIC0fvDSGHleB1jlY5pfJTVzIbsQp
 oz3xbwKThJkfFZsnFfy0fmblchCHx4Ep7bU/uqgHdxf9r9m83YFa0gMmEnCnikRDag8l
 zwULi5zlEtghLGfiUu98/QHWhWSVzydAYSoMb3UcRaUow8jqhdoc85IWZ4nHkzvBKoHL
 c0DFCF3AyJKDhSsKlDzE7KHtETnjPcR7zfGegZZxyyc6n+dHGjdG7AbQGQxosYTEDUpe
 dByA==
X-Gm-Message-State: AOAM530s0a8hTbq2Aips+pOcJaV+HpLnk5TmBlvK2o/VE2revbuhbWhR
 XTfsnL0j+k66vF/hl6RVbP+9ixSryp8dh17WCoLK5g==
X-Google-Smtp-Source: ABdhPJx9an/SHOw/ilJJM2EIiStDVJ6BqlUC72uZCTEoJfURFr1Tt1z217mASSp55zZ3isvREZzfFI4xnD6vhscd/IU=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr19254647ybg.140.1650966459414; Tue, 26
 Apr 2022 02:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-46-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:47:28 +0100
Message-ID: <CAFEAcA8S9qbSUmb6657jUZkEUb0nfBTk756hi7CWtdS7+LCmRQ@mail.gmail.com>
Subject: Re: [PATCH v8 45/68] target/nios2: Split out helpers for
 gen_i_math_logic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 18:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do as little work as possible within the macro.
> Split out helper functions and pass in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

