Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27CF4E3F31
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:11:04 +0100 (CET)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeHv-0004Vm-Na
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWdrx-0003O5-0Z
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:44:14 -0400
Received: from [2607:f8b0:4864:20::b29] (port=33470
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWdrv-0007Tc-5h
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:44:12 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j2so33510312ybu.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=caL4oK3nVP+q3wWeg7LFKwp2FjZQY4raP36ZphmIAKo=;
 b=NNIn4vsIo6BsPnYGgcwvVT+w9q4waYuMLp4aWSDoEX5/ZJJOOdAxzOxRu4PABLlWdD
 3VDqvQUbrKv0rcnWfz9nsebps2roqm4ny/8bVwtu3O3MPCKhYXB8XvrnQTS6NBb97KCx
 MvE7CxuNDmF7GHlSkXS4/Oas8sa3PyMxs+lBu0MrnomshDwB5dCh7Nek51vOfDY7Ernq
 zsBRIgV6VhDSL3TSMZ7x45Z8JMy/SOlfQaJlDPXsRYaHjO6/6P8XO+cuvKX4BPiPTCDZ
 uZWnR0h2rPyhw/XXBwYRbALV05oiW9xnkAVEZ76aN8P+tL4+9TqNxaKsIsXk9KizrtOL
 g4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caL4oK3nVP+q3wWeg7LFKwp2FjZQY4raP36ZphmIAKo=;
 b=2LyxlXTz5K7xYdI7J4GVr4YfsX9J7DPA2R799gKmNAkP5opNutlI1R2FhPtOU8SZeN
 h4xJdSZDdy9jZEjY3hkSuzYBHCGWsIpWHeev+x70iKoRD3havTnAMZa0wEAeiSxRD/45
 2ok7YHDZdOWjU8nJ2zVBh3lkzzi3sf6OXo74BhYLlxtfbkCp4/tOd4f0Bh+WA499vvr4
 pcLKyAlup2Qb3rvxdavMTZvSNRIkDmtKJcNMt5h5B2RvvB8fskdloPyIq88I/uRXZBxi
 shi1q92UqFVmh0X1aX9iitGfaQNChJT1iNXfDU7sBxNAXZHz+BUJuJMWdGhhSYEjKLxc
 xksw==
X-Gm-Message-State: AOAM533rHiCmlIBOvgzeU+oQ9n6vxevBvvaHEDl13yIdCxDWjTqwSLk2
 wdmyNcKX00W+L7tB3n5fva8aD3sZjUtmIPQYGU1sPQ==
X-Google-Smtp-Source: ABdhPJzaHUp1wn6PW+tTxlPnZwP67Y0fMXOod9i5OEbdNA0ONEWlebIYwNgJftfVy2MgQmXsxJzWabp0DUkzq5dcYTI=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr1136888ybu.140.1647953049888; Tue, 22
 Mar 2022 05:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220321214134.597006-1-eblake@redhat.com>
In-Reply-To: <20220321214134.597006-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 12:43:57 +0000
Message-ID: <CAFEAcA99_1iteqDS3eSYs7B5mqkw3Ai4eLaoYFi8OO5D_MV7dw@mail.gmail.com>
Subject: Re: [PULL 0/3] NBD patches for -rc1
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Mon, 21 Mar 2022 at 21:46, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 2028ab513bf0232841a909e1368309858919dbcc:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-03-21 15:27:13 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-03-21
>
> for you to fetch changes up to 6690302b848e5b55e3e3da34f0ee7fd9f8602e23:
>
>   block/nbd.c: Fixed IO request coroutine not being wakeup when kill NBD server (2022-03-21 15:21:09 -0500)
>
> One bug fix, and two patches that don't impact the binary but might as
> well be included.
>
> ----------------------------------------------------------------
> nbd patches for 2022-03-21
>
> - Rao Lei: fix nbd client hang on server death
> - Vladimir Sementsov-Ogievskiy: email address update
> - Eric Blake: qemu-nbd documentation tweak
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

