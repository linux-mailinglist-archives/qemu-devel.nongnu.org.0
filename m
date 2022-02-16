Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3484D4B8F94
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:43:55 +0100 (CET)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOLJ-0005k6-E6
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKODe-0005qj-Mz
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:35:58 -0500
Received: from [2a00:1450:4864:20::32e] (port=44787
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKODc-0007bJ-NO
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:35:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so2165282wmq.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pI1YGB8wSu84azkZnSco+b6TcQHovQVc5iORs2mQnKo=;
 b=cSHXoIwqwcFkK50h2KGcIRRZ3TrYwy7JMG/1v9gRRYsVp/AeiK2TEIDjuHGEDPMvxp
 U2NssQ5g7gCYTKyyio1nCyGOdA8K6E3SjjbB3Um9YUMP3UBxQ0c1PsbM/QhISG88CvEf
 fYOfJtai4P0I7dvOciNFF8bDkOiGysmqN0YCH7PTAb4Iwep7cnh3SrB3L8SqV4AgkerD
 YPUyj6b+y3dNFQ/m28umGj5Ijs8yTz+h4E4dAZo4HgwErRfUkpBXZZim9PNOrqg9SSYT
 GzDrhTNrq3jOn3BhLgc+icChOsoP0v3jPAgfOUZXAPmDlfhZ94O45ah99iZGvETLr2RB
 gcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pI1YGB8wSu84azkZnSco+b6TcQHovQVc5iORs2mQnKo=;
 b=pQR8mFpI+KkQA5wUgZQC4jjYvfh7V45ao0l1igaG1DHDAb3DIqHE116J3usJFKHPn0
 hQCsSKtsWTxf9ePyOcq7zeavneZuwwLyo26MDliH7l0WQRht3m4Npnmt2cj3ablEzp5r
 mQxNKtu/e1FVlmChqDbwQgxohfLoiypJROliKE1c8i7RDMmG/XCbHF/QkbANVUwDkIi6
 hVB7QmGlowFynPb4gqwyiGQJdFKNeEAyXIGosF0Elf2EvCFNEeqIXAFcEP98YQ3zv16K
 mBZLOwVlQpImdAUuTAfJATi+pNK5LIAxQDXC1fmSs7p4Cs1QQ9JlrTAUetiB8n3lOfdn
 UeAQ==
X-Gm-Message-State: AOAM530Kj2IiFTScQtY7PeiLJ1Wxn3nWCIU6FpdJx/AjnXnhbjRXesKr
 ZQtQH3D4x/xJwVw4DBnjLF/yomHhBiyNfbS99yjQpg==
X-Google-Smtp-Source: ABdhPJyT001D1xn60jaZRdry9hxkrE1QX+LygYy3g7kb8u1hh6wn3YsuHq3jDdu+zycQw+U9TvgL9IPyvbPfbPD4Kvg=
X-Received: by 2002:a1c:a514:0:b0:37b:b7c8:6091 with SMTP id
 o20-20020a1ca514000000b0037bb7c86091mr2597537wme.133.1645032955331; Wed, 16
 Feb 2022 09:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20220209124135.69183-1-agraf@csgraf.de>
In-Reply-To: <20220209124135.69183-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:35:44 +0000
Message-ID: <CAFEAcA8qM=4mmMw1yTNnmhtGM=GbcNQ6874Z8CkErA1=jJOiLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hvf: arm: Use macros for sysreg shift/masking
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 12:41, Alexander Graf <agraf@csgraf.de> wrote:
>
> We are parsing the syndrome field for sysregs in multiple places across
> the hvf code, but repeat shift/mask operations with hard coded constants
> every time. This is an error prone approach and makes it harder to reason
> about the correctness of these operations.
>
> Let's introduce macros that allow us to unify the constants used as well
> as create new helpers to extract fields from the sysreg value.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Applied this and patch 2/2 to target-arm.next, thanks.

(If you can send multi-patch sets with a cover letter that helps the
automated tools, by the way.)

-- PMM

