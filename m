Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BF30ACAD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:32:47 +0100 (CET)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c86-00083P-01
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6c3L-0003z3-Ly
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:51 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6c3J-0000SQ-OU
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id s3so5857862edi.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=daR6K0UAERpI2lt89pqn4jY+qW2P11sy59B8YbsEwz0=;
 b=CDK7KzcJF/UfOJSOBP8b2eWKzlZqoFMQK8xzwFuSKXChhUEGzbMwiS6xbDUXy2k9XZ
 XgtP56WUm7Bp2f5z88z5H9NG7WVen/+okD5gl8z36VC8vLZ69A2csV3JbvbpWd95cQW2
 3hEVNOvD2imBLOsLsZxpngY5QNA3ZNAIyp8oFr+84+FNF5Z+Yguzeh4kfGz6GrEPoWIz
 mV5Y1Iw+WimJLgruI+izVG9Hskput7OhLv8zfAZjeujhetk8NhQaO6ZNbLtqyVa3NEHC
 nSBe4krFR7JCN6q7+xXL8LFN++/tK+1IOZgtGWR0fZ0lEKlK4YWTn9S825RRhNTRtj5B
 lzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=daR6K0UAERpI2lt89pqn4jY+qW2P11sy59B8YbsEwz0=;
 b=ZZ5el/QERWrvWYHT4XXYZyji2ZgjlahFzljgKDMzk6NysnLSZMeu+WjmpvScd0jQ7a
 owVspKBQWKQx45Aj6KB8BKQjNgZyT5sYY7EfNYTzOIa4/hyXCBBNzvuh5UMTG+OA+QUh
 AQiDW/xfFiu3Z/nQo/udyA36UxFoT1NTzl0BQUAdID6808Uu80/Dx1kRiFr7ACZLIHF2
 WnstVxQSD+QTzf3muNugsAAskY0iiWZFPQpSUmZGHUeRqaVANoWWyT9sx6PYIIv7BK8L
 2IvaqiuzEUMtqKlt+6NRjx7CZMOpYdhmGnzfmoBJ2bK7EgoK5jFGFF8fe0iXIbIaEklE
 4gHg==
X-Gm-Message-State: AOAM532WyBFeXOzb+Ztwzuyr4BbnmLwy5m0C0GtSmFj2Q9vMaa0hvEH1
 1+96cUpm8/cwNZ5BLgDTJbPxSYrUk5x1XO0pa+T8Lw==
X-Google-Smtp-Source: ABdhPJyyuRKD04/MS7g+8J2hmW5iTdTilfTOfUBkf1/tsWGFyqrd35+sXMAiDLBp7c5k/FUf4VFCwlRMDne3r1RJSvY=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr19601734edv.36.1612196868122; 
 Mon, 01 Feb 2021 08:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20210201150021.53398-1-pbonzini@redhat.com>
In-Reply-To: <20210201150021.53398-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 16:27:36 +0000
Message-ID: <CAFEAcA-YqUeePiaaiCDSRw517ik_ZvQvuBReH2V44neYeBXaag@mail.gmail.com>
Subject: Re: [PULL v2 00/38] Misc patches (buildsys, i386,
 fuzzing) for 2021-01-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Mon, 1 Feb 2021 at 15:05, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 0bcd12fb1513bad44f05f2d3a8eef2a99b3077=
b6:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2021-01-28 12:30:30 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to e2c7c4a3f5ce0e2e529fb50e56017572c221182b:
>
>   pc-bios/descriptors: fix paths in json files (2021-02-01 13:05:51 +0100=
)
>
> ----------------------------------------------------------------
> * Fuzzing improvements (Qiuhao, Alexander)
> * i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
> * slirp update (Marc-Andr=C3=A9)
> * initial attempt at fixing event_notifier emulation (Maxim)
> * i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
> * meson: RBD test fixes (myself)
> * meson: TCI warnings (Philippe)
> * Leaner build for --disable-guest-agent, --disable-system and
>   --disable-tools (Philippe, Stefan)
> * --enable-tcg-interpreter fix (Richard)
> * i386: SVM feature bits (Wei)
> * HVF bugfix (Alex)
> * KVM bugfix (Thomas)
>
> ----------------------------------------------------------------

Conflict in configure. The fix is trivial but git seems to do weird
stuff with the submodule changes which get in the way of just
resolving the conflict in the merge conflict. Can you rebase and
resend, please?

thanks
-- PMM

