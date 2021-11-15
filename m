Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BF450A57
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:57:50 +0100 (CET)
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfIj-000687-G1
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfGL-0002OP-M1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:55:22 -0500
Received: from [2a00:1450:4864:20::434] (port=45834
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfGJ-0007bz-Op
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:55:20 -0500
Received: by mail-wr1-x434.google.com with SMTP id w29so31964392wra.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B/OXPmI3RngCNkk8ICOVeLicfkuhNzNjtyo/vtKuFDU=;
 b=E9W9KbTE/1BbmatVaaNw8/l07z5Jx1dTF7BrH7u2o1XjekujbZvagJpC8ztCBlCTsS
 8ct5lENovoNVR4S1IlKLzRbczXF0pJxdAr3uPWjKHp9F/mMnQBMgdgOoUyYD+9w5UACP
 15biYeed2AGIO+djL08znGa8Db9AZ8I8VcBDRkvo54IBUQSEkJWXpoKwTCFsvDjEllh/
 8EosaWanLBY3K2KKFLOTgUYtlyOtIcjgrxuoMJC0YuXIUl+w/VwYAb2HwFS1zlrNkUF4
 B+k+iEWlkVJOok0KDEQhsQ8nqLNy3glYpMb/+nNmgwMil+Nu1DsHt/50AnN4wApFddxu
 qmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B/OXPmI3RngCNkk8ICOVeLicfkuhNzNjtyo/vtKuFDU=;
 b=XfLNHMjRH7X3aoQ5B3mQBipeuQzi9kd1+9X4qKq7nI1Ljno/MDIYYK5JazTB7XwZKC
 Cmu5pGwsNqMcuc3u+UMMu5qcDgIQd0Blc1wDNWH0s7qnIjng5zdOwbtCstsetrx0IRMB
 x1ROnuyx6zbT7iaLaiJzf49pxfXFzqbx9kYH3sMzllWh3O65tUI6mQ89thIauq+JvSef
 aTpbUuoB74RPccTAg0IIN9Jxc3mMI0DPnHgR2MMiW+kbzU4p7GwGJ8GwB3tQVpXYhFrv
 37WYYmlP3RX6f5YizWBo5UaNXgV6hlqbzLuVNW4V/uTaHty6HLvs2Id22mhMKIJuBAR4
 9SpA==
X-Gm-Message-State: AOAM531wzWr4AJtjQx3xnRnSpRih4Qjqq5DG6UQWGZFglp9jz2RX4Edp
 d75TX80xzK2eLsQ61vN3bCcjYngdDlHAD/2FI3ZJTg==
X-Google-Smtp-Source: ABdhPJzuIRffkCJ8Mbut5l9qHMlvYjq1U3NCTQLQ67aghm4c9MeYaU7jXN834Mezje6Q5qJzDlXGokEVPt1UN9RYL+Q=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr581394wrf.302.1636995318277; 
 Mon, 15 Nov 2021 08:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-22-pbonzini@redhat.com>
 <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 16:55:07 +0000
Message-ID: <CAFEAcA-_Odr5ep9mAHURSrmeG9KjJiCorNSc9Afje+RvJ-zWdg@mail.gmail.com>
Subject: Re: [PULL 21/26] configure, meson: move more compiler checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

On Mon, 15 Nov 2021 at 16:36, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 14 Oct 2021 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  configure        | 91 ------------------------------------------------
> >  meson.build      | 44 +++++++++++++++++++++++
> >  util/meson.build |  4 ++-
> >  3 files changed, 47 insertions(+), 92 deletions(-)
>
>
> > diff --git a/meson.build b/meson.build
> > index 6bf43e6d30..6b7487b725 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1550,6 +1550,8 @@ config_host_data.set('CONFIG_INOTIFY',
> >                       cc.has_header_symbol('sys/inotify.h', 'inotify_in=
it'))
> >  config_host_data.set('CONFIG_INOTIFY1',
> >                       cc.has_header_symbol('sys/inotify.h', 'inotify_in=
it1'))
> > +config_host_data.set('CONFIG_IOVEC',
> > +                     cc.has_header_symbol('sys/uio.h', 'struct iovec')=
)
> >  config_host_data.set('CONFIG_MACHINE_BSWAP_H',
> >                       cc.has_header_symbol('machine/bswap.h', 'bswap32'=
,
> >                                            prefix: '''#include <sys/end=
ian.h>
>
> Hi -- I've just noticed that this change breaks compilation for me,
> because this test incorrectly fails to set CONFIG_IOVEC on a system
> where the header defines 'struct iovec'.

That wasn't quite right. On further investigation, the problem is that
the meson tests silently misbehave if you included "-Werror" in your
--extra-cflags. This results in meson building all the tests with -Werror,
but meson's generated code for tests can't handle that. (configure
gets this right because it has code in that specifically checks
"does this test case give the same result for -Werror and not".)

-- PMM

