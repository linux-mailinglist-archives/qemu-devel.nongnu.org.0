Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47259C641
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:23:45 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1zzE-0003lf-TR
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zy9-0003Gh-Gx
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zy8-00013A-Gw
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:22:37 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zy8-00012v-AN
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:22:36 -0400
Received: by mail-ot1-x342.google.com with SMTP id p23so9236988oto.0
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mK7Bm8jZeueEw55F5tr7uFjJzruMCF2YN6ZFMBAvKpI=;
 b=sPUyNPd/FqNZbOdl7vCSHq6ybId77vemcb9WFLCFd2Ed0EPnYIxe34XLWCsPMUxSKa
 wSpNq8YIwP1PdajuWGddTo82RGOAotBxHWAdZfMP4xwH+b79FKRpemi49KfpCsczRcTf
 3QHdNfNrBZEQgN58k4DkzaVzlKzmD3oH9zoDJRQwsgsuWTLYxnzZcwC8VmY0K/u1ooEy
 bM+amhO0FUUphs4Mk23ICm3k5b9PI7wmZXEKYkeRw5ujzqRpSYGlx1325yM0bEEx/XgW
 +6DWk0XtxtzMnQiVCA1ok70j5tYw5rZQL0skl+lm4WhLGFVTsX5x2/1YKCOov6T7SKdt
 JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mK7Bm8jZeueEw55F5tr7uFjJzruMCF2YN6ZFMBAvKpI=;
 b=sXNUbiO+1ug25JaHOWBVZTwqEaDAm2sdPHKFdHMUnYk9iGcU6NS4JnCegsCtrYSLjf
 cevWWPGuELZ0MSRjvumtDFivZ8utQXaIN/VfWv7vGufx+JM2CAmPQo0pZtFqM+pqCDd8
 WXhiBPxq1d1sdkQE2kboMwGnMbTYcpHQH34486llcdaXXoD2lY9HyP/T6KPYDJtOU3P4
 VwITKFBYy6rJRzWNa+7LKv/tcSzT6vP1PBPx9c9dxn5yyv2tlkaXSLCRLV/B+kojft8b
 DWk1y5S6bfOqyeyy7imNyxmZShpkUqErBinhOjK77eYp1whnrqW4aEDmBgwsEb3c9s0X
 jcLg==
X-Gm-Message-State: APjAAAUnoyf2Zh3QDXBBPE/107xzW1HUgUeGLL9DxneWk99S/P/WOzQp
 S2Us6+DfMt+rlbjqoKf/kENEN0AZAj6rHsnI1NnsmQ==
X-Google-Smtp-Source: APXvYqyjc5KpIBbesSft5iw9IqQcs1mukz+wDkD8CLZogfWeFnHChraZ1vXRHsTRXo4JEWS5XYaHoGYJPjf8/9XFXsE=
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr12162980otq.221.1566768155725; 
 Sun, 25 Aug 2019 14:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-48-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:22:24 +0100
Message-ID: <CAFEAcA_HZsEeYYdo2FpvV602ki-4XbyGr_+0tJv1PDRN=SeCPg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 47/68] target/arm: Convert T16
 load/store (immediate offset)
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 94 +++---------------------------------------
>  target/arm/t16.decode  | 33 +++++++++++++++
>  2 files changed, 38 insertions(+), 89 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

