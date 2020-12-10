Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F072D6690
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:33:50 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRhF-00022C-TR
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knReE-000193-68
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:30:45 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knRe3-00032A-0L
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:30:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id i24so6752474edj.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FeWFQXPVGQi2VhUWi52UZJuGCQ96aIWJzCI/mg+dQI=;
 b=IGBfiEc963FUSMKiK1YGunS2wpWHJAyCjk/Vk/eQLZnBWFQPEyR8/h6Djzltda9yE5
 ERutaCAn0NUcqcpTOB+SASRYYINGX+nuo3iD/h9W3jUCJ+fIhopIs8RK0wb2eEbOjwUn
 7OBeYYJnFf6q0uLdaBEa8CU8D7fcxv+es/fvxF8tjEwrezawvhJBsdIxxgi1TVR6gpPq
 I+aR5DX5r32jV4/4PN6tnPrOa9dCnMmZt2Hm5jHDptbbj0ksykS356Etu+k0KEHeVhgv
 GXDLWVmbCVjeVt4J4Op0EoZHei2K7Zw91OEXeF90S6Pu9ydY8HD7U9bbkrZd7UQB1zjR
 DB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FeWFQXPVGQi2VhUWi52UZJuGCQ96aIWJzCI/mg+dQI=;
 b=qLOjF+UFPZk32mCt+HuPd48W5bUYzudteaT8z3OkdMid5JpmNeWa/u77ioUeNAO2Ru
 GHYlP25ZtFr24vPVGB/qK/Apa06x2yD5VduYwLKcRPVk2ZGH+tGlZ9Yf5KYXCCxMEM8O
 kbsim7mTnLrDzOZjyxFzXzb63W4ue+Nc9KsNq3CWlAo6zABTIekLRYOyDOHiSprvKy9u
 TrDNU6GIGtX/9BGs3okb4+n3XFS3tyOyLpBGJRaLMSv0SXB0nGhvggE/7+ssQsKXYo1w
 EDQf6tLkJY3Hgr7RyIbjnp2mygPZk9VyvdhPbK+N2gqcWZx27lGuyyoWzLJYWLeZWHu2
 0W7g==
X-Gm-Message-State: AOAM533SHmhBG3RVkpsu8svPWlcbrKmQgBk3EFQh0MQHSDvvHdpqvDr3
 Q8JEJfDabouR8dwe18FEcnR12n+VG3kEGfZM1d+eZQ==
X-Google-Smtp-Source: ABdhPJyoRKxfUU0O7UIn8KuMBLe9EVwkeAsT2mUpEE8QAqOJAkEoZO/vE9YjeCSmuRvT+wdmvdJDcpSrzHMy4j1tRlA=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr8222799edv.100.1607628629412; 
 Thu, 10 Dec 2020 11:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20201210163132.2919935-1-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 19:30:18 +0000
Message-ID: <CAFEAcA_tJVOTZXCyYJrXMLiSeZDaSVXDR466hB6OhWvJ0nCx7Q@mail.gmail.com>
Subject: Re: [PULL 00/13] Miscellaneous patches for 2020-12-10
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 10 Dec 2020 at 16:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 00ef48ff0de9c3e5834e7e3f6691bbc80d08c114:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/microvm-20201210-pull-request' into staging (2020-12-10 12:53:01 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2020-12-10
>
> for you to fetch changes up to 4eb79bdf87206a223a7ad7a698af519d2ec75c14:
>
>   docs/devel/writing-qmp-commands.txt: Fix docs (2020-12-10 17:16:44 +0100)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2020-12-10
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

