Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A436C5FD8A3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:52:58 +0200 (CEST)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwll-00025i-5X
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiwaS-00063l-Sz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:41:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiwaQ-0003dq-68
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:41:15 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso5422861pjq.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5pUKaJADzgJwwXXo53YXCS0nQEocJEW3n5HEmOQXgI=;
 b=IBu9PtZcoXwDlm0A1/skyZJlspUQMjbnhd3rbNSsifUqXcqp0OCSta6WNhf2NIG1g4
 ANH4BxGkEO0oKwrj+DM3Z+9cJuqgMPFCky3LlqCPJs1XpCfRuxpyNFihD2HktBPY6FOi
 TrxZPVQNJdYQOeACXaHI1V4noytCbGP9pR+Gvk0QP56Rj0S0aHlx7FEXAdnVO6wQ8k8/
 zVxRDGKlfpj7Mq58BE88DWnW5RQyXnI1RcuaYUZ8wa6IcY+M0e7xVRbnwzlOic89iJc5
 ocpLGg1CPZLbyWNQDmwW76HdurT3wm38KkQjPlp3ObhHmcbws+Vgid45L+RMBs0rwuUQ
 O+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5pUKaJADzgJwwXXo53YXCS0nQEocJEW3n5HEmOQXgI=;
 b=5XbrR+YP7UIfv4TNHeXvmhH6DST1bn59NT/uVuiQxn8vjHIGmc1F1cZ4by98iNUKJJ
 JCn5sI4LcYl2sTA/v7RFGO12upEXyR9rD2UFslKrxCN08bUnHXOfCrpDZIf+9fs18NED
 hfUjLW+WM8T1cBa7Gevw6cDXoSr8rwfJ/45f4+ffHTjm2vmpHAiNU2733GKNaGfQbkA1
 gYwCpUgCp0IaZNmDG6GMfiY/YY9HTksDdhPSNB/fN2/kKHoDCdhgIapRpXx/oZwUWEkh
 CWIbA3ta6mduGerjMoG4dhOmJKb4afvxS6HLnZR1UUojjU2vYi+eVcpd1lfC/vbKSHWS
 +8FA==
X-Gm-Message-State: ACrzQf3GV5Af0XEnwJEiv03aYkKmRT6BXU3/HxbGgdlvTE6AIo1Cipa5
 SwS0UA6qA3OK0TVmZMNR/ONP29nB+bFAZijvcdn6FA==
X-Google-Smtp-Source: AMsMyM6BBSHiKfDrjylEtADFYAA2Cfl3kdzgvIyxcm0bvotquwy0G4+j11oK5FZ9AlaBO9szUF7usNE3vxngi05mi9Y=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr34907718plr.168.1665661272438; Thu, 13
 Oct 2022 04:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
 <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
 <Y0fxjk5zaeDYCPIo@redhat.com>
In-Reply-To: <Y0fxjk5zaeDYCPIo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2022 12:41:00 +0100
Message-ID: <CAFEAcA95S8rM39_Uxv_mDQNagsgo81JTc-aUVJmOnHhiN8R_zQ@mail.gmail.com>
Subject: Re: [PATCH] configure: Avoid using strings binary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Oct 2022 at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Oct 13, 2022 at 11:39:34AM +0100, Peter Maydell wrote:
> > On Thu, 13 Oct 2022 at 09:47, Michal Privoznik <mprivozn@redhat.com> wr=
ote:
> > >
> > > When determining the endiandness of the target architecture we're
> > > building for a small program is compiled, which in an obfuscated
> > > way declares two strings. Then, we look which string is in
> > > correct order (using strings binary) and deduct the endiandness.
> > > But using the strings binary is problematic, because it's part of
> > > toolchain (strings is just a symlink to
> > > x86_64-pc-linux-gnu-strings or llvm-strings). And when
> > > (cross-)compiling, it requires users to set the symlink to the
> > > correct toolchain.
> > >
> > > Fortunately, we have a better alternative anyways. Since we
> > > require either clang or gcc we can rely on macros they declare.
> > >
> > > Bug: https://bugs.gentoo.org/876933
> > > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> >
> > If we can determine this just by looking at C macros, does
> > this really need to be a configure test at all ? Paolo?
>
> We don't need to rely on CLang / GCC macros either, as this
> is exposed by GLib
>
> $ grep BYTE_ORDER /usr/lib64/glib-2.0/include/glibconfig.h
> #define G_BYTE_ORDER G_LITTLE_ENDIAN
>
> IOW, any code that needs to know can do one of:
>
>   #if G_BYTE_ORDER =3D=3D G_LITTLE_ENDIAN
>
>   #if G_BYTE_ORDER =3D=3D G_BIG_ENDIAN

It would be more consistent for configure to do this the same
way that compiler.h does, though:

#define HOST_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)

thanks
-- PMM

