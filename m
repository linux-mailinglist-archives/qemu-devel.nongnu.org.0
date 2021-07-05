Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D63BBDEF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:57:54 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0P6f-00042g-Ag
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0P5b-0003CI-Rn
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:56:47 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0P5Z-0003S8-LK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:56:47 -0400
Received: by mail-ed1-x533.google.com with SMTP id h2so23828025edt.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IL1tBXIs9NatD4z0pF8+IMq+EuXZ2N31p/yrQ7wpAds=;
 b=K+NdccqQaa3OC6DmbNAh/8jvDbh4twbo40AMhyohCPFa5lYuzK5QL0Tt1hn22PJX5S
 xk2cqvU37SH4JiTF1AjjUh3N6Walf67wrkscCJdJl+i0P7gklxUQMkvO00oTc32sjQHk
 Zda+en8fx48/DJbbt6ete3UG3jqdQqteKjeG7QqEUq0lmL/siU3SImMtOniiC5g5tUJV
 pom6y3OwDdxPnKYWHi6JhbFT/lFumBVK6+ZAPFNT922XYFBomcmVYVarJGnqETi9w7zj
 NmOcHaBH8sA6pAXiWUCkKDzy+WhGyx6iEKPDOh6qqP7zF+/WK84+9aOVFPJBirlwzNI8
 uzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IL1tBXIs9NatD4z0pF8+IMq+EuXZ2N31p/yrQ7wpAds=;
 b=o1vLVBWWNL7HVftSgL3bt40cYS86Ca4Q3t4LCpB2v1NK0V+gLj2/XAGdZOJCDY/rHo
 Fc40CPkC/wPQ0XvARVFBottNfCeU84VjeNwEc1tzDeOsfWPYMjd5EQmk4WvQPRtDo/+W
 NCCmhBoUtOb2rKBIqJzTTsTyGp3a09WRPgIWba1vH4BaOZbyjVBmKIfKOvvLs7XrsZ7i
 E1Go+mXhuMdQSL1yXSPEJzoF1IWxvLKXEAYVK6vpqzBPm62COSmyS3IpyAFQu+GwHGbs
 FPNo7vzQofbT0ZCjbzGK47GbvaHo9HU4gP+eCbVdBfUKaQxb3gpn9/+JfBNs5VIM5Jlj
 nnWw==
X-Gm-Message-State: AOAM530c3586dkLg/qhfXfhzXVvi2Xp1fnuGxKNXg3EM/TjWbTix60i7
 KKt2kfQeu4tS2K22BgYXgIAzjNImwWt8Cs/jilsAaQ==
X-Google-Smtp-Source: ABdhPJynCO/4SAVObsrkAKIyQm0K7TOgDlZ/FrvBrrBluZZ21LGl2EhP6NUilJRSiPMgCIYHUw4YI2eKFTJbCu+IFs4=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr16049722edt.100.1625493403123; 
 Mon, 05 Jul 2021 06:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210705100235.157093-1-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:56:05 +0100
Message-ID: <CAFEAcA98yuJxLpxg1NrKhppPSeOm-cjKDStE2SY7avcVfmyiDA@mail.gmail.com>
Subject: Re: [PULL v2 00/19] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, linfeng23@huawei.com,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 huangy81@chinatelecom.cn, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, leobras@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 11:05, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210705a
>
> for you to fetch changes up to e5f607913cee3f3b486eb024dbc7079b51f6da57:
>
>   migration/rdma: Use error_report to suppress errno message (2021-07-05 10:51:26 +0100)
>
> ----------------------------------------------------------------
> Migration and virtiofs pull 2021-07-01 v2
>
> Dropped Peter Xu's migration-test fix to reenable
> most of the migration tests when uffd isn't available;
> we're seeing at least one seg in github CI (on qemu-system-i386)
> and Peter Maydell is reporting a hang on Openbsd.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

