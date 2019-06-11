Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30D3D2DE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 18:44:50 +0200 (CEST)
Received: from localhost ([::1]:32796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hajtA-00023i-PV
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 12:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48397)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hajml-0004fG-9J
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 12:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hajmk-0008Bp-AJ
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 12:38:11 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hajmj-0008B6-UL
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 12:38:10 -0400
Received: by mail-oi1-x229.google.com with SMTP id u64so9466806oib.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VNdwwHkX7lNDqQxLoh+8yMqLxnk6wkKp0TbPmDU+gm0=;
 b=oA425SNoBdbTYcyKLHVvFaZr9j3x/9sokOcV/wYPYubP+iMGPlRxaYYBGgnX6WttQ7
 2nCw0wHI641fSX1Xl5jf9hUpKIHuCR2Pe+6Yx9STKYmLnxkXxeHMR1LVlICBnsm77FEp
 9NhOAEmjbw8Td6H4GVcgCafm0K32iznyV/BYgSG5z9BZW6a0yLEYYp6mOuZDQv1N54G4
 Hab8g394cdh0hZsEIrid0c0Ej6pBpS6/m9raSZL+dUuGAPv5wrssP2bpELaszzIwkv42
 mLA3v3rNrYvtdIa6NOtfV5x8TUU3NRxDgorBCVRfQHP1dPO2P5pL2qEBZwn4zZ7APbdp
 AmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VNdwwHkX7lNDqQxLoh+8yMqLxnk6wkKp0TbPmDU+gm0=;
 b=k2CbL3xp4w1/MfSfzy/qPy7DM/TTAjX++sGIB31WDkyW6CEdXRTU6vaUIDXnL34fev
 iH83zJKT+3x6DNq93oL9EBbI7MBw0gj1LDXbzEI+oHJTiPy+j5T9tSPUC3+F/BHVzwfi
 qsTv/vW7ncLgY/cqS9h8AdNzUCM7pcjBZ3U1GpXj7KPZFyKyWFZ33WYmNQQZKKTrQ1xL
 vMsVrwhnpSsvV1Es6KySfEVTojHSfKEPcI47yC3ZBbG6glEBeWhZWMYk2HFFD7I7yvWV
 z2pptq06AtPxCSqK4HhOfiDmhPkAyu7ap8Gg+2x5a4wmGjxgoLNNp49z+/OE6xdck5zk
 VcYQ==
X-Gm-Message-State: APjAAAVVNi5c9W9LIBw3AWw2/ceLXaAKOzou8/CUVG+y6PE00RmoR9N3
 K6+dP6MTH9N/hZb1n/0E7kjCT1381IL1vl/ay8Eckw==
X-Google-Smtp-Source: APXvYqw+Nm2OP9qjYsjDWfrilWVK8csJjtBl2SKe6Rg+AgbRxX1NpR8zYTZa+eennVCEBBPoNtIa0X4bZ2DKAOabBa0=
X-Received: by 2002:aca:c786:: with SMTP id
 x128mr15525236oif.146.1560271088672; 
 Tue, 11 Jun 2019 09:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190611152448.29436-1-armbru@redhat.com>
In-Reply-To: <20190611152448.29436-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2019 17:37:57 +0100
Message-ID: <CAFEAcA-i5kyUp_iGkWMGQvbj7xXqmHkfiKvkBmcubBW_VuadGw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::229
Subject: Re: [Qemu-devel] [PULL 00/12] Miscellaneous patches for 2019-06-11
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

On Tue, 11 Jun 2019 at 16:44, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a578cdfbdd8f9beff5ced52b7826ddb1669abbbf:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190610' into staging (2019-06-10 16:09:19 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2019-06-11
>
> for you to fetch changes up to 143a44a4695049223df38335eac72ca30d933a5c:
>
>   MAINTAINERS: Polish headline decorations (2019-06-11 16:46:35 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2019-06-11

Compile failure, OSX:

error: format specifies type 'char *' but the argument has type
'<dependent type>' [-Werror,-Wformat]
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1448:38: error: use of
undeclared identifier 'QEMU_COPYRIGHT'
                                     QEMU_COPYRIGHT]];
                                     ^
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: error: implicit
declaration of function 'qemu_main' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
             ^
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: note: did you
mean 'qemu_open'?
/Users/pm215/src/qemu-for-merges/include/qemu/osdep.h:463:5: note:
'qemu_open' declared here
int qemu_open(const char *name, int flags, ...);
    ^
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: error: this
function declaration is not a prototype [-Werror,-Wstrict-prototypes]
    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
             ^
4 errors generated.

thanks
-- PMM

