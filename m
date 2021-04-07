Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DA356D45
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:27:59 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8Dt-00008h-U4
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU8Bu-0007v2-O8
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:25:54 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU8Bs-0008DD-VP
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:25:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id 18so3344659edx.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/VugxKjctuRGQfgmE6eMfknlUN63VP1j1Rjrh+rz70=;
 b=h6+CNTMt+meYs/OW9nR7OznkRFcgdekDcpgH1HzSYMWABWDsN1WKyGsky4qMzFHI1A
 QhDTxaR9lAop1hskt/U0pU2c/rrnmF9APg0U/epvMmCR++4jxxiEptAMGXMAzDa1WJbW
 b/j8nLamWebyAUNUNqVLs4eXTIorSoFAjjiM54j7GZZUor57PouUvBI47zD1JYLRjuCn
 McCVbUdb21btlWVd/sIFKWub5daXSAMh61+t1ZeLtItNYgz2qh7yxLAPT3F/s9mp5UDR
 L2COG6aVYYCzvAHF83AqcVMF6RBcJD0dnNvOZBHeUU490JGi05LIxZpUmJsYlj+eDB8c
 0KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/VugxKjctuRGQfgmE6eMfknlUN63VP1j1Rjrh+rz70=;
 b=DbOcqlusOvA/XW7XcXk0kDJ/EqpWc8LV/3z9Lj+o4yQzElj8kj+2wSLw+Cx+C5DUjZ
 7/scVK+Np6bLpVKq6x/Qh2Oz7H4n649GEqp1Ci6loTN0D8zd2+3rqyWpUg0kcygX9+gh
 IBk3uV/FWzU/5+Bc8O4/uBRG9Jbo8djkmtzDfl8huZhgb7VxfW9u2QxN0u4tE+boA/qE
 YcO3h0sstOz1Eu9xnxjUij8/iUooQRQJFyjdchEB/PekHVnCqosfmBMYC4k7faj6nrV7
 Tzft+cs0KB1jktM8u5MSZf+9fQfrZMCYeR9sooiMujv4Ju/ozDZ1ovJ003yQqd83hmRL
 u0Dg==
X-Gm-Message-State: AOAM530762B/+1aOXlwPF6JEhpaOtmvQWHhVmR/7XutdqDGM8KKB07ua
 iRaJW1WHJmmRb1a1gLNZ2BJu1oJXRK//kjYletm0hQ==
X-Google-Smtp-Source: ABdhPJx7/zws6KLGPFpwFrYcSe8iVmMj8S9zqwZ/F4wOUpW3c9k6Asn11IQ5CgofhWgBWpwZw4qESK1TWiR81c3LGpU=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr4438069edb.204.1617801951534; 
 Wed, 07 Apr 2021 06:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210407102021.95225-1-dgilbert@redhat.com>
In-Reply-To: <20210407102021.95225-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 13:25:12 +0000
Message-ID: <CAFEAcA_cjGZUUYUzFygYS3NKXd02CwrtmK5U5fqF-oz5wAddGA@mail.gmail.com>
Subject: Re: [PULL 0/6] migration + virtiofsd queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: huangy81@chinatelecom.cn, QEMU Developers <qemu-devel@nongnu.org>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210407a
>
> for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:
>
>   tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)
>
> ----------------------------------------------------------------
> migration+virtiofs fixes pull 2021-04-07
>
> A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
> a migration test fix.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> ----------------------------------------------------------------

Fails to link on non-Linux hosts:

Undefined symbols for architecture x86_64:
  "_ram_write_tracking_prepare", referenced from:
      _bg_migration_thread in migration_migration.c.o
ld: symbol(s) not found for architecture x86_64

The definition of ram_write_tracking_prepare() is inside an
#if defined(__linux__), but the callsite is not, I think.

thanks
-- PMM

