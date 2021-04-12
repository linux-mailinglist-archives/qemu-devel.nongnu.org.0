Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D420735C775
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:22:38 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwWT-0002eX-EU
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwUg-0001tE-W7
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:20:47 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwUf-0006G5-8c
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:20:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id ba6so15049140edb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNJJVN5MozQSJc1pCT6Xx3yReqmbZTlGPKWkGLkl5fo=;
 b=Fu1+HnM+4pKdyQ5H5f1vMVR3RaFeiXvfBWjxeFOPB7J4IeqMz4eW8ggczIEjvkI8iM
 yQvSy8PNnC5VhLelDwEM8n2hgK9ftPrizvbya2er7q5SvMJXqLsP4NHF+mFR2mclrKsm
 Hr09auVni8HflUooYrn+2z5A9b2qDAL09NH9gyKBiPuop6LvgeCZkhS5ScnyV1yvLJ4c
 m97PerjJ7FHdi5dyx2qldKhonhOgnpJNeJLShJAZpOsqn5sejIOSEn4U9xFQ6SfwcRQW
 /vGgIyWcfkYNDd7GKVIGdW0yVPsPvvpahArj0QGPIHYmEif5FVpr4jT5F3E6/FzZeT0X
 VoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNJJVN5MozQSJc1pCT6Xx3yReqmbZTlGPKWkGLkl5fo=;
 b=YdTZMfbuUuUtaet0Qbq2FRgg1edJd0J/rhvwl1Am2xUVtItZAfEmGm4o7u7KS95uyu
 kMqY3i/RnbJUagYnIhBjroggxFP0XWfF70j9qpH3EwPysGwkp7ak+QMJ/5YpVKSb4Smx
 H507PbZOtgVbpno+mItFuowT1KeCC84gGPgQY+3NrDtCi2kmb4KKs0hgT2QNFpBPH0Dx
 RzKkSEdEKB0HhR+3yT9+p/2cBTrPRIsPc3VC3DKZyIu9MMpqjGMJaUptfZ1EyY4jodCo
 tyXh+ZUUrps8tWF20PA3VZmAa9bXxprX1aUs+lOfuCjB1/Ab1b3li0O0k31C0n4GuXdp
 CwQg==
X-Gm-Message-State: AOAM530NcOUtqc8a2RV0wallSyQl6dmkcEZsOBbBYodsfmSRH2uN2NHu
 TN14+lGKcy53k9FuK0vwMbmgQEplqn4098fWXrP6PA==
X-Google-Smtp-Source: ABdhPJyB4JCxyv4UT2IrVPsXgglN2L36cCyrOudZz2v5BZcbY9HLq2dB7Z2RnU69Su82S7m+ND2uL1o5hV6KV3mNL34=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr29045256edt.36.1618233642860; 
 Mon, 12 Apr 2021 06:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
In-Reply-To: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 14:19:58 +0100
Message-ID: <CAFEAcA_8ZsHwa+vxz99q52FUP4n7QDTLWpEEh2n_v-Ujiwdu_g@mail.gmail.com>
Subject: Re: Better alternative to strncpy in QEMU.
To: Chetan <chetan4windows@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Apr 2021 at 14:52, Chetan <chetan4windows@gmail.com> wrote:
> char *qemu_strncpy(char destination[], char source[], size_t destination_size)
> {
>     /* Looping through the array and copying the characters from
>      * source to destination.
>      */
>     for (int i = 0; i < strlen(source); i++) {
>         destination[i] = source[i];
>
>         /* Check if value of i is equal to the second last index
>          * of destination array and if condition is true, mark last
>          * index as NULL and break from the loop.
>          */
>         if (i == (destination_size - 2)) {
>             destination[destination_size - 1] = '\0';
>             break;
>         }
>     }
>     return destination;
> }

This implementation is "accidentally quadratic", because it
calls strlen(source) every time through the loop, and thus
copying an N byte string will read N*N bytes of memory. (The
compiler can't pull the "strlen(source)" call up out of the loop
because it can't guarantee that source and destination don't
overlap.)

I think this is a good illustration of why we probably don't want
to roll our own string operation functions if we can avoid it
(ie without having a clear view of why we are improving on either
what libc or glib offer us).

thanks
-- PMM

