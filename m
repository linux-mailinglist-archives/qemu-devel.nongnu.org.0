Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA22DD9DF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:27:27 +0100 (CET)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzry-0002HT-OO
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpzqx-0001p9-9i
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:26:24 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpzqs-0005y9-Rv
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:26:22 -0500
Received: by mail-ej1-x631.google.com with SMTP id lt17so39798509ejb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bC7UFxJlSSNC2EO3f+qPpOSDo+qzPkf642dAqEJ06UI=;
 b=F8EVeBSlNU3RcQewRPX3ECWkMxiFjVe5SfsHA1mQl9WMXe1FRAcDVy4EerIYe5URoF
 +Qg0Tdw2OwYpfuSn6qqyo96UUPrD+57JvtImZlnEFsluaL0cx26eKFPzWdz99LS0NZHQ
 S5p3a/aMAAtxjy0YvYE41RXyfak1dZzvNje2zfLcwQxE0FO2uqjEr7hW+D/KNiME9qtJ
 II432CXQPUQKgU6a2i0oPGyDgYr9tK7MtoG6yf0UScAKfJTU8xczLKCL9zlKw+X6tHLp
 mibdco3W0TTNE2v2aA+y7Q7cfQoPgoNZwsyLSeUaH/x+E/atjJRUB+0HFZvZK7eDieSh
 WMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bC7UFxJlSSNC2EO3f+qPpOSDo+qzPkf642dAqEJ06UI=;
 b=VaKzaqYDEe85WVfdnhjCzrHY5CHzTVx+P55VbbJbT2QDHSY54RsSC87mn8FxCtda4/
 1wW28gpzhR3swooWV0eH92m80qO8bEgrVcpD/ZU9DHr30Fr1D/zbBJqsbt/X5w0xH1rW
 gi22M5KtYKeDWbSTwP7A8ar9uzx7ECMlH8kxiD6fa3xlU3H5gi9BvSxHXB412Ndds0Y7
 2NjXEhi2LoWCqsarj3Py8DY2tLzDO1ApGqrNlyLI/XV1VQvqHtNR/RUy0Nk7cLPc8uq1
 r3kdTrl+rrjPqYyon9bN+MKLFq9w1ecpqFLiwu+pXGXQDTPBxSpGNIT4mZJ+74DpkgdA
 w5zA==
X-Gm-Message-State: AOAM5326g7tcfGKlejphFRatbFmZ+DVc7dfN69Hjb0IihMSDRTZBMUbv
 WDmtvePLowJMiOK5pPPEuk/XZsORwStDQZTNB2TFKQ==
X-Google-Smtp-Source: ABdhPJycaHjgak4O9tDJdDCLCGTZ+7flH9nZXpxOiJYaoUOFBHtddCLrCjiMNJ5GcChRNroYARDA1fXdnT8a4CdFOtQ=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr798339eja.250.1608236777068; 
 Thu, 17 Dec 2020 12:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
In-Reply-To: <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 20:26:05 +0000
Message-ID: <CAFEAcA8RyT58QCX=UpfGRrOvBZWAC7Jhvq0t+X2cAX7qEjhfkQ@mail.gmail.com>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
 (was: [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 20:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> (So in theory we could make CONFIG_USER_ONLY
> a poisoned identifier but that will require some work to
> adjust places where we currently use it in "safe" ways...)

Specifically, putting it in poison.h turns up these places
that would need to be made to do what they're doing in a
different way somehow:

../../hw/core/cpu.c:211:14: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/disas/disas.h:27:13: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/exec/address-spaces.h:24:9: error: attempt to use poisoned
"CONFIG_USER_ONLY"
include/exec/cpu-common.h:20:14: error: attempt to use poisoned
"CONFIG_USER_ONLY"
include/exec/cpu-common.h:6:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/exec/ioport.h:43:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/exec/memory.h:17:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/exec/ramblock.h:22:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/hw/core/cpu.h:1035:8: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/hw/core/cpu.h:518:14: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/hw/core/cpu.h:602:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/hw/hw.h:4:8: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/hw/semihosting/semihost.h:29:8: error: attempt to use poisoned
"CONFIG_USER_ONLY"
include/sysemu/accel.h:40:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/sysemu/cpus.h:65:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/sysemu/dma.h:34:9: error: attempt to use poisoned "CONFIG_USER_ONLY"
include/sysemu/xen.h:27:9: error: attempt to use poisoned "CONFIG_USER_ONLY"

That cpu.c one is definitely dubious given it's in a C file,
not a header.

thanks
-- PMM

