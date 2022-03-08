Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E474D218D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:32:25 +0100 (CET)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfZI-000595-07
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRfXz-0004RI-Co
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:31:03 -0500
Received: from [2607:f8b0:4864:20::112c] (port=44338
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRfXw-0006H4-PW
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:31:02 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so213589637b3.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqE5qluZSZSs+spoSlXzXxzF6JeQCwwiI7MoXHktvIQ=;
 b=a41HbAUFyza0SX/PhIIoaCYfB/G9lONLPEI6Xr+navNLp2KFboJD/OfHhTqTpYTBL7
 TSnJaM9j+ZnF2CjY3Hfb2q+NzhC1u5EgtwbaEaKnnnv8xRCwsBkZyT68bELlYwFkEo+r
 9bvuWEjyrHO1wCvKkSzH4O70OjXg5M7p8xjAb5lcBPxHTsx13G4vreVG0A+wD5fVvd3o
 Nm1Jhog5vprAAMDc+GyJ6eiyVTtD/dhKyYGCXTpgQYPpuWZUqKsLHsNtUHtVzj8d793k
 G/8Z1+nQfM/Any3niUdQnVilvwXwuWLaRuTP69J5naIvwE21QZ7ij4BfAZ4k/WWLE+rA
 pkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqE5qluZSZSs+spoSlXzXxzF6JeQCwwiI7MoXHktvIQ=;
 b=LycB+AR6J4NTAzurNnZMo83G5zOxJ2U3wZsY4/DYJvn6pUboStgObB21PNYTu+cvz6
 uV6PdDVD9RjICpSaWG0uoyyUFqcZtVsy+xs4EwFksmlypgkTitAeO8mz0a/MnmuDMApp
 VGUAJ22PWx8wlb+atddBDX9N765mFFC35f3uLISLW3NijwAu5/lNbkssZNhzXWmnd+Im
 q0J+MlSVOcYTx8AiTjM2mjp5ENNwLz3nDeECJc4no2YqBStjx/ohWe6I7dTlyEObNhap
 rFOqI7BaM1RB5jA4BC9OQBRnT5i75MDIicQs4jTnTs0X4mL3mYYBzZwNpk3kdsX6tfTj
 ZQoA==
X-Gm-Message-State: AOAM531ZcI0D6IRXEhdT0PeNXImQzZASI/93iNJAfyv3GHSHtix5pmdn
 DrwVMLpaItmEAocB+0NnSdTnX2HrmVN+5aBR/9znyQ==
X-Google-Smtp-Source: ABdhPJx0VlDq18fSnKIlr2LOZf/B+T9azjPSynWGiYiESy1kE8PAErft/3XFqot5xEaQ6C8Wo6z6HeXmGIw74PNHEsI=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr14016415yww.64.1646767859677; Tue, 08
 Mar 2022 11:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20220307182609.94466-1-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 19:30:48 +0000
Message-ID: <CAFEAcA8HMb=54PSncx7Z1krLa0xZ7CYkLy1_vG6uzGAg+aphZg@mail.gmail.com>
Subject: Re: [PULL 0/7] s390x, tests and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 18:26, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-07
>
> for you to fetch changes up to 818e1636080768749dc826acd4825e71828ec7e6:
>
>   Check and report for incomplete 'global' option format (2022-03-07 19:00:05 +0100)
>
> ----------------------------------------------------------------
> * Fixes for s390x TCG tests
> * Update Haiku VM to a usable level
> * Some other miscellaneous small fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

