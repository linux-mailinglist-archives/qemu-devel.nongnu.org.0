Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F663108BD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:12:01 +0100 (CET)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7y5o-0007BU-AQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7y31-0005Ve-Fo
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:09:07 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7y2z-00054G-RU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:09:07 -0500
Received: by mail-ed1-x536.google.com with SMTP id l12so8187624edt.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y32vxz9x1qc63b3FAytiQh7xliH1PIF40xM+koHzE8o=;
 b=st8Db+DjZDCpIr4P0J1/8QCpKr7AivBtn0ZuGT8CsyFgMvCs6ykoVlTptRL6CAdGrH
 OVAyTeX3gdUsKZyBVlCmHVsQ6VK0tPGWRO3dUw4dqEwVFZFJNsav7EA5J0MBhgHSmLXW
 oEItzjcxXckTWiS1EiAKeUjojOupnP4RQBTfcLbVqU3Mn1RhRGYFcobypqRHptZddGh4
 x9zYE17pYLuUUlKONOsIw1BEd4K4ZSMMTtjYHpQImNgCQDBr1KLX2mmTgbk9hhfXLukC
 PWQgP62csYxB22BiqIFWbnpe/iS2lpEFeMxL2wEvj0W7qxIzr+JsfDER8Yzft9ft01VP
 3MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y32vxz9x1qc63b3FAytiQh7xliH1PIF40xM+koHzE8o=;
 b=cxzBs9kGD/ivY+mchUkk1R9PFsvRKHl6uL572WjIbd22DrqwhAJCLwINCUXbiPMVMn
 hzIH8UY0T8ewPSymfTHpvSEgcUbCFmjgZctKGj2tGHB4QX/vWP3M19i9oGvvK8PPHVcf
 80M3uz9/8CoDPqxt+d3cFYikAkfW8sAi4w954VPb+kkwMLQGdRZSnDXDbIHYPkq31QV8
 6YbWKa8FSf/N1ugpr/YY8A5bbvlZcBDqDL3c/4Ou4UAu85jZZO5W0V6eTnnbb0iS0zoz
 2EZfEUNMXRrv7vpHntbsg3EtYAZkZ+4jQtHyZoBn7/U6KnhiGcUYut2bTglypekK5ZnM
 4zoQ==
X-Gm-Message-State: AOAM533hZTPH2JqtX0cSVO83Rn4LhIHpRJgjFTQG8OtBaHaRIPhR6u2E
 JQLVmdo5vyBDjaN0lRlaSvecTMY6gZljX3LwfZIF8Q==
X-Google-Smtp-Source: ABdhPJyNM0nxgtM39bk5syRGPsXixpC5cHig3uKofrfWBMIVCfRnGJ0EWHNI4M766HVkN/3ZjBylervDqFIEWYCthJs=
X-Received: by 2002:a05:6402:254d:: with SMTP id
 l13mr657935edb.36.1612519744164; 
 Fri, 05 Feb 2021 02:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20210204183439.546918-1-dgilbert@redhat.com>
In-Reply-To: <20210204183439.546918-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 10:08:53 +0000
Message-ID: <CAFEAcA8EEi21Xsfq6+VX4bbY+nutbmekYo3EyVWSKYzHa4jkmg@mail.gmail.com>
Subject: Re: [PULL 0/5] virtiofs queue: Security fix
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: virtio-fs@redhat.com, qemu-stable <qemu-stable@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 19:14, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 1ba089f2255bfdb071be3ce6ac6c3069e8012179:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qmp-2021-02-04' into staging (2021-02-04 14:15:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210204
>
> for you to fetch changes up to cf269ff8032392bbdd700e7bfd21823ad9eee3a9:
>
>   virtiofsd: Add restart_syscall to the seccomp whitelist (2021-02-04 17:50:08 +0000)
>
> ----------------------------------------------------------------
> virtiofs: Security pull 2021-02-04
>
> This contains an important CVE fix for virtiofsd,
> together with two fixes for over-eager seccomp rules.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

