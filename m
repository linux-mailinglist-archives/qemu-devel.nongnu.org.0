Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D623D7507
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:26:38 +0200 (CEST)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MAP-0001Tb-61
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8M8l-0000Y1-KR
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:24:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8M8j-0003jZ-Tn
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:24:55 -0400
Received: by mail-ed1-x530.google.com with SMTP id x90so8707232ede.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKheUhqsrQo9CSDdY12fKCWPkwOaxAS8AdSupE4kZUI=;
 b=qmFFA8Je7uVJNR+fAXu2NAWYQmjb+75IUCHobvnGUj80iWs2PXusBlfztZW+AH7lR1
 KMfEZg53Ky0bHpGLIEM8xd7m4j1fh5pBzPAP0xDINYsrNO6lMZ01yR6rcVzOxZ6agEub
 EbvX2TVcWZsW12T8W96RKAyVc4e8CJ965Abbg5MpjFnGPseq5BgQyEJ9EO+i+aLWDYDT
 Y001jjCFd3TxoKpPNGdY9rJbDaS5fTfz/4M1qXJNmIE5esWWFs9GSMXdIvzkhib94yMR
 wMzVMZtX1rxAEc99bk8bd2YO29vDYIqpcEUU7At7rrbwrJY3drkCaKS8SY6bc1diwV2p
 57GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKheUhqsrQo9CSDdY12fKCWPkwOaxAS8AdSupE4kZUI=;
 b=f8c8IZ86c69BlQL7qOKyIx+T8fOqXvBTyBsme1WNs5oyFEsUyPdLj0M5Nzl6ztanMN
 YtyVHV6ixcu5R7vVPQZsMFPxxsC+A7w+Yvz2C55Wfbl3fopde4ZWe0CnXqQSOYzMQsaR
 RJlnADWw8trYcu3HGB7+EsP+FB5t2cBN/N7sJ6ezPUESgeexx2COyOPkdgusB689sigL
 VHJQWRVcAdkRdgMmzj4XMwvm6Gt8SADfnwRv/+GasWnIA2K8pcBmmLH18TgdHsilr6VC
 0JeqX+on+hBKb326ceOUh1Q0eRwaj6WY1JfYCqoYXhTZMP9BosoyhEAw38gEHFsguQ6M
 vYLw==
X-Gm-Message-State: AOAM531et35je2NZ7YY4AeU31jgl5/lTp2Kos7+b3yLefyS6jSDL7yyj
 wM1fyqN8NtaZS0FOMNF+DjtRnzRMfEyuf7x2/W5Trw==
X-Google-Smtp-Source: ABdhPJzzNA28Vk0SmPF32iJYRE6SBX9D6XUCgxcGgpp76zEvZtvqOp62k2tQfZLtu0n7hwFGgdkg2hw7sxBAc3QTg/0=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr27298065edb.52.1627388692458; 
 Tue, 27 Jul 2021 05:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210726124331.124710-1-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 13:24:10 +0100
Message-ID: <CAFEAcA-__9jGQc9L7M+4Sp3FVCHtC2nrUY2-xZDhnneXnJsnEQ@mail.gmail.com>
Subject: Re: [PULL 0/7] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 wei.w.wang@intel.com, leobras@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 13:47, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf9d:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-24 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210726a
>
> for you to fetch changes up to 3143577d6a3f363514219c03d936e653ede44f32:
>
>   migration: clear the memory region dirty bitmap when skipping free pages (2021-07-26 12:50:13 +0100)
>
> ----------------------------------------------------------------
> Migration fixes 2021-07-26
>
> Peter's fix for a bunch of races
>  -> Seem to fix the occasional crash seen by Peter
>
> Wei's fix for migration with free page hinting
>  -> Bug has been around for a while, but makes a huge difference
>
> My fix for OpenBSD test corner case
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

