Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE593C850F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 15:13:53 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ei0-0000ES-A1
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 09:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3egK-0007hd-EE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 09:12:08 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3egG-0008VI-Vf
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 09:12:08 -0400
Received: by mail-ej1-x629.google.com with SMTP id c17so3189071ejk.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ZFMVImXUets2jfkQNpUykIw5epHF00Q0CGPGB40lqk=;
 b=f6E7QV4UHzrIMrq2Y/A19eU2haE8coCU5FMcmWlV1rMADTvMUq2L+wDsVPArWsvvfL
 2YpUwkOkhE0JZIZiaTUdEU8Zbnnjai3HRY31N9MFW+EbiHnUXsO6RCZR1vSMpSQjtEac
 6Q2fPjI8aUoBhpq2eWpn/nkzNpEr9G7Y00rpaWE9cw8FFxCXGzvtJAIYK+09hQ6a7HQZ
 Cx5V8n6PE+JQzL/FgdoPRW4YHVOR/2cE3AcpqA4ZAmP+yDsTKlVzz5OGyI23VKm7rwrl
 7vqhGDPQgsXELfMdwZsKZ42Phrd+DVWKS+kektkSG1CmSIBFzWWnUVL9L141NCtFGqui
 iJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZFMVImXUets2jfkQNpUykIw5epHF00Q0CGPGB40lqk=;
 b=pcm6KBrD8PMYqUZ4g/YF8LLt+bgbdo0rEYrhbXXxP/ivdXpShy/R88biwYAxV4IpKO
 Qx4SXzr2ApLOcIcIZ4NCgnnXqFgiEk2JdXtqojjhJDq3hSF3UrnevPgnqdoyh4R3XNMR
 TXSgGp+VmqGPKy5FWMfaagSMmzaPez6PnNM/ReK3+7UNZK0GE/dOjYhubAx6sn6wl4Gs
 d+s3zW/xnV2UX6VWX2qhCFyfLcXrHZdSJOdQPQvEvJpskCN14n+n4Ia0zcRE3HP6KKMn
 bAAaEeT3kJQVNhtD2deITx9QWN7n9vZNHblsgNmC1YRYK6CxIfCR5I2+xoZw+xkpR4qH
 9azA==
X-Gm-Message-State: AOAM531/9zq3qtK2m3cbRFBUcp2Rl3vFYC3z3qYiru0MKpNKTjR9+5Tc
 F95lEmdw50Hs7SJJcR76VA4c6CRKpD4k4QSXarBjWQ==
X-Google-Smtp-Source: ABdhPJw72RsfyTaf3kKynf7M94y0DW+oktJ25QvL7Xw/0UBdCNATum5+4bDe+DUFQI0iCCcpxOZzEFxaEjy4B6sRIJE=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr12422891ejx.85.1626268323559; 
 Wed, 14 Jul 2021 06:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210713160957.3269017-1-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 14:11:23 +0100
Message-ID: <CAFEAcA-9gi4KyLUU307UfE_NP+L9ujzrp-8ogL9OUBQGi7fXhg@mail.gmail.com>
Subject: Re: [PULL 00/11] x86 queue, 2021-07-13
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 17:19, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Sorry for submitting this so late.  I had to deal with build
> issues caused by other patches (now removed from the queue).
>
> The following changes since commit eca73713358f7abb18f15c026ff4267b51746992:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210712' into staging (2021-07-12 21:22:27 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to 294aa0437b7f6a3e94653ef661310ef621859c87:
>
>   numa: Parse initiator= attribute before cpus= attribute (2021-07-13 09:21:01 -0400)
>
> ----------------------------------------------------------------
> x86 queue, 2021-07-13
>
> Bug fixes:
> * numa: Parse initiator= attribute before cpus= attribute
>   (Michal Privoznik)
> * Fix CPUID level for AMD (Zhenwei Pi)
> * Suppress CPUID leaves not defined by the CPU vendor
>   (Michael Roth)
>
> Cleanup:
> * Hyper-V feature handling cleanup (Vitaly Kuznetsov)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

