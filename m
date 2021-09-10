Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEE406E7F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:43:35 +0200 (CEST)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOigg-0007qa-S4
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOifp-000776-Hu
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:42:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOifn-00068M-Ss
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:42:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id q26so3236788wrc.7
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CsB/de4+tPGOLF/IH1low9iPfv4g4if0eRlFYHlB9cE=;
 b=OrSlFR3Ix7NfjAlfD67VlI3GNxmv0bbO8On0AMYErUZkqJJnj4jXyBkdeYbIH3B+HI
 dgUPtb1myMWU7fTBGn74FW41gyH2F5dA+TKWoVlxBTG1RqW3NNyzwq8/RErQC7YZuDE8
 zMWYgqitILWTFUHiSusTaUQum3pcvaulzc390ak64Rzm97YX5oYqcoXZ6zKQXQhQogqF
 Exhq0A9ptpD4FSsmV4gHHbGZhAjQaDVnk9EQMHSriAnbAIYxU6uiBxjz8b7lRTADpbu4
 nszV0P3xJn0m4u1tbANn/WW2GAS1n5pWwaQurRUQQSuGTyhikw/BtYrX7Us3fCXg3xQI
 QJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CsB/de4+tPGOLF/IH1low9iPfv4g4if0eRlFYHlB9cE=;
 b=gnEU7ke98g4r9qExHhDIjA905rhZzFM41TZ0OXHVO0ZJkqF2URtA+pXRbz2GFFpDAQ
 QufLjzsnoE7CFXm9XlUngzV625TXZJpTlXM6Zspaq4bgui6FgUXXaJ9bXORsze0vuGGK
 DQ5BHcOekR0fBIWr6gPX4lsHTtnRmcA0gEn/xWLJtdAWFBGqX+xX1Xea71CLUU9z9iFy
 aH8s4B1my6tAEeKxH/Zx8CFVCwlymKy7H+I/lV9AZHNRT2OElKJ2m22RDB8T+CRgdFZg
 lNTBi3FbFiEROjvnP3I7vZilntNha1y54apEkLcmdDw9hvi5fX+OsJU52N9ZsGTPWoPo
 L54w==
X-Gm-Message-State: AOAM532HHE8LGD7zHCD0LXJo9OeOjNKN4thdLYpPiIzm8QoH8kSbLKQt
 qh8YiHkii6R34ZvmldDYdswGICWITTaR2wawGIECOQ==
X-Google-Smtp-Source: ABdhPJx2fzHw/83tOfm8N9aPQ67K9wQYbAzy3nqZ3ma9RWWa+4FHuSo3LJQA4CDNTjklgMgrE81mIOE5VAKzhUWr/94=
X-Received: by 2002:adf:f185:: with SMTP id h5mr1753479wro.302.1631288558406; 
 Fri, 10 Sep 2021 08:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210910152933.468368-1-pbonzini@redhat.com>
 <YTt6vM2FtoOpi+JP@redhat.com>
In-Reply-To: <YTt6vM2FtoOpi+JP@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 16:41:48 +0100
Message-ID: <CAFEAcA_Mw8FS+sgiBnEkCRrwHF2R==092_imzaNr7P+=ksHUxQ@mail.gmail.com>
Subject: Re: [qemu-web PATCH] contribute: ask not to submit merge requests
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 16:34, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> I think it might be worth leaving a warning here despite adding it
> to the main contribute index page, as people might land directly on
> this page and not see the other page's warning.
>
> >  Do NOT report security issues (or other bugs, too) as "private" bugs i=
n the
> >  bug tracker.  QEMU has a [security process](../security-process) for i=
ssues
> >  that should be reported in a non-public way instead.

Isn't that text for the old launchpad bug tracker? The gitlab UI equivalent
to launchpad "private" bugs is that there's a tickybox for "This issue is
confidential". (At least accidental confidential gitlab bugs won't have
the same "vanishes into a black hole that nobody looks at" property that
LP private bugs did.)

-- PMM

