Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97295BEA64
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:41:00 +0200 (CEST)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafMp-0001HJ-28
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacsk-0002Uz-1e
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:01:48 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacsi-0007nR-2R
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:01:45 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f20so3711120edf.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=smtrdcX9QfdZ22oB+N77L2hzWIKbPV2nSxZiwXrImcQ=;
 b=vLvJmDRLGdhzm1awkpl6hfctBhwdMC5uPbq/SwlNr7XDJERZ70sGpk0R4DTJAQCOoq
 J+4iGOLO+FYQV42HLj9EVQkHe2hzTOduPCC4MPpIyok90tJjw6FNRgJSyI8iso3MihT7
 JNR07xi/E4DC1FXyi9YMl4hn0gE7lNoagZRf74oJRVa7oPOe2YoDrE2HrJC47QwfczP8
 n9+NPQ9cCQDCYKMvpEg3QN8UhvMJz/fAT+ilaq1YZmZtvfH/tzyuQtA88hB+EoJQQ7hr
 +xRT4e3y+GyATVtjH+DF8M9TCSRJZ/EIoqXAorT8bFhdNQDxI8adUivP5NsB469IyeeN
 DAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=smtrdcX9QfdZ22oB+N77L2hzWIKbPV2nSxZiwXrImcQ=;
 b=3sDo7kTiueVd9qpvarIHb/LRrTxtVKM2PplcRAeI1jfZ2svgzgaJh9Gp6xedBRN9KN
 i5d8QEXgqk8Hn5c/aBfMmWLv6yMUbOfNcUlacUZKXswMnlnc9vdzgIDQHQ1wLJ4etc6D
 XRxvPjwL3K3Fvzsqj1BtMsw9ZWHyLT0/hSauPIjXqhsWGeV19BpcnjnQDBaqkHUCQ13c
 kVBGMTwRKsiKGHk7LqvpqGDc/j+158+S8aG5ul3avy2C9bj9cFofnJ8YHOPXnU5snGgN
 hWZVJrwfH4QOwVB4kZ8YMZt6//+c+n9t9IvKslvpsFpA65/rGBa9Od/DfR70fkeCG2Lz
 xDPQ==
X-Gm-Message-State: ACrzQf2XnWC9xy8LrQ2uwlQzUQKQDc5P5/oSm6hi76owNXLdGdp7KX/f
 DijI9akAfF4XCHVKktFZZw0ZLolk6Mf+fFhSdkJYeg==
X-Google-Smtp-Source: AMsMyM60HHSlAtpHHPRygwHWUb36H/HcLQoerKjQqRWE73+NxtLQLHgzeZZwWKRC8VecrJtcaLAxcgc+xN8KlIG+dcE=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr20012170ede.375.1663678901523; Tue, 20
 Sep 2022 06:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220914132308.118495-1-richard.henderson@linaro.org>
 <YyYqnE1PeKmyX/cA@fedora>
In-Reply-To: <YyYqnE1PeKmyX/cA@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 14:01:29 +0100
Message-ID: <CAFEAcA_=52f-rgC85ZNvkWOTa8ci5G0yRUnBoNL8WRBU+rPTcg@mail.gmail.com>
Subject: Re: [PULL 00/11] semihosting patch queue
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 17 Sept 2022 at 21:20, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

I have updated the changelog with a note in the 'incompatible changes'
section to let users know in what case they might need to update their
command lines.

thanks
-- PMM

