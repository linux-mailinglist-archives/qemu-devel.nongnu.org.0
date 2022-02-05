Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E554AA92B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:34:08 +0100 (CET)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGLCZ-00005y-2u
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGLA4-0007jJ-O1
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:31:32 -0500
Received: from [2a00:1450:4864:20::433] (port=42944
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGLA1-0004x2-M6
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 08:31:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id h6so3404280wrb.9
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEeynqj3PnLdI+8BEEzwriLF9HFjUTxuCMJ2wJEjg58=;
 b=FqH003j2fMrNf4vcG0pxQ4fuB9BfeNdpQYU9hJEVNfxUcNk2kS+JHSvJe2KC1xDt5q
 MIU0PxQdiApzy28FHLWEFjHg68zle43wPF890891n6phURdOMe6It16ssgmjf0BqsVQA
 ZkG291K6rSHrz7/rQ9PaA8RvqGfARSdK42wK38KhVrPldEUkjcWPCQBJJB5naXu92llz
 9w44BUFj2/bbZEB/r8OCrjwa0o9jed/tWEJpmPLcrbmAcE/PfbAcQyEcx/ig0FvMWs4x
 RGGc37GwEIaAPOd+aPYYMvR50ge3QUerN5rEZvLLjmIqzcPKNmYjQAgYimxCNsN0T9wN
 AMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEeynqj3PnLdI+8BEEzwriLF9HFjUTxuCMJ2wJEjg58=;
 b=lXoaaS3xIEfbEmPW5g78dvpNZvo7/RNZv8u9LDJSR4L2AXwA0lnZPQ657hxRp5eJ06
 MPgqVR4jGqsDWKraF3gIlr+PECoeNHN1ECH/p/dWkxfK9hpNZ+zbC91buxUr9LBwO38I
 vfzVnBhpoEiwPpzX8B1Zqsir4NUTqCiOiUh6UTEK6rwjdquaHtF2hwm0JNlHPLzD2HKL
 9sdp1hIfYE1+PxDDPsMmh9SQ4lpuaN5x1POpujvAvDzUmn70PiNMYGN4OOhR8e9+yEZ+
 CEx2a+bs27rgNTj6asMAU5Y/lzyGfjYn7bL4RoQmUA8hGUxX5FTf9rKUNSzPt9KUVU0w
 ZYKA==
X-Gm-Message-State: AOAM5309/DPfKN4xYdkCUs1l83a3wt+I2PwwycO1rjkAbAoNEG3wqd7B
 qu+6RMRhKrTZBLLAZfpYN6txM3yZ35K8d2HYcN60ZA==
X-Google-Smtp-Source: ABdhPJwb5VTe10xVu+nE0ZOXgBUE0PutFrytfFOfaZtliVLL0M9x8Ev5hmxv/f3KGeXGC3uDsdWQZv31pglvRCo38CU=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr3184075wrz.2.1644067888121; 
 Sat, 05 Feb 2022 05:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220205072452-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 13:31:17 +0000
Message-ID: <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Sat, 5 Feb 2022 at 12:25, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Feb 05, 2022 at 11:07:33AM +0000, Peter Maydell wrote:
> > On Sat, 5 Feb 2022 at 01:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
> > >
> > >   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to 593a84174b09f0c8ae4d35ad014f93d1fb7cac00:
> > >
> > >   util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-04 20:16:59 -0500)
> > >
> > > ----------------------------------------------------------------
> > > virtio,pc: features, cleanups, fixes
> > >
> > > virtio introspection commands
> > > Part of ACPI ERST support
> > > fixes, cleanups
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > Fails to compile for 32-bit, Windows and macos because of format
> > string issues in hmp-cmds.c. Here's a sample job with the errors:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2058116754593a84174b0

> Just re-pushed with a fixup patch. Can you try again pls?

Tag still seems to be pointing at 593a84174b0 ?

-- PMM

