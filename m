Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F39006E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 13:03:15 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hya0n-0001w2-Sl
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 07:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyZxq-0000xr-2Y
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyZxo-000247-He
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:00:09 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:46715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyZxo-00023j-Bd
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:00:08 -0400
Received: by mail-oi1-x232.google.com with SMTP id t24so4460684oij.13
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9+X/p8hzavvFD84MoUXoqHN4vwHYTVvPu4jvhHawHk=;
 b=Aym1y65xOM7KCMXTdtDaY+ZwCLcox/l1OOVMjUJBBGIpaiSbrNRmiqysDnUXdl5HKq
 VK3K9aBE0vMzle1wP1cwnxvhEb3HeNDEOpteuxScj1s4ufyGGFfi2OVYw81utxp5F3Q2
 sud33hIAc0hRwxx6nr88jLyL4xkY5nurxG3OBlZzcMXvVlRqTHMNVNaq8wWg4jVYnDh4
 8qMqrW4SgoIc7dgi6Sm/gSSlONNU9q5d79FD6V+IaGgN1oy2G9p7zNHnSR9LG+snFDAi
 gNuNQ5TXRFKBQ9YbGcpIoi4oETx/BglPmlKNIsn9kI9h31w3J8LMjJeb7DKqBxhaWLHn
 6xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9+X/p8hzavvFD84MoUXoqHN4vwHYTVvPu4jvhHawHk=;
 b=UNlN32buXNPPL2ilH7vxkc/VgNB6Y4nGDSyd1hCKyu153BpnAuEs0NfyOY57DbeZF9
 TiT5i4PXjRWzEcFIivgoDjqdbRSK4c3/Dlw2mezORrtugSqlDqXleIRjvyFNF7jQPVTZ
 UxAJBFbC2A/y2+Gkqu2plKsszEJQv6kADfSpFSoJzwuWGaWqhSZaR4+4//YKE/CJBucb
 n/Kv7KwiLzx+0napFd0QuQtjCi9IA9Z4OwDXDWk0jaTPTFmrEgbINchMjR/qzJF6vTjI
 on5lpNDxRTtCOmJ3c16JO4C9vZEn3HV5NeYWugK06rweaZbn0uYzMP+c7b/LKB14RBZe
 Tlzw==
X-Gm-Message-State: APjAAAX9S9+upQW3sIbe1aHKDhM2EFySIgobffztw0vV1XaNpn33N+Td
 tdc8sAm2wRCK3/8XtcGk6AJVpu9HVnXQ7Zy02dLNWw==
X-Google-Smtp-Source: APXvYqwR8WMH/MvO5zANte0RZHM+rizXhdAsOxEj55gUjpdtlAkNtfjoJ0jfB8M8DtyZMlnGrHKPJ1g2MghC9ZSbgl8=
X-Received: by 2002:aca:6185:: with SMTP id v127mr4702674oib.163.1565953207219; 
 Fri, 16 Aug 2019 04:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190813154653.20568-1-armbru@redhat.com>
In-Reply-To: <20190813154653.20568-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 11:59:55 +0100
Message-ID: <CAFEAcA9L1yA==UV__H_bkC+HBKNB1vMtAXidQsbNwDGSt6Yokw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-devel] [PULL 00/29] Header cleanup patches for 2019-08-13
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

On Tue, 13 Aug 2019 at 16:54, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 864ab314f1d924129d06ac7b571f105a2b76a4b2:
>
>   Update version for v4.1.0-rc4 release (2019-08-06 17:05:21 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-include-2019-08-13
>
> for you to fetch changes up to 8d111fd683b678d3826e192bc07ffcc349a118b5:
>
>   sysemu: Split sysemu/runstate.h off sysemu/sysemu.h (2019-08-13 13:16:20 +0200)
>
> ----------------------------------------------------------------
> Header cleanup patches for 2019-08-13
>
> ----------------------------------------------------------------
> These patches are rather bothersome to rebase, so I'd like to get them
> into 4.2 early.
>

Fails to build on OSX I'm afraid:
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1166:5: error: implicit
declaration of function 'qemu_system_shutdown_request' is invalid in
C99 [-Werror,-Wimplicit-function-declaration]
    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
    ^

thanks
-- PMM

