Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1557B4D6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:52:38 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7Jl-0000Ke-3n
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE7IE-00076F-Aj
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:51:02 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:47025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE7IC-0003T0-Jb
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:51:02 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31c89653790so169090357b3.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5qOMn9Fl86+3bmAYJUqFjvaLkDQSJOdpIAVUuJFVu38=;
 b=cLeIy1cNXnXewYl2jDWKipltuLjwgmVxp1jE9KhUdOMcxlT9UhdUN968YhVtZenSwW
 hrGWq8hQny0FTXlz0TW1jWeSz778x7loLNdJxbR9iiRI3OXA3TqxiQ05ATUT8dGWbrr4
 NAa3tacskkAQb5oZK20Wu155pMFMh0+W46RTiBqK/ZXm0lHgUJ1P/07vyeMZj5q9FE+v
 vKeWjbfmLuhN4pKFSonzW4hOuNnyuBYbIzPFmtgFsWjPLs5qAf36kF2nBx5LtZQsb+gp
 GJBGKw5h9NsCpwFQ5R5PuELzfdYMpf28tWC65igkBeV7iP4EKdfWLm1/m1Vgitc0+/sR
 NsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qOMn9Fl86+3bmAYJUqFjvaLkDQSJOdpIAVUuJFVu38=;
 b=Hpd/ix1lfgMAS+cPnjmxcvfBIxbg+Hu5nKpXl1JgaOlRCOZEcHLy+Rs1ZWOTbq8R87
 KT9CHCd5gsjVJiED0v9Mqn0mz3OjAKZl1kfU0vtPlv3c6cu+WW7Osxf4y4R1aC7ypJ3d
 +Mv7e/HxNpiie2qSYXaWsFzmswH/beCV/5HUTPFgxh1MhlwGRMXvRC8NTGP91vNAzdg8
 oD0ETiHeTDG87xfBLTFS2YIc8rEnjepgdtwl3RIyljgPCh8/BpBvlhcm5ES2+LFHEQRm
 O442D7ejCfLdSfsOqOwdmbZnZ8JRwQz/mYI8CSu0rT1Aj8LkkpDBWxBsJgKbpf3shUsQ
 1fIQ==
X-Gm-Message-State: AJIora8QELMEA6whtHz4A81X5oZceXgjSsM3d7FJkxv2IvG8o5GM+6tP
 8LIAzEkHFOK0xbB706wcg4ivUk6xx897MBXjBnULgA==
X-Google-Smtp-Source: AGRyM1uU4ijg5VBS1vbvoM2UVHsJAl4JrZ0tbPHAWRkXdyqYkpUteTk91wYjBTaSzJ6F/0aCgrjoEF9Oa4CF8z3I5/c=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr40364498ywb.257.1658314259484; Wed, 20
 Jul 2022 03:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220719180000.378186-1-richard.henderson@linaro.org>
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 11:50:47 +0100
Message-ID: <CAFEAcA9w-q3PC0sLQh3LEjZNufhNTzh5kxqo96+uRxs0USfw9Q@mail.gmail.com>
Subject: Re: [PULL 00/21] loongarch patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 19:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
>
>   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-la-20220719
>
> for you to fetch changes up to fda3f15b0079d4bba76791502a7e00b8b747f509:
>
>   hw/loongarch: Add fdt support (2022-07-19 22:55:10 +0530)
>
> ----------------------------------------------------------------
> LoongArch64 patch queue:
>
> Add dockerfile for loongarch cross compile
> Add reference files for float tests.
> Add simple tests for div, mod, clo, fclass, fcmp, pcadd
> Add bios and kernel boot support.
> Add smbios, acpi, and fdt support.
> Fix pch-pic update-irq.
> Fix some errors identified by coverity.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

