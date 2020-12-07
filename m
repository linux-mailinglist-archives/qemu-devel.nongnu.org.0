Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D032D1B96
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:04:46 +0100 (CET)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNgb-0001c2-6P
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNdy-0000u3-MY
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:02:02 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNdv-0004Tt-Q5
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:02:02 -0500
Received: by mail-ej1-x641.google.com with SMTP id f23so21551942ejk.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYf5dXOi+6n2x+eqgGoIRs/j2xhLJUFmrfAh97aVgHY=;
 b=aQoFknHFCuYzPnR5PH9O8MrunPPTOzJTC7ZQI94ZVJ/Awr+whHZoscmi4tUlzIP8s/
 15HpM2SFcwxU4bdm/602LF9pyrwpZSPZhgwSV9jf95xng6Ou56TvKoHdEzAN6Z3hnZOU
 QV44I8TNbHPAsiVTiVhRol2Ao+sJIoXxeYTNUTd1WklKR1anBnn4EBkE5re1p7uwYcyk
 zvd8rBF8K2eFSNJl664SZnT0ihECG5SWVSif4Bn9OuXCYPa3Jo44kI6QW/FDcJZqwkHm
 SoxvMPRe9NYjrdi0gRIoejOd7mZoIaAJP0/eeWFAx21p/FFO7M2myHacgwYLQADCG8Lb
 Quig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYf5dXOi+6n2x+eqgGoIRs/j2xhLJUFmrfAh97aVgHY=;
 b=Fxjdm4W/jYyyD/5NV3XwOsy9YzwYLHRF7em2Z+Cw1TUILnCSbubKcaDc2Ptf0zRtXJ
 PiH2jir+XAQh1Eg7cSjMnowABx5jpUKOShjlld3ndTq/AIdqGYoxtPSoxnx5a5nonrIX
 Y4x90eNLqw8K63Q8E+PXD8c4hxYRtG9AtKPhlnn/B1yYMoH59XCIjIQQu+2V8L/D/v21
 1gC8Qt9uJWViGJml9yEenOkenSB8Dnpf5aeszEhvT2t1px7fl+UHyTE1oYNO8jWdAFDO
 NciOs8NN/re10RR9LCyUaksjIodT/rEDNYwbPnCcE1nu0+vzcnLV/ukaHrwOLn0J2cwe
 kMbg==
X-Gm-Message-State: AOAM5333nNubsYprnB2L0Ebg32eoisIzqjE4U6L+w/r5YtJ9DjkN5NjB
 7VF2JeeavV4JTJeURAZu+MhHL0QJFhiVro5kbZg21Q==
X-Google-Smtp-Source: ABdhPJyaXCp3giH6B8N/DhT4JGNfKCG5AZLHGPCk8+CZ28VCvQFXPYH2v3G+hi76dqMNPbJkQ70EeApPzl9uAQa/OEg=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr14225699ejc.85.1607374916346; 
 Mon, 07 Dec 2020 13:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
In-Reply-To: <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 21:01:44 +0000
Message-ID: <CAFEAcA-G-B=y9498aYVc1RdKGEX7tXr-ZbPJCq0VEFPF2a2AcA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 20:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> These are fairly obscure, and it wouldn't surprise me if
> other target archs had picked a different separation of
> concerns between userspace and the kernel such that userspace
> didn't need to manually deliver an exception.

...looking at the target/i386 code, it looks like the
approach taken on that architecture is that userspace just
asks the kernel to take the exception using the KVM_SET_VCPU_EVENTS
ioctl. (For Arm we only use that ioctl to handle SError,
because the information that an SError is pending is a piece
of state that's external to the CPU.)

thanks
-- PMM

