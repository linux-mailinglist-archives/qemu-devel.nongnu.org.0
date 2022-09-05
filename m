Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B75ADADC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:24:09 +0200 (CEST)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJZg-00086X-MX
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJXo-0005p9-IM
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:22:12 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJXj-0004aa-Jk
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:22:12 -0400
Received: by mail-yb1-xb31.google.com with SMTP id a67so2572907ybb.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=26J77l4SBSUdSTyvRH+nMy4qbRnLRWPLgA9WqHDgiSQ=;
 b=TE6FKFBRkYlNfmQ1t6Fi9KRGmGl0mHInB8zFR8P7DhvhufwSaXKNn3DAKxADWz8an6
 EEleQiaWO31IFn/tte1lxjwPTp7eB32akqB4cmpEjT5Bkwn74vdJ+MlXWNzAaas06Aau
 ui64vdbetWn1YBIcLomQl7tI+fKE4/dRfr3wsf1MQjRvvZctxVj3DupRB7MWCAIguTTw
 4y4qyol3cu0ZLMRzE8G95edFcSGk6Gseq8sd+dMH8G/0C0eL3+uVVA8raw5B/8Vc06oJ
 i7B/VkkNOoijYCyz2t3niGQPvkdi7m1s5dvSxj+vo5ioamG8tMovcDHaiTjpX1xuY6x5
 4OlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=26J77l4SBSUdSTyvRH+nMy4qbRnLRWPLgA9WqHDgiSQ=;
 b=zFkk+HWlkS86LcU1URyeu/eeFlaK8JfNRrLUBHPZyauBf9pN1klMgr4fyAoqjYSh/9
 j2X6NbLpwrg6BMWBsHwkXRW8EeBSN6SpL7PYrCKkbNcplgbUV2YBzl6GRxv8/5f+mbhI
 pktlE8H8mFJlqqpRkdEvEt8r9jyrtGsbkBzoLWnM4/nOF0S/oeKpN3iVNeLt5S4CbWPZ
 ysybCsIXqkYeTVPzGQGM4on8R0QDXXHbFTyzQbBiCGeGAey0rGycWivHp3IVxPKwbLQ3
 IIjMjWOL2uEffHuf20+HKmADptCdGW7DL04zLbDz1S2Nnu/Maqx/3vyUkH0oyqW13DYr
 Ez/g==
X-Gm-Message-State: ACgBeo3TGkjHjEKqYYEMPopnXflZfqf76HX43xDy3Z/LqJr6N+BgY2hL
 uVT3LO+UYwnjk9J7/mb4Sw+MN4hx4FET9w3Kz4bjoQ==
X-Google-Smtp-Source: AA6agR4Gyh62E75/1VxjFicfLzQ5DiVUPHEFR69KpJkWrIXx8bLoB9l2yeCWiu4+ul/0GE2Uomg10XnOjlfEUOgQ7qg=
X-Received: by 2002:a25:c07:0:b0:6a9:3eb:ef4e with SMTP id
 7-20020a250c07000000b006a903ebef4emr6550766ybm.85.1662412926487; 
 Mon, 05 Sep 2022 14:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
In-Reply-To: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2022 22:21:55 +0100
Message-ID: <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
Subject: Re: sphinx-build is really slow, any way to improve that?
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
> when I build qemu, there is a lot of time spent at the end of the build where one cpu goes 100% on sphinx-build.
>
> Is there some way to parallelize that? It seems it is the current bottleneck for rebuilds for me..

It's a big fat python program, so I suspect not, but
maybe I'm wrong.

You can always configure --disable-docs if you don't care
about the docs and want to make builds faster.

thanks
-- PMM

