Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF26435BA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 13:58:33 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbONF-0006Jj-0o
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 07:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOLj-0005Qj-CD
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 07:57:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOLi-0006Y3-9s
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 07:56:59 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43359)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbOLi-0006XC-2f
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 07:56:58 -0400
Received: by mail-ot1-x32e.google.com with SMTP id i8so18657043oth.10
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3r5492UabspWHO6XwE4GrFuY047mhIG6A24j5S6p9Q=;
 b=XPNlkWiK3G8g/78H6kgHm2h9vUyBZC3aM1qPsr79ucf82oZ4y0pz5yhEdMunqjZAc0
 uNtDY32t++F4ys0Hal1ctInsgEVjmDlIYzz4qhJSYwlCPySYL1re3Ak+C2hFpEzfgYIw
 OlTA0OD3q+KWsB79tpUKXlt/Js/zV6EjdTe+W5q1Xj9I3E8uXxVAf033+X1NjLRpSKaA
 Nv07SP1HduAJYjhPwY6IcLBnFnJEBK554EURRw3rON4tR9/xvtzEY5WPyoEAQi0kGxbv
 s4skceGRUEVyqOzuGbyVyQkfKmJrWLOdf2toLzphievSfPnrnT1loxR+lJRHbxoqvjE+
 ZJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3r5492UabspWHO6XwE4GrFuY047mhIG6A24j5S6p9Q=;
 b=Y5yNd8+2yea+DklVllxr8Etfc1rBlesTPYbWrTRP8LUco0ODRHabD1ZZACGthHqIl2
 T12bAqSOmgzQZgvgTTeriS4EXv/bwyNUYed6jV+j84msea+EXAMnf7UgRsmZnEo06d/M
 wE40bVfxu1mSigov87H/V2sni4c6gSLnV1pNZw14teWuHgn7fj4cKHetK0kec68tBAX6
 msN0GHeuKkmY96zB1KuQE7i1hJuFYcdhJzZZ1pQfKrc+1n7oM5FsgvovdOlW/JXstsK9
 FdtbRAS0aMaX/QECfrY6q6NDV1FAy8TWeC8CeDcPYw7XmSkuRVL0mV/Lsa884ORQtjaW
 7FwA==
X-Gm-Message-State: APjAAAW19OEsVb5zHd3omZkg91X0LS1Dzg6IAYL9ZnbW1XjnBa0K9SPX
 0B8d+pLTxGjvD9jnBZpChunKW6NvV2UBkyHeckbqZQ==
X-Google-Smtp-Source: APXvYqwKqwRXQFQfHrRekOFucV778kHx8+79SQLfBQwlEORJpDwgfJ4JlZtZe/N+ADztC1kFObohCXD0wMAdgT3sJ84=
X-Received: by 2002:a9d:d17:: with SMTP id 23mr41873275oti.221.1560427016894; 
 Thu, 13 Jun 2019 04:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190612165229.26976-1-armbru@redhat.com>
In-Reply-To: <20190612165229.26976-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 12:56:45 +0100
Message-ID: <CAFEAcA8LcVEf4JQ_s2_L=rrPAA4jAnbk7-t0A_aEeSfXuBdTHg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: Re: [Qemu-devel] [PULL 00/11] QAPI patches for 2019-06-12
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

On Wed, 12 Jun 2019 at 17:58, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a050901d4b40092dc356b59912c6df39e389c7b9:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190612' into staging (2019-06-12 14:43:47 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2019-06-12
>
> for you to fetch changes up to 157dd363955b961ef378eb1f7817c31a7fa94d10:
>
>   qapi: Simplify how QAPIDoc implements its state machine (2019-06-12 18:37:17 +0200)
>
> ----------------------------------------------------------------
> QAPI patches for 2019-06-12
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

