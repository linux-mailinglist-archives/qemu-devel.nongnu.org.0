Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A213DCE9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 15:05:07 +0100 (CET)
Received: from localhost ([::1]:42454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is5li-0000rD-3f
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 09:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is5kR-00005G-Rd
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:03:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is5kM-0007Nl-Im
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:03:47 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:36032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is5kM-0007Mz-CY
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:03:42 -0500
Received: by mail-oi1-x230.google.com with SMTP id c16so18950308oic.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHjHSZeyddH2/dJdvpSQdT6RjGQaBZ3Y+7LxXdW/iLY=;
 b=QZiKyjo3wPDgug6+oXJEYEG2XhbpW8MqBpCDFQbtSOzIa1kaVLRc3KWxzOb19/P6Yy
 R+S6S30GlKiHuRDFyplR53ieUiNNUB9YmRc//c6joJmDd12kT7fSSgRllhiaeq0tMrRq
 d6NDIU85ali/sV32aveyxtWlEQII7moFA3ZXmAjGyAeJmO1ADuEOocbhc8qwTIx0uWni
 GWkPOEgTsHhkhIiOiiAfc+WfT4A1DC5QfTGHG1xVH/UatxeOtbsMzTJ7eUhv6f59+kM0
 89/zU4xLIUQ+KzLAbhb7B1MwQeA6MHZ9LLP26BoUuDt/lNo0hV19EWNmY6g6uZXHKoTN
 qIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHjHSZeyddH2/dJdvpSQdT6RjGQaBZ3Y+7LxXdW/iLY=;
 b=BeFNY7vb/lU5NgHp8J+W5LQ+fj6gCPloCsm5roRBOe54JQnRfzRV+ls+tXhJDakakn
 xojLkD1Kr0n6oCip5wHpi3KwQi9lF8yEnMC6yKxjl8ioW40D/fHKzjku/RkDUNKxABHs
 zk6tbO8Uak3aUynBgbCtfVquQugiz8W5XHm/7gpr9rAT+moT0/CU1sRzdGcRHGZkovmj
 S1bRGkbSYQYQtOM/P8Tftqi0KCIKEQ+9nty40ojr7x/LUp9j3oSX2E4+0nY8dQnd6V7U
 +iGLBh3PfFq/q/P93PFQatFPp2Ptbyd3Yile3nf3vjMO3Kj0KIhQbPSEgrojimfz+DDp
 rpYg==
X-Gm-Message-State: APjAAAXeOJngqNc0U+/rH2Ez5E98gmX6rM9+UDm/SmOjfK2lERVwUvzO
 mto7XNG4b+PG+k4tXTKeovNKTsCX3Q9VZOYhMk8ke2YymPE=
X-Google-Smtp-Source: APXvYqxzk0Cr++Qkh/uQCJFpFgfkEjZqZ6E6zBiWQPoH6Tn8tVtpOlE9JPXCRHDNG36vrrbzbOJQSgwbMrpyr301qM8=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr4179780oid.98.1579183420896;
 Thu, 16 Jan 2020 06:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20200114102055.24058-1-armbru@redhat.com>
In-Reply-To: <20200114102055.24058-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 14:03:29 +0000
Message-ID: <CAFEAcA-xBy90PsLZWtzRG2qvd+Jq9XzdWGb-kPVF38dDwJvcbA@mail.gmail.com>
Subject: Re: [PULL 0/6] QAPI patches for 2020-01-14
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
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

On Tue, 14 Jan 2020 at 10:22, Markus Armbruster <armbru@redhat.com> wrote:
>
> My previous pull request failed tests with Python 2, which is now
> gone.  Try again.
>
> The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108' into staging (2020-01-10 16:15:04 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-01-14
>
> for you to fetch changes up to 3bef3aaec91815b75a78a4c12ca92ac3cec53faf:
>
>   qapi: Simplify QAPISchemaModularCVisitor (2020-01-14 11:01:58 +0100)
>
> ----------------------------------------------------------------
> QAPI patches for 2020-01-14
>
> ----------------------------------------------------------------
> Markus Armbruster (6):
>       qapi: Tweak "command returns a nice type" check for clarity
>       tests/Makefile.include: Fix missing test-qapi-emit-events.[ch]
>       qapi: Generate command registration stuff into separate files
>       qapi: Proper intermediate representation for modules
>       qapi: Fix code generation for empty modules
>       qapi: Simplify QAPISchemaModularCVisitor


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

