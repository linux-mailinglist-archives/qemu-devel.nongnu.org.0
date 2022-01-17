Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD169491234
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 00:12:22 +0100 (CET)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9bAj-0001F2-T7
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 18:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9b7k-0007hP-Qa
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 18:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9b7i-0003FW-0t
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 18:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642460946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZFKXAkLk5BSNwbIqtGwDuXs8yKu6st9ghkJhbSBlmlg=;
 b=iL7G/aTdX4KhxHolXTfuFogrQww82C/umdX3aiNNpJfx9b/cKoKQy7FBN/0RudgN/WEPf3
 ednBhpoFCtrmHWoADgaOQ9sxZcVCqzQGUO50eLn0g6vUsRS6jHH4X8dyPrA08uCItZyjBp
 94d/Wj7bVPWKDbXFikzHRlUjD+Kc6iA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-lI8RxZtYPEWiUi5cHSuUDQ-1; Mon, 17 Jan 2022 18:09:04 -0500
X-MC-Unique: lI8RxZtYPEWiUi5cHSuUDQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so10915197uaa.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 15:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFKXAkLk5BSNwbIqtGwDuXs8yKu6st9ghkJhbSBlmlg=;
 b=LXaMDz3jI/fcuo44zt/R41xdTsaVCMynAYhaRsjmLwDaFJCmvGk6yTQ1MciH8QPcgJ
 e6o8LgIbyhug5f1EId2rstpFq8zIFhtAXG8K4jy9YwTp0MFS40smaY2+bhlKbk57141N
 uYn9h4xVQKTHS0zgTjSEnWqVc7/9mk592r3LdZuKYslG9Na6yLn44Jpiy43a98VzlN9A
 YsKut6PfPN+VwGbqqBO8Sz0kSNN9M+avpcuiEQPK1VsOtHwgaWU4Lle1K2RhqyBxtrbA
 mOafkB2tQvc+zQRTRS7NVDY+QwY7Jj3rBEiHFbSjPziIJNdi1CHH1ZsN4Px0Ve7URfD6
 BXbw==
X-Gm-Message-State: AOAM530lFglGnD14kwqK0Fo1xs3md194g/O7iw8PVm3wK4BASMJ73Ijc
 18gSnnn4e7foupTuZ6/9TOsp30ghJPtMhYDiRfXmUvroxZKnVerJUYcL7WWA8tJE9wQS9/wZ90E
 urGAWqP6OYln15727jByCnw/y7ZqMzME=
X-Received: by 2002:ab0:6497:: with SMTP id p23mr8773805uam.32.1642460944087; 
 Mon, 17 Jan 2022 15:09:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3yMZ3CvBvaeimGfw4sYXErMg3T+dSvkP10xhru9IQ/0/o8PlpNvWwwcGRQ8U/RQGhbjsg/uF08/YUNzTv0z4=
X-Received: by 2002:ab0:6497:: with SMTP id p23mr8773799uam.32.1642460943825; 
 Mon, 17 Jan 2022 15:09:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
 <CAFEAcA_uBfCyJVq24p1jt5gaRmcMCZsjXae4y69QZ5dXpYX_Pg@mail.gmail.com>
In-Reply-To: <CAFEAcA_uBfCyJVq24p1jt5gaRmcMCZsjXae4y69QZ5dXpYX_Pg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Jan 2022 18:08:52 -0500
Message-ID: <CAFn=p-Zba+Ge6EckjRzkKsH4vU18RkspBaJvpSVE9H6gEU=r+Q@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

On Mon, Jan 17, 2022 at 3:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:
>
> > Can you please try applying this temporary patch and running `./check
> > -qcow2 040 041` until you see a breakage and show me the output from
> > that?
>
> With this temporary patch the VM doesn't launch at all:

"Works for me", but I found out why.

>
> peter.maydell@hackbox2.linaro.org:~/qemu-netbsd$ make -C build/
> vm-build-netbsd J=8 V=1 2>&1 | tee netbsd.log
> make: Entering directory '/home/peter.maydell/qemu-netbsd/build'
> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/meson/meson.py
> introspect --targets --tests --benchmarks | /usr/bin/python3 -B
> scripts/mtest2m
> ake.py > Makefile.mtest
> { \
>   echo 'ninja-targets = \'; \
>   /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
>   echo 'build-files = \'; \
>   /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
> outputs:/q; s/$/ \\/p'; \
> } > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
> (GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
> (GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
> --debug  --jobs 8 --verbose    --image
> "/home/peter.maydell/.cache/qemu-vm/images/netbsd.img"  --snapshot
> --build-qemu /home/peter.maydell/qemu-netbsd --
> DEBUG:root:Creating archive
> /home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar
> for src_dir dir: /home/peter.maydell/qemu-netbsd
> DEBUG:root:QEMU args: -nodefaults -m 4G -cpu max -netdev
> user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
> virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
> -drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
> -device virtio-blk,drive=drive0,bootindex=0 -drive
> file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
> -device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1
> DEBUG:asyncio:Using selector: EpollSelector
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Registering
> <qemu.aqmp.events.EventListener object at 0x7f3b76bfc9b0>.
> DEBUG:qemu.machine.machine:VM launch command: 'qemu-system-x86_64
> -display none -vga none -chardev
> socket,id=mon,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
> -mon chardev=mon,mode=control -machine pc -chardev
> socket,id=console,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-console.sock,server=on,wait=off
> -serial chardev:console -nodefaults -m 4G -cpu max -netdev
> user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
> virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
> -drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
> -device virtio-blk,drive=drive0,bootindex=0 -drive
> file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
> -device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1'
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
> 'Runstate.IDLE' to 'Runstate.CONNECTING'.
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting connection
> on /var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
> ...
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Connection accepted.
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting greeting ...
> DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:<-- {
>   "QMP": {
>     "version": {
>       "qemu": {
>         "micro": 1,
>         "minor": 11,
>         "major": 2
>       },
>       "package": "(Debian 1:2.11+dfsg-1ubuntu7.38)"
>     },
>     "capabilities": []
>   }
> }

Well, today I learned that:

(1) vm-build-XXX targets use your host system's QEMU to run that VM
(2) my QMP library cannot talk to QEMU 2.11.

That doesn't explain the intermittent netbsd failure yet, though.
(I guess this wasn't a failure point for you due to the aggressive
caching of the VM images? Unlucky.)

Here's another hotfix, this one I cannot easily test quickly (I don't
have 2.11 handy and it no longer builds for me),
but I think it'll fix the VM installation problem against older QEMU versions:

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 8105e29fa8..6b43e1dbbe 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
         """
         self.logger.debug("Negotiating capabilities ...")

-        arguments: Dict[str, List[str]] = {'enable': []}
+        arguments: Dict[str, List[str]] = {}
         if self._greeting and 'oob' in self._greeting.QMP.capabilities:
-            arguments['enable'].append('oob')
+            arguments.setdefault('enable', []).append('oob')
         msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)

         # It's not safe to use execute() here, because the reader/writers


