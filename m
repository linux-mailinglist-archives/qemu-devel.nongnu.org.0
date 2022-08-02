Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D858823E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:05:19 +0200 (CEST)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxCg-0008Qd-Kp
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIx9t-0004Bq-Gb
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 15:02:25 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIx9r-00018P-Ck
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 15:02:25 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31f443e276fso150604897b3.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=fA2ZfQZZ9aIzMe85WXO345qehcQDrXuhX69OifwKdR8=;
 b=TzIT9P5tlWZEPin9DW83ZwhL5yr8F/00O5Yz1KK4rK9rQTnbCU0uRObAmT8iN22DEQ
 KTK/GSvbsLzRvy21CDvfhE76+RiAa15yZq6BWecYy/ZLbP6WBS0C87mPYj0BxGv9ikwj
 oyrbh+VxgswZCZ9lVwiU+qkySzRhYJqyFwSfXD2FwdZATUxtncUCWjxDsMB1OfTLyb0W
 qg3rarWUejnVzDKK7ffQoG1bot+E2EoMCSSZtWqaDgVrFKzzgvTZy6NS3570/e6SkR1j
 ZxKtogwisGG3My06d3mQGtgWpX4oin1ZxWYzF8hYQPfVI8ETSsWYaoUykHvd0+QbjdiM
 /yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=fA2ZfQZZ9aIzMe85WXO345qehcQDrXuhX69OifwKdR8=;
 b=n3GO9JvrfqQmZ9dWFuy3GJGh+cNcZXx+KWyC80eSlcn758RuvRu28yEbzr8t+f1+wU
 zSJRf5EXk0+Ozdd+2ukezL8rRU3hSzwINfPhx0snDfZPRlP7ESUIZ2YQQpz4JH/9uBCT
 vsBMzOJjLIOfOU7T7Kid7ZlcxdkCE9IuOKp2n2gY1hlXnMnTjWFSLYHbmr8W41yNP50O
 rAh4CBLWaIgjUclsnzVa1RkMeI4ahpu28rycLg6Zy5B3HMJa8feI6VKQKtiRFasIribD
 u+jnXc4dGjOaLYHYp6clSBA6mnS3GgjYssmM66L4kCCw5qPUNwCNjDOPcA4/lmnPYm4s
 YwtQ==
X-Gm-Message-State: ACgBeo0zZOVhwoBIv0kptR86KcrapNyNHiOje7QIe3YFb+6lC0baqLk3
 la7rf90qhj/aFZlJUwdre+mthVzNcKbYAkoAnMmaUw==
X-Google-Smtp-Source: AA6agR70zdBgd9dWzGIjKg/wnsxa7UXvkSdrL/yPbTUruMP9pWFQdx3WVgHb6sDSKurAW1T6ZS18N7nnz+ESvTHeoCY=
X-Received: by 2002:a81:63c6:0:b0:324:928:c672 with SMTP id
 x189-20020a8163c6000000b003240928c672mr18456776ywb.329.1659466942239; Tue, 02
 Aug 2022 12:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220802164134.1851910-1-berrange@redhat.com>
In-Reply-To: <20220802164134.1851910-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2022 20:01:41 +0100
Message-ID: <CAFEAcA94S0_UddzNUcrf+3GvphmcHJ+4VhHj9P2vA8w5cEsWow@mail.gmail.com>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 Aug 2022 at 17:43, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The latest glibc 2.36 has extended sys/mount.h so that it
> defines the FSCONFIG_* enum constants. These are historically
> defined in linux/mount.h, and thus if you include both headers
> the compiler complains:
>
> In file included from /usr/include/linux/fs.h:19,
>                  from ../linux-user/syscall.c:98:
> /usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_c=
ommand'
>    95 | enum fsconfig_command {
>       |      ^~~~~~~~~~~~~~~~
> In file included from ../linux-user/syscall.c:31:
> /usr/include/sys/mount.h:189:6: note: originally defined here
>   189 | enum fsconfig_command
>       |      ^~~~~~~~~~~~~~~~
> /usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCO=
NFIG_SET_FLAG'
>    96 |         FSCONFIG_SET_FLAG       =3D 0,    /* Set parameter, suppl=
ying no value */
>       |         ^~~~~~~~~~~~~~~~~
> /usr/include/sys/mount.h:191:3: note: previous definition of 'FSCONFIG_SE=
T_FLAG' with type 'enum fsconfig_command'
>   191 |   FSCONFIG_SET_FLAG       =3D 0,    /* Set parameter, supplying n=
o value */
>       |   ^~~~~~~~~~~~~~~~~
> ...snip...
>
> QEMU doesn't include linux/mount.h, but it does use
> linux/fs.h and thus gets linux/mount.h indirectly.
>
> glibc acknowledges this problem but does not appear to
> be intending to fix it in the forseeable future, simply
> documenting it as a known incompatibility with no
> workaround:
>
>   https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmoun=
t.h.3E_and_.3Csys.2Fmount.h.3E
>   https://sourceware.org/glibc/wiki/Synchronizing_Headers
>
> To address this requires either removing use of sys/mount.h
> or linux/fs.h, despite QEMU needing declarations from
> both.
>
> This patch removes linux/fs.h, meaning we have to define
> various FS_IOC constants that are now unavailable.

I don't suppose anybody has useful contacts with the glibc
developers so we can ask them if they can try to maybe
not break applications like this, or at least if they do
to provide workarounds ? Having to hand-define
a bunch of ioctl constants is particularly messy.

thanks
-- PMM

