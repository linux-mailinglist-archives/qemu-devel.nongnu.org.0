Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E5406E18
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiKq-0005ic-Is
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOiJ8-0004wK-8V
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:19:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOiJ5-0002sx-Vo
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:19:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1637332wms.4
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nl2NHPUqebaf5NqtJhctcNT0MadumGd8DGltf7uio5s=;
 b=tofei+HDXSE7wfR4vh38qfBRv/UQHRkS12MWTeZ3DFBqqg3j0fveLdaimku+2zK2GX
 aMgH2Y3FYYCugCOHBDQrAaXaBFXz8ACsi77M1noVcx3ZvM2B7B8nEEdPld1fRzfglbg4
 /UT+RTR6isW2GUdldZKrnCH5tjG9Odw3kzWWzUkCpf2m92BuSdIbKLyS/831H0+L3AKk
 YcCcE5T4dCq7M4FLHqzvXE+tkJnC07byHSiYktIGVh9Sw+ZG5H+P69ZGwxnmJ7BXuAMJ
 /bKjZXAixGWcqWni6SOc7OM4QfYLiU8k0lAH2GVQRcZKOZtsJQQDj7wU3vFiOcfUpXZw
 JX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nl2NHPUqebaf5NqtJhctcNT0MadumGd8DGltf7uio5s=;
 b=2AqRZuIXIF3PzEa4jdcapUXyVrNfKacXRRmMmdHbC4AIzZOh5nATDIG+QF9v/Wur/4
 q1TuSwg+ecFbpePQsnD4QU6nYoBZUedhvKMJupYrZWNWbTIAuyV0if+DtDkI+sntkLRs
 mZViceXDCeRyeCNdVLlD+/abmzSlzPvhXn8CupG23yuQSrp3g8RB4MX9gJFHVBFvd0wH
 JN+pazXjcLTM8sHFPU3U8Gbb3XnLa4ijmv3feVAWHX+egpgOeUiO+BhTM9o5w74U263x
 +9zcmIJbvTeS+xXvF7IIF2N/AB+dpMJZu3PVW3CvLmZzjiDj9YQquyTSkjpV8Guj2DhC
 qgSw==
X-Gm-Message-State: AOAM533Kfz4yJbyGANHx/Eoc7pENO4iFxlI9zOBXqkdCWZe8Ytk29/w/
 GqTzM9ekZPa97JN7/0iHXEzXqMoCXM6u1A+cDfWnJw==
X-Google-Smtp-Source: ABdhPJxkKIpgL6ah6KzMqABNIzGGVRzJ1B+J+TcjAlqDyHBlqCBfUibt79hRu8NGdEc3GEeWcwDN9cRKNuQlUQKtYYs=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9004124wmj.37.1631287150195;
 Fri, 10 Sep 2021 08:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210910102300.3589982-1-kraxel@redhat.com>
In-Reply-To: <20210910102300.3589982-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 16:18:20 +0100
Message-ID: <CAFEAcA_o3wMzcji_oNXUPoEzX7UHaweSGjXYDkOn8KxL3hfpcA@mail.gmail.com>
Subject: Re: [PULL 0/3] Input 20210910 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

On Fri, 10 Sept 2021 at 11:26, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/input-20210910-pull-request
>
> for you to fetch changes up to 4e9bddcbaa74e2463f0a79350fea5311c9890982:
>
>   ps2: migration support for command reply queue (2021-09-10 07:32:32 +0200)
>
> ----------------------------------------------------------------
> input: ps2 fixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

