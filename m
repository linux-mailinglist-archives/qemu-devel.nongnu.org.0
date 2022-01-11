Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7648AB31
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:14:24 +0100 (CET)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EAY-0007ZN-9u
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7E8e-0006Tv-7m
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:12:24 -0500
Received: from [2a00:1450:4864:20::32e] (port=35482
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7E8c-00020n-FS
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:12:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso484112wmj.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xeIa1CDwsqPG1wJRcbXcWnh3Th9lmTjvMmUCpWXl834=;
 b=C7eW0HzJmB7PihyhoARppyHyA+q9oOG+PWLyQt8QCfpmkoZ2GgDKp53x6ZBObsvTBX
 zzTh0utPHPHAldX1Nub8KA1jRtyKDa/1o6wiIN2dgcnQdHH2Elz+uPMgnnxhB+FxzpRm
 SZZG5jxF2TqV2W1H8FXz6Z2k/+sWnwxS8VLVSEKkSVrmSlS1pEOk4hh3TjL5UudOQk/F
 D9YdoujBoAKoEjRj3HAz8Q+yJx/PxWrdOOpszCjByVbM/TR5Ps0Jn0jhTfrru0PT06wy
 otKZ1JKq82M878HmX6A+jpncJfcz4lq+vZj/WaBr6SMoGA814fljdNtgshcFe90T2fsX
 cxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeIa1CDwsqPG1wJRcbXcWnh3Th9lmTjvMmUCpWXl834=;
 b=QehIYtP0bk6XkLzNCql4CDWYM83lrKV4I71NGnR2cHz0HguaqcIV8pnqD88Loox1kq
 YOh0Hyr+Dv/k95tyS0HOgiQtUYkuJ1G43Pq8d7lKRh/Fx5RJETjAAFJt6wgvAjgyLS2X
 hMUU0S+Got4K8FfrXgFD8ZDqVNZWlqRDm8EB4rKohAM+2GLquqLdP/UOp3zjhadNz9dd
 vg6YUjTQQVfbUq/I4i3LOq1gwzznw1lXwX8KaLVENR+nTLRVpwZWidx9JLQDBDJatUCa
 RuRquLLT63mOWS7QFYNYq/9ZMzVreQjYslUJPgQoXgDRmnROe4nZeENTSVFtcV9ChYKN
 P3iQ==
X-Gm-Message-State: AOAM5316Z0Xx6nAigAIpR6T3bnxxD8q2qIDm3dT6jftLHtOfMueZwzFr
 EQ+ylqTBT1dwyhGcUZZ5/lYJa3A8lLLrZbwYCxIMAg==
X-Google-Smtp-Source: ABdhPJyYCXsl0J2K0GUVEIZ5sueBxzHNhSvQYLwIbIjw3frp5uksYzuT+3VZxqnFvhM+mr/owmaJj1sjrzVwNpDtHfE=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr1774576wmh.133.1641895941142; 
 Tue, 11 Jan 2022 02:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20220110144034.67410-1-pbonzini@redhat.com>
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 10:12:10 +0000
Message-ID: <CAFEAcA9Bpn7U+0h7XnW_NZfKr1cdftAkd7HTNHo9zMP0OF3oAg@mail.gmail.com>
Subject: Re: [PULL v4 00/18] Build system and KVM changes for 2021-12-23
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 15:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit afe33262585565b64df706c62b4b0f6e0ad30c71:
>
>   Merge tag 'pull-riscv-to-apply-20220108' of github.com:alistair23/qemu into staging (2022-01-07 22:09:24 -0800)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to fb714a07243a88c41002c23a24e174c5d9d40d57:
>
>   meson: reenable filemonitor-inotify compilation (2022-01-09 17:45:02 +0100)

This breaks the centos-stream-8-x86_64 job:
https://gitlab.com/qemu-project/qemu/-/jobs/1959569820

because the commit "block/file-posix: Simplify the XFS_IOC_DIOINFO handling"
removes the configure --disable-xfsctl option, but that job's config
is still using it (looks like we set this up in the file
scripts/ci/org.centos/stream/8/x86_64/configure)

'git grep xfsctl' shows that scripts/coverity-scan/run-coverity-scan
is also still using --enable-xfsctl, which has similarly
been removed by that commit.

thanks
-- PMM

