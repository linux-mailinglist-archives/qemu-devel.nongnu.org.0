Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E23E28C6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:38:24 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxF9-0004mC-FO
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBxEN-00046c-Jy
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:37:35 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBxEL-0003Zp-Q5
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:37:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id cf5so12426226edb.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkbJ28F7o/SE+jfxAjTXNSyglO1W/ahHC64F6ycCd1o=;
 b=yTwpYQpmxZ25DEAKX8kOlbDUfBrXxEc2hl/5xmY3c5fQjjs9faEjiQa/XFlMPtX4GM
 jYmTTVP4RTwDM2OP8QWz77ngiTf/VYac/ziRyyZZ/omumcsv1BEgSMwllvK6VbcvPqEH
 3eoLXrZO712S9g8IbYuRLJOwFhw6p+bXCMvjnqSaI9LgNwDs4hHm4a079p050Hdu8IJF
 BF4DxoNo2ltpwOPuQEQBYLOcPZaJoMp7/1UoMfTuaxrZdvSwaoz0zxyE/eYMuaQW/IEk
 Kn1QV1BbTwMSSdUnv1FFkO5q8tCcVN4lvHWVmV9mFv4Qn9T6uKZFEigJP8Z3uz2IxRKo
 Eu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkbJ28F7o/SE+jfxAjTXNSyglO1W/ahHC64F6ycCd1o=;
 b=FfSNRKmKm7CDaTNisIXoWXzu6W/DXb4DXXwF/fKEITL5PP01OILqWdNoj2MIdC+wnE
 v/Lw2xXrqUan2sScJDz3/ObNQ9Em0UpaoKU7tql80/AdMCYH5Q4rsCfx617woL+6keJw
 vXiwpQoz8nyVuWjugK0cRKi7x5kKjTaQLdCjcSQTAsXseX8YcamDeGGTAWplq9nBfhgS
 uoIfm6vcUQnNMq5f9+vY4WJQuY3dNixn2cjgNGTLlACqfk6QqaVu45EkGJwXT5vrSTmH
 hpUd0o/6wKAeD7PYL+XK+NYWz4VKaaS5JyOEmdWAQJcNUSB4IIPg1E0P5NLWLgscJpCy
 mabA==
X-Gm-Message-State: AOAM532ZCTeh2sZfBiT+lolUWQXZBf4CwuLHiRuzz4+Vl2FByK4UP1JA
 /oaymNjnKP9xhvxmzePyd5rcIM0SEby7XqFnfKumxQ==
X-Google-Smtp-Source: ABdhPJxc/0i+4JNhFVLyo2wcg0MIWEig+1Jj0Nr326Ik02cEhVrtG8xAg41fq9OCBLNRUqKayemzlgkPZyXTo5H5jxg=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr12021922edr.52.1628246251984; 
 Fri, 06 Aug 2021 03:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-QcwjGtgzqkLshyU4NCq2ZhhdvJN3V_7rTCA4nUavhaQ@mail.gmail.com>
 <20210804094231-mutt-send-email-mst@kernel.org>
 <CAFEAcA9yb9MzY3w1G5xcPdY0h-S=m2Z8YOxc7fLTU4TOJ4z6-w@mail.gmail.com>
 <CAFEAcA-y8R-tXv1vd68V9x69pyc0whns35yvft5fP5JUMgV2oQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-y8R-tXv1vd68V9x69pyc0whns35yvft5fP5JUMgV2oQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Aug 2021 11:36:48 +0100
Message-ID: <CAFEAcA8kYpz9LiPNxnWJAPSjc=nv532bEdyfynaBeMeohqBp3A@mail.gmail.com>
Subject: Re: intermittent failure, s390 host, x86-64 guest, vhost-user-blk test
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 at 18:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 4 Aug 2021 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 4 Aug 2021 at 14:43, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Aug 04, 2021 at 01:40:37PM +0100, Peter Maydell wrote:
> > > > Saw this intermittent as part of my ad-hoc CI test setup.
> > > > The backtrace says that the QEMU process has somehow hung
> > > > during 'realize' of the vhost-user device...
> > >
> > > Hmm seems to have to do with the daemon not responding ...
> > > Cc a bunch more people ...
> >
> > Here's another one; same thing, but a ppc64 guest, I think.
>
> Ran into this again; I'll spare you the backtraces but it was the
> same 'hang in realize', this one for qemu-system-i386. Same s390 host.
> This seems to be a fairly frequent intermittent -- can somebody
> have a look at it ?

I think I have also now seen this hang on aarch64 host:

pm       2507739  0.0  0.0   7300  3104 ?        S    09:29   0:00
             \_ bash -o pipefail -c echo
'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/pm/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/qos-test --tap -k' &&
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/pm/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/qos-test --tap -k -m quick < /dev/null |
./scripts/tap-driver.pl --test-name="qtest-i386/qos-test"
pm       2507744  0.0  0.0  88952  8292 ?        Sl   09:29   0:00
                 \_ tests/qtest/qos-test --tap -k -m quick
pm       2515688  0.0  0.0 333288 21044 ?        Sl   09:30   0:00
                 |   \_ ./storage-daemon/qemu-storage-daemon
--blockdev driver=file,node-name=disk0,filename=qtest.EjWt12 --export
type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-2507744-sock.s5wii0,node-name=disk0,writable=on,num-queues=1
pm       2515689  0.0  0.0 869272 65868 ?        Sl   09:30   0:00
                 |   \_ ./qemu-system-i386 -qtest
unix:/tmp/qtest-2507744.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2507744.qmp,id=char0 -mon
chardev=char0,mode=control -display none -M pc -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-2507744-sock.s5wii0
-accel qtest
pm       2507745  0.0  0.0  17404 11244 ?        S    09:29   0:00
                 \_ perl ./scripts/tap-driver.pl
--test-name=qtest-i386/qos-test


Not 100% sure it's the same hang, because the machine doesn't let
me do ptrace-attach-to-process, but it seems likely.

-- PMM

