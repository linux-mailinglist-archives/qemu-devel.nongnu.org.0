Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5819B5A8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:40:04 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DXf-00065C-IV
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DPh-0007VZ-Jm
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DPg-0005jw-LC
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:31:49 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38816)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DPg-0005jX-GF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:31:48 -0400
Received: by mail-oi1-x243.google.com with SMTP id q8so7309560oij.5
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1WwUpIyiIJfVQIp4aZAQTCnturoa3nri/sQ8XonAXU8=;
 b=nAgojLgSwMLqL4BP4tkh5A8dW4tJSYpWPqXoKHrrI9cJK4oH8VPONoW7hK7UMg8LTO
 CNMFTIL2S+NAOMFOhnzq/RnNcQg+tWFqK9iL1JZ4Cql53m0X5LqvDjDnD9MpRRFLeu1R
 5wpFqt9qgJfuxA6wJh6H/uBHhlZOmoAISYMFBZ+rThM+Xpi00MxkUZYmsjmS6xZm+T8s
 k8hWOc/ETDe2jU9kVUMtOT7Tj1zz6h8vmrhtrfY14btguR8ZPnerypVQJi3i2L1LSVMQ
 4W8gcOdMntEw6Q1stslm9mFCbsXF0AikRZlfBqVHZQSaaugDvm6clqnFi3CTO+pHZWI1
 A1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1WwUpIyiIJfVQIp4aZAQTCnturoa3nri/sQ8XonAXU8=;
 b=oGMeZmj4h9RQtWkasJg+0rsJivA1kVmEg95uQcrzpW6RLkSZtaa7g13jYN9rESaYI2
 WeZuFq5+F8O3sK7uq67czrUiILhaBHGAEcR/vundvDNTdbmXYIpIy9/j2Wi8LqVrlgKR
 ljbsNlaELfDJ6EDYPp66F1UonrgrDflSs22/jnKb9fW+a8qzQY+cT3utf3moVK5ujvpF
 D6Nv4jX/0aTmmDb6DGSlZfSV63z5MCTREJkQK1VHs4CmTNAr47u+bPH0Ck7eMG1OmFdB
 wTXScrM4h4olCw2iZaOXUkA6BGwIwIZSy3B/W8AVCaJjxfd5SqKhhVkB5LYalHL37SBG
 FTYw==
X-Gm-Message-State: APjAAAWdCSzVbgLomr9f+EZn3WU7cEL4Qe1k96VoBrZ17faCxZRNewzR
 AJ2KenfeCWu2a2QFjpCaBnyW4xKR0tI9VbmqNS+IfzlG
X-Google-Smtp-Source: APXvYqxFE4kvjyC14pEtu+Zvjf16t1RCt8alNIVndo2uN24IoeQM3FG+K3LpkYh+LTgK1Qllegbk/XAFGV3mrHa8tOg=
X-Received: by 2002:aca:4b86:: with SMTP id y128mr3968587oia.163.1566581507620; 
 Fri, 23 Aug 2019 10:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-31-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:31:36 +0100
Message-ID: <CAFEAcA_NqFk9Xpmxk_rG8KxUYQeV7gSVp2JAwHRt4Q4h1jJe4g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 30/68] target/arm: Diagnose base == pc
 for LDM/STM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have been using store_reg and not store_reg_for_load when writing
> back a loaded value into the base register.  At first glance this is
> incorrect when base == pc, however that case is UNPREDICTABLE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

