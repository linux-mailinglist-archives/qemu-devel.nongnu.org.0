Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BC572186
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 19:04:31 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBJJG-0001Wd-0J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 13:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBJGL-0007ur-MJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 13:01:41 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:35746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBJGH-0003NA-Ah
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 13:01:27 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31cac89d8d6so87734907b3.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JCpocHi3AmqOwkZ0SuvBMpsth0l5pYY8FmoMCg3ahHk=;
 b=KQ53MHeobsDZxwtfxuTc8EejmDCbqW/jsQe1qy1qSDUOP2pIER1B05Xj+TFL302KTq
 VgpiGd/auK3GJuZ70R2qxZkJy7ASCFMIVMfTZm+GGuxEvn3P8+jN1vePpksz6kzPZAtw
 8kCYqlXLyakamzzbhXIYcUXE2d6fGSWyND8mHaVUdGbqJvsI1zqEfoKN7GUWNdNTK7k7
 6RPa4cyqteF7Cl1uLRTGZKof71PjC4rPf4dYTIRA2FzbzhEO8sB7cRNYRw/P30N+cVMr
 T+zZQ1yMzxFyZZaWBEso1KS1ZFDm8rZMSD0tYtHKjbzYphYgKDzxoqmgA+QhcdOwv+h1
 Bp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCpocHi3AmqOwkZ0SuvBMpsth0l5pYY8FmoMCg3ahHk=;
 b=RYyFeG7veZgMF0Mawo2PbovAzaDp3RFTZEBMXl/W5GmpsMm2KvP9JZ8Jm5KkWUGxxl
 X8N8NDOmUfDKayzLSxg7AEGN6Yrvv4f69k3IvT1qlwAcTGLuVqiragUHFDm2NcYg3SAv
 /Z0vS3R7H2aSJSwf2RJXPY6E+EI+89DA6XknZk4ZSqQw254JUsmcC8EejaTbl18d2cd9
 K4EJ3mZi+y5PO48xUGHBnFPUvXHDVr+X7O0mN5RxNJnzCt313AvvadC+j62JG5fkNFdr
 vSCB0Mzbglv5nkU9dSjZdc67ViyEfuk2A1Oa8A3dpLQuhPcqJGfka+U8GigxH/3vBwAg
 9VDg==
X-Gm-Message-State: AJIora/KH2KePsXYaLIP3cvOvDFm4ABQ0cHuVadyspoUrhP2Fns9JcoO
 VPALcYep1BUXAVJaVuPmfAi9BVaH3p3YVTz7N+zLYQ==
X-Google-Smtp-Source: AGRyM1vmsxQ4PNgIayeDWZa0bhHk3h1xPudVmM6XWdqPiKOSPIcc5GkHfDmoHNUAlc0pooQCJ9BpZ5fram6hmAi7yqA=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr25948655ywg.329.1657645284129; Tue, 12
 Jul 2022 10:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220712124956.150451-1-pbonzini@redhat.com>
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2022 18:00:44 +0100
Message-ID: <CAFEAcA9xXUhJkgFP-_muPePX7agH=3q+30qXb1J2_XNXrFvvFg@mail.gmail.com>
Subject: Re: [PULL 00/18] Misc patches for 2022-07-12
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 12 Jul 2022 at 13:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9fb6d8a9b2fc0e150b56a0ff4341494dcd8360b8:
>
>   meson: place default firmware path under .../share (2022-07-12 14:46:58 +0200)
>
> ----------------------------------------------------------------
> * fuzzing fixes (Alexander)
> * fix cross compilation CFLAGS and compiler choice
> * do not specify -bios option for tests/vm
> * miscellaneous fixes
> * preparation for pre-install tree in the build directory (Akihiko)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

