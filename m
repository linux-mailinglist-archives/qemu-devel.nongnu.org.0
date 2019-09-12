Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD339B1637
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 00:17:51 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8XPS-0004XR-Be
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 18:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i8XOa-00045g-J1
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 18:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i8XOW-0007oz-TB
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 18:16:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i8XOS-0007lp-V9
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 18:16:50 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB33899C41
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 22:16:47 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id 34so15705355edf.0
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 15:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/XZiBUO7jjAPi4cLNV51o6Poa0KYuZo/C9SHNrLo30=;
 b=AD06h+sYkC9+xEm+J3LY6MJzNEm1c35nZeZUbjo/b2vNLFXXBfS7MNNB7CW8PsXz8a
 /ehmEzKGgEorawPj1r1ZVf29ueD2XArsOHzU3fMMz58IbcHjPJ0/ge3THx5Ajz2a12W5
 E8h1YTIdjOKYPZtHwyhJmRvm/8Q9PRTn8GCH/m2aDUKHv9/B+yiEWEwO84AdFwMRcrKX
 v38RXmA0ZiqkB6biTDUoulvGP35DocWsn4DL2kptziq+A/E8BAzbrx5C3sCM4bcevIsz
 s1sjeIt0adCYrcznb+Ww3LoQYynj8R0QUgXlFbNo4bOTva1Lz5f8wjRl/fXyn8deuhC7
 hX9w==
X-Gm-Message-State: APjAAAUou3qOgMwYBH1QrBGCM18KEKJYmOecIszW80lzMZ4eG4hOXo3U
 IHY3+9zMR/vfFiMz55DL+I2OKdNJL+L1AlpmTEThhAjv1mvnFHIaHnLyE8H3KS7HRJ2mavwVEzx
 dYGZ5jDK+bYHOhFM5PBITXIBGrKCvAYY=
X-Received: by 2002:a17:906:f205:: with SMTP id
 gt5mr32145195ejb.279.1568326606403; 
 Thu, 12 Sep 2019 15:16:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSS88KJGascjVmwLb2aBGAdv+6fTEkCjIwu4Ua93vdijMfCDpBOaCS8RCtnkCtRVYbEJo40anWWtMSWAXlaWk=
X-Received: by 2002:a17:906:f205:: with SMTP id
 gt5mr32145183ejb.279.1568326606145; 
 Thu, 12 Sep 2019 15:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
 <1566284395-30287-16-git-send-email-pbonzini@redhat.com>
 <46af8966edd45c163d7d0bd974f557cd@ispras.ru>
 <000901d56936$e10a0b60$a31e2220$@ru>
 <ae45ff2c-70d2-da6d-5f65-2d842f060af0@linaro.org>
In-Reply-To: <ae45ff2c-70d2-da6d-5f65-2d842f060af0@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Sep 2019 00:16:34 +0200
Message-ID: <CABgObfaznqy28SWGGjRsPhEOEnFD4JLinRoZMxy48DajSRKL3w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PULL 15/36] memory: fix race between TCG and
 accesses to dirty bitmap
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
Cc: "Maydell, Peter" <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Il gio 12 set 2019, 19:43 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> >>> Fortunately, in order to fix it, no change is required to the
> >>> vCPU thread.  However, the reader thread must delay the read after
> >>> the vCPU thread has finished the write.  This can be approximated
> >>> conservatively by run_on_cpu, which waits for the end of the current
> >>> translation block.
>
> If we are going to delay any read of the dirty flags until vCPU has
> completed
> any active TranslationBlock, then we can simplify the TCG operation so
> that we
> do not (ab)use the mmio path, and can promote this into the tlb slow path
> as we
> have recently done with watchpoints.


Uh, that's true and I agree it would be great. Die notdirty_mem_ops die...

Paolo
