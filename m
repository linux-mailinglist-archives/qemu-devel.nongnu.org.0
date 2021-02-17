Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C993F31DBB0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:46:26 +0100 (CET)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCO5x-00084c-U8
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCO3y-0007ab-BC
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:44:22 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCO3v-0008Ja-IT
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:44:22 -0500
Received: by mail-ej1-x633.google.com with SMTP id f14so22584296ejc.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xNOEAGBoMqexvgDEp6zDoVEuYvs6L1zxrJTTgHkwEy0=;
 b=IQCN6dSKhTlh+9jzS7ePSPSUq1ARC9nzuCFfwR17ZdV164VnjSyf+DbNWthP4lVSPz
 gxN7ah7ILgcx7Mzfpk8PA8/ZX+nNhtIEEjI2DyBAc2smTKIftu23E0dSjoVlXvGPPvZ7
 y5mTvtjUR6RaLnEPgib8JlOyJ9OW4WpECysP/zYFad9x79dFS+vRCge6O5AMDt6Q4wdz
 zxVY7CrUX3fn0BvCUqiVKidkpmcBzBiOxQ6kbn/VfRiVMotMaORITVQDWO8JBTaBEOXJ
 tGN3QBIlD0qNHHdD5v0VdaQFqYZhgyqdshuRg9taRJEanSlrOhKwTXr8ubMlYIZBKA88
 xTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xNOEAGBoMqexvgDEp6zDoVEuYvs6L1zxrJTTgHkwEy0=;
 b=X0gSsjbw4qjfco1mCN1xQW07Si5VZJasnQ+c3AUjqTMUp/PxMEcs6YKYon9MzCLR6S
 rYq3FkshQvykwXyFp/s61boYo0ZbqWgkOPkWMOJgzDiP+UmWvHEbtbzysrxEMic+kQLb
 HczmhvI6S6hqneYlhLtXyrpNEfoT7ak6XN+E5d2glPWDg+AI0sr6z/VNvuEJhuohy1k6
 ojqems1FiPTiwSCEZ3r7ltBwMa3HCZn+6tmRslLLcaDpAAHeE+gylJOUJF0fnEqeoU6J
 KAucOEVhKzOR6QJJIbUQMYIaUkc1MUW1v46G2D6dNqmla8dP5abaxxp+Z5Ao0kgr0GnH
 Ki/g==
X-Gm-Message-State: AOAM5331+bEgj/eucMXv1B4Qe/J/rg6jmGMQ8agooqbxeHRpNqOqv978
 MrNjHgwTGSz/UeqGbvLe8H/Y6febuD/eSHHBrWOj8A==
X-Google-Smtp-Source: ABdhPJz2KfbPb22XcSw2Br6AMJoka9uulB7WHsoV3dIvK9JK+yeZp8DxzmboFeEs7leyHc8i73lejZObqSXu/GvHxSk=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr26128809ejc.482.1613573056767; 
 Wed, 17 Feb 2021 06:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20210216182611.139813-1-pbonzini@redhat.com>
In-Reply-To: <20210216182611.139813-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 14:44:05 +0000
Message-ID: <CAFEAcA95E7YWJwZT_+amt-fuhpr3XW5mjbTKKk4oFE7ND=1JZw@mail.gmail.com>
Subject: Re: [PULL v2 00/21] i386, qgraph patches for 2020-02-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Tue, 16 Feb 2021 at 18:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-15 17:13:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 366a85e4bb748794b1ae0ca0ccc2d95f316679a0:
>
>   replay: fix icount request when replaying clock access (2021-02-16 17:15:39 +0100)
>
> ----------------------------------------------------------------
> * HVF fixes
> * Extra qos-test debugging output (Christian)
> * SEV secret address autodetection (James)
> * SEV-ES support (Thomas)
> * Relocatable paths bugfix (Stefan)
> * RR fix (Pavel)
> * EventNotifier fix (Greg)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

