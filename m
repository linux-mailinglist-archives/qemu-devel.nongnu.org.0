Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FF154903
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 17:23:14 +0100 (CET)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izjvs-0003DI-Qs
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 11:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izjud-0001h2-OZ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izjuc-0007ye-Hz
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:21:55 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42758)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izjuc-0007wF-At
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:21:54 -0500
Received: by mail-oi1-x22c.google.com with SMTP id j132so5138968oih.9
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=jjExA/+lAdP0GFLnGUlqqZPgju3x+JrwDT4o6ie36ALHBcqxzCHLjHBm0EGKeZUfcR
 BO9xulremVUaVhDuPvmmSsZq8BWbKbVcpHxZGbNnWwbpvfuYTqfZnKTiFzjpueG+iWPI
 GFszHIYEope5cE3Noht9rLCRgxOEu3B2sdurN3vSOaihVSA2pmWrABVKVnvbO2QiOEvN
 Jqg2b+ovWWxYjECDwXdUibpobaj5h0EY4pI8KTZn33dSc6VZJuBSM+ao34/7b/uuzwg6
 P+MDWAhXSUvnO6BiZg3UFry4K/q/5krm+K32neAXKCbRTrgAaghwQ5zTDUr1MJOUOxM9
 Hxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=bivId4zsKjz2W6nuWh7J1HDwtQK7l7colUJjp4wqeDo33aQ8EK4UsTLpIEZVCu6BxR
 1aOEGuca+Fv9mZiO/yhdTzdVr4NRYrabivV773F0UkYmLpVuKlrAfC9lAtwnFCRzKTq+
 hGXkWVt1dtKdrP7PjewZD8rLliGUOsiJtBixrRid//mrRA288RIy9Ym4QLA+jQ5Oujw1
 jLsbwVGo6vHyUg0B7nh2YA69rvx2rx1twAmv/Kd+PufLgmDax/HbeF3myINVVUfKNaJR
 JR1Z/m3pvfBo6pkQ8eV/dcpTTsCSSB4xxk2usysoUilES1foHxfXt8NTBtUZfbYnEZ5L
 DKVQ==
X-Gm-Message-State: APjAAAW1nrrlxXTGMdPAUNshBv6BVibcLqXqZ2YzcgBxxsoTB3Z7FIyU
 dn8aNCDCnugdLCBEyOXERRXe6+1Cd2J65ty16+E0GQ==
X-Google-Smtp-Source: APXvYqy4Uiq/2N7lL/jTsZNffY5ATmhKfOfBmT5bOULjNf4D9KjDia8jCfYk39zMf1+BSiqlnoCF7kItsWmVApkUB6w=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr7280033oie.146.1581006113321; 
 Thu, 06 Feb 2020 08:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200206125027.1926263-1-laurent@vivier.eu>
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 16:21:42 +0000
Message-ID: <CAFEAcA_-8Qzamm7n6WBPZFHuMmMuHQ9fpzKZ+8TnBWQ0g=3vnQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Feb 2020 at 12:50, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7bd9d0a9e26c7a3c67c0f174f0009ba19969b158:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-02-04' into staging (2020-02-04 16:12:31 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 8ef350b32fe08d254f92a3a7efe89809397fff77:
>
>   MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines (2020-02-06 12:32:03 +0100)
>
> ----------------------------------------------------------------
> trivial patches 20200206
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

