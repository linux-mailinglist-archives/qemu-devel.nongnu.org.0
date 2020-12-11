Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD72D7994
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:41:28 +0100 (CET)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkXv-00049P-Q8
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkUn-0001s3-76
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:38:13 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:38324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkUj-00023v-Vg
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:38:11 -0500
Received: by mail-ej1-x642.google.com with SMTP id a16so12917085ejj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRFIs3S2KRGCER4PNZT6ok60qekcFvkbGCRnJqmoxLs=;
 b=LKRJ2hsSaZ2edrnkbCLKcqlS3ONNk67UYhmqPapq8/78o0SDomvGIQxoLecUgTiju+
 aSHYCotxti0+wdgl01SNvMLSeH899fOmvHf2ggidqOvi5IgKc17w3OOr/bbw6BJxqm6X
 xcNLopy8mQtt9MAcxTuJvvsFGvqbVIiVwx+ejcNMfdP2EewFEq3t1PAHaHTyMx4uJBKq
 3leTgQtA707nb36cp9T4dBuZaoR9F+Wo73MbYWWw3SyDy7t6KzEUggzaodGRHQPvrJJQ
 ub94otd+HcE/k/xrrPQVNTN7IE688I9k1n2ZT9acGlPS2cuDOqok2whfQLtGUfrouW87
 jD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRFIs3S2KRGCER4PNZT6ok60qekcFvkbGCRnJqmoxLs=;
 b=Io3Yejm1WhudNyOYXG3XCjl1xMDtCXNJOvkJqEHBNGDIoylI8xy4ukKL2NxYRFNpd7
 WfCu8ORos+s78jFl6rgdcJ0W3+NRVnvPWHh3M3TmyqP4YIIVFAJr4PmovZMrRMrNuyUF
 jDciWtbcysKEIJJWBHutbA+oUfzQ95JTksjMIDbjkF1KAbTqh8no4oT3LjyryB+9aXF9
 nqtmn7fPtSC6rvwtK9Zn+FUfC/MWUngoVs6lVA6oP/0EvZr7UrRanxG/pVVI6ZtShUQx
 FjeqyytkU7BWb/1HfOv8bCy+TCF2KAzEESe6ecRvzIPnPx44E4TXGupqxSFAdBLzNdyQ
 AKDw==
X-Gm-Message-State: AOAM531B4V8yk5SsOCyTZqjbaxTtItB3HXGFT0HL3nEutjgeCZFuIel8
 QUlVhTV7jIXoP15P0nf2skE3AfDC6CtbojZsgI04Rw==
X-Google-Smtp-Source: ABdhPJx9rc+ro2vRZVZRa76BDN1w2lgOyEk9CG9W+YdEbLE2RovtNb6jf5eYLtB7Za4ddQgThtoe22iVsr7p25uqHqQ=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11742760eja.250.1607701088404; 
 Fri, 11 Dec 2020 07:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-4-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-4-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:37:57 +0000
Message-ID: <CAFEAcA8A47_vmX5hcPffjUj0v0isH0zV8cjr70LjCG2pAsvKjQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] hw/rtc/twl92230: Silence warnings about missing
 fallthrough statements
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:24, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling with -Werror=implicit-fallthrough, gcc complains about
> missing fallthrough annotations in this file. Looking at the code,
> the fallthrough is indeed wanted here, but instead of adding the
> annotations, it can be done more efficiently by simply calculating
> the offset with a subtraction instead of increasing a local variable
> one by one.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

