Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F7342229
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 17:42:45 +0100 (CET)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNICy-0006aS-00
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 12:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNIAN-0005sf-HV
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:40:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNIAJ-0007jO-Vw
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:40:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id bx7so11506057edb.12
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3klji1FmXjnwAmVav7aIHYxG0BX0zcCVY0eMfcs0DaM=;
 b=smOhA88eQ8s6m8X5dWuJ6szkgRw5earqb8VxNqVUbq2qEZ+ixLldfXFObKYDWX/AhP
 F/lCdf78ZzL/6zVLU0kanGAmSQ70klbe5SUkhqPsytOySvHm36oCTps0jrNf2NtqmxM5
 3OaxFhuIf52dLMRXfU4q/DKE1WKI8hB3ZuZWE/067FiWnnpmlxmwbk4iPyjkXNG6037T
 QFo2l55N3G3lfJQ3YSVToHd4f0EfiOY1osyR2/rP0vx+w5qq/PYx5EzeZlb1nZzjj4Vn
 l1/MRh5C8FjSrUMbMvnwI1yxPRqNSOh455BF6VQXZMpHgS9SVm4BdyzMm5oyHhwoq6Z9
 Tu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3klji1FmXjnwAmVav7aIHYxG0BX0zcCVY0eMfcs0DaM=;
 b=Hucm2+zSYUprXiRRALd1oe0WZWcPXZHbL/CrnYbFgNUSu57PhiUlXuxPHh8N2xJnxf
 17wwdV5YrYbjk0LeN6LdDvE4klKKs6Qvwa+mFudYh1k5dVPmbDJJNRd69Y99OVXkJEM4
 yZWUHhxE/4QAb1hiOTSzEgoggk3uSr4g7L3AhuS4yz7cfQoQik7pLLQCQfFWvn3RTalj
 Hn+wgTe+vCYTEPtg6UOR4w6KM1/qXRRy8JScsPIFffo8VWBsa1mzYSjv/ZMvB8AdrGAW
 Nv+bTotUpPtra5+Vh12BDwY3eWlGBYOvIFo7MQethi903oLs8U75HIfkWoXdES42EHdq
 YYzg==
X-Gm-Message-State: AOAM533YbEYhpY6V6dWQltdyVHSMMZ7Zm+TAXcVrOVZoeP4xtwDiE4cH
 mIVJoYpfnEsV9FVtdhB7p68GjpYy+/dbxH3WNJBfwQ==
X-Google-Smtp-Source: ABdhPJwm81AhBAcrIzgvexdHqhpiLAY3QIxuuk7BLtpjUcIPUkNSEdTBDTcrztv6pqVf63TXwwSw/FDwOVeLhtzkZSE=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr10431476edu.100.1616171998412; 
 Fri, 19 Mar 2021 09:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210319144312.2082946-1-armbru@redhat.com>
In-Reply-To: <20210319144312.2082946-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 16:39:33 +0000
Message-ID: <CAFEAcA-3UmJ5r-iv_hUXwKo4KRQQ9xxE+rXG7YmwgsL+FBekSw@mail.gmail.com>
Subject: Re: [PULL v5 0/7] QOM and fdc patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Fri, 19 Mar 2021 at 14:43, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 92566947b3ac5ca75f91a34acb188219c455fc71:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-03-19 11:27:40 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16-v5
>
> for you to fetch changes up to bb3c92ed105f0704ffd1cc1dc6031b6d457c829e:
>
>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-19 15:18:43 +0100)
>
> ----------------------------------------------------------------
> QOM and fdc patches patches for 2021-03-16
>
> ----------------------------------------------------------------
> Markus Armbruster (7):
>       fuzz: Avoid deprecated misuse of -drive if=sd
>       docs/system/deprecated: Fix note on fdc drive properties
>       fdc: Drop deprecated floppy configuration
>       fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
>       blockdev: Drop deprecated bogus -drive interface type
>       hw: Replace anti-social QOM type names
>       memory: Drop "qemu:" prefix from QOM memory region type names
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

