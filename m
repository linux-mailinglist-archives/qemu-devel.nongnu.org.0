Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB9390719
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:05:02 +0200 (CEST)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaUH-0002n2-8i
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYmd-0007HO-2i
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:15:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYmb-0003SX-1B
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:15:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id z12so46466781ejw.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z5JZcDfvtO7MIAix2uFXS0AerP7T13u1RvjLFU9PTy4=;
 b=VO/d3ZJfCJ1nXwfk6ez9tttAEPsxDISXCw8F8F6WNfnh5H76J9sQwOxW2TbDyFWXgl
 REIUXNEAjGytvQTOKQOiOFGtS4+HwNSF2yBeyeTrSLk15oQx/DPjEg188mEjVnsz4Ucb
 +NoVdp/Rp2M/qr3RCPklF+klkr9ui2zYakOCst81jq0F3jVWPZy9+x1bk7fbOjIz51ct
 G653NFRpmef5DXxzxUjvxcmTVnIHZrd8DqI12obo2ULQponWJOQO5WgQIw2K/tCYQGWd
 rGg+VWeOWWHvWUOlglZ5+2TFWnuxV1aBh66zzt+rHqRQc7WVfEEtztqrmAqxRGPHrdDj
 U1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z5JZcDfvtO7MIAix2uFXS0AerP7T13u1RvjLFU9PTy4=;
 b=AEhQuyByIbNg/j7+M73Zh59tX8V5ahuwad6SIAmuoP2YwlU9e2tFgwKcLNOTTbAcgt
 IYAsjZbOuJEC+VYd++z6CoSGp4zMBbDVdns5n4tHA/v20mpAKNsB4HVTyDJbcEuQllrg
 N0dd4X/2Fkngr8mOZ+eS/d3DMoOf+lyueNn7HTcXRqk0EIAmAk6jvZvf/GOetblBNShw
 oUVT+Sw9nm0GHRMZ0wLgXUMGqNepz8j93I6QAe9Y+vUSOfqKjapYd5p/J3EbJt7B9XFL
 icMHgf2Isi1u13nuEZSZdh2BkIfvJv07Ntv8i23WRO8Hn9Lc5i0JaoBsUyB0fUwdTzNH
 h/lg==
X-Gm-Message-State: AOAM5305bHEgKLGzajjhOUO3prwvSyqSAfQpjHbK+14CgOPOjVNYJ6IV
 DiFy5Orum7+yL/90odC7wZVQjk6z1NNFK7200Qz4EQ==
X-Google-Smtp-Source: ABdhPJxR0GQvaOu5XCfVdSoE0IJjYzTxeF4ktKQZnmh2AtiRbFsULBZH83Jc72joLEugFMzNAVbv+RyaFNzWkZX9neE=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr29517519ejb.85.1621955746597; 
 Tue, 25 May 2021 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210525112431.22005-1-alex.bennee@linaro.org>
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 16:15:23 +0100
Message-ID: <CAFEAcA_p9Co6CahB2v+NagwuP+sdGz+Xy800A2JAnyqOZce=Jw@mail.gmail.com>
Subject: Re: [PULL 0/7] testing, gdbstub and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 12:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The gprof/gcov passed on retry. I'll continue to look at it but didn't wa=
nt
> to hold up the PR because of it. - Alex
>
> The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a630=
49:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2021-05-24 15:48:08 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-=
250521-1
>
> for you to fetch changes up to bb84bcf61495e9c2907b0659a60beacd2e92e34e:
>
>   plugins/syscall: Added a table-like summary output (2021-05-25 09:24:21=
 +0100)
>
> ----------------------------------------------------------------
> Testing, gdbstub and plugin updates
>
>   - ensure gitlab references master registry
>   - add special rule for hexagon image
>   - clean-up gdbstub's argument handling
>   - fix replay HMP commands to accept long icount
>   - minor re-factor of gdbstub replay handling
>   - update syscall plugin to be more useful
>
> ----------------------------------------------------------------

This fails gitlab CI with a "yaml invalid" error:

https://gitlab.com/qemu-project/qemu/-/pipelines/309137207

-- PMM

