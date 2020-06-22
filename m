Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FEF202EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 05:24:18 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnD4D-0001PX-R7
	for lists+qemu-devel@lfdr.de; Sun, 21 Jun 2020 23:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnD3K-0000Xu-20
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 23:23:22 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnD3I-0007w4-4S
 for qemu-devel@nongnu.org; Sun, 21 Jun 2020 23:23:21 -0400
Received: by mail-yb1-xb42.google.com with SMTP id k18so8341322ybm.13
 for <qemu-devel@nongnu.org>; Sun, 21 Jun 2020 20:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ql4Psp1MJn0Sbda/hirf2+oPjyFqchvpFA+ijYuIgVE=;
 b=BV48AOLRHb0k4dskfJMulB4ioOcGq5XCydQHdL4JKj8+QLkwTtMbFsc8y5AH+83jQC
 +vgoWTUUwNbcmjt1mqQarAYZhSfaldRTcSQRKfIkJ1QgKMFjHJHVvYbNVavag0tTZ5PS
 BQhfU2aSFOJjvxx7IxJ36/3CBNPt1/QvC86VjvAZxYLc27zGgpHIhe1P++lyBheqJOXw
 faL2117zMsWvAf9K39LWw/3OrHySgU1Ht1B4ym1zMlDjdMCs9laaqgzkca5K6snPK7Vb
 H0tJpT4wO3lqEfqOoeyY5JutWwb4r6hi9R4QmsftnUU/euTQ54Ie2lihfq354J+wHSfF
 AnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ql4Psp1MJn0Sbda/hirf2+oPjyFqchvpFA+ijYuIgVE=;
 b=e5P8fjXgCSAyoYlz/V6TKoNOyrFdF2nlFVWZTfk4R33NH/+HOcyaZDwdSmVg72Ns0R
 rOrRSHLQLDrU/L9+7zo1r1INubE+FaA1hNhnQZ0I9AdQbcgTMMRtuiv23MDp8ftt6bSq
 BdedJ01OOCcmPlrJ81Yx8wxIbQLatUnsimKi9hyZV+JvY0pdtfJRlBDUUaOlswaJZcNa
 Bv7RZEo4GyoCNSYN0ur6kjksdTI4EvUxruVy7R8I8qHm3fbJK2myqvd97IAX9WuveJiB
 BhK7jognLEzloW3XMvYfBufcS75Ee/AKem7g+JATsCLaom95ZtEHiejuTi2LWaiST+ok
 vjuA==
X-Gm-Message-State: AOAM5327uegR+Ssm3XAN4/joy8s8j2wXGO8pfxwt7i13rtQlsjU5AYDi
 EhE4+2xr6ArgxRdKCjTcxZI8F72nNgGajS0//7w=
X-Google-Smtp-Source: ABdhPJwxPud/GFWBee6Yv2ZB0lqOluPh5tMzm0HSthgk/Nwj/+KevqJuzFmlEAEMQotFgWLnS27uYRhM8hetnG64Jzk=
X-Received: by 2002:a25:da44:: with SMTP id n65mr26381861ybf.387.1592796198585; 
 Sun, 21 Jun 2020 20:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <003101d5ab71$8424dc40$8c6e94c0$@protonmail.com>
 <20191205143622.GB3080934@redhat.com>
 <000101d5ac55$f8422620$e8c67260$@protonmail.com>
 <20191206170747.GD3291374@redhat.com>
 <000001d5acc2$e7e07ee0$b7a17ca0$@protonmail.com>
 <000001d5b312$8927d550$9b777ff0$@protonmail.com>
In-Reply-To: <000001d5b312$8927d550$9b777ff0$@protonmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Jun 2020 11:23:07 +0800
Message-ID: <CAEUhbmXbEJPwMttTpSYSwOm+Cm+LfwZOoSSfxHuOp_u+eU2_=A@mail.gmail.com>
Subject: Re: Error compiling Qemu-4.1 on Linux
To: Aijaz.Baig@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Sun, Dec 15, 2019 at 2:40 PM <Aijaz.Baig@protonmail.com> wrote:
>
> Hello
>
> Anything suspicious that anyone can spot in here?? Still cannot get qemu =
to compile
>
> Keen to hear
>
> -----Original Message-----
> From: Aijaz.Baig@protonmail.com <Aijaz.Baig@protonmail.com>
> Sent: Saturday, December 7, 2019 11:25 AM
> To: 'Daniel P. Berrang=C3=A9' <berrange@redhat.com>
> Cc: qemu-devel@nongnu.org
> Subject: RE: Error compiling Qemu-4.1 on Linux
>
>
> That file IS present and its contents are:
>
> prefix=3D/usr
> exec_prefix=3D${prefix}
> libdir=3D${prefix}/lib/x86_64-linux-gnu
> includedir=3D${prefix}/include
>
> Name: GThread
> Description: Thread support for GLib
> Requires: glib-2.0
> Version: 2.50.3
> Libs: -L${libdir} -lgthread-2.0 -pthread
> Cflags: -pthread
>
> Let me know what is falling short here
>
> Regards
>
> -----Original Message-----
> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Sent: Friday, December 6, 2019 10:38 PM
> To: Aijaz.Baig@protonmail.com
> Cc: qemu-devel@nongnu.org
> Subject: Re: Error compiling Qemu-4.1 on Linux
>
>
> On Fri, Dec 06, 2019 at 04:55:37PM +0000, Aijaz.Baig@protonmail.com wrote=
:
> > Here is the content of config.log: https://pastebin.com/6zrSXWAG
> >
> > I am configuring it for 'arm-softmmu'  as can be seen from the above
> > paste
>
> Looks like it is failing on
>
>   $ pkg-config  --atleast-version=3D2.40 gthread-2.0
>
> returning non-zero exit status.
>
>
> This suggests the file:
>
>   /usr/lib/x86_64-linux-gnu/pkgconfig/gthread-2.0.pc
>
> is missing on your install.
>
> Or do you have some PKG_CONFIG_LIBDIR env variable set that is mistakenly=
 pointing to a different directory.
>

This is failing for me today after I cleaned up my build directory and
re-configured everything from scratch. Something is wrong in the
configure scripts?

Regards,
Bin

