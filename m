Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A192A39BDD3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:59:14 +0200 (CEST)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDA9-0000pH-Il
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpCdx-000087-QJ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:25:57 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpCds-0007v5-VT
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:25:57 -0400
Received: by mail-ej1-x636.google.com with SMTP id a11so14680991ejf.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgIeMT2CQ52GDhvPeHrpr0QYsvZ8S7DmB5JwRtwCoNY=;
 b=XIj0QgdaaQzfQJpLhZFEdHSdygNFpXC+4VhKWej2nhUxgkmLUOrH6HuIb2xc2RtaZm
 nkIbRJ6JHhgtvObCj1z/MYvJ1vYKOv9ScM79e+3PoptPdnwDzD7b3JKEqyYQBXfyBLI+
 oUSn1wPsgj5F+/Pie7Nq7xPgiRFRwEu9UZ3iJ5aiXjo/ZvbfxfZr+wXoNASCDLu8Pf5V
 ibFMXnOuOgRFunswdgzDIuwOf4KfVkepGn+QnK51i1L8ZAqxveOojQxdnJlxOUuw6Rcb
 G9EG6f7NClLZs1VYLEBc0R9pRuIPL6Or74xGdD9Bus0VU9K4cY/HjPNH9+l4gsZzjEyq
 tFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgIeMT2CQ52GDhvPeHrpr0QYsvZ8S7DmB5JwRtwCoNY=;
 b=RNAhL5NzKpP/fJ+r8M8gOMC/hhb0jeOk7zD1xBfuieD0jltEsCpT5tkAeSnHwg0Iec
 YPgkdaPsUzWH7ZU6iWkp2KyfdUEmqnsZjHLfbpLrUQ+863TBiyDC7S2oBQjan9Izqqcz
 fAEklqgQ4GgahjeHqYoQ01j6sYliYbQ03XUCl31jmRn0PoBOExuShjvlvJJi1uBX2kmc
 boktXEAvFQdZLItmUc+lqrmk3UN31XgGEGSeEAfTa6inV6XgFstqpVD7kRRw9nmL7esQ
 uEAzAnHzZIMB57EaRLuJIr2Pit/Y73vgZua4nmpWtVgwf17u1eV3nfFDFL5ZBC3bYoB0
 z+jQ==
X-Gm-Message-State: AOAM5337u0QzFIc26ZDyBTtVdTVlw7PapmvM/dMRWHIpJHuy5jyVC8+h
 5oEKTMp1AbbRr6NsKvC4qYHs1HCYiscTj6oz4L+HcQ==
X-Google-Smtp-Source: ABdhPJzT5oj+6FuQY6k7UQaHITAXIlC0tUUhpEEjlwpWIqQaLm0G9qItvq7uImUcv+/W6iG528l5aA/6X1xPRBqPtEc=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr5094218ejk.250.1622823949721; 
 Fri, 04 Jun 2021 09:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210604073617.69622-1-jasowang@redhat.com>
In-Reply-To: <20210604073617.69622-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 17:25:16 +0100
Message-ID: <CAFEAcA9PHV8dQASm1t_ZzG_JuepBN7RgHc5KfKZM23cw9czfyw@mail.gmail.com>
Subject: Re: [PULL 0/7] Net patches
To: Jason Wang <jasowang@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 08:36, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 90322e646e87c1440661cb3ddbc0cc94309d8a4f:
>
>   MAINTAINERS: Added eBPF maintainers information. (2021-06-04 15:25:46 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Andrew Melnychenko (7):
>       net/tap: Added TUNSETSTEERINGEBPF code.
>       net: Added SetSteeringEBPF method for NetClientState.
>       ebpf: Added eBPF RSS program.
>       ebpf: Added eBPF RSS loader.
>       virtio-net: Added eBPF RSS to virtio-net.
>       docs: Added eBPF documentation.
>       MAINTAINERS: Added eBPF maintainers information.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

