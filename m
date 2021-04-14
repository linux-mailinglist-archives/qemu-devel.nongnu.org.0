Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22C35FB82
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:19:42 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWl37-0001SU-EU
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWl1O-0000gR-SV
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:17:54 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWl1M-0002Rx-LY
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:17:54 -0400
Received: by mail-ed1-x532.google.com with SMTP id j12so33138edy.3
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qivaZ1JD39rY82iNw4aAUU5N4Kc0Vhkl5lpNeMy20/Y=;
 b=RJuJO7lOuUNRYagdtu2HBcG8rFNKq6GQHHFsXYvNL/aPatfg0KshubN7TlOQymvlgk
 R019lG7kWZ5d3kQeGg4+kDhrRGvop//nvpsFDyP6kcfBcjdiojpbquhooCjbzBd4N2r2
 BpAUXSXUSsfQl3CwY4OVxLPhj662tgW4gCAmrvu0xieZDtbu98NhK1xl6HhtHyjzF2xq
 gOgW576gWbdM96Hw5eBUkqe8fqgcr/MDljj2EfE+v9WGuCfnRH69YgUmJNi8XPQJO7ME
 c7a11KPl+c6fojgU9aqAm+VuxSJOJfCR0lQkTfbjm7/MsCo+ULUBR/LPD+3yurBrMaUe
 VMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qivaZ1JD39rY82iNw4aAUU5N4Kc0Vhkl5lpNeMy20/Y=;
 b=QP+h9zHCd3k0imt08TVouyfN1dHMqEuEkDp7LyiwNU7ZIGvTxfnqx2S3mluUAIdDsn
 XIdOOkkhcbkwRuurbcvuGaB5P5lF5Gt5LjViXBbVFqUv9VDm44SZQ2K6T0jku8viv1rs
 Wm8crdsxXqfx4QDE4xz9un4lSDBMRTSw53I4k95irOpvsaiaImJ9j0ZWcAiGKIUEFdcJ
 ccxSBYZdnOdaPJjwX9hxFV5otGwKG7Y5m/pbgD3HVPRyundlTKgG14Mxt1NuTVdNGU3E
 PjOrV8Y7VtXNLji6TRFO3yXWq92XrkBzMUT7nUPrIb5Cunpl+wEkNth4+4nbn86GAIuk
 84DQ==
X-Gm-Message-State: AOAM53354ncCOwXG0W8DwDLY536bk80B+8JWGZGlIe6iipKuDi4s3JXD
 +c+ibwTPDilkHOIJwYxGCTV4NUHyz/6UHs4TI2Xw5gl1h2M=
X-Google-Smtp-Source: ABdhPJwQwmceI9ma97bojnh64PnMrWsE8dNTjtXMmZGcj/ZmNp34/jbgVjjBQmgAXJrLAGS2KGjmr0qGjeAsZVRL7PI=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr507061edd.146.1618427870615; 
 Wed, 14 Apr 2021 12:17:50 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 20:17:04 +0100
Message-ID: <CAFEAcA95ZobYrOaDA4O4ESWNAKkMi-y8QUGoVQRkC2ujbtNeSA@mail.gmail.com>
Subject: tidying up osdep.h
To: QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(cc'ing people related to the recent 'extern "C"' patches and also
randomly Markus as somebody who's had opinions on header cleanups
in the past...)

osdep.h as it stands today is a mix of two things:
 (1) it has the "must be included by everybody" items:
   (a) config-host.h, poison.h, compiler.h
   (b) things which must be done before any system header is included
       (like defining __STDC_CONSTANT_MACROS or WIN32_LEAN_AND_MEAN)
   (c) includes of system headers which we need to then fix up for
       portability issues (eg redefining assert on mingw, defining
       fallback versions of missing macros)
 (2) it has declarations for a library of QEMU functions, some of which
     typically wrap and abstract away OS specifics (like qemu_create(),
     qemu_unlink()), and some of which seem to have just been dumped
     in here for convenience (like qemu_hw_version())

Every file needs (1), which is why we mandate osdep.h as the first
include; most files don't need a lot of the things in (2) (for instance
qemu_hw_version() is used in just half a dozen .c files). Is it worth
trying to split some of the type (2) items out into their own header files?

I suspect that the advantages would be primarily just making osdep.h
a bit clearer to read and less of an "attractive nuisance" for new
additions; I imagine the bulk of the extra compilation time represented
by osdep.h is going to be because it pulls in dozens of system
headers, most of which are going to be required under heading (1).

thanks
-- PMM

