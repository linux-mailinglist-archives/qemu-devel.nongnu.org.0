Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3944CA272
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:47:13 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMVj-0005Wn-SH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPMUO-0004SE-8w
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:45:49 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=39765
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPMUK-0000N6-3Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:45:47 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id x200so2440025ybe.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jM/P+gROu2GSblY74Ee3qQGwJnBvDgN3lpECWe/3eYs=;
 b=h50Y4GTbU8XgWBlz52V0U51RfdIraiU7m3ExgADADLO8EQASL7B4meWkcMlvn4Pd1U
 Vil63bDcfj9RoozNPoeW5RYrM1/LdtRtyGvW9J7MTqQsVCIp4qSGYh2E2xif/w5QJauA
 epoBFHKrVq9jMPFSGbFFRuJADqxiGmppraigyujlKeX88uYXRAzWwejeTun5XSgx9pkj
 F5Pj53O3642TrmSCjpsaZ7Rgw/OBmf1IwZjvxRJz9HszyE9q1Qgpb9tt2s4rUyJ7z/C0
 l6QVJNmBZeGOp4tB5IR24Kx9N0fJecNmMVX0Re2Wi8iQb9PBm3Dqt3Qdn2fFivB/Ti2I
 2c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jM/P+gROu2GSblY74Ee3qQGwJnBvDgN3lpECWe/3eYs=;
 b=Yf4LQlxPqraRpBCTXl6ifLVFbWatnJA3OPQjq7w423qom7EhC6dpkimqPFIEuxt68L
 s8585x9Po16roDF6i/6twvgVddpGXVL3ha3qo87SREp3wOWycR0RecxaWvQwjGKZhG1n
 44PiO2gdthyVC/TWjO6QyUp+qAandruUhKVHL4NCRmEdb6W1H7emZpsKpl4o/eaI7CFH
 eVz0XTq2wcuz+uez+Kvz3rM/BJhcvTMkhQSl1p9eIHmKkupPLXVgQas9XB9A/D/SEwH0
 iCL8WASQ/Hkw9JnMM1xEf5tnp6RRsq5l+5+eIWrnw/OIBMvvcw6jZapGOIxomazNXJVY
 CWNg==
X-Gm-Message-State: AOAM53138sHblj0DnUVU6aM9TWmo6L5QJq8/D0LzBC+F2yyTwI8IfVWd
 PQ7IZusJGxLYV3fQcye1IWLk7WbUZVYHAt+KqzXKMQ==
X-Google-Smtp-Source: ABdhPJyg4Anm1e7xG6mVa78WOHAtkfZ8aYAKENI6yef4Yjy1QDz2clSKgEBXBjn1oW1LZp9Qj/b8ibdpm8uDNdRNo74=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr1199057ybo.67.1646217942368; Wed, 02 Mar
 2022 02:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20220228181214.2602-1-imp@bsdimp.com>
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 10:45:31 +0000
Message-ID: <CAFEAcA_P=vXa_AHUOK9TXS0kgZx=En94JTHvButjO+Ayh_fsaQ@mail.gmail.com>
Subject: Re: [PULL 00/16] Bsd user preen 2022q1 patches
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 def@freebsd.org, jrtc27@freebsd.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 18:11, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:bsdimp/qemu.git tags/bsd-user-preen-2022q1-pull-request
>
> for you to fetch changes up to a5b8816636ebd7665d96122c5568192e04c5a888:
>
>   bsd-user: Add safe system call macros (2022-02-26 21:05:21 -0700)
>
> ----------------------------------------------------------------
> bsd-user: Prepare for future upstream of system calls.
>
> This series of patches does three things.
>
> First, it starts to give up on the idea that you can run FooBSD binaries on
> BarBSD. They are too different to make that happen any time soon, though I've
> kept the support for Net/OpenBSD, even though they haven't built. We'll need a
> lot of work to make that happen, though, and I need to simplify to get things
> upstream.
>
> Second, it starts to move some of the ifdef trees into target.h.
>
> Third, it starts to upstream bsd-file.h, but the remainder of the file in the
> bsd-user fork had some issues that will be resolved before next quarter's
> update.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

