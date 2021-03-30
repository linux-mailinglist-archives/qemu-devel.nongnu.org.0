Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CD34E727
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:10:46 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDCn-0006D2-Cz
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDB2-0005ey-UR
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:08:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDB0-0002qc-MM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:08:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id x21so17904563eds.4
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Kcz4ltAm0OPblwFQT7LPbFstrktHHtXk0csABIm87g=;
 b=X+ADkBla/YxI6X5csVqk/42OUSZd8raYugy9xxskw9YYov5weO/SkxErZod3taz4SF
 jRhQwV0K93vWcV4hGCcpqrZiuDvYWUF5y1tARttuJ2fXPs/EMtaxA8HhhtfhtJ2Vfxxz
 /jvjTID8hCI9D3mk3znzsgKSnZR0fsaUAlB3CFjuHxeapYje5yueCEkYhYU9n9H2swwX
 1qosA9y3rz2OIN1bRqNVnLcTo1q1oytthyXjQKOIYlMjP+/Odyn/1rPtRnHphD0wxI3B
 VXqpWb5sTnK8HjEp1j6bR4/DfsR3exx8HQ92ss/B/hAmOJe6RfZRmAjbiZCZa/GfOiix
 9vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Kcz4ltAm0OPblwFQT7LPbFstrktHHtXk0csABIm87g=;
 b=ekIGPQ4NBq/lCKcT8xnO7NqgWdyfkHUZoCZFpg1vB3i4YPtlwSSgAw0xyVKp44z0Vq
 cClC/ZecZ4cW8UGkY/tCydV9alAjFpkfmZRfcVVv221SOceRpVigkFfBUVeMfxpV1nLm
 ez7WdyVNp6ntTlEdh0cIsSd7id4KRAobdriX8Sfa9d7ye1JFpN19ySzSsW4lQe2vhAEL
 LSPo55qF5rNgTvvP/JitKHNQwS3wNaD9qnSOGKqj6Xy6NGvEPBFSeWIjW9BHsN6QWWx6
 8Y91M9LkK7Mi2e7b7jVG0zj4zAtpBovfWEQeHNBc6/WPtBeuEhp8S7EY6E10QW9dsksZ
 Tf/A==
X-Gm-Message-State: AOAM530huev97V8B97KvciYu5JsSKhvI23cZgLarf2Fc7wEG+r71qrDC
 Lbgj8mkFI1nWGF9ofA+wNkV9YXVSJXYZQlwgh1ug4w==
X-Google-Smtp-Source: ABdhPJy8h2ofKOiX50gpxmNIUm3w2r4jx3jMUWk+8N/2mw3RXanaZt5fN89LWoS99CsSCwtMTps7AwKkwuRK2SDFSBc=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr33210113edu.52.1617106132604; 
 Tue, 30 Mar 2021 05:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170449.125958-1-its@irrelevant.dk>
In-Reply-To: <20210329170449.125958-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 12:08:21 +0000
Message-ID: <CAFEAcA_jYduz9=0rwEfFy-K6Skqk1K+Z4Q9185vJrr3ra3R=cQ@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/2] emulated nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 18:04, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-28 19:49:57 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.0-pull-request
>
> for you to fetch changes up to 3a69cadbef7af23a566dbe2400043c247c3d50ca:
>
>   hw/block/nvme: fix ref counting in nvme_format_ns (2021-03-29 18:46:57 +0200)
>
> ----------------------------------------------------------------
> emulated nvme fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

