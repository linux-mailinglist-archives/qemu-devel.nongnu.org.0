Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CCF6A95C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:04:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3Ca-0006y3-79; Fri, 03 Mar 2023 06:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3CW-0006xB-HC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:03:49 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3CU-0006iP-RK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:03:48 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 130so1226102pgg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677841425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t4xoFeWO302skjnQ/fqB+7hUtgvkEYforbnz6qEI8nM=;
 b=afzjMUcomoaNrvT++wK6wTVEbHr5JP49Anay5aLQkooy1AsrCTvJqAtHNMDqFBrYa8
 JSVqIYYQXs2OFfEN5cgemLHsTHpMmG44V6wTcILj35LDaAWgDCwGFUiQiGXQsklNyNPj
 ZhqjM4rtZpZj5WhCgdgAtu+T4i1dWreNp+KWXsEb1Qj3TmDiLESI4fFpijYFVI1Cwj9l
 0GCc+HceNHi2dGVymnlHc95Ke39A2tkUtu9OPItn355oWTnPT+LsFduSuvaQho6INkVY
 mq/6Mua9El8OCqfjPKpARTPRprRhKh/4LubFeE+mOXfkFEzzSuV8O6a6PqgefxAz6R1r
 0IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t4xoFeWO302skjnQ/fqB+7hUtgvkEYforbnz6qEI8nM=;
 b=8NHowpxGW+kMzsPotoFQoX4Re58CjAwdwWoh//6zugLL6Fbih03FvL9pRZGPk5qEfq
 pou9RfPnDJP6Tj7MmrY+ku2eC+cDxhZDgJ5hqiFX7ZyrTrCLtbI6Bvek0zFIfSymHekJ
 xnpOBtX5DZKFy4k07VcEyTaKKI0ofA9Gn89b1/sdGei/XdQcslWabXQWi5jJspqImyPe
 hQPl/EsBAOQVP85u4vD08uZXa2gOpjU3gc4rn6NItS1fM1Mixf3UvgNEJFmJKIIRSENR
 QS32xM9Qab4OcLVeNFnWj+q3qRt64kujBX4Z7l9+nbrZhbAH2EkyzczPPX7SBMpU6fYU
 qmMA==
X-Gm-Message-State: AO0yUKUjfl0AhNRhvY9eyvq07sKnpX3ZcM5EdGGTsLsJUyBVYr6kb0HU
 ho4korUVhdonraznJHqYdEgRQHhs94X8pC44BuQVXQ==
X-Google-Smtp-Source: AK7set+2C+7cP5WfNkyP0jg0Y9n+zBUFhtxca7nyH7h1TSw01owMpypfDheMYwAMYBS7+SbSNpcSdnnK8it4ncx7sNo=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr394472pgb.9.1677841425061; Fri, 03 Mar
 2023 03:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20230302123029.153265-1-pbonzini@redhat.com>
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:03:33 +0000
Message-ID: <CAFEAcA98FkO6_buQentxpUK5Zw_5=8NYf0i0R8DymZKmfpFg5g@mail.gmail.com>
Subject: Re: [PULL 00/62] i386, misc changes for QEMU 8.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Thu, 2 Mar 2023 at 12:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 526947e496e4447d74b8d42415e2847481c5043d:
>
>   Merge branch 'xenfv-kvm-15' of git://git.infradead.org/users/dwmw2/qemu into HEAD (2023-03-01 15:02:13 +0100)
>
> ----------------------------------------------------------------
> * bugfixes
> * Core Xen emulation support for KVM/x86
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

