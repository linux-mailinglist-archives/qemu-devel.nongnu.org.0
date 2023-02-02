Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1006885E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:01:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdt2-0007xL-W2; Thu, 02 Feb 2023 13:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdsr-0007wk-9M
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:00:30 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdso-0004Wb-Ss
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:00:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o13so2654665pjg.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=53Ny7VCs8e2MUazibSKYC3wsvLpB8f1/vW1tCGrdFjw=;
 b=JFLvrWlrrPQJzvqBvHqDkLhjrOrPSJKKGrleEQdGiWNcCX0b/+SyNOob7N6IUaCRnG
 TTe9mdjxB7v57DbWrOjBv2Ely1HZXWKPWO1QkrN1DWNAG8iUcILxeH24HKlpQKPRF/0f
 i2At/SNnwAxywOw0noNOI5RAbf/2XRpOMwXKecqJuFz3o1EB81mJGr7zxyzF/ugXpstZ
 5qz+J0nj4Z7n6CReASbZsRWClyogwgbDiIqMhpLotV1bEdkXUOHUDeyyC/TeiQBGp6CL
 VYUfH8LmtmlmCt2gV2slSm5+94F1etQiskqgvHR7Mu77geROaKltJ6Ze0AWJmKtplQrt
 hWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53Ny7VCs8e2MUazibSKYC3wsvLpB8f1/vW1tCGrdFjw=;
 b=mtBoGe/EqvfuvFYK3MPmE94MRjBGjQ5n0vLJQbqn5eSE56nl7Ah620dKGA4w2CSpc/
 cDhHEUR4EFeoIx/7r4aJN4FdmAdr9rnFfYciz0K7oBHBNntFCYzaJPZBwWDav9lqrBch
 cCjn4X6bwB1tG2ABR1SGcfkJ99TbXKcctNHZfTPTkNtXEzrS9SKY/rHpRuuRDRtsZCdX
 oIM2ZZshr9AsXpMAgiMNICaFs2AgYFtDvt6Xx63axxaEsocoLYNvyoxoq3X2Lj+O19se
 +CI7z7yuHWQ/SLtLccXUhWXDqr24kXBkTyQ7gRiSrwb0CFO5JrjTtDrCIqz8OtdoU/Of
 LH8A==
X-Gm-Message-State: AO0yUKVK84IqZ9xtJV+6em2MMWdxz3QUWk5sUV1EQXqJTk1ha2BSiy62
 wQ96Q85D/UzryVaXNPfEzCGl7x8EKasxlTwEe+YPfA==
X-Google-Smtp-Source: AK7set8CJUqvFrBJ9SfGBKZCJGkRjuxDGr8nbqKC1UpzpGc2qtAJ/rO6XOCLoXSl1pT6+Qn3HVBMs0ZaWOMBTwdC/FI=
X-Received: by 2002:a17:902:f552:b0:198:a5da:bf6c with SMTP id
 h18-20020a170902f55200b00198a5dabf6cmr1812414plf.9.1675360821224; Thu, 02 Feb
 2023 10:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20230131101205.1499867-1-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 18:00:10 +0000
Message-ID: <CAFEAcA9AZ7cWoJnofP67tLeH7HW4N7Wgcgjk45gx5+KySJ=M6Q@mail.gmail.com>
Subject: Re: [PULL 00/27] qtest and misc patches
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Tue, 31 Jan 2023 at 10:12, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-31
>
> for you to fetch changes up to e030d08c2fc02743dd37e3d2e6e28fdd739590b9:
>
>   gitlab-ci.d/buildtest: Merge the --without-default-* jobs (2023-01-31 09:05:26 +0100)
>
> ----------------------------------------------------------------
> * qtest improvements
> * Remove the deprecated OTP config of sifive_u
> * Add libfdt to some of our CI jobs that were still missing it
> * Use __builtin_bswap() everywhere (all compiler versions support it now)
> * Deprecate the HAXM accelerator
> * Document PCI devices handling on s390x
> * Make Audiodev introspectable
> * Improve the runtime of some CI jobs
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

