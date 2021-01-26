Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D03030ED
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:14:02 +0100 (CET)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Bzd-0008J5-JC
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l4Byf-0007oc-G5
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:13:01 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l4Byd-0006Cn-Gi
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:13:01 -0500
Received: by mail-io1-f44.google.com with SMTP id e22so30315936iog.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 16:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4G0Pad2MVNmYhT/T2B3oqNjX8uTAW3sgRIP2eX/poOQ=;
 b=toSt3XV2ryqkUHVcX/NuEQ/62C4jFeL2XBIq+yNQJAVj1hhraZKXUu7nD8rsQV05pF
 cgR+sh39ykc9vrcqmsyRa20DomNvvIZAECx9yhTxMndApv+mDAJcJ9qLfjKs1lwS+7L0
 5B32aQmYvX9cuChNmN19Md4zZFnuuWDo50pdTMP6qeCtbuMyc7+xMZ37tGBZS1ipJ33y
 qcMNkIBG5mqUm1gHwCCjONliJk9NK6jNWhFgct0JTLQusa1gT1Z0wGn2lKrlT2/1/xDb
 qfBaVqDjSXThsSP13RzfGiLA+PY91FKbk+n7I1x1t+qQT7U4Ln12h9U4TFR5LfcMh0K2
 c6ng==
X-Gm-Message-State: AOAM532CwPJjL4TFpe2BZ1o6d7t4yueIUNIXicqYdoYs93lnNYdQ3N+W
 OuSgo75MqS8VvLOPTmio/uwng2C4wFA=
X-Google-Smtp-Source: ABdhPJzTrf8gPFbsSxhAx263x+sIysUGDytpMuKMgGrxtfTf3WgxLuT5MY6oMgmh6cXndFHAgpClfg==
X-Received: by 2002:a92:c26f:: with SMTP id h15mr2423790ild.65.1611619977641; 
 Mon, 25 Jan 2021 16:12:57 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id k11sm2897545ilo.8.2021.01.25.16.12.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 16:12:57 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id y19so30326205iov.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 16:12:56 -0800 (PST)
X-Received: by 2002:a6b:fb09:: with SMTP id h9mr2301977iog.32.1611619976745;
 Mon, 25 Jan 2021 16:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
 <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
 <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
 <59a773e4-b277-a8a2-b496-d95b515718e2@redhat.com>
In-Reply-To: <59a773e4-b277-a8a2-b496-d95b515718e2@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 25 Jan 2021 16:12:45 -0800
X-Gmail-Original-Message-ID: <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
Message-ID: <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.44; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joelle van Dyne <j@getutm.app>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's how meson does cc.has_function

https://github.com/mesonbuild/meson/blob/master/mesonbuild/compilers/mixins/clike.py#L761

Since the compiler error comes from the header file with

__attribute__((availability(ios,unavailable)))

The meson check will always pass.

cc.compiles should work though. Is there a reason why it's not used
instead of all the compile_prog checks in ./configure ?

-j

On Mon, Jan 25, 2021 at 12:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 23/01/21 14:45, Peter Maydell wrote:
> > On Sat, 23 Jan 2021 at 03:18, Joelle van Dyne <j@getutm.app> wrote:
> > On Fri, Jan 22, 2021 at 3:17 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >>> Can we do the "does system() exist?" check in meson.build ?
> >
> >>> config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system'))
> >
> >> Unfortunately, this doesn't work for iOS, which defines system() but
> >> throws a compile time error if you try to call it.
> >
> > That's odd -- as far as I can tell the meson implementation
> > of has_function() does what I expected it to do, ie
> > "try to compile and link a little program that uses the
> > function, and see if it successfully links":
> > https://github.com/mesonbuild/meson/blob/39ede12aa5b27376341df85bc9ec254913f044bd/mesonbuild/compilers/mixins/clike.py#L791
> > There's some initial cleverness there too, so I guess some
> > part of that must be what's tripping us up.
> >
> > In any case, I think we should be doing new checks in
> > meson.build, not configure.  Paolo, what's the right
> > way to do a meson "really compile this program and
> > check it built" test?
>
> One possibility is that you have to specify the #include in the "prefix"
> argument of cc.has_function for the test to behave as the QEMU code?
>
> If cc.has_function doesn't work, there's cc.compiles() and cc.links().
>
> Paolo
>

