Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF4374394
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:44:17 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLZI-0004gl-CO
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLU8-0003NN-Gb
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:38:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLU2-0002LK-I7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:38:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id f24so4130951ejc.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pj2AYyiSCZQYjZyQjKAfF4g8SHFCLO5vLVe4udmq9Ps=;
 b=LfWGWBe+9ctlqWDs2BKdQtwxFFmmZWBwjlZ8mpqg0Kb0jmctwWp0+9uSu6K9rcgzpc
 K8rTl1uOTcqNviMiJbQKNTRp5VWbIkN2cjfc3cP7Xq8sWVpL9uuC7s9zMWlY4zDTRjKz
 SuQ0bgL1bVBjh7fhCQeWBntVDh9m2Hq9EgAeQmllWFxdvc9PDA0Fx0eC29pd88OS6Ijt
 Tz4+Hta1eAAaznkPP2nyu5GWgJ/E+nbXc+63RtvDCFVkM8CQtHF4Kb+K3T5IqfWDCaGI
 yLVJRz4eLwat6iOMkRGKV9T4W4IUGP8spFHMSF6L5rbKSgX0kQAUqMGhU7Glv+xy2Np6
 rlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pj2AYyiSCZQYjZyQjKAfF4g8SHFCLO5vLVe4udmq9Ps=;
 b=U61N1qLUMQhCotSkKHQ8vIRru8xA6puDJGixnsfBmORWdgftrwHFXzDGC8xRvrpvR3
 qKFe+oDWS7oxmsB/vc5exAlWycUJioueLF/dMxwldsY/Dg6PkV7ZJfdG5S7WPl5QRdgg
 cXR2D2usvYXYK8VFfrn9iE9zjberq/k7WSI+Am3FQtkqfedIveyMId/z+hVUw/5r5oWF
 uk8okh2XtpftJbyYD9XdlAofkHbZViP/Xcxa7fe1tqpNDXkUpST6W1KNr0zgmxyFsPWZ
 sLK7u3/KyJ6lGghDcqMekX4b0YVBgjp1IddtWzgNxk8Yooj1jVl6K6XtzkTn4a4kD0im
 oaCg==
X-Gm-Message-State: AOAM533Dnb/GM9M70TO7RwfBzBjGGvzeGrGIJVBGOjkjoLQMbMzvbTrl
 4m9i/ky6NcZpxismKHtFLYBquBAyBZYFmOwfUewIBA==
X-Google-Smtp-Source: ABdhPJxZKNxvqbIs5pnHlN/IOLTQp3uPcMeXRJeV0YNvSD4o7m4Qj2sO6QIWwJcg+sDOtBFw4KubQqRFP73KJCIl4AU=
X-Received: by 2002:a17:906:3115:: with SMTP id
 21mr21871790ejx.482.1620236328383; 
 Wed, 05 May 2021 10:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210503083623.139700-1-laurent@vivier.eu>
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 18:37:41 +0100
Message-ID: <CAFEAcA-0ixPa9RojrqumN_gUyiu3awWjpkCRV3+MWuj0Q0PweQ@mail.gmail.com>
Subject: Re: [PULL 00/23] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 09:41, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to 9197b5d4b5f163455c891baec531ae73f5d3a73a:
>
>   hw/rx/rx-gdbsim: Do not accept invalid memory size (2021-05-03 10:07:41 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210503
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

