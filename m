Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF89F06D5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 21:24:51 +0100 (CET)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS5Ni-0002nG-Np
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 15:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iS5Mn-0002FA-U8
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:23:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iS5Mm-0004av-RX
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:23:53 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iS5Mm-0004aZ-Lt
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:23:52 -0500
Received: by mail-ot1-x342.google.com with SMTP id u13so18843685ote.0
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2019 12:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vIC3jofyVopHem/NuW7s43eM7CpnThQVqDSTrY5ud9g=;
 b=UDaLfkbmNK0070n6aRZS4rZW5NrQvoEsZ0ncN6zBXRCYZUzraa0iQQ3kwbKJ8GfLGb
 kroHuZ+aQHEEofoKdUC40/sO2kXmg0sIYbwGi1qsSFqqriLwqFd5GjPK6jkbOfxWDjWh
 oPNy8GoVIm1MNEfLz6jgggRTyB+LmXmCKnerlGztK/050LvSNj76NcqB1+DpEWGfhr8q
 RrtO18g1S3I3sxenfacT5w92uYZm+OGg9Rna89sXz77zPdhORT6gkAFI92TL1KnzVstO
 Wtg9xaXv+ociOJtvNZMjH0eaUOlRi7t/5IQnAlocEbhjnIhrPpC7ApbSRReJuWDALWxY
 GQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vIC3jofyVopHem/NuW7s43eM7CpnThQVqDSTrY5ud9g=;
 b=gFWFRBYbWrb+UyZB7SGDzQDMWEfxvhlkNf88wZArM0iWHYaFS07ymeaHCZ/dSrOHHC
 HU6TDRXT5iQ7pNOs7d6BcARxQHIbja64fa33l4zRlt+XLBI5Jt6BUDtmrLoqzGUWOkpH
 l1t3/Gjzs55ZuDmQ+viupPTbozWQu4NOiKOAkOLrWhJs4CaFYgy+HtuwMiNo49vKHRjc
 iI9khu2X0kkhknED1QKNvsGL8D/X1pvXaXBA3RRjDVwZANCgpg5EUqDjg1H/7lFzQME2
 NtXkIH3EeQiGnqtVqP7DIbaZ5nFPwWwVsNmLXcTpFpdZ5yTJDXFlEkCReQQkEyTzCKks
 OKpQ==
X-Gm-Message-State: APjAAAWtp7Q7iK6Cd2kJdXx95XW5uCaBe3K3KZ+rZ8uEEM1tFQoNCrnw
 VJyK6Kjp9vtKrwOeCFli9XhWEOZXoUnpRv/2J8zNGw==
X-Google-Smtp-Source: APXvYqz3GCAwEned9Ck+iVrFgWXQBXnPDkZdh8OrBr7CJ13LLjhcRvTaB1eP4//sw0U0N60WUvLuv3xFUktTU3h9XII=
X-Received: by 2002:a05:6830:1386:: with SMTP id
 d6mr8213143otq.135.1572985431536; 
 Tue, 05 Nov 2019 12:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20191025090841.10299-1-christophe.lyon@linaro.org>
 <CAKdteOZ9dYWhL7GDofCTFuYqN+Z60Z_daUAzDTPdhXODTYP9xw@mail.gmail.com>
In-Reply-To: <CAKdteOZ9dYWhL7GDofCTFuYqN+Z60Z_daUAzDTPdhXODTYP9xw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2019 20:23:44 +0000
Message-ID: <CAFEAcA_wKJraQ7KW7PNFxf7quQ44w0mvkOaiojobU7s88rNooA@mail.gmail.com>
Subject: Re: [PING] [PATCH 1/1] target/arm: Add support for cortex-m7 CPU
To: Christophe Lyon <christophe.lyon@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Nov 2019 at 16:41, Christophe Lyon <christophe.lyon@linaro.org> wrote:
>
> ping?

This is on my list to review, but it's missed softfreeze so
as a new feature it will go into 5.0 once trunk reopens for
development at the end of the year, so it's not the
highest priority for patch review for me I'm afraid.

thanks
-- PMM

