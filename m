Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C9563265
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 13:19:32 +0200 (CEST)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7EgN-0002iA-0T
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 07:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EZH-0006GG-H6
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:12:11 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EZE-0007yn-56
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 07:12:11 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d5so3467394yba.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7Nc/ob3uzg9z3PYFM8pGtwVQITXLNSXt/fdwKejvrI=;
 b=smZhzr0djX4YdwyLga4agJopjVmmEmMoCweVUuuaU5xQA5tOW3p193jTLzqcJyOBy2
 ud3BUOXz5XEhWDmYhjf0KhnlwV23UmU5E1r3oeHPr+PG+5Y+eWwa3V3Zic1oqLDBTuwB
 U4usfdfSsRq/nPutrZ3g6WLhCn4U6/NTGPx+Jw3TpTTMC0EdNMkUIv3A3S2mYbaSMWNY
 OgcWMm62QeFcTNLYU0eC6VDSrfI8XHkBHnZeI+mtjdqJlLBREGBtRKqRxko0F03SpCF2
 L+yE0o0sLTMvanJGNmWXvpwiVFq3axYLFNpSqpuvIJnegbbd9UvTl+5O/AS5minPlgr6
 vSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7Nc/ob3uzg9z3PYFM8pGtwVQITXLNSXt/fdwKejvrI=;
 b=nIwWEcskP8ady/+CrhRZj123gLUytz2TZwRiVslfn+ABgTkKxhigdO6GE0ibNObg5b
 DaLzxc+1APhg2a5u31Sx00ZjQaKppc6doGMMdQsna8qWqTEkNdue0cQJ9QkhfF6MALU0
 iR3TiCKJX/JvX930eBX2cZVYyVNHEMPBV4JsGmedyGwNZQl741PPwNMMI0kLpcH7QrtF
 6+34fzlvq+YzlFKpg113wiI55Ao47DUHrtdfzE7kBvU6VcIHa328oJuqJCDjeavSgTmk
 t0psJK8UWoVN6+7L7EHRBYOQMLaW6qRNQQrL6pgVgfNYyhPvxLQpGiOh3Eof5oPtoEyp
 8eTQ==
X-Gm-Message-State: AJIora9vSWETsjOgT+8A9SpptqiocJdcdTbyEftocgEcQyJRZIYl/02u
 PDbelnSX2y3UzKYeaE2y0fP5fzooeKCMDMJs2kWL7A==
X-Google-Smtp-Source: AGRyM1v2IYcbjRVDeP0c9M8ALDQlE8RRlSSHdW/EIvUUnw6USG8QtPjn0WwgcTGWO729k/TPaN7QfTXjBOYLikVdde8=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr16245325ybg.193.1656673927047; Fri, 01
 Jul 2022 04:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-5-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 12:11:29 +0100
Message-ID: <CAFEAcA9dMwOzU93ppao9YoHVY5jtYuqbUx04OtHAMjk0moSrQg@mail.gmail.com>
Subject: Re: [PATCH v4 04/45] target/arm: Mark ADR as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 28 Jun 2022 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark ADR as a non-streaming instruction, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Removing entries from sme-fa64.decode is an easy way to see
> what remains to be done.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Yes, this is a nice way to do it and easy to review.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

