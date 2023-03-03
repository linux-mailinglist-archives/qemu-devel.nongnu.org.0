Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FEE6A95E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:17:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3P8-0006am-6F; Fri, 03 Mar 2023 06:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3P5-0006Zw-Ss
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:16:47 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3P4-0001eW-71
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:16:47 -0500
Received: by mail-pg1-x533.google.com with SMTP id d6so1247998pgu.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677842204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
 b=aPuwdCNtlGGPCx32OtbizzAVK4IYwHotCm8vUf8rH71gCgSTi1Zcq6Ws8tRaL1SKR2
 qHQx4dPQGal5Mp01cA6yIhckJT5y0sDY/56m8Lkyg/mZJMEvcnV988KI15KI5u6L+IRM
 h+iELKli65iCRvcgLCo/zay4wFtlM4nv5Jr+dKavsDrx73Cy/z5r5CszWSk7BN5jbqoe
 cV8M2NxSGEj949OnkHmqKa248lgc2klZK4amqtvMC0R95XHJEVU4zXax0Zjrm7Rio91E
 Uw1owcNYZT9V8Mn4FhEJHKN6dtpI1WDU3Go5X6Cqo5qi3WxQC0vRJPf39b08ndKFcJMI
 yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677842204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
 b=EJEdG/RDIhfBIBc4PSTz3pq9EyFVWI1d6SwUH+6FDYaibdXTeLHs78jhdREgQEmKtQ
 31JXUJN+niFEqC8EKt2JymrtwpRE93SMfpoYdszyA2dmAu/qkTIe45C4xFHXlUw+1TFk
 nx45GYRDj2sx6HtUMbAotUT2Fi8bbVx+P7undY73FxG/U2Ds9s0XsNwvlXakfiOVx+mE
 KMUbfOiaAFS7MrnbFZPrkdDz0EwOTZCinM9SvE1XLitHgLU20cFAAE9gPvuEejpA6n1X
 GkmVLqzQsv9e2iFsbyhK0n9px6d5fUhK1vDnoFtdQ5QMC26LRjsQ+B21Y8sgfNwk0+xB
 va6Q==
X-Gm-Message-State: AO0yUKWPlgBdyyhtsF4815bj4APg7haPYhxxNUu49B1FKlIkA/UeAVL1
 nUlfJoR4rlvAJ0S6qzq/IAFNKNSsvaPg0Pjr4CWBhQ==
X-Google-Smtp-Source: AK7set9CNauIHkidY86e9p0+4D48SNNhrsSEwa5fbYw0YUBRN8Nx2srPULT6bjJ68MYMjGEsg/cbJriR7JHdxPs40sc=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr378922pgh.9.1677842204397; Fri, 03 Mar
 2023 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:16:32 +0000
Message-ID: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>  on x86_64 hosts. Thus users are recommended to reconfigure their systems
>  to use the ``qemu-system-x86_64`` binary instead.
>
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.

I think this is not quite true -- at the moment if you want
"every feature we implement, 32-bit" the only way to get
that is 'qemu-system-arm -cpu max'. The '-cpu max' on
qemu-system-aarch64 is 64-bit, and we don't implement for TCG
the "-cpu max,aarch64=off" syntax that we do for KVM that would
let the user say "no 64-bit support".

thanks
-- PMM

