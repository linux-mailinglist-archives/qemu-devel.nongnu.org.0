Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8F367EAE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:34:45 +0200 (CEST)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWfU-0000DW-GZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZWcm-000707-5a
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:31:56 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZWcj-0004O0-TI
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:31:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u17so68051531ejk.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hFPQV4U/Sbx5bW3vHP2Fci57n7J8xW+ws6qLvoWDXmA=;
 b=qdrmGH5FP47+9vBgZQ9axdJVOL+OXkSVBgB09N037yzW/BcssSS4opGjWDYGJIx94R
 XTJB1KUVpbeyOARNZh/C7nYJr+c2z2BTRX5qrylj5bICAhoOKLH0vDskG7OjZBMTUFDE
 0i8FuA7j7Kz0A0at9aPITDW6q/QkqG37VeNwan6aRqSrc9eoqKTVWfFueAKRUwTAp/Dt
 ypjVKBhbn7W7FCnPn3S14jYnl/WFB7kO03GKXED8ZI5BIXyRc0vMikhBbmueb7GhA2Z4
 EXtjW9rglS7H9zu0FHK0s7fRZ1gUcuCctHgORaNpOxCLT0CYg3CUDqZNUe9YFjZHctP/
 d6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hFPQV4U/Sbx5bW3vHP2Fci57n7J8xW+ws6qLvoWDXmA=;
 b=aOmiToVxDgGTqjiLeKQ86KbFXlLB47Nf8+/rqWiC/YEZ8uDgmg57oQoh4Jr2F+L9tg
 UV7L3JiV4Pp6rQJRp9h1yED3T5NADiBy+7ZEGarJ93i0ySTAufz/TJCFNBKNaI0VadWa
 myDZM0nZ6+KbWYKU2dZduTRC78tCF1I0OUO4WMgVPY+VIWmCI5ewmO1Fnkohc5XD89ck
 M8CqtR/05UAvwZ4q/lftA5/6iJVeSFkBB1Abe3Xt8wu7T9mAnUBC33DOLEMGtK5XMRam
 A6OE4lMenlgUzKyQtGXuPvGFPBLm1k6Zt0jm3LWqqx4xt6KvRp9/XQl7hw1T51i9WShr
 FAeg==
X-Gm-Message-State: AOAM530pzhidY1rW9qpYfeyjgGVzxvVL8GtNGW7vMmI98eRv75UC+r/L
 q9RN4z7u4WqCF7+S5PdGF3gFnmBkQ8IC3HUNVmpFGQ==
X-Google-Smtp-Source: ABdhPJy2mQtC9nYpjcqgb61HG85vgtRwMxyEJo5HBp5eAlvWsdca6huitW2vxgUTQrGUfgN88EYCiLWhTyPjwYoWR0Q=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr2642646ejh.4.1619087509331; 
 Thu, 22 Apr 2021 03:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
In-Reply-To: <YIFMt+xg+xH+M4rd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 11:30:55 +0100
Message-ID: <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Apr 22, 2021 at 06:47:30AM +0200, Thomas Huth wrote:
> > On 22/04/2021 06.18, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi Thomas, Daniel, Stefano,
> > >
> > > Regarding the following warning (GCC 11 on Fedora 34):
> > >
> > > In file included from pc-bios/s390-ccw/main.c:11:
> > >
> > > In function =E2=80=98memset=E2=80=99,
> > >
> > >      inlined from =E2=80=98boot_setup=E2=80=99 at pc-bios/s390-ccw/ma=
in.c:185:5,
> > >
> > >      inlined from =E2=80=98main=E2=80=99 at pc-bios/s390-ccw/main.c:2=
88:5:
> > >
> > > pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region =
of
> > > size 0 [-Wstringop-overflow=3D]
> > >
> > >     28 |         p[i] =3D c;
> > >
> > >        |         ~~~~~^~~
> > >
> > > Daniel were right on IRC:
> > >
> > > danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S39=
0EP
> > > is just a constant address 0x10008
> > > danpb: the compiler doesn't now how big that is, so it seems to assum=
e
> > > it is zero length
> > >
> > > This is a known GCC issue:
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578
> > > "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing =
a
> > > pointer from integer literal"
> >
> >  Hi Philippe,
> >
> > thanks for following up with the gcc bugzilla!
> >
> > ... so the problem is that GCC thinks we're in fact dereferencing a NUL=
L
> > pointer at offset 0x10008 here? Wow, that's ... crazy.
> >
> > Not sure what to do now - wait for the bug to get resolved? Compile the
> > s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and th=
ere
> > to hope that these silence the compiler warnings? ... I tend to wait fo=
r the
> > bug ticket to see whether the GCC folks change the behavior of the comp=
iler
> > again, but I'm open for other suggestions.
>
> Assuming it is just this one place in the code ,then we should just
> use "pragma" to temporarily disable/re-enable that single warning flag
> either side of the problem.

The gcc bug report suggests that use of 'volatile' also sidesteps
the warning. Is that a sensible approach here ?

thanks
-- PMM

