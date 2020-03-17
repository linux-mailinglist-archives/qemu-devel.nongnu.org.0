Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A566518807A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 12:10:39 +0100 (CET)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEA7K-00081l-N2
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 07:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6L-0007OA-MM
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6K-0006ck-Nh
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:09:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEA6K-0006WO-HW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:09:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id j5so5237799oij.1
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=AKYFtF/g6sx/HiI0KzPvMFmMkCrG9HVQZwHH//m5UuO3M10DTjRrbinSx1ERjGgAIy
 IFJBbBo9FEDq+FYlh0xEv3STgi24H0e1TuIl2f0xaxHJPWvTr5ci+6VcJ6qASajowgto
 QTZr1eGASXUMcw8Twz25eewAXhdMjPdaUiKsw46CzKLWF15RZK+mYKmpTCOtSt+ysACS
 WHfGCZSLnNicLT8PU5H4DLccmFTS13K1OHrf3RcWM9ZQOmaXdVVB31gx19T/xfL3r5g7
 R01/EmMI04lWnYIUnT0hPYqgbNZ0EWVTISaSWBCoErPVTnwSG8LmKalh5AL0iCLVrfir
 b0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=FZXBoFj9jtryfHLgrJPQcFbHhB3osLI1ZSU5E8eFMA+hEB8joJmtQbzpj8cqI5AJFg
 wtMfevdeP5f5XnQYB+u8W2X/bcQ8VDBScxiL1TPBeAB6doYn3jlJ2O3alSnGkkbNkj/B
 bnQJz0FSTSemj90A0KrV0nuoVAieNEoUnzJGzMGm2jfZEUB38/aA+5PEzIfGWNOZbdrH
 iHa8AzfmhNU5LZzZ34zFo21jKIq7nP3kKf1zfhTJPaPiaOj0iub+CFDkW+HT02Bga8ba
 3kQvpvK0seGzOxWnOYktkKmu3Lun1TY/zZuxrM5a8PeqR5TQZvuF8Zhou66E7ORnKvLY
 95jw==
X-Gm-Message-State: ANhLgQ21TAq7Bp3ZElwYMWarKUGmAqw/ha83kg5qeE/etRHIRlG9SHN9
 ERBOB/wRj9xdYXlZI7I8KB3JChCfRn7WlECT3pku5Q==
X-Google-Smtp-Source: ADFU+vs2c9DxpS0l4trZekhVLc3xZAcpRkIj9P/idCPZL/Dwnk4e6YmgjRqCs9EAE8eGRtSGWMpvmCBrez5pnUn1SKo=
X-Received: by 2002:aca:190f:: with SMTP id l15mr2930921oii.48.1584443374646; 
 Tue, 17 Mar 2020 04:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
In-Reply-To: <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 11:09:22 +0000
Message-ID: <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 at 11:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> ping

Eduardo said he'd queued it -- I've been assuming he'll send
a pullreq for it.

(The followup work I was planning to base on this turned out
to have complications I hadn't expected, so I've put it on
the shelf for the moment. But this is still a good bit of cleanup.)

thanks
-- PMM

