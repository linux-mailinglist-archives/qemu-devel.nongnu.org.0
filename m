Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907CE401DC0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:48:54 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGrd-0004Jx-M0
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNGoq-0000tl-OQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:46:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNGoo-0005Yc-Uo
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:46:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z4so10439829wrr.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KgePS++MDmx06kaWJdKp3JYQLZA5T8HWaXvyKsgjslw=;
 b=VQN6eJuZbH63yWqOvQJEmHBBu5bUfsgNbEob7QgHSaDISaTm+9NPJlel96VROGdfFk
 r8Gb5pZKlILZ53qQwk2F897PMBuSb13PahfjBEAI1BNXEQXsrqu0X4KlN5vf0o55KGt8
 cQpf0K1x9HPqjd1dC7WyL+30x1M1kg4pGTNZjikRvwFPGov1V9v2+F4RGx9ZpuYTJf4b
 l8V5VxFiAt//rH6YlxLmV+LRw1Q0IS9RctF6I2SCRXgF8mHJ+vL4y9P1Uz7TZ3nt5/WA
 uK+xTn+AnGCxl4EukCMTOVJO0OmW/fORmSt4cJ3Bb/ANC7EYMDscHzrqRTrOdlC03PnH
 zqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KgePS++MDmx06kaWJdKp3JYQLZA5T8HWaXvyKsgjslw=;
 b=fiaSG/W6bIE/exvLRTWjbZIgbG6UPccRHZLFzxnn+zwCEmqEcg01WLDlOLNoRHeMCp
 yR27e2CtblxJyEz93T/W6HqT3ELdKbpey002GY51O5r7YQDqlHi3Qtws9HovHM0KXBo6
 YsnXbwr4F9H6rg3Kgw9A9QfFz4Q05tepZHrLbz2cHsSKWNSHd8lFRxU495ZSGmxBqVrQ
 2xRrKcUodDbq5rZqPA/aDgY7J4GwBqNh8s9fjJ1hZLb+YxoB97tipdwWVF76PdGJZmnm
 Vx6J6g30kaFwSPAkNq8kUBLNtN2rgr2Hi9nmwuMphDhcfauvKBFksnVAzpBY+s8FuAE3
 +rZg==
X-Gm-Message-State: AOAM532Hpe2iWHc0dOX26BQVh5neAHZhxC5mi3tWbu1j6w7GC+Fy7nmp
 LZCYb6DJ2NixcWfM5ap2SvGW9XIX253UF9YUBSHV4w==
X-Google-Smtp-Source: ABdhPJx9E2x/w1o/kelzpGRQBAAQuVI8eczvw0FqiDXsBdrvoPHoWk56V/bql987wWHWVEvst9ck87JkSjrLq7ivoT4=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr13616539wrr.376.1630943157466; 
 Mon, 06 Sep 2021 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210906152657.72046-1-pbonzini@redhat.com>
In-Reply-To: <20210906152657.72046-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 16:45:08 +0100
Message-ID: <CAFEAcA-qpYUk1wQ1Sn_=-Oy2HEhzuEYwYP5EuZwUN_AVS3EqAw@mail.gmail.com>
Subject: Re: [PULL v2 00/36] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

On Mon, 6 Sept 2021 at 16:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to e423a6e6467abe2994e70670eb197069cc652782:
>
>   doc: Add the SGX doc (2021-09-06 17:24:38 +0200)
>
> ----------------------------------------------------------------
> * SGX support (Sean, Yang)
> * vGIF and vVMLOAD/VMSAVE support (Lara)
> * Fix LA57 support in TCG (Daniel)
> ----------------------------------------------------------------
>
> v1->v2: now entirely x86 - removed gbm patch and added the first one to fix TCG LA57


>  slirp                                    |   2 +-

Nothing slirp-related in the changelog, but the module has
been changed by commit f99ca7795fa6d17
("target/i386: Moved int_ctl into CPUX86State structure")
in your branch. Looks like an accident, could you clean it up,
and resubmit, please ?

thanks
-- PMM

