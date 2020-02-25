Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64516BFF1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 12:49:48 +0100 (CET)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Yih-0007Ql-8h
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 06:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YhB-0006EM-Fv
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:48:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YhA-00045U-L8
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:48:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6YhA-0003z1-FN
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:48:12 -0500
Received: by mail-ot1-x341.google.com with SMTP id 77so11801423oty.6
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nXjRV1eP8YLUEXHAEVyS6JQiwlZnO5HH4POdTNI5WCQ=;
 b=dA32RnaGs/9loKLdpGqdTZjszt0ox+I7D3i9I3oeN3WxhoZqsXXadMvPwuXzgN2o59
 zYMA0mSJ58fZivm8bVMo6ffsoY9t/GZZKz5cT7WylkykL9POaqKLh+lAT/EKYQvONgzj
 7lCpGRPoECIuiUKj6kCHGbTbWfAlBtH9ZRSG4eyRbmDpP6qdqGmaorcLduneEy0s2Kvv
 KDtCV3J88ZAjZhSV2rTGatVvLqyMmTzNm32gZEoI5j4XTmaSN0HTk2OVGTTVmlGE4RNm
 M1fZqD7nPAlmCKH/1JIyIlQQjgAOH3VkSvLzbBHNAcPoFTBoIZOyKXIgTgshfKa4Flkr
 ArOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXjRV1eP8YLUEXHAEVyS6JQiwlZnO5HH4POdTNI5WCQ=;
 b=kI+QjOS/o7y30+U0BB0avgSeR9sDKoIulP9pIWbtFTPJzpqyGYqpplIWGE0KT/UBts
 fyOrMrwobyzl9Hx8rmA4Lxgpr74n6SjBxVguZ+ZeQ5p7LhmyzTQeFVJ7qLSELneLTrXf
 49QF5bjge/BYe4rkfNj/0mwhzSqbnbqbudhzDta/7moFdGmuAnSfFAkLrBRGdTFfdoh4
 n8hUF8uYDPMDH5gyTIS6YMVPXd0wLLDUhec7Fp30dHp7nUzpniK1ZzBZDSwm+x9RHXW+
 Wvzy/NjovNJXmCW3owKXS2Lp++CxOOFmchxwDA1hlb20ESCTJUr8qHR+Bcyn0BV1G6+G
 lQXw==
X-Gm-Message-State: APjAAAWA7eqZaw2DotiTL4Bexh1FxjNE9QwnUvPoRcok3ZLQ6qw1x6U3
 +ZpThRgXFUAMHhDmNuyhLXUNm1nDa68NlepMfsBuRA==
X-Google-Smtp-Source: APXvYqz4eoT967j2aRmr6+14RYjTLEvT8JA55cQIBDWOD6D2H3kCn3/Bb7M4BGPH8S6gyZKuxlYhcABo49IZFSswL9Q=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr41350591otq.97.1582631291582; 
 Tue, 25 Feb 2020 03:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-5-richard.henderson@linaro.org>
In-Reply-To: <20200218190958.745-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:48:00 +0000
Message-ID: <CAFEAcA_LN_aqEv1fxyzeUjO=L3=WTuQLmcdqF5BwGK2RhH7xow@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] target/arm: Honor the HCR_EL2.TACR bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Tue, 18 Feb 2020 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to the auxiliary control registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

