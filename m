Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC53673E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:59:47 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZJ0k-00015o-47
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZIye-0000Is-IO
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:57:40 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZIyd-0000b5-36
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:57:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id x12so44506975ejc.1
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NhW2gyiz/mBltejiPsTUufScEZyQDDgWyrvqhB86ftA=;
 b=VdjdCBbmx4hks46eUO7IoMa+gbkWGVBhE6DChnHlGU7bP2fSuDRh7VRKaeRmweYNUA
 sJN4NMYZ0ikyjSEARVqzLFHFFweUHtuBLHFqG+/d82jY205uBlrn63NfAHTjtDD3bBI7
 Dv1yrnu+rxAAtx3Jen4fwHgqHEHDo+qssNDHmP0V+sW0dS8Xoo7t3XmU3VSYdLjDBKSC
 2PdMXdmjNrDzpOg7lm6ARE9qtJIygH2xE+6R8r5HaldPqOTlnj3XduQsfNF1cfu5HYjh
 cqUpF7Q77+4NOTOgakQSsr2lV+7JN00O2PxOWgutmwqqPT6yYT7PjmFD1oCzWlL21uX7
 TqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NhW2gyiz/mBltejiPsTUufScEZyQDDgWyrvqhB86ftA=;
 b=h4ju0H3WFeefq9gn1a7+Gzpk4xAqYZ231gFXc8Hh6DpVvenBN9cNLPH0AnYk4Fw/AB
 BhNj4h4zntc7D1JMHNUG7s+J13Qr2ypyq14Pxg1h9NGXTxUMe9MOhk3rUghfQVEfDtdM
 utOm3UhEIEmHLdQarNbnqCGALL5QkglvcWkuq5E8sBZzIhnYI2Vv9IsTv5WGcD/+27Iq
 ArmjufGq7zyKZCkfhk+ZA07nyG13dAVAXledWKS/dEfOaiavwu+6huWfjk6Wckkt3KiI
 salHbcrM4sCo6s7x4VT3qUP/P6Kf+9N+P/3vNnFHJ2/VCqUruk8RE2Wgu+TwSkF+h7Uo
 HxGg==
X-Gm-Message-State: AOAM533Y8OzFOnhI0qA29i3DfYbKLvpx2uLujldObTArSghUFEfDBrD6
 BaSgBFAKUliQUo828R6hhvk2rg5uLpgxdKUHUdyhWw==
X-Google-Smtp-Source: ABdhPJzNh8QkoIxVEEtf/AQPdVGz6DR3VI6YitRqXQDbKHXWoKAmbVboj8pOiqHxbkMs91tbTNs3MpqRKX0Z7ThayJg=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr34563397ejx.85.1619035053675; 
 Wed, 21 Apr 2021 12:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210421132931.11127-1-alex.bennee@linaro.org>
 <0edb902de3407d276c264a87335550d4d0e8f93af530ff196e5bd69064b92a74@mu>
 <8735vj8llf.fsf@linaro.org>
In-Reply-To: <8735vj8llf.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Apr 2021 20:56:40 +0100
Message-ID: <CAFEAcA8stoqKwtLZZsXkr59PkwFExb6wZ2cXCkb5KDYw1MzNFw@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/tcg: add a multiarch signals test to stress
 test signal delivery
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Apr 2021 at 20:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > To further document my confusion:
> >
> >   gdb --args $QEMU ./tests/tcg/$ARCH/signals
> >
> > will SEGV in generated code for every target I've run. This seems to be
> > some sort of change of behaviour by running inside a debug
> > environment.
>
> This bit at least seems to be triggered by the page protections for
> detecting SMC - I think. If you skip past them it triggers:
>
>     if (is_write && info->si_signo =3D=3D SIGSEGV && info->si_code =3D=3D=
 SEGV_ACCERR &&
>         h2g_valid(address)) {
>         switch (page_unprotect(h2g(address), pc)) {
>
> and runs.

Yeah, for linux-user code SEGV in generated code is expected and
handled -- it's how we catch things like SMC and other cases that
in softmmu we handle via the softmmu slowpath.

thanks
-- PMM

