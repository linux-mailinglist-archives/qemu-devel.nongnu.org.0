Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121174E69A5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:09:52 +0100 (CET)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXTmI-0002W3-N0
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:09:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXTlA-0001mP-TY
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:08:40 -0400
Received: from [2607:f8b0:4864:20::1136] (port=33267
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXTl9-0007jM-F8
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:08:40 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2e68c95e0f9so63329527b3.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4k/L1UX0evZtuk7RJyfJ5j3ftadXauMeY2wYOCZ480=;
 b=f6dFWdPfs196QqAzl7b8HRAVlmWqhIviS9ryQMn0/MUbPRlrEtGx+3DS7riO7qyfgg
 2BlFBlCg1OrBtwiB3LtHjhmPnsfMJe8tBzVvuTYkrnD+MKsEmZmQMTdFCJZR07YFvL++
 VQL6hcqHg23Cj4X3ieztE4VniDZIBHS39nDNDo17C9Pkh3g626LF3VcJtQRELocPCN1L
 tsvHzNCH6VTKyyy0oTAO0N3olEO4LFDWjBft9Yn3pp37V6WVJ8+bXYfj2ntHlrX6qQgX
 QpkfC/MsuIk1mtTlav/BZTafLFLCvpo/mB9qGHz00jisNlZmQTW4MPkwRgjr2KDd6QTj
 KF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4k/L1UX0evZtuk7RJyfJ5j3ftadXauMeY2wYOCZ480=;
 b=jUP9e62Fl+vDMc0MLReWAZEmTOIjgjQvjusjGmoG6KPgihG7Sry1XKj3esxOea0sbr
 KXuIfKh52McDrnKo0LoR0iH/6xfPLAWLK8Opz0jJe8WUbDUADVnrQm7SlKm/8cuk3TmY
 029A0OjbnXud0VuRoP+5AuQVMM1YWsfB188FTjZuIOlySOn+af21CEL1FgoZP9ddfkD+
 nCchQp5nfmxDy2bUVTXy2tNKvy5t5gSaBT2wuPDTYTncJhkFF4K1LORz3JHjFQkTfzyW
 YlF3rcPqGx8jiW20kH6HyEZEBQitovUqfY0KYVm3n9TnW1HXxPJ8z21eRQ38q9zXHD6x
 qHfA==
X-Gm-Message-State: AOAM531DKJGS/Thm5UdjMBodIUYLftaQmODK3yHbd4Nvu7f7tnY6jBer
 uxQNIxXTFigeqQ4HVDugTbEQa6B07hDbDrEi2vZicawbw+dz/w==
X-Google-Smtp-Source: ABdhPJyHJUdtt5Qoumq3hnCEPymri6xIZcA1qXIaoiQ8oWrVAcxstejlegxKYvqa4DKJK3BAy5ELjd7aOXALWyFzE+I=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr6693430ywk.455.1648152517456; Thu, 24
 Mar 2022 13:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220324082016.3463521-1-laurent@vivier.eu>
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 20:08:24 +0000
Message-ID: <CAFEAcA9T0BF66-Jp8a_j5J=LzVJKRUTkHhp-rCgfJcGbS_pu5Q@mail.gmail.com>
Subject: Re: [PULL 00/10] Linux user for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, 24 Mar 2022 at 08:29, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 48fb0a826eea2e7b0135f49e7fa63e7efe2b7677:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-21 21:27:14 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-request
>
> for you to fetch changes up to 330ea9d1d819680ac7501457220b8cd1c29f9d2f:
>
>   linux-user/arm: Implement __kernel_cmpxchg64 with host atomics (2022-03-23 16:53:17 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20220324
>
> Fix MIPS n32
> Fix ppoll, epoll_wait, pselect
> Fix error message in elfload.c
> Implement ARM __kernel_memory_barrier/__kernel_cmpxchg/__kernel_cmpxchg64
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

