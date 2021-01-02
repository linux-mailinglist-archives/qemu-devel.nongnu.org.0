Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5552E885E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:03:40 +0100 (CET)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvn7j-0003sV-LW
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn5u-00031Z-Jp
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:01:46 -0500
Received: from mail-il1-f176.google.com ([209.85.166.176]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn5p-0006Vd-Ku
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:01:43 -0500
Received: by mail-il1-f176.google.com with SMTP id x15so21750798ilq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lw212Yxdo7GfHemy0idAtolWXN++yK10X6LqFGYpO4=;
 b=B+JyemaGElLcitmUG7bTA+2PQM3kl3pkyHZretX64VCbAIkGvfz3zOfSFgmdS3KEOB
 8942Pp3gg2wllMeq91+BUjd9oQYaxAQfBxFVBS+IpGDyHW67jIf0k5hfNJqKLktGKswG
 XNOcd786N1grSPRKhwLotuASA/2+3SERya1bgekEv2sv40BTN804/o8usSicK2uv4KYO
 aF+3tJIjdmCE7oFlNKp0y/lYWMPI4WgITSVpfUzXZjh9pSOMsdbm7hsd2WeSvMR+RlIu
 38q/bLCKPlwrigObA4HlST+NDbSoFeE7NBECN1XuPykSfypgYsWx1Ydtl6dOkksTRGRa
 0Cgg==
X-Gm-Message-State: AOAM5319JC/UOr8CZ1Y50tAsVko2kB4I1Tlx9aEt4Ajh4S/dKYyQzfOz
 qjlvyLiH90AanmQOY/wEC07tPlaUy+g=
X-Google-Smtp-Source: ABdhPJzXgc1BJADKSnJyB+vThhjHOxshgqrRz9CDTleXXecRqBxCWSxgrcW2s9gZ4xUjIU786WzvXA==
X-Received: by 2002:a92:d151:: with SMTP id t17mr66014618ilg.108.1609617700479; 
 Sat, 02 Jan 2021 12:01:40 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id j65sm38954130ilg.53.2021.01.02.12.01.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:01:40 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id w12so21696702ilm.12
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:01:40 -0800 (PST)
X-Received: by 2002:a05:6e02:154c:: with SMTP id
 j12mr36290988ilu.33.1609617700214; 
 Sat, 02 Jan 2021 12:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-10-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-10-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:01:29 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBviu5fji=h9ZF6ZxBmd36tG31i+MApCU=Oompq13qWPg@mail.gmail.com>
Message-ID: <CA+E+eSBviu5fji=h9ZF6ZxBmd36tG31i+MApCU=Oompq13qWPg@mail.gmail.com>
Subject: Re: [PATCH v4 09/43] tcg: Adjust TCGLabel for const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.176; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Change TCGLabel.u.value_ptr to const, and initialize it with
> tcg_splitwx_to_rx.  Propagate const through tcg/host/ only
> as far as needed to avoid errors from the value_ptr change.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h            | 2 +-
>  tcg/tcg.c                    | 2 +-
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  tcg/arm/tcg-target.c.inc     | 2 +-
>  tcg/mips/tcg-target.c.inc    | 5 +++--
>  tcg/ppc/tcg-target.c.inc     | 4 ++--
>  tcg/s390/tcg-target.c.inc    | 2 +-
>  7 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

