Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AF171611
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:32:53 +0100 (CET)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HPQ-00011U-Mp
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HMr-0007TT-0y
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HMp-00057j-SJ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:30:12 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35817)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7HMp-00057T-J8
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:30:11 -0500
Received: by mail-ot1-x341.google.com with SMTP id r16so2601307otd.2
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYzLKLN3Nigi/KIUqFSy3dXl2M8UMVgDHYTkXi/dM4M=;
 b=OQQh+40Xi/kLntFqpKmcz6AMVnL05zfcQwRI+UKv8qUP3dPrZxWRIhhf7yCMcTJBTH
 Ut6SJ5Vu7zhfIG30h+UyztX05r2E6nHOVG/k6s9m4bGeHLAiE9/nw4JP1IJrfAm2k2D2
 X5w4C67te20bSaLEfzMtDZ+73zX41DbCU1VoeQj7KEpyCEteYJ/IqYSx2XJVbbVNCy0M
 Oi7QJ8ZzOqxivZcfRKRh8e8qmtoMsS3FL5jgnanFZ75992UlA4IU+3BJE6/Qtm8gFv3O
 lbJwGcCjmBKs0m2qzkDdQwabPEjgyGI6Pq9ON90XAt9bqahJYbQ9QRX/eE4RiWqQH0vD
 kxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYzLKLN3Nigi/KIUqFSy3dXl2M8UMVgDHYTkXi/dM4M=;
 b=id/f+xHwnQFcBgjX8jq8418jA8JRixH1H4iF0N9IXpvR+NhewuH5rFQRo9p1Nd2Snu
 o5kRkZcUVJRbCQVo6Ct9VgWSYzuF0Nk5JPLvK0hHL0keuSg1RCc3rwFsS1vdhi3ySpdB
 b7LXcwfqv4zlMWOr9F4e1C77ZTSUOOtK2aSAQC6xmXC8reztaGwlzStYhsomYhlxbxnu
 Ds9dx9TnlNc31MbdiN/0clowBsGGmoYntoJlxIJA16eSw6GfQaAH8tfyDdN13LMP+5gM
 cG2dy2cczYWZZS9Q0UZhT3E0D6tmIDN8D6EsY3ajNrU+v2KH1YMja/xg70irB/RM4Tc2
 7tNA==
X-Gm-Message-State: APjAAAWwSIk9lHKbPH59VkxndfYiqDZKVyjxqBkmt4AJjHbUFuhE3DAw
 r9v9ZWMYpV4TeaIynwojAye5GW4O1g3GKjFKJUkjxw==
X-Google-Smtp-Source: APXvYqyrWkwscmmKTe17crle5qpf1WG2KT+LgkHC4t96dkIOUy4jEjk58Lfz8kCKCtRx0fXOTfHiD816BypWbcThmoo=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr2729159otq.221.1582803010299; 
 Thu, 27 Feb 2020 03:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-5-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-5-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:29:59 +0000
Message-ID: <CAFEAcA_7CO7Gzq1e9i=wr=E133YLGS=tu2V8vhVsvsRPK+gf4A@mail.gmail.com>
Subject: Re: [PATCH 04/18] qemu-doc: split CPU models doc between MIPS and x86
 parts
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The MIPS CPU models end up in the middle of the PC documentation.  Move
> them to a separate file so that they can be placed in the right section.
>
> The man page still includes both x86 and MIPS content.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

