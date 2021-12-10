Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3346FFCA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:29:16 +0100 (CET)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mve5S-00057e-Pm
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mve2U-0002o0-H0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:26:11 -0500
Received: from [2a00:1450:4864:20::42e] (port=39501
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mve2O-0000kU-Ly
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:26:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so14377081wrn.6
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 03:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=41hXRHnrhFhgGnMC2ttwvxMRGHW6C1ta/K7XSzwwaHk=;
 b=Ns/y+F8WZpMF2Alx2onWsNPIWY40fCkqcm4+h2K8IQAMRDU8q9wI7hhbowrisKqZhm
 0bow1CoyIKNmjWpl5oMLVQtgJ33V/vhSH6+Z5Y/ig+NPfzKC4pwHvqGCIy//P+SJnMyo
 9ypiQ1mK/einpsOoEE0i9y/iN33PXWH/v0ZzCvZiG/McjorNwjJGDK1Oc2RXNGRgcLct
 NI6E+EusT4jJYWtBYM5ND+1M6fsMXXwtd9UjpwBFo8It2NGXe9FBuPejb5f66bVn86SX
 7hr4E0ljVMlvGQStN1MbcD99Fi9CHWMxJNxk8q6e42KvHxKtggKzkIxHiNbYiDW7jWAi
 HtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41hXRHnrhFhgGnMC2ttwvxMRGHW6C1ta/K7XSzwwaHk=;
 b=rIpfwb7mDQiJZIC1KzhB0eHpkDS3zL9iALFWJCFdTTbVv1JX4ajKZ/XRiZbjrjRczY
 F8o3Kw6Hv4OpMrN6NrMYrOM9AS0u1+hM+rLiiBAYSm9F9OJpcr8HTm5BJwK85/gG5yfN
 VtlQYi15Fwrmq7TFSMVm4ItdawrKnJjh4BVwMvS7xGAMYQ3A55NAVA9mXP3KBgB2+DQl
 +NN06QuDEgcvFn4hFbfwd/q/+mVmwkNW7SJ+vz6iPKwyV/K5Aq1GvZ7hPQ27tT/4mbT0
 2wq/ShwCs4j+i+fon7S+ieDPkMN5xIDNeQRCkxJflw07oLOYfQNeACHLumX7itB/yb8n
 wuNg==
X-Gm-Message-State: AOAM5309Q+HOGrgxeD3XfmumcrbGHcGPP6nEMaATTv80RurJcBQC6Qw0
 YGDtbxgUkYWFdoIO8Tb36avXE4Wd48eKSHl3MA33Tg==
X-Google-Smtp-Source: ABdhPJzyhIuucW4R+aLGZkgvlSWvhNw/Z1ItYuFIjTn/YJHNtJeHpCpZ0tANHf0Aa2QgQOqks1PA7bZQ7wY0Scs5OPY=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr12789013wro.484.1639135561545; 
 Fri, 10 Dec 2021 03:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
In-Reply-To: <20211209145601.331477-6-peter.griffin@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 11:25:50 +0000
Message-ID: <CAFEAcA_P8x90HgxSiqYiT4h6HsBwZsKKfXUWx1_g8sCgikxzZw@mail.gmail.com>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
To: Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Dec 2021 at 15:03, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
>  1 file changed, 483 insertions(+)
>  create mode 100644 include/standard-headers/linux/virtio_video.h

As MST notes, content in include/standard-headers/ is from
upstream Linux, and it gets into QEMU by:

 (1) getting it into the Linux kernel tree
 (2) changing QEMU's scripts/update-linux-headers.sh to know that
     it wants this new header file
 (3) running the script to create a patch which updates the headers
     to match a new enough mainline Linux kernel that has the file

This is important because files in standard-headers are used
by QEMU on all host OSes, not just Linux. Things like:

> +#include <linux/virtio_config.h>

or

> +       __le32 version;

won't compile on BSD. The update-linux-headers.sh script takes
care of sanitizing this kind of Linuxism when it copies the
header into the QEMU tree.

The process also ensures that we don't accidentally bring in
support for a kernel feature until its userspace ABI is finalized.

Where a new feature is being worked on on both the kernel and the
QEMU side of things, you can post QEMU RFC patchsets which
temporarily have ad-hoc header file updates (eg created from
a kernel tree that has the not-yet-upstream kernel patches), but
these should be clearly marked as RFCs and we don't take the
QEMU patches until the kernel side is upstream and the QEMU
headers can be cleanly generated from a mainline kernel commit.

thanks
-- PMM

