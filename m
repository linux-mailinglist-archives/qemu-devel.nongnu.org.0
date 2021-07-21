Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DCD3D0F38
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:09:23 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ByU-0006O8-UK
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6BwW-00047K-Pz
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:07:20 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6BwR-00044n-PE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:07:20 -0400
Received: by mail-ed1-x530.google.com with SMTP id ee25so2301285edb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MC3lyB1pkgbeDfG2WPIRhJ+jHfXNCdKqQ5vFYRtuf6E=;
 b=VzjnYVRG9vBflAnRtKKlv30uEKbvR9fHOz/SlY8/CmoH55Sk4TNBQh5JvF0amsMps3
 v66M6YV+iypNyK8/xbC5V60Nh6WgE2ZABqQE/BwJzFpOeqAwTK5zvhfSW8IhKnxNlSTU
 rRtwAFO35DqpUVHk+WYNaQfxuJ2IrGtU8Sttkz/zzZFA4rIFOxs/z6w5cIX3BH2dd8p9
 HXPpemdlW/dD4bCnpITiZNFC0t57poglRPEemn8StnkNtDRxNwR5ujD+pHiwC7QuQNNM
 OWQcDxGhoynCujWIdO7ezMKWVIeS1mO3ZcEatscrGktBP4f71oEeX14YdJUdNc85HauL
 thkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MC3lyB1pkgbeDfG2WPIRhJ+jHfXNCdKqQ5vFYRtuf6E=;
 b=uEWdTy91JalfQ2STb0mEd+AEU+4neblg2T3NFT2rC7yRSsHLTmxT5GgqcEz3yIkLpv
 PeaRPKw6AJMUJEd+xElPX1+uN8P/vevuM/e5In6icMQt9Ygcf6ibRK+RMnSgaeX2HSr7
 lCcb1UaZ/mDiRTCdXa7VQ5XAGAhmb79C7f0s4wkUCnNy9ZuW2fgYrbbHzDDsZ+0cUNj8
 3vfYFKrtyNFbeEQ99ps4/QDM9yZtTtve9GJ6F2P1TEs51pAf2JOls/kwh5Wrtbp004GM
 3uZXXTu6tcK/OEzW+yzDqz4BIdsvkMFy6rmqMYSnTrNms5IsinzUerMj5j9g4ZizHVva
 peGw==
X-Gm-Message-State: AOAM533WwOs3aTMH5Qvv//fqZ38miRPKQunaVBbKCSo5UQzrDD3sV5WE
 +qw1zff1gtQsu2b9Ne1AJcd7zVmA99rRC4jJlrW1gg==
X-Google-Smtp-Source: ABdhPJz+sCHA0fyggujrisoGUJ1/cW/UEV3nyKxgbPEMCtVZj/vJcJCB6g0zc7TPQ+11E3rvDjHI5SwGzhpKVEG3J3E=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr47244269eds.204.1626872833953; 
 Wed, 21 Jul 2021 06:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210720233018.101541-1-crosa@redhat.com>
In-Reply-To: <20210720233018.101541-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jul 2021 14:06:32 +0100
Message-ID: <CAFEAcA-WvywkPm2m_oOax-ppQZkNoYof3s6ArNpzhX_BE9_bzQ@mail.gmail.com>
Subject: Re: [PULL for 6.1 0/7] Python and Acceptance Tests
To: Cleber Rosa <crosa@redhat.com>
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Beraldo Leal <bleal@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 00:30, Cleber Rosa <crosa@redhat.com> wrote:
>
> The following changes since commit c04b4d9e6b596ead3cf6046a9243fbfee068ef33:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-20 16:59:33 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request
>
> for you to fetch changes up to f4a3fda43e389fa26d41ec9cd24f42c5fe20ba9d:
>
>   remote/memory: Replace share parameter with ram_flags (2021-07-20 15:34:20 -0400)
>
> ----------------------------------------------------------------
> Acceptance Tests
>
> - Fix for tests/acceptance/virtio-gpu.py to match the change in device
>   name
> - Fix for failure caught by tests/acceptance/multiprocess.py
>
> PS: While not a maintainer for the subsystem in PATCH 7, I'm including
> it as a one-off to facilitate the landing of the fix as discussed in
> the mailing list.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

