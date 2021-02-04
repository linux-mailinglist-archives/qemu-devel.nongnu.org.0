Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BC30F62C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:24:00 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gUB-00082x-ID
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7gPz-0003pz-Km
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:19:39 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7gPx-0001E7-Tp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:19:39 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g10so4625553eds.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqEVjDmWrYOUivgHg4bMlu5DvQZdTpuOraB89hWcKlY=;
 b=hYpiTDLVIRWfRnRKphQnLEkqFdOwpp0b0LCxOwUMeIuWkbRj+dtnqLH9ZO2gB69SiK
 S5ZmJLBI4LT9XUXLwybWJmNgbUpahZkmPfM4kZDixWIF6HaDvg2EbctsRbNlvKLxKtMS
 RfEHjbVmP5o1C3BoLFO7IqjX5oJ9RJhHOvHe+FH87gc67iUGx74Yc8Pg/Sw0VaHTtSDf
 5mzHktcLWbrcmDvQ6Vc9YV5EJXW4hH/t6G+ht5cAMANt0ByoQNqH7Js/8yWkfb8RnvNO
 Vy9X7F15Qypz14A2HJH6hGQqiactCnfNAkAw0NYzpOj7jDThfl+3yFwtuRi8pepFHQUW
 UmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqEVjDmWrYOUivgHg4bMlu5DvQZdTpuOraB89hWcKlY=;
 b=XWr/G+cOM0jDVnC5GIFN1qqabbistSuXBf2FXXDsq5PESO6ssc731g6YaUB5uCmX/9
 JYoXTaIS+TUzHrNKVNKUbMDUaLjCcDuy/L+ynsG/nlPNds0dSD9HBiuvq7KX7LNjEvbg
 Ks0gkKrzqFUBo4OIxOIplYh8K999qRr1JbJw9nSQ6K5ZkcGg+ncYQW7AsSx3sp6dz751
 qTFr4YnGFIRw2hrQ2V1RT+KnvnbwKY+PCNEMHMUSgzxqwochu1apJqaAOQMRsuxDjc3u
 VpmcbvE2Bio+BSwsMhzjy81yEY68P3JfB4ylAf8w2DWw/FEt4Ys5RkcKbmcLHOVLX8iP
 LHFg==
X-Gm-Message-State: AOAM532LTTKA7YsAxWp5sQnptHMvvTcRUrzeh2bvIVosfgwRW3E6tJy2
 wjaMiGVmzZmrKF42MtCSqzpONmthQGtBOSki6MQATA==
X-Google-Smtp-Source: ABdhPJyXRDJ/5KgocQ37PAVtFRV5kDG3s+1ulRh20RFkF8uqYcdBiTTfWjhIdJBfTCuLWNVRG95Zyn7xVoiIhU6B/vI=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr8386364eds.204.1612451976549; 
 Thu, 04 Feb 2021 07:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204140136.2769065-1-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 15:19:25 +0000
Message-ID: <CAFEAcA_GQ8EYJdJAssFG8x9rUsGeMG=R3_Zg4GBQ2E8zUFY9QA@mail.gmail.com>
Subject: Re: [PULL 0/9] QMP patches patches for 2021-02-04
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Thu, 4 Feb 2021 at 14:01, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' into staging (2021-02-03 19:35:57 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qmp-2021-02-04
>
> for you to fetch changes up to 88daf0996cd0488e93e67bcb0af258f2c24f117a:
>
>   qmp: Resume OOB-enabled monitor before processing the request (2021-02-04 13:20:29 +0100)
>
> ----------------------------------------------------------------
> QMP patches patches for 2021-02-04
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

