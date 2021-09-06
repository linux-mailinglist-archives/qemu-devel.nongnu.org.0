Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75E401CBD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:05:20 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFFP-0005ZL-4l
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNFEC-0004sf-FG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:04:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNFE9-0001tH-Oz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:04:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so9982521wrv.13
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rj+RjQ/5hg7k3wDvjWFKmq5QIoDZNvMXSb/Bmcyiuw=;
 b=Jkd5nBJWcuxkrRY1g6ptJOx1zPmDjxfG1qPcBggdhJxHEoqy5zUqEtOrAxee9wetDB
 0lTG+kHgMvxMLCz/IgYznKlpxUR2JesdbVfVHBjGxQKsrqEJaCykK6xp8VpXD+5PnkkB
 0STz792I1PXe8OKGb7iVASG83C5LuF8Tvq2ptR9VSTuJ6sVNgJYQRoa1JyUNAouBwxBd
 VUx6cI573BZIOcZwX4KqCo8ui0kHtx3A8U6ZM64J3sfcNrQGz6x54wtWrUKIHabWgKbQ
 5VpVZdJwgpZskklEtn7vlL9HHzXOwX0UySsLee9HL7gCPlfLg5rLuH9Hu75E3Yx50AVq
 7+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rj+RjQ/5hg7k3wDvjWFKmq5QIoDZNvMXSb/Bmcyiuw=;
 b=SZl5zo3VZ1cZCRaAi/hjZIMX2lm+ThgOP4tWGcl66lshPXlwqYW+ifY6IoKmMvps1w
 ygfTNPmv3vTYOTw7CavKqW1+YDLLFe+Qa7wU+vPtIec3t3Hu1BpW3XAsPw6cPEcT2gvT
 SP5kVFqbArILznpVqSdx7AaWZ8EmhzpmoY36nHeCTos03KWF6baxJeuHLkaqi1qjobhp
 En7/1B4UNtc8RoS5lysGIhLoC4+qBh3AHAUuzI4pqtoi3LBgF4evB32Sk6UJAqkQ+YZK
 b4xdxQOnbTT+dVvJMOG7lWd6hShnZFz7UMEbWh9wRPDQ7Mw657NtHDbhmkT9UIQ9s2jF
 b3mw==
X-Gm-Message-State: AOAM533egotHaEoPFIsHI1YnqtxKBu8OXQ11XVNWMcSc+0uJcHqnigro
 WMdwK9+uBcSJAzop5rOhVQqt3GPS+UdmrWAE4owHsg==
X-Google-Smtp-Source: ABdhPJxgDlI/0allqhiJd7JgXfR5N63qv5HC5eDkMncm0nIML5wc9XGo3AL+ilMHmn78rfUdWpVZVp5ws0WP9tazPAM=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr13704033wrs.149.1630937039670; 
 Mon, 06 Sep 2021 07:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210906131059.55234-1-pbonzini@redhat.com>
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 15:03:10 +0100
Message-ID: <CAFEAcA-3nCxntVjqpQAnk-K_bjFueUwMGxwZcak2kVpBxBjyxA@mail.gmail.com>
Subject: Re: [PULL 00/36] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

On Mon, 6 Sept 2021 at 14:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 31ebff513fad11f315377f6b07447169be8d9f86:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-03' into staging (2021-09-04 19:21:19 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 4e3cdb6ce6048bb28d70a438081252a29563b757:
>
>   doc: Add the SGX doc (2021-09-06 04:10:24 -0400)
>
> ----------------------------------------------------------------
> * SGX support (Sean, Yang)
> * vGIF and vVMLOAD/VMSAVE support (Lara)
> * Move GBM handling to Meson (Thomas)

Hi; this has a merge conflict in meson.build; please rebase and resend.
(I think it's likely the gbm patch that Thomas mentions that's already
in master.)

-- PMM

