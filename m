Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A776FAD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 19:22:09 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr3uy-0006T8-AT
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 13:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48075)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hr3uk-00065l-9k
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hr3ui-00039b-Ah
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:21:54 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hr3ui-00032y-4i
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:21:52 -0400
Received: by mail-ot1-x341.google.com with SMTP id b7so5931754otl.11
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1byvF7L1dTQshtCgWGpHT/qQzbxmO/4jZWys+j/Pf+E=;
 b=uN8Nkctt3azySxxTDv3Bo9zpsJHw0UQE1daRsJnNpDGQj27m6YJ2TVzldSs3cobqHG
 L8Ic6CRMpNQRaOuOtI4cGn7DMIxSHZcSUBmawzP+mHfQq3PVWOmwrz374NccOkENPNrZ
 IWu9XuQwBbjr3slXxoEo120xWx3J7nlLiyzp9qRWjFtkRXxmfesNtaefpOKs14fGGKT4
 iSjmxaoGC+gpHOkcixO/C8fY1wvgRJQbe7L/Qmw9lafHWwHRr76uyP1Y4lE3gYYPLmel
 8Lm1dXE92Jc7wClMWA3Zl/TNEzcbIAueAmbZZ4P24TeDMrCceef9tzAnGrPU/7nOYGdR
 Ipbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1byvF7L1dTQshtCgWGpHT/qQzbxmO/4jZWys+j/Pf+E=;
 b=FrbMPPZpzhwXfh3eRrKuvwSnEn/CgR7vvqlCvsV2iBbuWS32YaN9CdjFlQd9eaOBiW
 5P90K0DCMFqlLCRm7KeAp17Bl1HiQtqVdNP3Y104GmKge6aVit6ato+l1MLIkBr/Zi4L
 zrvf/jL5JNLLW+V13oomZj0DlDSVoxiFxFB759m/5eUF9ad200DwqLg1AnONjR3PDb81
 bSkyYhk84S0+gPSkyFQI3fwlXEr8ocD2iU8/10kBMuyB/KjDmdwdbhPUHjAcMx2SzQ3x
 Wqe8eP/Ox+FwOm3rwj3W3jYmXHN1E4BftyHsn6dRzDXEaUiHp97Xz9X4OPp/+mambX4e
 KnCQ==
X-Gm-Message-State: APjAAAUywQj44fAlCJdU5JsNd0lREchFpE7+JmnUXok9VoRgN4nb3QwH
 9FtamirzVAW2l1EA/UiQCG+utmhhk7+u+IeLvPvfbg==
X-Google-Smtp-Source: APXvYqwjY/9APWIdIRPDFtfg8P0+i9L+oilxcswi8O9tO5FQX8CT71E0CqcXacoapzDIr7qb9dIKIvsOn8llRXfNydM=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr22576567otk.221.1564161709980; 
 Fri, 26 Jul 2019 10:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131645.19501-1-peter.maydell@linaro.org>
 <4045bd6c-6bf7-356f-a62e-f2f4f61a948d@vivier.eu>
In-Reply-To: <4045bd6c-6bf7-356f-a62e-f2f4f61a948d@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 18:21:39 +0100
Message-ID: <CAFEAcA-EzBQ8U-OQBCJLb_rNwpEqC-9_YNDPFRbprSeAVNV+3Q@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1] linux-user: Make sigaltstack
 stacks per-thread
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Jul 2019 at 18:17, Laurent Vivier <laurent@vivier.eu> wrote:
> Tested-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
> This patch seems also to fix failure of LTP test waitpid02.

Well, that's a bonus :-)

Could you submit a pullreq in time for rc3 (Tuesday), please?

thanks
-- PMM

