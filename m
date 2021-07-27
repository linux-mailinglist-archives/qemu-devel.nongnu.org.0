Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D33D7BE5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:11:45 +0200 (CEST)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QcK-0005ms-Uv
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QaK-0002fh-Kz
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:09:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QaJ-0001ac-1Z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:09:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r16so16263762edt.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qj3m2jz5TjgHefugNavwgdMBAKs1yv0sK+uAPgRnCGA=;
 b=AnLkG2F6s75Ef7EwoJcf2np+G2veqSpjDosvfR6rJsHVperY9bZ2eG3mcYZR6WyyMn
 6+Uqjl0G+/d5GaKMiC7SUDtfLub0dyN9E94cXUlKYIlk/Re9SyKnIdRizf7M1EDzIQFq
 7DGWL0R39pLbalr8v6ITHEiDq8/vHYcTguru0CaaMaYMuizH9MbHCzMTJw3PeNMxMhxc
 a5YrVGIPNXCUVdIyghJO33d3seXkhwdZ/7ax8Mn1SYY0pFOynQSAPtr45ixKPrRWYaaE
 NR6c/4E3StOOEgJ2UrgM4fgqfDONk6Gt+DslvZCRwZR2f4piVSzflBHDZ576VMpGcYac
 +5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qj3m2jz5TjgHefugNavwgdMBAKs1yv0sK+uAPgRnCGA=;
 b=OYdzSx/kNM0tRDclRafOFTrC25imyKg5HlPbT1vmncoMa5DeUEynrKGvr3AcisI0v/
 1q0ddsIycE+VIpKlXxNPbfsse/TiQikEMB0Dp+mQypsp4xVYIS24rjvMx7P0ukz+84mI
 tA81sw/JZnQTWRIL6eYoO+5vkdMNkusuAKKMPtAmMSFT7q11rExavAYVVuIizpThVm77
 23oMNUuRLyxHtp2PqLe+oWw3ONEZOEovo2unJYMrdhWsDiAnZyrBi6Khmqt+ZjvLXoZ0
 EcI44vToc1fi+d7EaAmvzX7hBg153CdGcCrwacOkpfEoW3UlZiv/IMDOkdrWnOReCujm
 ORWQ==
X-Gm-Message-State: AOAM532MyP/oEvRjcsOnszsQ8M3SBRfLmQ0LCctg2V0W2SZ4vlawY41g
 YxvmM5QejclMro+swfFeqNPVc7MRXtKO5D/TWbadOw==
X-Google-Smtp-Source: ABdhPJzUfuw6voZ4RS0L7/kQWFVdaGSyvKv6xRS0Ek84BQYB3dni/Ha/cogUXoDoevqbSkBCKXizk8gclqTV5OM8rLA=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr19258592eds.251.1627405777500; 
 Tue, 27 Jul 2021 10:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210727152239.829519-1-armbru@redhat.com>
In-Reply-To: <20210727152239.829519-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 18:08:55 +0100
Message-ID: <CAFEAcA-Y2Tcm0uj_eiKvNJ8sGZKiPF9TzOD3BKD2r30UWrGHXw@mail.gmail.com>
Subject: Re: [PULL 0/1] Miscellaneous patches for 2021-07-27
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Tue, 27 Jul 2021 at 16:22, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ca4b5ef371d6602b73bc5eec08e3199b05caf146:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210726a' into staging (2021-07-27 10:55:50 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-07-27
>
> for you to fetch changes up to 3e61a13af3d3a1942a1ec2f6dfd7b407a43e4273:
>
>   vl: Don't continue after -smp help. (2021-07-27 16:52:37 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2021-07-27
>
> ----------------------------------------------------------------
> Markus Armbruster (1):
>       vl: Don't continue after -smp help.
>
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Just a note to say this has missed rc1 but is still on my list and
I'll apply it for rc2.

thanks
-- PMM

