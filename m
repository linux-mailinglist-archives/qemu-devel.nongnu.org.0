Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3303BB9B2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:58:57 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KRM-0006cm-F7
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0KQU-0005nR-8e
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:58:02 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0KQS-0002Jp-Fu
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:58:01 -0400
Received: by mail-ej1-x636.google.com with SMTP id hc16so28062435ejc.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7FgJ+gWRUkEfmQTLeVjC6tbb4Udjj4RvzZYrNHwQuQ=;
 b=CEkUsGvStwiWR9ehWxmyYp/muzhXpUAZb7p20WZ7SAWDvPUSLs5rr3uvMhNYnKtSIu
 GPU9uIMOfw8TuLHJ4i7xOIInuXRwzTONAgQOdJKx1L5Tz4FUWNn2BYYhj/PBcdkr6MAF
 xZAKOeopEB9owOOwMIhqa4t6QgBVipR3jGC7fxBW0oDzzVHxrZ8H4kzB/ftZQYAemtrJ
 6TfgIJ0Ggwk7KHvqie4Kvg0J6mv0mdHHpHzWYgWXe+2RXdUnEZI5y6kTY+Ah9L3+0ZGo
 V0bJRUegtXqlYvpsO9ugVfyN/QG18Ybso0OChgAN8JKY989zU5/p/CzRWVYQMOUlzsy4
 LZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7FgJ+gWRUkEfmQTLeVjC6tbb4Udjj4RvzZYrNHwQuQ=;
 b=cQv4+6z8+kbiFfwldv/MEZB0L6LB0JN/mfQeEXRslexnPV94IXq4mb+3MZri4Rl0n8
 8YcmRq8uE8qJi6OUyCPy/Cl+g4dpe8tCcfyEE3QGwWML8P44nFT/dqVjoMny3n2HcifX
 a1UdbJC+AtEFw9ybhg82zz8QhT61W0LM0V0yTSKe8Ft2WgobjEC3ySJknVUGbeogn1Ip
 vM93HVXWUbovzy0/v0pGmep+ErLXNCIJUf9HeEeTAYrmL7ZkA0vz4+otyPbaqs2/6H6Z
 yauds56K73zR0AvW/aqcmNGjB9NAvw/3/tCjE8FRiZf9F8QGZTi6jI1iBAY+xImJX6zg
 flYA==
X-Gm-Message-State: AOAM531EPiTP/91uBrjMQWqcmMuncLtXhlbz6QgwlfChKo9kU1GqCfMz
 JBy69NLzBBfOudczl65mC8Sc/hEt+euzJwyB4FsQbQ==
X-Google-Smtp-Source: ABdhPJzTsOgUxk0HKtPXE9IFPGGH4j8Of2057Q++YyT6LouPuwRK/2ZhZNO0TMr2dI1BQkBSDXE+g5xoqPvJQH0V0uo=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr12180185ejc.382.1625475478387; 
 Mon, 05 Jul 2021 01:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210701141545.193571-1-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 09:57:20 +0100
Message-ID: <CAFEAcA8SfuHm6Q_8jLYNuxB3VFHSFUECGXsp42YONZSuT0fpsg@mail.gmail.com>
Subject: Re: [PULL 00/20] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Thu, 1 Jul 2021 at 15:19, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 1ec2cd0ce2ca94292ce237becc2c21b4eb9edca0:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-06-30 21:09:27 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210701a
>
> for you to fetch changes up to 9c21e61435e09a7a67f951a096b93183a7a5ad89:
>
>   migration/rdma: Use error_report to suppress errno message (2021-07-01 12:21:32 +0100)
>
> ----------------------------------------------------------------
> Migration and virtiofs pull 2021-07-01
>
> A bunch of small fixes and improvements; two particular to note:
>   a) Peter's fix to migration-test for uffd, means that a lot of
> migration tests will start running in a lot of places again when they'd
> previously been skipped.
>   b) Vivek's 'Fix fuse_setxattr...' fixes our build against an API
> breakage in the kernel headers.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

This seems to reliably cause 'make check' to hang in the openbsd VM.
(The NetBSD and FreeBSD VMs are OK.)

-- PMM

