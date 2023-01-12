Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E96670C9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvPQ-000110-48; Thu, 12 Jan 2023 06:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFvP4-0000wO-3e
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:05:50 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFvP2-0000S8-CR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:05:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so947015pje.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew96WjzkEwEHELpjNgr5PVqcufpMUbnbQ9P/sL0p4Gg=;
 b=UDR//PrpG6rUINwGe04FzPyFmxnK5X8g9S5fS97x4U0faL49MxZOtkPBlebi+PIIlU
 mRbqkQbFfFrB9XmlRLyRCHTDqGPqAcck6ZxbaQiwIBR9WffNNVB0h5Q1QAk+PuswwhKR
 CcPAmnJMTifEfPxFMwUqaHAdb2dLfl8mRFozWDe3YS2tVIHqsOwQje4rzjxI27hMNRo6
 qol4ILTX1bab51fWPZgFPFn2enpyZwb77jv4wo5z72GQ6ELNhxEHl9aE7OKZP3KnLIEg
 wtwMmpXjuXXdqF0DdJ+np4bbq49+AGi+I42teJ7LX25MR+oZ9dEqnaCZ+Zu/7991TGMZ
 G93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ew96WjzkEwEHELpjNgr5PVqcufpMUbnbQ9P/sL0p4Gg=;
 b=xXylwEtmNIHq4v4AGQKOhjiODVwVh8mr0hp2LfNcacMcjmOh7TOzLZNVQTBoIS0VhV
 7m+gbKfIEfjDLesJ1lhjdd+7Q2tUbBUev0Tb1woKqV7MkY307tJ1009e4r2HDKTH6GHd
 /X8RuOULuBSZ66CVr4fSdmsvhX6Gv91px1MQ78SkxrynjsonTiCgrfk177rR+l1PC+lk
 A1BHU0NeVtWrQ5nkhvwGDWptZ/yuHxapgk1oGlpi2tZ/wPJ+KK0oVD6QZnGjjF/Dhnil
 KoTukqd0+pVIGOpgnt8MMdv7fBjdmNiQGsPlUkB7zU1LkUMl070bHNWefsrpRtWNFcRK
 /mTw==
X-Gm-Message-State: AFqh2kp22xQKQeXzc51guRhPGDCgh0fAbUOuwFCaTEJSvnuNRkC1uFvV
 wzx5nn2rQnvVrw7B7rd17/xtBkzVjUZjMIXuoo/mo2Mz8BoZDw==
X-Google-Smtp-Source: AMrXdXs1JNmqxkPiIUuMr7sQa6B7crh75smjiX8nH59yGEg7tDMYYyzlIoq8+BNqvpKo8BCokG4QAQOgOqHVVXvjgeE=
X-Received: by 2002:a17:902:690a:b0:193:1f3a:4977 with SMTP id
 j10-20020a170902690a00b001931f3a4977mr1545938plk.168.1673521546685; Thu, 12
 Jan 2023 03:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230110084946.299480-1-pbonzini@redhat.com>
 <CAFEAcA9VCBqarUPzRrTx5ZXXFV8bdijge6zi=YUSrcirtv6bWA@mail.gmail.com>
 <08ae1223-2721-b10c-ff2b-91a62bd83070@redhat.com>
In-Reply-To: <08ae1223-2721-b10c-ff2b-91a62bd83070@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 11:05:34 +0000
Message-ID: <CAFEAcA8KRTP58UoGEGFvSSBxQ66EmnXFsBWgq0S2a==CGFwhjw@mail.gmail.com>
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Wed, 11 Jan 2023 at 09:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 1/10/23 11:53, Peter Maydell wrote:
> > On Tue, 10 Jan 2023 at 09:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> A handful of header files in QEMU are wrapped with extern "C" blocks.
> >> These are not necessary: there are C++ source files anymore in QEMU,
> >> and even where there were some, they did not include most of these
> >> files anyway.
> >
> > Any reason not to also take out the extern "C" block in osdep.h
> > and the uses of QEMU_EXTERN_C ?
>
> qemu/osdep.h is still included by the C++ sources in qga/vss-win32.

If anything C++ still includes osdep.h then you can't remove
the handling of this from os-win32.h and os-posix.h, because
those files are included from osdep.h.

thanks
-- PMM

