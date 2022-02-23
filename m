Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA74C0FD0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:04:35 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoVe-00081z-LA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMoFr-000191-2Q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:48:16 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=33498
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMoFo-0008VS-Ip
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:48:14 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id j2so46911326ybu.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXzoOzWUVG4czQbsGE4GebW426LpE94f7jPPIpEB9E0=;
 b=Fr4jmq9VzFYuRN9jvXot1sevoCc3k8GLOBm8V8CvjJ7fJFyw3nsQHSQ0dXBd/+k7mh
 jhOpm1fbUpNmBfm67bmH1FYhCies794DRsbraoeLVy38S3pplxj+bZZYstfqfO4KJrNH
 MrfLWdmvXi8hB2/yc8gGOT4UxCuzW6kbbiDzXx75j7flUMxbShUFBZRpbRWzNf73Bowv
 KVcLzauQBWX6REPkD4nm1SpaBu6c3Ou2zbUKNNbXZh0xtx/jhqxAKUuVUOJm6t0U5Fuh
 +NN5vel5lwnBTesNzY4JmMdbxLmSmsVwibTJwtKHZifX5Thf4gMYkrVcHEOyw+7x5iLR
 7WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXzoOzWUVG4czQbsGE4GebW426LpE94f7jPPIpEB9E0=;
 b=7wusj0QjyklO5t+Xa/yKmYR/CU0wDP4/O6JSn3igw9ijYVy5QS2uwQxo78Aag+QAY4
 YSt2cP5d9fOtufwYCZQ32sS6neWMGFuQNr2T6l+xdlTuZFhgVclI7WF/q3EI0v3tkGNG
 C7noVaT1qIA6eavpfMtHW6TK0FCTBlGKLpIE0zJc0Af3bKNYJYXQoj9x3ZLrGzctu3av
 DINLgbczkvumRoalnULljDHBlnc56/uyBtMXyak7d+7fqiYKyUYXY0gUIJi3FWqbcwKd
 RDVe23PiSfgg96nQ92U3HkauZJ3pC15ey5b/+4HiQOrHrFEWSZ0Hv4JfT2Gu7WPXSuiw
 HQbQ==
X-Gm-Message-State: AOAM530fTg94MWwOm7jYL3BnnlTJvdY5H4/LwE/Zk6sP88/DHlCz+ksx
 5j4iHsdMr9CNCDznYccsbe5WG9Ygg9ks9itjppSu/w==
X-Google-Smtp-Source: ABdhPJweqXEdPQRo1vhgJsnJJLP/epQz7VkubYcLLeL0g0xQT6hBSVF0amQCMUBihPorboeRO0CoQp4YT5Ogpzfydbg=
X-Received: by 2002:a25:497:0:b0:624:8ba2:fc8e with SMTP id
 145-20020a250497000000b006248ba2fc8emr13445117ybe.39.1645609691636; Wed, 23
 Feb 2022 01:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-5-stefanha@redhat.com>
 <847d8aa2-66a4-f0e0-8709-5b4775755d83@redhat.com>
In-Reply-To: <847d8aa2-66a4-f0e0-8709-5b4775755d83@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 09:48:00 +0000
Message-ID: <CAFEAcA8O_x_ESK6Q2E7xSp2GV+t8R9atnO2r1Rr6G3XhUzWc8A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 09:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/21/22 15:29, Stefan Hajnoczi wrote:
> > -static __thread bool iothread_locked = false;
> > +QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)
> >
> >   bool qemu_mutex_iothread_locked(void)
> >   {
> > -    return iothread_locked;
> > +    return get_iothread_locked();
> >   }
> >
>
> Can we rename either the variable or the function, and avoid the wrapper
> altogether?

I think it's useful to distinguish the API for the rest of QEMU
(a function) from the implementation used internally (previously
a thread-local static, now a similar thing with wrappers.)

-- PMM

