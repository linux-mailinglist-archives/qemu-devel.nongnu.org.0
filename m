Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA12B03F7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:34:32 +0100 (CET)
Received: from localhost ([::1]:55334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdAs3-0001oQ-DJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAr0-0001O7-CU
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:33:26 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAqy-0003hy-HS
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:33:26 -0500
Received: by mail-ed1-x534.google.com with SMTP id b9so5768268edu.10
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M83+AfNfGHHgPog2IOjLjHhOuzfshj5gLvHjxD60f8Q=;
 b=RfZPy5S7VQIZ208mhezKPRvugk4JXeJRQawfCskj6sJDjX3rRDoPmKlKW16eOmKW1s
 eEU/CsIpRqEXDh/50GCcZuvh5TXQTtySl1lBSzdbU/4Ipqn7WaSRlhMa/I9wQ51YXwei
 6v498gwi2xHxxWa0xK798mSe7iGbjcRE6rXu+qI5yz5a+1Yud+v3LAvCmW1i9LucwRYc
 FzPJP/v+XXXoVaCEyz6WyiaAeloy12XBP4oOMyQWNPGC1KUASKg3K06mCMwIB6D5TgPG
 Ziyr6UNoAWhJ2AqWPE8/r6Avmia+MMf5mMskAORYBowB/u9Pvg5ypLSLGVmVXXQHRPUg
 vMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M83+AfNfGHHgPog2IOjLjHhOuzfshj5gLvHjxD60f8Q=;
 b=Rc0VP0cYm8OObB/oZo3Ra0HOIt0sBQ14b4dI7cLJeTAixCvCcnAq9yNqVr/crY0wN0
 528PULrMRI8MKvEN7VqIIrYjoniVNlVTaerwrrthOuYJoyqJhdJxqm0279y7x6aWHD91
 U6FBAYTf3L/MBiGcQ09ySeDdCbKn6nD20XJ1Fvbn21El6WejQ/l/xRBoOIk9+cYOrxB1
 4AxjVk9qXXl4WotGyhfZHjjHzTSXfEFtWlySkIK5ytQ1LR1LZh2YH7GCSnFcOwxY8gCo
 +f3HH0bJlRg6x3xbB/r+v0xFx+OVw81Pw/cwwgxmxxpK1GE80WW3SpDAbuuzWqG+LfpC
 fH4w==
X-Gm-Message-State: AOAM531Ok/+HRFbhCpzx1qReL/BhFs/4dK9vOIluwAa+tDIA1+DAaZVB
 /TSc5mR+kbl0HK4S8B6siNfQciHapfkl5nwMzGLxTw==
X-Google-Smtp-Source: ABdhPJwLrETbndmW9yWIrLgDEV4N7hOrkMmhpiGOXA8X1WbObiSRO7pBF0/vIR8szKQUzHB6zm8gaEI/XSoiQmEdb2U=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr4495337edr.44.1605180802643; 
 Thu, 12 Nov 2020 03:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20201111214033.432676-1-laurent@vivier.eu>
In-Reply-To: <20201111214033.432676-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 11:33:11 +0000
Message-ID: <CAFEAcA9pOGKkTWja4D_tt0pZOPVMC4WCvfmny+qcJVZJqsaReg@mail.gmail.com>
Subject: Re: [PULL 0/2] Linux user for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 11 Nov 2020 at 21:42, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
>
>   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request
>
> for you to fetch changes up to c7811022ebfcaae64e06383ff734f3b3651bf892:
>
>   linux-user: Prevent crash in epoll_ctl (2020-11-11 11:01:08 +0100)
>
> ----------------------------------------------------------------
> Fixes for epoll_ctl and stack_t
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

