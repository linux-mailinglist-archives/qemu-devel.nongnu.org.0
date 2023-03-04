Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3526AAA53
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSQQ-0001hu-Nj; Sat, 04 Mar 2023 08:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSQP-0001hX-5n
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 08:59:49 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSQN-0001OD-Ms
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 08:59:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c10so3148910pfv.13
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677938386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wuA7s3kB4VWBgfNEwopiWg/6WYZ4z9ciTiy5DB29kyw=;
 b=Rx4W6F3gAtpfPY8vWMDo89mEQMZqX1YG5+gfb+IwhtQyFHRIKJVRKwfnJfpQDQZnhw
 hhJj9qlYLEftgFKivWXPdBdAjht1qI5fEchpRxV9f0ebnFS41Ceq2715wTGkt7Q9mULr
 iQMbbGBHDNGQFBfFeQ31r8oBAfXZZ/dORBkMX89QpOVCfLC3jGwXAgvIrSoVCdDRVqf9
 4PgXY9Ctjf56uyDjdIwuPrG4HvAfJJmTy8F4Zl+nDPzULG3mRAvVT3tizi4uA4ud2W8z
 LL4nRY4QVJ6JO0WFjVUoc+hC/TpvMFGdzp7Vvm6mcMxfNRjM2tYA9zt17NKur1wKVPN3
 rpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677938386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wuA7s3kB4VWBgfNEwopiWg/6WYZ4z9ciTiy5DB29kyw=;
 b=YC9xvMOKLjw8spZOK67Q/GXWou9fu7Q9ZAPxviWRed5gzcQVE0mrTY8AaopDfOK4C4
 byCL882C9FwG45NmDqF9KE5UUx2+ATFgzmTv/mv6/ksaUImCm8eFi8tvki//JxOzi9nQ
 QdDSi4/iqGA9v5ZxFJF8aFWzHrOLf/jodcKpNnQ6zLfSohACcQfwEVQQWjy8Htzcl7XW
 tD8pNKuvuBZg5J+F26XlWpII8t+oYIq5lUjE4XNOrn61RUfLlXn3I55xH9Ztqlp9GbUz
 0V2Xn5QO58M9MDhLXisbCJ1+ALOKxXBCXECsWtvmWCxA7n4BzB6VSA0/+CF6wctI4xjE
 YiPg==
X-Gm-Message-State: AO0yUKVA0sJGlA0QghPDy+MjLtWkz7EZ1HnCrwt+lmCaJvcglp+YptAX
 5nB1XLKuBOhReJupuwhmpEamLnmBVzN2uT9UR1KOZQ==
X-Google-Smtp-Source: AK7set+wluDdL0tSgJGfjriHef16eE8Sbrem/mC6F4rGV7X4n/do95rf0id43aTmnp5xDQ5rc2WFytI7yen7w79mpaY=
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr2215296pfg.5.1677938385717; Sat, 04 Mar
 2023 05:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20230302161959.9844-1-quintela@redhat.com>
In-Reply-To: <20230302161959.9844-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 13:59:34 +0000
Message-ID: <CAFEAcA-Xf_6wq=vshxQiL_tGzDsG-6GNjYWjRfRn66WiYSFNDg@mail.gmail.com>
Subject: Re: [PULL 0/2] Migration 20230302 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Thu, 2 Mar 2023 at 16:21, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 262312d7ba6e2966acedb4f9c134fd19176b4083:
>
>   Merge tag 'pull-testing-next-010323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-02 13:02:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230302-pull-request
>
> for you to fetch changes up to c31772ad6883533757d2a7dfe9ce24325e3ec16c:
>
>   Fix exec migration on Windows (w32+w64). (2023-03-02 17:06:27 +0100)
>
> ----------------------------------------------------------------
> Migraiton Pull request
>
> Hi
>
> This pull requests include:
> - use-after-free in test-vmstate (eric)
> - fix exec migration in windows (berberian)
>
> Please apply.
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

