Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920F301293
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 04:20:05 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l39T1-00050V-Pl
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 22:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l39Rq-0004XK-Qs
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 22:18:50 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:40850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l39Rp-0005GO-AY
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 22:18:50 -0500
Received: by mail-io1-f48.google.com with SMTP id n2so15367917iom.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 19:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQy34Bw62K+CliVm53B5l1j2q8byGNqEXoRXke6xJ6E=;
 b=GDiOP5+SBKYNQuFWvnDPZgnfR6vpTOETe+RdxxNnCBbZEGTtyOMqGwh0uvyStRVqmz
 WxNJxzbAbjKpSWMAlLp3hDnjSjJ7VXFuEJ+NA9rIX5VMDyCUBmWqCSDh/AUgRaUAb5A1
 DBn29vJFk7q905Gr/sign+3QG2H95v28BBpQZR0GbVnC3MFDodQqJk/LOibdTHZTuI8R
 FHAcFupJc7IQYo/hzIi2RZtEkx0oBO+oEtD4y+daj4ix5h32Y+HLIgInvfSpNMHZucmZ
 B9/86Zg54NkeSTTIzvQYlll1Dq1gwf4JILowLYTg/ZUa0rPyWI//rr7z3SGAoNOnGPWJ
 C+KQ==
X-Gm-Message-State: AOAM530fRvh3KrfJTvZ+UqGa3Or49/Mcb6LjTFi0w6zghG1pGePi8J+v
 cFaIuTgoTKu7vSF1tNDc5WkjGGDGf4I=
X-Google-Smtp-Source: ABdhPJy2OaMzvQqkOI3bJN3oMSmpcSyaN7rklTzCEEiT/dEWGvXMvliLt2wNamrUzSNArTK0oq1cQw==
X-Received: by 2002:a05:6638:184:: with SMTP id
 a4mr119151jaq.142.1611371927949; 
 Fri, 22 Jan 2021 19:18:47 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id l20sm7348936ioh.49.2021.01.22.19.18.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 19:18:47 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id e22so15369400iog.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 19:18:47 -0800 (PST)
X-Received: by 2002:a92:40c4:: with SMTP id d65mr6700807ill.197.1611371927229; 
 Fri, 22 Jan 2021 19:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
In-Reply-To: <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 22 Jan 2021 19:18:36 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
Message-ID: <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately, this doesn't work for iOS, which defines system() but
throws a compile time error if you try to call it.

-j

On Fri, Jan 22, 2021 at 3:17 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 22 Jan 2021 at 23:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 22 Jan 2021 at 20:13, Joelle van Dyne <j@getutm.app> wrote:
> > >
> > > Build without error on hosts without a working system(). An assertion
> > > will trigger if system() is called.
> > >
> > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> >
> >  configure            | 19 +++++++++++++++++++
> >
> > Can we do the "does system() exist?" check in meson.build ?
> > Untested, but looking at the existing check for "does gettid() exist?"
> > it should be two lines:
> >
> > has_system = cc.has_function('system')
> >
> > and then later:
> >
> > config_host_data.set('HAVE_SYSTEM_FUNCTION', has_system)
>
> ...looking at how we do the HAVE_FOO_H settings, I think we
> can just collapse this into one line:
>
> config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system'))
>
> thanks
> -- PMM

