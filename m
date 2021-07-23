Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77D3D387B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:17:13 +0200 (CEST)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sEy-0002w0-Hf
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6sDx-00028m-RW
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:16:10 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6sDv-0007T0-3W
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:16:09 -0400
Received: by mail-ej1-x632.google.com with SMTP id gt31so2751643ejc.12
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWvmwONE9uXXwY3bHKPRikwcNWHcAa5BgCq6T7g1Ttk=;
 b=y/AJNdqzp6FD+EGOkMXDspScN97Th7kmIqGfYJUEF1sqTceVyzDgWO4kyKX3khGNjb
 OK2ufJ2Wswh+oFiv6esMUeCShUzYxDZQ1EAZln4IAySsifTOzyeDMjSIUMD1s/tokoa2
 qaDcyUW+iTHQLyhPpUATleTPCdu+yheMhxIZmYDBjDWG6gWJsUsDW32AXE7++xe+9WTm
 J/e/IixyCBdbCoobS7FdLo3lmo4NnaD0xaBhpZ9RZiQUFKoqqIJnY52gQIkjOwY3ALL+
 FbGuMjmGCS6xz4cij/S/DwFW0l1Zd4urUl+B2ejiTa90EOKJJGEm31kr0+e1h87B2fr1
 4CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWvmwONE9uXXwY3bHKPRikwcNWHcAa5BgCq6T7g1Ttk=;
 b=r7l0dlqyZPY0v44tnBtrPC7zcLM2zaWfTLPununWjPZDH/RmxFLPzRlIC8bYMf0B1P
 niQJAeFcSuSItgYxqy/2JogpGM0fC8FunrO+KAaCXQIc11k5XypZwXqGtOCUis2D6McO
 La/9Ljh+2ovaaHHcEbLQ/uLwAKeLreVbtr7sm2SK6NKDLtmdtuMjnRMOdDHC+66U+T45
 52J9MFNhnlN8aS9kYuGNEBCYFcIXvztXV2FMjbhXZm6zEWphY8Ob0wQKcjj9RAqpX64K
 97qMad8gzBHIfuFadh3vmNAYOQHeRuWiKdS0Po61+asSU/iN3lEmmd4/mIlcmRCzH2aX
 xHrw==
X-Gm-Message-State: AOAM531YmrDOczbPG36mf2pvoYMBZcY1yk4mLXQJr+1OdwKy8pI+NNtv
 0L9XkjoYHNJLE4lNtHKl1Rcr7PDe2qkhRB+Gz9WFEg==
X-Google-Smtp-Source: ABdhPJzDVEKfQ/oVwsriZiJmjxVjUn5PJ1jNIHNn/Jh46rIj9kDq5BpReLQpaeufsjuPfID68BVSqpYnIEzZTuuc9/Y=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr4057985ejc.56.1627035365288; 
 Fri, 23 Jul 2021 03:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210722153612.955537-1-pbonzini@redhat.com>
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jul 2021 11:15:23 +0100
Message-ID: <CAFEAcA_9c7BMZxkxoXxqq5s3CFzTbeP9mAZ-MScYPRJeyF57Lg@mail.gmail.com>
Subject: Re: [PULL 00/15] Misc bugfix patches for 2021-07-22
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Thu, 22 Jul 2021 at 16:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 0848f8aca6f7b13f2a755c2593b0a1cbb39f658e:
>
>   configure: Let --without-default-features disable vhost-kernel and vhost-vdpa (2021-07-22 14:44:51 +0200)
>
> ----------------------------------------------------------------
> Bugfixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

