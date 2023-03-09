Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F406B2895
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 16:20:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paI2z-0006Yc-TD; Thu, 09 Mar 2023 10:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paI2y-0006Wq-6V
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:19:12 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paI2v-00062U-Fy
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:19:11 -0500
Received: by mail-pf1-x429.google.com with SMTP id fa28so1694800pfb.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 07:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678375147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7pSJNq+7rFRI+hlQefhFmSeoL2+yXr7UUl/B9jEng0Y=;
 b=ibQ8nq1rAdCyNm5//Kl7KvkQ6mtOoCWB4UjkEqKfZn1Cd+WowXEtaRgeNA+f0EtZSN
 58d5YZZAaQr0UDjMFtGHYy1J8/3rJ33ZhIwJfXH9SFfUQdj9Rx8LcxnqLOrEiDKLKGRj
 mztB6hOakU0d2JWIZjmjjthhQoGCThzfawEG3HhriV0zUUbL3OnOEOtwafxN1E5xbCGp
 bDV1288zJoO3K/lBVT13Tw4zDNXITtzDcErIhXpzyQjdBTOAbox4cLczn9hSt+hhJo2j
 eG0iTDAqPne60gOuEOzXw04BUEDKgQO4Csw2EPNiahucGydtGzS4+7H0Fxmi7pcaYMGF
 4Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678375147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7pSJNq+7rFRI+hlQefhFmSeoL2+yXr7UUl/B9jEng0Y=;
 b=61uXB6RYvuGIsUVSMqmEyxxou06Zv+XkbZN83iP0Yrit8M89YCfZSEt68aoNqhpWlk
 dIRAqJveDaoEi5Q+L5qqwfAJAf6t3sZwkVdtDx0z+GAxLxoa7K345/v4KZEuRGLr5cBo
 Rq4PqxKJktqgnpxhlTj4Ld5D/d2+wyJm9XB4aIWesUJFGUKHQ5wyNHUZCWC02qXVTeh+
 kp/CICj6LWwKPP3Jb00Xo8Ux/MkM8QoWfGZg6wOys2jXSHK2SNXGMP/pyyC2J0Pa4k1W
 tRS6ABH7P2Hjztuqrjbj8OYynxq42pwZHoqahgAyUdB6od/30LlXrsDzzGVQhwNTE3CL
 gk1Q==
X-Gm-Message-State: AO0yUKVeWrCeyLehvb/yFTQQr/obNCfnKcpIZg/ooP0rPi10AR3swbeS
 TrW/AUutso04OuFXLx+YE20jh+YRE1whaHkRUyEQxg==
X-Google-Smtp-Source: AK7set/YdBxJd9ZU9Hf9nqYnYY61zXJ6jzvtW7pVLd1MtiesYN3RKW8+ZfcRTdbrpSQpoN9TTiO8O8+RdCUWbtokNp0=
X-Received: by 2002:a63:f350:0:b0:503:72c5:dd77 with SMTP id
 t16-20020a63f350000000b0050372c5dd77mr8030634pgj.6.1678375147620; Thu, 09 Mar
 2023 07:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 15:18:56 +0000
Message-ID: <CAFEAcA8bOzZQowyYEzga8xK1mYaDsCSqHAFgt0qHFRnxfECgDA@mail.gmail.com>
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2
>
> for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:
>
>   docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)
>
>
> Tested-by: Paul Durrant <paul@xen.org>
> ... on real Xen (master branch, 4.18) with a Debian guest.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

