Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A21A6848
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 16:43:39 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO0JG-0001LT-Af
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jO0IJ-0000dr-5Q
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 10:42:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jO0IH-0007NC-N0
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 10:42:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jO0IH-0007Ms-I4
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 10:42:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id b13so5032179oti.3
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pjn9WDuOX/qY2/mcAo4bDjO0tx5qMy3CwlH2uDzsLQ8=;
 b=faUxIgqi3MU/dGS2fjLFuczlBxjj+uzxDiJT+wcWtzCP4qhJQkqfL6PgsJ/ZvyupOn
 RjEsKLqZYTpR3OJ/ceUaKFb66CEeSUxyMOgbDo5oFkBjDSrw4B/8YKxDFU/jK49xgt8K
 gFRBVn9fbsbavvTZL+p03m9IRbIaR1Kb0M0xd48+lD2RbrLpAjYKWZ53zsOBFYbHJyDG
 zPyBLXhDPPMGQte/Obwkh4bVXTCOzn2U/Lwnvnbe0NawgVOjGW3vn7rckZsitB06dJcK
 3SIoShEzWX6GzUYtrR3crWUsHEq0uSGVukHMyvdvQry5gFaWzR0G+QumjO+ZwuJGrdbp
 xKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pjn9WDuOX/qY2/mcAo4bDjO0tx5qMy3CwlH2uDzsLQ8=;
 b=IDGkEBuuQdZhV9XljU8HvAVka4FwY9V6qgBVJgdOz6g/fltAChY0nuOUlLpa87jd1+
 R5zE5l2jNIFUC0E/cAUX7gouJ2PU617WzKDDWdYLARyh57LBDL+wyrkIJ9lKMtQUtqXs
 +f3AMeL1xehNjnWWtD0eNRGlVUb1yy72IYyxzPNRnxxIR29ZZChnsI41mURX+hjj8n0V
 YjfIsvHBKLPDF0FsKUaeZdSghippepqtCZ4PcN1NDsy/XmwGi7RVXEFC8A8TK/N/RwNw
 RNeIQaspOkjcXEHPmsw2PIFEQdeo1SrL0nYBnsI9F3YhaUq2uspNt9+c4XRSIBnLSfyM
 tpEQ==
X-Gm-Message-State: AGi0PuYyQAWqxqqn8WZ6NpU2U5QHOIFmL6cQ/1y7xa1IPpnCi9/vQQ+a
 lFYg39ma0Lu/SWfaG0zVsa3B06dmgnYs7SnPnevmhg==
X-Google-Smtp-Source: APiQypIJC+hcMqchw4bHILr0BqZ307pxnKSImw4pFSATq9GzXVcMZdWbFMefUKEZ4sCQVPhp/cmpfkych1/hacFoHwU=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr4843687otq.91.1586788956365; 
 Mon, 13 Apr 2020 07:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200413070457.25499-1-pbonzini@redhat.com>
In-Reply-To: <20200413070457.25499-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2020 15:42:25 +0100
Message-ID: <CAFEAcA_izEV-YahmTXNbC5fSdYF37ZD1CUiWdNPpQcgyZZc4kQ@mail.gmail.com>
Subject: Re: [PULL v2 0/8] Misc patches for QEMU 5.0-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Mon, 13 Apr 2020 at 08:05, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 53ef8a92eb04ee19640f5aad3bff36cd4a36c250:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200406' into staging (2020-04-06 12:36:45 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 267514b33ffa3f315adc26fc14d89f92e90840f5:
>
>   module: increase dirs array size by one (2020-04-13 02:56:18 -0400)
>
> ----------------------------------------------------------------
> Bugfixes, and reworking of the atomics documentation.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

