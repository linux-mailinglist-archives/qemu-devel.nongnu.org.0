Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBB224D8B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jul 2020 20:42:25 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwrmy-0004B0-F2
	for lists+qemu-devel@lfdr.de; Sat, 18 Jul 2020 14:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwrm2-0003kM-Cm
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 14:41:26 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwrm0-0007SX-L2
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 14:41:26 -0400
Received: by mail-oi1-x236.google.com with SMTP id y22so10904326oie.8
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0CXYr4bvxbMJs6bl7pgmCP0kXFpEOdSYzqfCFyru3o8=;
 b=yw1CKfwE6a2Dp+Vyf8R6FN5Ouiu2h03CUNTmBZKHxrg65SEd8nLE341h0mcA4fcHw2
 uVzrokG/fYULqk6xPmwKhIG8fZ9UPoAm58foTxrppDsRSPhbNynPMu1e+EExqLgazmVm
 7LoBq2uM26zD6O37dadO/5pk6qASdp+v6foEC7rOlyY4fbIfT9jyjNZR/hF5QSsumy6T
 Uhb7fjXIUEMK/lwcEKpL0dwp6Zqezy5hMRIS2wKZk+UwpK994Bf7AOpAP8J6RT0J6rfV
 ghPI3fvAKAix65Uke+ItYWvnXqk3KUUYjvhB3oxyxp1wq1ArXa+zQwFv3C75TkHDWLDo
 l1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CXYr4bvxbMJs6bl7pgmCP0kXFpEOdSYzqfCFyru3o8=;
 b=Jy7vQaLs1YDmyWqlGIBGf1mf3z14ZP5a53PhGtEknTmP9jFt2KgqwCtBzUU23Fubhj
 DYpKTwluyIsdiorng28TEc7Hbyz/UWbMU6y5YRInyNbkr1Q4OCh5vE3rFkWvjkIyeu/7
 rlRf10sl57V15NyCBwecQZqbJ38rkOm3Dag8NOQkYYnSY8M0GJrygOAE+wonuhEfN6cy
 oIK24xyyVityFxW628/1tuivg0AflAF9j2Jpxq/LSyHTl9Lt6AjFo5Q8/+qVJv4jxqG/
 PslK+3WinDnrapJHxc6/B/iW/VoEHCc4Q7gY9PaAtoRJFpVrCOqOYZhqfpcuN6tpP3Ef
 IS6Q==
X-Gm-Message-State: AOAM530EfDdjkhi8WaHU+ujOgRlEXfvzW8gjxVeHgqKOEorT4kObShF0
 cPbCmpDbWLrc1nsDV7JUHgQmtkSa9Ta3GTRVa+LJKw==
X-Google-Smtp-Source: ABdhPJySSP1CpdZbrQzh3v39GXBq6IfBj4zHiXlE2EoAbLoInymfS24OwDypcYYGm2WbwfmLfmXyIdG0zyXJB4/jrkw=
X-Received: by 2002:aca:2819:: with SMTP id 25mr11304143oix.48.1595097682815; 
 Sat, 18 Jul 2020 11:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200717135633.791340-1-cohuck@redhat.com>
In-Reply-To: <20200717135633.791340-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2020 19:41:11 +0100
Message-ID: <CAFEAcA-2R1XKs-bA8MF8oyxAzffrXaiy0J0etjuWfAkfk+oQkQ@mail.gmail.com>
Subject: Re: [PULL 0/1] s390x: documentation fix
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x236.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jul 2020 at 14:56, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 151f76c689b1ff4c2c59e6d8469a0d4fe5346f55:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-pull-request' into staging (2020-07-16 21:46:18 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200717
>
> for you to fetch changes up to 9ece07d7a3941eeb845a6f000a191bba19557231:
>
>   docs/s390x: fix vfio-ccw type (2020-07-17 12:56:22 +0200)
>
> ----------------------------------------------------------------
> Fix typo in newly added documentation.
>
> ----------------------------------------------------------------
>
> Cornelia Huck (1):
>   docs/s390x: fix vfio-ccw type
>
>  docs/system/s390x/vfio-ccw.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

