Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5E35A5B8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 20:28:11 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUvrW-0006RS-2z
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 14:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUvqA-0005x6-Af
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:26:46 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUvq7-0004xE-M7
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 14:26:46 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l4so10076600ejc.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FPQcNPsG5Y3BinA4iJazp5w+DVlfy2ymhPZCKdH3Y3I=;
 b=QMfN6fMEq/h/g/p3SdhwnmTqTjcfrehQmtjONe/9xmWrTwqekNencKcDdxXLjRa/Mj
 LyHhP6RRQ6pC0givKnUgVC/dxEPulfphH17BU0TG0V9/GAIkO3/wCQnZyn39OUV/sr/Z
 WibpUNbDuc8bjB4WnQvzkSl5jXeqXlrRc701KBH25VsnyraQ0M0w2Nj5yvXXeurDK+DF
 DOf1dVi+IwUCYYEfif+tbKz0O3pAGg9o3bcZX/HgCqZK7VF9kv2yr8INKokQLcyAJOE5
 SXZG6z80zDkG8F3BSSRjLlTw8BvzWaVnCLeA48wsaBnc7/4Hbcj7z/+39tj3zxcXo12c
 3w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FPQcNPsG5Y3BinA4iJazp5w+DVlfy2ymhPZCKdH3Y3I=;
 b=fTr09CUgYc6jjs9fj8EVdFPiUqcsliMJcp39kKn2F87aUFLJJwY7R7pBezfbghaxxC
 an5UG2rLxcg1wtP7ZQzrSY7gpWVnhwTk6aTfY8VTJtPaUvpMnxEdJ3231wS+9tryx9vm
 kostN2LhxI2PfTQuWsSylWEMEXr9y7SnZj3S9c3cf+MP3xCrzmQlre1lcdH0PuOfjzkr
 krhmGFqmomujjs5BtoxmiKaeHpz4hw7JxEGchFtN4cF8MaA25q0I1bz2foRm5fLjUBUw
 bP8sp0/MvXwybHYzEqWF/D2joUbfO4lZ5N4BlRh4FGwmb6Iufh50PSDm7y2mcFGURuqV
 01SA==
X-Gm-Message-State: AOAM533/r3RRds+p/8CR70nAWrBK2n8rTkAEPgk0MUW+Bi/P0miR6LE6
 yUwSNM+l1GUo6+ISDNiQ4Xxj6y/jqHh4FF9ANPKb3g==
X-Google-Smtp-Source: ABdhPJygDzncEoyC1SLRoxaR8WbFMPmekaaVxDHi+3tqUI1pUOENNyNu96Npj35KMcAlJ1vl4+zf+cF2cVE0F3bYGPk=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr17219532ejh.4.1617992801057; 
 Fri, 09 Apr 2021 11:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210409144858.278553-1-cohuck@redhat.com>
In-Reply-To: <20210409144858.278553-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 19:25:59 +0100
Message-ID: <CAFEAcA9KRy_pXLNeJ7dVZA=SaTCqe+EwSiYa+ZNEkmQnC+GrFA@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/1] s390x fix
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 15:49, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit d8724020dd13c88a72fc391a6a2cf63abbd3dcca:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210407b' into staging (2021-04-08 14:00:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210409
>
> for you to fetch changes up to d895d25ae2bb8519aa715dd2a97f09d4a66b189d:
>
>   s390x: css: report errors from ccw_dstream_read/write (2021-04-09 10:52:13 +0200)
>
> ----------------------------------------------------------------
> One s390x fix:
> - correctly handle the case where the guest ccw payload points to
>   invalid memory areas
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

