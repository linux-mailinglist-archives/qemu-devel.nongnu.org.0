Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D24532E3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:30:34 +0100 (CET)
Received: from localhost ([::1]:54262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyXh-0004wf-O5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:30:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmyHg-0005jd-Dw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:14:04 -0500
Received: from [2a00:1450:4864:20::42a] (port=33350
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmyHe-00083h-Eo
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:14:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d24so37572480wra.0
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=625k46KUpJ/yuqlwKdiHzC5NkapHa651jbVFHV7lTHM=;
 b=qqlyVsWDH9IZO+RZwybHL/5rB5ymFcx1CELpxjmkAv1Mt0HPvLwW8iUBxPUbxhGId0
 U0Ok3c7GlJm1A7mBHhxWUWhy8Sz8SDyh0Cb5hz9/fI38hKKRVmthrVnhkTQ0H/W7gc2l
 5SX0sa02H25z847YvRKybfyt27Se5aJwXIKJY81CnZSvCecZVly+DcA972ruNUp6plzd
 VQf6Utkj0xYk8ijBiU2JQMGY8vmjcWiv3cZvWlAKyGeiEC4+Ul0wBWR2lGgm8DyynLLd
 3YZcGQn6uhGeResnl8aaX2PlVP37FFolk7YO/xVAXWk/OPrLYeHZ3tMn9EcDViZVs0Qh
 LwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=625k46KUpJ/yuqlwKdiHzC5NkapHa651jbVFHV7lTHM=;
 b=7w4PwX/toGVEYV9N5Zg4Dj2jevO1yUCuyzvhCJZkirNLbSW6a8JUpm1qWt2jMKXYGX
 jVN91rrwY6y0++ki8tP9ZXqEe9iFOxWRstAcubIZTcp8iXcc/CVmtN3sI+g7E3EQ4vRR
 2OUGSYl5SVc81j1pHci4e6zZv2obsBx9i+pP8+5sW5MrqomFzrPAbRZzNA1BYmDo3Y6R
 qaSKOkXMMrLOemQhA+OwTXlV7fHeQRo/+5CkeDzvDGJanS5vbFPe3XdYVgfTLisNivVf
 sI+c+9rf1hxQmlVhpJyVXGAxwT/yC1tnG2sV840TDqM2D76nw3y+uV8mfGaxzw0R6phs
 DD9Q==
X-Gm-Message-State: AOAM530vRgM6IaFIgUZFgzm7lX324w0N+nSwYFL24s/94U3iJekLZIJp
 md2GW/yE+iIwZ4dNpgMPfMFlGe6q3CN+2qADJ274gg==
X-Google-Smtp-Source: ABdhPJyfaBXuIIZfzkXc0m8DpNPAgvBu5wrjQNLMH7zNAnUC9PggS/AdQQNz6VPSbWP8pKaqZgS8XESLX5TiPFIL7Vg=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr9168440wri.376.1637068436268; 
 Tue, 16 Nov 2021 05:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-22-pbonzini@redhat.com>
 <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
 <CAFEAcA9HoX9riUjU_N6erkLu0r5gRawDTKSJgwjNb+2Mcn+0=g@mail.gmail.com>
In-Reply-To: <CAFEAcA9HoX9riUjU_N6erkLu0r5gRawDTKSJgwjNb+2Mcn+0=g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Nov 2021 13:13:45 +0000
Message-ID: <CAFEAcA8NfccCPsTHZXX-48Gk+9=Bo6RYr2iDeGe=Nr80qHzbRg@mail.gmail.com>
Subject: Re: [PULL 21/26] configure, meson: move more compiler checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 16:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 15 Nov 2021 at 16:36, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 14 Oct 2021 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > +config_host_data.set('CONFIG_IOVEC',
> > > +                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))

> https://github.com/mesonbuild/meson/issues/1975 says that for gcc
> it's actually going to be wrong the other way (always setting CONFIG_IOVEC
> whether the system header has the struct or not), because "struct wombat;"
> is syntactically OK as a *declaration*, not a use.

In case anybody's interested in an easy-ish meson contribution,
meson upstream indicated in that issue that they'd be open to a patch
which made whitespace in the has_header_symbol argument be an error,
which would have caught this bug earlier.

-- PMM

