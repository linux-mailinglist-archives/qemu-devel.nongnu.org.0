Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9103822978B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 13:38:09 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyD4a-0004ev-KV
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 07:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyD3N-0003ja-IO
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:36:53 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyD3L-0001wm-VA
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:36:53 -0400
Received: by mail-ot1-x341.google.com with SMTP id h1so1468543otq.12
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWCBJmMnhKF1Yx+Ds4c4A/vrtZ361W8YVR+X4oHpcD0=;
 b=FsZeA8XUm2xSusv8qBr4WxV5/+FD0cc/DCU/Coy/grfT35reLIY7VfA+8tFvS0lL4X
 rbnpZMCLfOcRDLgagACYZ6KF1m6X38bDhrieCMX+IgqEpAdkW6FuZ6VeVhB6XgMNec6I
 LcEUpT9XQfAZPY9BYybpZxW2QRWrT9j/pMEouJDAsZi54AXXh7D+s9s37w4HkHkTV1yX
 G833Ik+yUeVjK68P9WL5w+EJ20PmoBFLi5+fIG96DwwPIHKaog0n87MbOzdTFVXy+E53
 Z3SYR8qamQT4u70Ma2Mv4sVN7A5h3QBc5B7ffCCZBCYQxOAwvBqUkH19u4qCL+nJERoV
 4uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWCBJmMnhKF1Yx+Ds4c4A/vrtZ361W8YVR+X4oHpcD0=;
 b=fSEXeLopbqFjzHH62pOXWPcQOKMSm3uztBH2x1K/9fwQMAEoQ2Gs5Rumwl6w3ncum2
 xyUEDY/3L79tmncfTQGK1ehOoerniIbXw6L60XUfKSJHAgI8coqnXbaNIsN7bUG4VS4q
 IBeYimQQ/M1KHUE8hO3p3kPgJdoRk9f39TYUibXrtzWXJZwph0H1meXFuYe9tHH6B3/A
 XPEJVilHu4j/hdFJGEnbKEdthi1jK/RQF5UhMO7+M+D3pEhCxN/hdfIDYBWPmYItddCJ
 w7VOUq7IlpDIp5msf9Ev1GB2FUIGY5LrjoqaOIAW5eovA1fS8oRb5LPbG1n35b6+fa61
 pnPw==
X-Gm-Message-State: AOAM530JlsezMp2tHgxn1sGhZIyrEH9vNkbKhfFMQwFWDa+uzj1mBrem
 gAOAGnbvxoiQhdSPTC/pkaxxXqf0FyPMun/XYWv/Xg==
X-Google-Smtp-Source: ABdhPJwBODILyag+PnZfFPDk+kjdWBk8Su84GK4pTYea6AUYZkM1KTtbNttGTjnRsUi4I9PYlCfv8y/tfOHIzcFrelQ=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr28952320oto.135.1595417809011; 
 Wed, 22 Jul 2020 04:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200721152521.1578693-1-armbru@redhat.com>
In-Reply-To: <20200721152521.1578693-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jul 2020 12:36:37 +0100
Message-ID: <CAFEAcA9zCfo0T7yZpWgP4HYv6k8MSm+znP-k78fEs1GxDpUAOA@mail.gmail.com>
Subject: Re: [PULL 0/1] Monitor patches for 2020-07-21
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Tue, 21 Jul 2020 at 16:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit af3d69058e09bede9900f266a618ed11f76f49f3:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200720' into staging (2020-07-20 15:58:07 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-monitor-2020-07-21
>
> for you to fetch changes up to 029afc4e76041e1a320530d97f99122a1b3d5da2:
>
>   qdev: Fix device_add DRIVER,help to print to monitor (2020-07-21 17:22:44 +0200)
>
> ----------------------------------------------------------------
> Monitor patches for 2020-07-21
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

