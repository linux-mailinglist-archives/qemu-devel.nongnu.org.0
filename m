Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5E36E616
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:34:51 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1CE-0004U3-BQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lc1B2-0003El-VE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:36 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lc1B1-00076K-89
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:36 -0400
Received: by mail-il1-f180.google.com with SMTP id r5so13442730ilb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+vVLwgt9+sFmJpK2KARylC2815+iplcbXpcHRsyeX4=;
 b=fS4vyRuGBuvgAcj9owVWxALJaKA/bGkRjYlCrfUD2k3sQeG4Rl5nGeCbqyKxmWvznZ
 R04SekahCVp1+POYvo1RgqcmcpOw4yYdm8Rc0j9sCHo2EjbpW+Wngnj+9POf5PFt0me9
 7R5KCMS9Abhrz8uXHov0TK6XP1m2rGeA92sdsfplvvBPvMU6NhgjAs5L2JQh0zhvePHZ
 9SwwGwRlAvfmUPw8c1b1fizMwEWw7+ah9fEDiTBscTD9XYwxI/TYMSfzEYtI+d/FHp4F
 LygIAUyL2QDfe83gHAPEcifdx16UqCCBTsS24ofXlL3GpND+PMYwxY9Yj3TL3lwItNxl
 4Xxg==
X-Gm-Message-State: AOAM531IPS6gRSy8DnSSURysvoNKDeg/mC16LuRXNkEL92FjzvtL4ZdG
 NE9L028IpG4O2RKNlo9bt4r6SMedaKs=
X-Google-Smtp-Source: ABdhPJxhdD/yi7NvJdUDmtgxaHCmeSrpQh9D3S7kGWUaXDKAjcuo6WaGqLVMxwLbQqirtHZlysC0iQ==
X-Received: by 2002:a92:c944:: with SMTP id i4mr25547725ilq.305.1619681614085; 
 Thu, 29 Apr 2021 00:33:34 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id q5sm1074465iop.17.2021.04.29.00.33.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:33:33 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id b9so12719212iod.13
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:33:33 -0700 (PDT)
X-Received: by 2002:a5d:8b56:: with SMTP id c22mr27367336iot.84.1619681613399; 
 Thu, 29 Apr 2021 00:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210428195558.16960-1-j@getutm.app>
 <dd5fc80e-c08a-95a5-57e9-28a123196eff@redhat.com>
In-Reply-To: <dd5fc80e-c08a-95a5-57e9-28a123196eff@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 29 Apr 2021 00:33:22 -0700
X-Gmail-Original-Message-ID: <CA+E+eSD11QHWh5HUZT+74_1k3-KPAym09An6=8BtSKjROAY_fA@mail.gmail.com>
Message-ID: <CA+E+eSD11QHWh5HUZT+74_1k3-KPAym09An6=8BtSKjROAY_fA@mail.gmail.com>
Subject: Re: [PATCH] meson: change buildtype when debug_info=no
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.180; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joelle van Dyne <j@getutm.app>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 10:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 4/28/21 9:55 PM, Joelle van Dyne wrote:
> > Meson defaults builds to 'debugoptimized' which adds '-g -O2'
> > to CFLAGS. If the user specifies '--disable-debug-info' we
> > should instead build with 'release' which does not emit any
> > debug info.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  configure | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/configure b/configure
> > index 4f374b4889..5c3568cbc3 100755
> > --- a/configure
> > +++ b/configure
> > @@ -6398,6 +6398,7 @@ NINJA=3D$ninja $meson setup \
> >          --sysconfdir "$sysconfdir" \
> >          --localedir "$localedir" \
> >          --localstatedir "$local_statedir" \
> > +        --buildtype $(if test "$debug_info" =3D yes; then echo "debugo=
ptimized"; else echo "release"; fi) \
>
> NAck. You are changing the default (which is 'debug') to 'release'.

I thought 'debugoptimized' was the default? From my build logs,
there's always '-g -O2' which is why I needed to make this change. The
default for 'debug_info' is yes so this keeps it on 'debugoptimized'
and uses 'release' when explicitly disabling debug_info.

>
> This should be at least mentioned in the commit description, but
> I don't think this is what we want here. 'release' enables -O3,
> which is certainly not supported. The 'debug' profile is what we
> have been and are testing.
>
> I'd be OK if you had used "debugoptimized else debug".
>
> The mainstream project would rather use 'debug'/'debugoptimized', or
> 'minsize', which are already tested. We might consider allowing forks
> to use 'plain' profile eventually. But the 'release' type is an
> unsupported landmine IMHO.
>
> If you want to use something else, it should be an explicit argument
> to ./configure, then you are on your own IMO.

What do I need to avoid '-g'?

-j

>
> Regards,
>
> Phil.
>

