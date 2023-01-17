Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6E66E2B4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:48:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoBq-0003mf-Vb; Tue, 17 Jan 2023 10:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoBo-0003mW-2d
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:47:56 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoBj-00083h-Lg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:47:55 -0500
Received: by mail-pg1-x530.google.com with SMTP id e10so22260306pgc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZUSGwXw7DwFHW/Y0AOu0ewlvQ176iXvn+9+BhTS17k=;
 b=uUXMtsVNVEmT6f/hKbtaM43OjadlCW/VXS0WH622LaMP53bAqDrg7rSCrrDR22Pn/9
 3E3KE+J/iq8uNZLQl9WCnY07UzWRAsUtzeFs1jW4uKWW3hT5Yi04eOnVki8F5zollixR
 UetrvEPdhYjl0MD9nkt/S6MwaiwKDxIjRIgxyRVF6p+KuHO4gfxaZ3tPrps+9CfZfctU
 XkP3cbt0fyfTc4ZXkEbTmcisUI3VbB4xr0g2WbltIq7CzkyULJbuZBIPCPVX4sLcW9aW
 vAg+gmXK4VbSdgvkG+jhujnizMSkIZT5u51M/UdJ5cW4NhKnulzk8b4BMy6ZC00bF2+s
 3SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZUSGwXw7DwFHW/Y0AOu0ewlvQ176iXvn+9+BhTS17k=;
 b=3WFtwjqwPFN2IKr8R6Sy2XuObFD0sGxbApS9l6dRoEb+fIQjeIdN34hQi6mGIDOfWP
 4Xh+fCb4a+tbmqrAGWudqugHxuMIEhAzU+XnbykoIbI1thWwDoIQb/fBrSz/xXApfGEs
 dpOfVImrv4XEfWdic08cXkkHvFZ8PMTZNePCdXSOTmnBHHhpAHjq2XrV81J9HAbU3Uzt
 kuNHC+5TE4ClPMRr9XMbNyfewBGpNiJZt4Wj3G6Ntp0NfR7zBPRcSz7Fd1rXN8YJM8GV
 zRxsz7zQjj+Bz8yhHPv6uqFLb152ysS+MJBUABh/QcID6CirD71uWQaKJ1KiDgg9Vk/6
 et6w==
X-Gm-Message-State: AFqh2kqJJquZGz07rwoyI9XLCFXRJjatnqEE2aNK89lbAFvN43rOWikm
 LhkcvS7kp7Fj9AFY6IsfpQvLfd77/tKTNwoHQekscg==
X-Google-Smtp-Source: AMrXdXvZiE2/ntQCz2ceDqMNf7Q3NPIZahQvfvcKnvAxOCwBkMbrBznPqJeN9eFOOkfBk2o0VSOBJTZgABKvj9P/Sc8=
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr180865pgl.192.1673970470017; Tue, 17 Jan
 2023 07:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 15:47:38 +0000
Message-ID: <CAFEAcA-9D8-h+Oq+8-Nz0dMXBC82fzRDWGYQ_yNYE5j908KGKA@mail.gmail.com>
Subject: Re: [PULL 0/5] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 16 Jan 2023 at 22:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
>
>   tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116
>
> for you to fetch changes up to 61710a7e23a63546da0071ea32adb96476fa5d07:
>
>   accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12 -1000)
>
> ----------------------------------------------------------------
> - Reorg cpu_tb_exec around setjmp.
> - Use __attribute__((target)) for buffer_is_zero.
> - Add perfmap and jitdump for perf support.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

