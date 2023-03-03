Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889226A9623
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:26:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3XS-0003Nk-Hh; Fri, 03 Mar 2023 06:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3X5-0003Lg-5I
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:25:03 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3X2-0003V7-EX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:25:02 -0500
Received: by mail-pg1-x529.google.com with SMTP id q189so1236281pga.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677842698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
 b=JdlLeBN9mZJKEzV2VH1S1A56dOCzQMFoF3EFCCzNeJhuZ0/DcQj0FSt6e+TAwbQ8a/
 9sFQyrtfC3y9X0+7Ge7TFkFeBBu/HfLMyCr0TD5vmRswBGNsMR0KuPPcC/t+0Nxkyg94
 akiDWvTZlsZ6o+AnhgnxbxN5VJXTOyAXd8wiBQ9bH4agHMMI1JenET0Q5kr13rdOXADZ
 G0bd5vBN/KVFmaFe7hiFRlnnaJ3W1II1jZJrGujsdTk4ORgorIXvETWuDQmhj5fNAi6M
 LPDGI+bWQc7wCa2g+Sz+/eaGH3DArOygO9P4pmwO7LKLsiOARMLG0eSFMnIF41229i2A
 HYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677842698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
 b=7Mj8sjFYysJ6CfHHHrRf0npuSEZ/xjsW5Tm9o+7IuVut2d9ZEGwwYqi/v2jud0rvIq
 5XD2vBuTw03dNoqiT3vdVyuAXgxOVab3mfVNG+NZ1NOF0yX13FKo9Vb/IJA/00RdjtzL
 am1/OMWRawnq8KaG/PkwNFHPhMrjjciNBEbNtlmnL2Xh5Xf9ywjtPHL5AI1F/b/oqtI7
 ctwKoBGAfis9l4CZVlxol1u6MTvwEA2bKfNCoNY7Uz5m3Hxif/J17x1s4wvrPmQxe9lZ
 fx+aP9CYxkgYGaATNU5YNfRA2RzNe/Q1OAHKEkl8rPPDMUJY7ih+hJmkL+NkA4/TMSOj
 EM6g==
X-Gm-Message-State: AO0yUKX0+ujl69sAOi0q4TH+xlgzS1kVT64XybVsAWs1TI+sS0jPN/ob
 tQXx3EcUGMhNw0ZnteQ7riOvo0KOxAldz5VwDM4dcA==
X-Google-Smtp-Source: AK7set9TFhgmzEYff5a5Y/FhcSMZ3q7NzK7FxjJZYmiBpcpZypyz3OwZzAn3/jSFaGTGPE0QrSfYtgRzKg7q/DB7Eps=
X-Received: by 2002:a62:ce4e:0:b0:606:6380:98da with SMTP id
 y75-20020a62ce4e000000b00606638098damr729699pfg.5.1677842698016; Fri, 03 Mar
 2023 03:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:24:46 +0000
Message-ID: <CAFEAcA9cE087cowTodqAb2mkzGxxnAcBGZsMNu6uj_Nsa2v-dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, 
 Reinoud Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 3 Mar 2023 at 11:09, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hello!
>
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
> > x86 ==> deprecate both, user and system emulation support on
> >          32-bit hosts
> > arm ==> deprecate only system emulation on 32-bit hosts.
>
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
>
> Adrian
>
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

I failed entirely to get any traction with persuading the
kernel folks to provide an API to let QEMU work in that
"32-bit guest wants a 32-bit dirent but the kernel is
providing a 64-bit hash value as a dirent" case. Somebody kindly
wrote some kernel patches but they went absolutely nowhere.

It seems to only happen for certain kinds of 32-bit guest, where
the guest libc is not also using 64-bit dirents. So at least as
far as Arm guests are concerned the effective result was "the
older arm binaries that were built to need a 32-bit dirent are
just not around any more, so very few people run into the problem".
You can also work around it by using a different host filesystem
type, I think.

thanks
-- PMM

