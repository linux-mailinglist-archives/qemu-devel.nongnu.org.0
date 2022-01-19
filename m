Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391B494160
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:59:29 +0100 (CET)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAH79-0003AP-Se
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAH4s-0001d8-Ra
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAH4q-00021Z-8u
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642622223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWvF2sFjY9K3gzPJFAtr4lR6rlN2lxlmg+JX0l/QSTA=;
 b=c+8OZXrKg7C91ydenGMzam8tdhHkQ+YL58IKMYGuD4wupsGPCH3FY5GgAkw8Mj0+gKH/nL
 +UPb5Z6G7bxmn5Be/Nwq4cKQpeyeTnZzMFH3jWXKgy7M9tpo8c5n9sL5f8ymX4n1E+fPXp
 FKNrGyuZsK9cw6ZoymDoTAAXtZDSgJc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-b5sC5QhNPnmHyv0M9Xda3w-1; Wed, 19 Jan 2022 14:57:01 -0500
X-MC-Unique: b5sC5QhNPnmHyv0M9Xda3w-1
Received: by mail-ua1-f72.google.com with SMTP id
 t14-20020ab0550e000000b00305905ffc31so2013195uaa.16
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 11:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWvF2sFjY9K3gzPJFAtr4lR6rlN2lxlmg+JX0l/QSTA=;
 b=65KjwAfYOQ3EM2aB/H1ZyUeul7o6g1/xx6j48N+WmNnBXqqnvVon6yWFeZNj/t1XBE
 Eqp8wALKQgkuhTcQ95loGYPxg0bNZPUxxyYHUeqis1MAB2+N+n5d26KQZOjysz8uPmnv
 0rmmONZsqPTx7TUHOoFEVHnnBoBSG/fY9Ga/NVv8BUIFyjedtFTdHtE5QUQUWlMDvCPM
 PTfIIimlsE2fVWW+4t8lEQ67C1QOOeQNuE3r3MwVm+iIsi0vcmj50D4wBgn3nzqvZafE
 DnpKP10ZOOh9y+r0jtBsQ7i+uEjwQZV7oAykaGwlHel7HVkpCx5RrtkrTLr4P7IjG8qI
 jjwA==
X-Gm-Message-State: AOAM533KgyOx3nTe6vf8tbCRyD35cz+sEPeKi949+A+XlA6bOW1Jzl4h
 oBhY80haowbuvg4CWlEP9z7E6/dH6nnsub7D0jaXU6OjcR0Nz3tp6SS6nge+uqkQCkL3l3qrqTf
 4li41TSJwF6C/r72qTUFiHb+cU7x8spA=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr12594347vst.61.1642622220738; 
 Wed, 19 Jan 2022 11:57:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoVLHnEqlb3Og6SwWclym6G91dXY60vCGw/SX7QiZwVCsCoIS9mJczEIn5xg7zr2XXY1kR+1DGckqvR91gIJg=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr12594336vst.61.1642622220415; 
 Wed, 19 Jan 2022 11:57:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
 <CAFEAcA__xayWZJWCmcPQqR40rKsNk0JxbAe7Hx8V65wSuXCfEg@mail.gmail.com>
 <CAFn=p-aLZmh4erVjsMEORJAj5ZC4ME_6TuWh_Bk=EQz=Xh8Ohw@mail.gmail.com>
In-Reply-To: <CAFn=p-aLZmh4erVjsMEORJAj5ZC4ME_6TuWh_Bk=EQz=Xh8Ohw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 19 Jan 2022 14:56:49 -0500
Message-ID: <CAFn=p-YjDwjyozNnQ0Kvofyw6B0Vtk42Br2LHWPK1T0rXF-cDQ@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 1:34 PM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Jan 18, 2022 at 7:13 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:
> > > I do expect this to print more information on failure than it
> > > currently is, though (bug somewhere in machine.py, I think).
> > > Can you please try applying this temporary patch and running `./check
> > > -qcow2 040 041` until you see a breakage and show me the output from
> > > that?
> >
>
> Thanks for playing tele-debug.
>
> > Having fixed my setup to not use an ancient host QEMU, here's
> > the relevant bit of the log:
> >
> >   TEST   iotest-qcow2: 037
> >   TEST   iotest-qcow2: 038 [not run]
> >   TEST   iotest-qcow2: 039 [not run]
> >   TEST   iotest-qcow2: 040 [fail]
> > QEMU          --
> > "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64"
> > -nodefaults -display none -accel qtest -machine virt
> > QEMU_IMG      --
> > "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-img"
> > QEMU_IO       --
> > "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-io"
> > --cache writeback --aio threads -f qcow2
> > QEMU_NBD      --
> > "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-nbd"
> > IMGFMT        -- qcow2
> > IMGPROTO      -- file
> > PLATFORM      -- NetBSD/amd64 localhost 9.2
> > TEST_DIR      -- /home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch
> > SOCK_DIR      -- /tmp/tmp1h12r7ev
> > GDB_OPTIONS   --
> > VALGRIND_QEMU --
> > PRINT_QEMU_OUTPUT --
> >
> > --- /home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040.out
> > +++ 040.out.bad
> > @@ -1,5 +1,95 @@
> > -.................................................................
> > +.......ERROR:qemu.aqmp.qmp_client.qemu-12407:Failed to establish
> > connection: concurrent.futures._base.CancelledError
> > +ERROR:qemu.machine.machine:Error launching VM
> > +ERROR:qemu.machine.machine:Process was forked, waiting on it
> > +ERROR:qemu.machine.machine:Command:
> > '/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64
> > -display none -vga none -chardev
> > socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock -mon
> > chardev=mon,mode=control -qtest
> > unix:path=/tmp/tmp1h12r7ev/qemu-12407-qtest.sock -accel qtest
> > -nodefaults -display none -accel qtest -machine virt -drive
> > if=none,id=drive0,file=/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=mid,backing.backing.node-name=base
> > -device virtio-scsi -device scsi-hd,id=scsi0,drive=drive0'
>
> > +ERROR:qemu.machine.machine:Output: "qemu-system-aarch64: -chardev
> > socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock: Failed to
> > connect to '/tmp/tmp1h12r7ev/qemu-12407-monitor.sock': No such file or
> > directory\n"
>
> ... Oh. That's unpleasant. My guess is that we aren't listening on the
> socket before the QEMU process gets far enough to want to connect to
> it. The change to an asynchronous backend must have jostled the
> timing.
>
> > +ERROR:qemu.machine.machine:exitcode: 1
>
> And, oh: The VM launching library only chirps about *negative* error
> codes. That's why it wasn't printing anything more useful. I suppose
> the thinking was that we use the VM launch utility to knowingly launch
> bad command lines, so we only wanted to see failure notifications on
> -errno style codes, but that obviously makes debugging unintentional
> failures a lot more awful. I'll try to improve the usability and
> legibility of the errors here.
>
> Thanks,
> --js

I've published '[PATCH v2 0/5] Python: minor fixes' and pushed to
jsnow/python. Test it if you want; otherwise I'll wait for
reviews/acks and send a PR like normal. CI is still running on the
final push, but early smoke tests looked good.

(Patch 1 fixes compatibility with QEMU 2.11, patch 3 adds better
diagnostic info to failures, patch 5 should ultimately fix the root
cause of the race condition.)

Thanks,
--js


