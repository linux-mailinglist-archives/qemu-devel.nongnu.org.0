Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61B1127C56
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:15:55 +0100 (CET)
Received: from localhost ([::1]:56627 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJ4M-0004Ev-5g
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIph-00009A-HH
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIpg-0003pD-31
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:00:45 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iiIpf-0003n0-Qg
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:00:43 -0500
Received: by mail-oi1-x22b.google.com with SMTP id 18so3784032oin.9
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7tYwsPLRFtYT+gosi+FZ9G04KAY4ATDB/3QakomYNjY=;
 b=tP/XeM9OYBCQD8W+9kQndcPQUcZKsCTTHQwc254gfMkxjm4Bit5Jd4ob4uAwttQX27
 Nd8euWQK9P+ntfHkm0ex17IvWcTzMziQ5xaoBLzhwBX9ja5pej6elk8sTdYJ/lUcxBZI
 qihPYkJtUfWt0gtkltQXfTCadf0FEg2bljMSaNGYzJHPvtiED2dn2J737iUP38k7MB6F
 9Bews8hbZA8PK+w26S7K3TBi0+qv2Kwm6DDjyTtyYtaOJEf3wawIIF+BoIeCr9FzJ25W
 UmrS2UqxIpT6Xn3wfc7wvwU5jjZZ2UJYlY6hCFBGuE0ip34rjTOAPbA7rmAsSp/OyQKm
 FQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tYwsPLRFtYT+gosi+FZ9G04KAY4ATDB/3QakomYNjY=;
 b=IZ57pj/gKkW9f3MAax/0tknIHzyGV+KmIlUndULhmlKFcU2tYmhq3gEzpRjJodUo9K
 Y0GrGYjaWi16pP8t7mqY9ujtXRQDJFWngo+YvJvmKhyw/EKFXcl4X4/iZdHKowSc7EfF
 ll4RI60CNAOvPXSUyQvE2AprsPn3i0EQstK45bIz40sb71ArUoFubRxnTL2Yi4FvkjQz
 vkjuNJtKQBHLRnRmCdK+Vfk3DD51yhvUmwknh64+l5ki26JfaWy0Kkbbo1bFDlVnwcOB
 jVcjObe/QPX7ljSgl7BJJIpoeR8zB4Gp/jUAtUTmT0IiJnZzhcozREwPx9NJyj50ayuu
 TR9w==
X-Gm-Message-State: APjAAAVpMl4zVUiPuCqbVQ98cr93EuHqSM83PMsKQZDdsS+DuFXWee4B
 h156D3rKdKV2otfVxzeOMhK1JKW0CShaxVn870+Blmuh
X-Google-Smtp-Source: APXvYqzEdTf5R6y51LQzsdcn3m6qUo+eRMdrICORD/yeyZOFGKjIC13QtKIdokED53WP3om4kbY3kty/FL8cCyQZq3c=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr360707oid.98.1576850442632;
 Fri, 20 Dec 2019 06:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20191218130105.125981-1-laurent@vivier.eu>
In-Reply-To: <20191218130105.125981-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Dec 2019 14:00:31 +0000
Message-ID: <CAFEAcA-k+aahB2Sn+ON9T71HHwKa_vgcmtc8tkwMASx1tfoZgA@mail.gmail.com>
Subject: Re: [PULL 0/7] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 at 13:03, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit aceeaa69d28e6f08a24395d0aa6915b687d0a681:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-12-17' into staging (2019-12-17 15:55:20 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 80bc935eaaf93e5b9a4efe97abd7c51d645f2612:
>
>   qemu-doc: Remove the unused "Guest Agent" node (2019-12-18 13:31:01 +0100)
>
> ----------------------------------------------------------------
> Trivial fixes (20191218)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

