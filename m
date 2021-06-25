Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5230D3B3E46
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:11:26 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgvs-0001za-VL
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwgun-0001Jv-P2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:10:17 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwgul-0002Y4-NE
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:10:17 -0400
Received: by mail-ed1-x532.google.com with SMTP id h2so12273648edt.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2DB6vixGPTXEQDysboSrJbbTAEsgkW+GKLJPxb6IMY=;
 b=G6HJi56WbDHDDQz+AV+U7U8TIn0s5hbDahF/2Lv8piCwZiUp7MsbDha/c32fh4u9l7
 vg59EUIi8TazaMQU6Gv3SaKRtt40zB6dceMPPrO5SsF8KKgdE0/mZyHkpWUKczyXw9N3
 Ujb7n8RshjyM3W2r5wqTtkjBPTQuiVMvvj1ilGbuHmgaYcoVwGqWTlas21itiTddcP8C
 JVedJTg2d4FkY0UnXPdO+G4KkUhYNIzxyo47GlaXQR6k04tH2cb/dbyT2XYSJ11LjunN
 g0EvMMrHQtGYj/5lv7XamoO+H4xbtB7ANfrje04t1MqEouxCaz7idmVXVXt8tTqXT77a
 QlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2DB6vixGPTXEQDysboSrJbbTAEsgkW+GKLJPxb6IMY=;
 b=kBDWc7xUiPUG9cH/DSuBDHm8DFGLU3dvWyGIRkz9HXeXXldw7cgX2Nor42WHv9YbTa
 VQsC/zMFkd2z3r86RPjogAj79ouCV4QfvaXSQrCrP0+HaL0Q9O6uf4YA7UISpXn8E5wt
 1/6HYHly7xnpFGu3yrb67AWdjXKDA/MhHgcf43tulZ7e7Uve0YwmUafMvJG9nHL9UlnQ
 V4i6kmvryHHHEipTDcjQNxyn0dIA/X8sqeKOk7JyL0lN154gf2m3vKkPhIaKSn38fVdW
 jGKi7EkMPyeNPnwFj4B16uaUgeOdSYPR/8Fel7zXlG36xlyBxYCq35IliK2epOXvVOPL
 rw4g==
X-Gm-Message-State: AOAM533ikmD1TPcslFQav6MuM6RMUcGDipOq+ppTd9CLCUBveQpNBU6d
 dPvJ6rcBrPKd8fJOBg5tGBa7mSJ2+eaI+WJqEtz1Ig==
X-Google-Smtp-Source: ABdhPJwzAMWRI4/f/oM7XvF4m3gfSfQi65mZyl6JcYrFViH2dWiRVrmxIJod6qrsSy58Gv0EEM/gRQwWIxit3YrVo9w=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr12713033edd.52.1624608613988; 
 Fri, 25 Jun 2021 01:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210623121424.1259496-1-pbonzini@redhat.com>
 <CAFEAcA8kr5sn-jQ_wLa6a-m0DmbWPh1v6YuHQK74dy8pp01-Vw@mail.gmail.com>
 <3d085a3d-d4e0-6750-65c0-ec91c5f63d8d@redhat.com>
In-Reply-To: <3d085a3d-d4e0-6750-65c0-ec91c5f63d8d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 09:09:37 +0100
Message-ID: <CAFEAcA_TAZ-CgzM4pQxr71jaC2Vr0kenF2WXsqcR13YLaddDDQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Misc, mostly meson patches for 2021-06-23
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 22:05, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 24/06/21 21:09, Peter Maydell wrote:
> > This generates a new warning on one of my boxes:
> >
> > [...]
> > Has header "sasl/sasl.h" : YES (cached)
> > Library sasl2 found: YES
> > Has header "security/pam_appl.h" : YES
> > Library pam found: YES
> > ../meson.build:926: WARNING: could not link libpam, disabling
>
> This is probably too old a libpam, or something like that.  What distro
> is it, and could you please attach the resulting meson-logs/meson-log.txt?

I saw this on Ubuntu 18.04.5 LTS and also on Debian bullseye; I've uploaded
the full meson-log.txt for the Ubuntu box to
https://people.linaro.org/~peter.maydell/meson-log.txt
but the important part seems to be:

Running compile:
Working directory:
/home/peter.maydell/qemu-netbsd/build/meson-private/tmp97iric39
Command line:  cc
/home/peter.maydell/qemu-netbsd/build/meson-private/tmp97iric39/testfile.c
-o /home/peter.maydell/qemu-netbsd/build/
meson-private/tmp97iric39/output.exe -pipe -D_FILE_OFFSET_BITS=64 -O0
-std=gnu99 -Wl,--start-group -lpam -Wl,--end-group

Code:

   #include <security/pam_appl.h>
   int main(void) {
     const char *service_name = "qemu";
     const char *user = "frank";
     const struct pam_conv pam_conv = { 0 };
     pam_handle_t *pamh = NULL;
     pam_start(service_name, user, &pam_conv, &pamh);
     return 0;
   }
Compiler stdout:

Compiler stderr:
 /home/peter.maydell/qemu-netbsd/build/meson-private/tmp97iric39/testfile.c:
In function 'main':
/home/peter.maydell/qemu-netbsd/build/meson-private/tmp97iric39/testfile.c:7:27:
error: 'NULL' undeclared (first use in this function)
      pam_handle_t *pamh = NULL;
                           ^~~~
/home/peter.maydell/qemu-netbsd/build/meson-private/tmp97iric39/testfile.c:7:27:
note: each undeclared identifier is reported only onc
e for each function it appears in

../meson.build:926: WARNING: could not link libpam, disabling


Looks like a missing #include <stddef.h> in the test code, rather
than anything specifically libpam related.


More generally, I think if meson probes for some library
and can't find it, the correct response is that it should
just print "Library libpam found: NO", not a "WARNING".
"You don't have an optional library, we'll skip that optional
feature" is a normal situation.

thanks
-- PMM

