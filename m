Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D75184D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 18:28:07 +0100 (CET)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCo6Q-0005LH-CE
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 13:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCo5X-0004oX-Pf
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCo5W-0003mf-Mq
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:27:11 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCo5W-0003kD-Gw
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:27:10 -0400
Received: by mail-ot1-x344.google.com with SMTP id j16so10903430otl.1
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlS/KgEldgg1X4r5CinQ+Kxoe8xp8zmOzsNcWSXcgBY=;
 b=kYZX1nSDtTGjcPh9jrUNM7UprOFYxUUTSNE+j7QnzQkeVaoeFkYt2YgAv9UXKviqOe
 KnhnSXRLKRjBO8mlOeXyVkVm1BlmSs9A4vnsZjcbMn49yribhAmTgQbmJUqoGg4htfhT
 grlisgJid+SIEAg6+Ser39Gn2G5nDuwFD2fI3CABvRrV7hszpeWk8IswMrB7BwIPyzbC
 nzG8RmqnLj8v6JKz+aZ20vqppjBipg3Xle+TUM3Po0hGzo+4j3xGSZSDZ2S0kOlnzyE5
 21WZcDAknPm8jEM2buA4HFFbfKBh33psUVdgR8I5+ZX9Fzfo8Csv13UTwBxZ2bZ+JO7c
 NFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlS/KgEldgg1X4r5CinQ+Kxoe8xp8zmOzsNcWSXcgBY=;
 b=ZAKaQuhdfRKXKaqYRP3+LpxE47mW/bu/R0Tb17bYyt2tI90uK/PadpRa5bunHekqmf
 9wswlcpMvJYfwrGLvaDBnc8w5qAAHrQxGz87Qtsl/vSV5byDmZtJmPrdJFFB3Jgt4iID
 WPwd2T+yMST8UzSLqaylGhExb9NaMQ7hMzdUoTwBzKWbRoc0MZAwZVbJD7e5HUcf7Hzn
 cmcvRX4CFpGAbXdORv7JgEO7/KnMYeuMm0N9MvCwUw4kPxM+USIeRhD4rBQcQwr8CytS
 fCwrJcKcm3f/JETKFfSQcLs9AJWrY4aLTQcZurKkfkX1CJn14fhq+VVrot9Ut8pFdWty
 Uohg==
X-Gm-Message-State: ANhLgQ0DnihPt/3gl3SvQg4v807FL8ZwfuBTfgMBZs3wtXNWM2uuJiJ/
 9xQaCnvP+OxZnDtJ3BoA1mp3qeG+uvsq/PWrOiM/aw==
X-Google-Smtp-Source: ADFU+vtmgxpijsnX0JuV9ba/tqbNlIgN5WKQwkDEarfbING6LwToj5l7ASdGQzWnof3un6xBGHogA7kbhkhYn4BdR+8=
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr12078813otl.135.1584120429354; 
 Fri, 13 Mar 2020 10:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200313170517.22480-1-armbru@redhat.com>
In-Reply-To: <20200313170517.22480-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 17:26:58 +0000
Message-ID: <CAFEAcA-3qnR=PYSfSdEQrkqWYdnpqvVq-mTjE=Xf7vsC+VR=Lg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Minor error handling cleanups
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Paul Durrant <paul.durrant@citrix.com>,
 Ashijeet Acharya <ashijeetacharya@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020 at 17:06, Markus Armbruster <armbru@redhat.com> wrote:
>
> Markus Armbruster (3):
>   Use &error_abort instead of separate assert()
>   hw/misc/ivshmem: Use one Error * variable instead of two
>   xen-block: Use one Error * variable instead of two
>
>  block/monitor/block-hmp-cmds.c | 4 +---
>  hw/block/xen-block.c           | 5 +----
>  hw/misc/ivshmem.c              | 7 +++----
>  target/arm/monitor.c           | 8 ++------
>  tests/qtest/fuzz/qos_fuzz.c    | 6 ++----
>  5 files changed, 9 insertions(+), 21 deletions(-)

series
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

