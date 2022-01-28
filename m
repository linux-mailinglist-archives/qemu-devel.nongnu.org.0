Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B849FBD6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:36:54 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSMu-0002GT-LX
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nDSHN-0007xz-KE
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:31:09 -0500
Received: from [2607:f8b0:4864:20::1029] (port=51107
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nDSGW-0004fZ-3T
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:31:08 -0500
Received: by mail-pj1-x1029.google.com with SMTP id o11so6657347pjf.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aInKu4PbLE8Bc2ZfOuVksCyCnmWRPnbOqx4QqH7ZeuA=;
 b=R2qGCjUNOVDSK9iChTp3plT+FbVTqXX+GUMPdEPa7XfAer+52O0zhVukOTCbzVZ9hL
 U29URTWG2QRX98zTvS5fQD9yliuBavDCkyedUW4EVuS/6HIooUZFjXCR/fyJEJqHyzk1
 2k01BGRVNfoEe92hWNy5SdSGVKOwmvY51qz9PbSqsTsbBnE9ju+Xt493iETgq/a5aDD6
 2dxO9uAICtDL0spIqJQba77Z6bsPaenut5G5VNdP+y0uUuq4FjDE93BaIC/JfHR8PrWd
 kXRlB7659/BkUyYSwfrBSxMnE3fyKUu1O+9P77yi71UUq48Bm5G9O3VF2jjiUh7cLZgy
 u+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aInKu4PbLE8Bc2ZfOuVksCyCnmWRPnbOqx4QqH7ZeuA=;
 b=uiTh2xxVQGF1N6F2j2V0b6ToaiWllC0yX1+a6jLckQfHDYhHJIF4mqXxUTDyUZp8D4
 2SbOM5qMsbZtTk7eRW6JdZpr4Mg5CAwNPDOLlDKPyPrvAujX8Bfp78Z5qw28qcuNYPzO
 zpOnDWcklOb6XKt4BQi4eba5LsMynji1kgKITpsHcPdDedvoV3TJfPHs2gtW1VTN1sRi
 oqVWz4VZHNZeFSL7GZUt1BQv1y7Il8H/7dpyj+LbIAt9PUlsyOq8H4Mj+b3rvKCX0BPh
 dV+XjcU2ULTyJIKTwqy/L2ZMbfkMIQvYoeyfOYde/szfl/JI/JgWcd+rrk9cbl33Ky0M
 fNbw==
X-Gm-Message-State: AOAM532CPaEutyJjh3sKb+uGYy5d/d+D52MehFxDxG7ZYHB36jHvEBmA
 YPrlZy8lFEm8BftxqkijFRyhT++tWU3bVgD22mA=
X-Google-Smtp-Source: ABdhPJy8zJvz3NsLT8NsJ5XCP9UUlCJk4487AEccQbYbDtRr2KrckyhX4cCakUa9j6kD5JHtkOzfY5IBCaOqO+l7dig=
X-Received: by 2002:a17:90a:f298:: with SMTP id
 fs24mr10155357pjb.75.1643380207280; 
 Fri, 28 Jan 2022 06:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <YekeHW1GdrIZk3dO@roolebo.dev>
 <CADO9X9QZj+Vgtm6xC1sgjm8w0Szpeph7esVx9G44uq4nfaezWA@mail.gmail.com>
 <CAMVc7JWTOp7apYcz_EeZ-cDcUuFqhF7ChnDamDiAL+aqQDjSUw@mail.gmail.com>
In-Reply-To: <CAMVc7JWTOp7apYcz_EeZ-cDcUuFqhF7ChnDamDiAL+aqQDjSUw@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 28 Jan 2022 17:29:56 +0300
Message-ID: <CADO9X9Rw+mcEeXDsE2kzqW5oSPE0Kvc2mn9c-rFTp3x42kEpww@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007c66ba05d6a54582"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007c66ba05d6a54582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 21 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 16:03, Akihiko Oda=
ki <akihiko.odaki@gmail.com>:

> On Fri, Jan 21, 2022 at 9:19 PM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> >
> > =D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:32, Roman B=
olshakov <roman@roolebo.dev>:
> >>
> >> On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> >> > Create separate netdevs for each vmnet operating mode:
> >> > - vmnet-host
> >> > - vmnet-shared
> >> > - vmnet-bridged
> >> >
> >>
> >> Sure I'm late to the party but what if we add only one backend - vmnet
> >> with default mode set to shared and all parameters are added there?
> >>
> >> The CLI would look more reasonable for the most typical use case:
> >>  -netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1
> >>
> >> That would remove duplication of options in QAPI schema (e.g. isolated
> >> is available in all backends now, altough I'm not sure if it makes sen=
se
> >> for bridged mode):
> >>
> >>  -netdev vmnet,id=3Dif1,isolated=3Dyes
> >>
> >> start-address, end-address and subnet-mask are also used by both share=
d
> >> and host modes.
> >>
> >> Bridged netdev would lool like:
> >>
> >>  -netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1
> >>
> >> Checksum offloading also seems to be available for all backends from
> >> Monterey.
> >>
> >> The approach might simplify integration of the changes to libvirt and
> >> discovery of upcoming vmnet features via qapi.
> >>
> >
> > I can rewrite this if it sounds more suitable to use
> > single `vmnet` netdev instead of three different ones.
> > We can discuss this with Markus as a QAPI reviewer.
> > Markus, what is your opinion about single netdev?
> >
> > P.S. Seems we have enough time for discussion:
> > I started fixing memory leaks found by Akihiko and
> > met a strange deadlock on QEMU shutdown on
> > `qemu_mutex_lock_iothread()` during careful
> > interface destruction with added semaphore.
> > Need to go deeper to understand what's the
> > problem, it will take some time.
> >
> > Mentioned part of Akihiko's review:
> >
> https://patchew.org/QEMU/20220113172219.66372-1-yaroshchuk2000@gmail.com/=
20220113172219.66372-4-yaroshchuk2000@gmail.com/
>
>
> Actually I thought it would be tricky to implement.

You mean single netdev type?

Actually I thought it would be tricky to implement. A deadlock will
> occur in a simple implementation if vmnet_send is already queued but
> not executed yet when destructing:
> - vmnet_send tries to lock the iothread and waits for the destructor to
> unlock.
> - vmnet_stop_interface waits for vmnet_send finishing.
>
>
Sounds like that's what happens actually.
With added semaphore:
--- a/net/vmnet-common.m
+++ b/net/vmnet-common.m
@@ -320,13 +320,14 @@ void vmnet_cleanup_common(NetClientState *nc)
         "org.qemu.vmnet.destroy",
         DISPATCH_QUEUE_SERIAL
     );
-
+    dispatch_semaphore_t if_destroy_sem =3D dispatch_semaphore_create(0);
     vmnet_stop_interface(
         s->vmnet_if,
         if_destroy_q,
         ^(vmnet_return_t status) {
+            dispatch_semaphore_signal(if_destroy_sem);
         });
-
+    dispatch_semaphore_wait(if_destroy_sem, DISPATCH_TIME_FOREVER);
     for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
         g_free(s->iov_buf[i].iov_base);
     }
--=20

I see this thread dump on deadlock:

(lldb) bt all
* thread #1, queue =3D 'com.apple.main-thread', stop reason =3D signal SIGS=
TOP
  * frame #0: 0x00007fff2037ebb2 libsystem_kernel.dylib`__semwait_signal +
10
    frame #1: 0x00007fff202fec1a libsystem_c.dylib`nanosleep + 196
    frame #2: 0x00007fff212c4bb8 Foundation`+[NSThread
sleepForTimeInterval:] + 170
    frame #3: 0x0000000101ebce3a
qemu-system-x86_64`-[QemuCocoaAppController
applicationWillTerminate:](self=3D0x00007fa9f91a1de0,
_cmd=3D"applicationWillTerminate:",
aNotification=3D@"NSApplicationWillTerminateNotification") at cocoa.m:1202:=
5
    frame #4: 0x00007fff204a00cd
CoreFoundation`__CFNOTIFICATIONCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__ + 12
    frame #5: 0x00007fff2053bb1c
CoreFoundation`___CFXRegistrationPost_block_invoke + 49
    frame #6: 0x00007fff2053ba9a CoreFoundation`_CFXRegistrationPost + 454
    frame #7: 0x00007fff2047134e CoreFoundation`_CFXNotificationPost + 736
    frame #8: 0x00007fff211e1bb8 Foundation`-[NSNotificationCenter
postNotificationName:object:userInfo:] + 59
    frame #9: 0x00007fff22f585b3 AppKit`-[NSApplication terminate:] + 1377
    frame #10: 0x0000000101ebcf1f
qemu-system-x86_64`-[QemuCocoaAppController
windowShouldClose:](self=3D0x00007fa9f91a1de0, _cmd=3D"windowShouldClose:",
sender=3D0x00007fa9f91a7810) at cocoa.m:1231:5
    frame #11: 0x00007fff230417c9 AppKit`__19-[NSWindow
__close]_block_invoke + 153
    frame #12: 0x00007fff23041723 AppKit`-[NSWindow __close] + 284
    frame #13: 0x00007fff22ed12bb AppKit`-[NSApplication(NSResponder)
sendAction:to:from:] + 288
    frame #14: 0x00007fff22ed115f AppKit`-[NSControl sendAction:to:] + 86
    frame #15: 0x00007fff22ed1091 AppKit`__26-[NSCell
_sendActionFrom:]_block_invoke + 131
    frame #16: 0x00007fff22ed0f98 AppKit`-[NSCell _sendActionFrom:] + 171
    frame #17: 0x00007fff22ed0ede AppKit`-[NSButtonCell _sendActionFrom:] +
96
    frame #18: 0x00007fff22ecdfc7 AppKit`NSControlTrackMouse + 1820
    frame #19: 0x00007fff22ecd883 AppKit`-[NSCell
trackMouse:inRect:ofView:untilMouseUp:] + 130
    frame #20: 0x00007fff22ecd74a AppKit`-[NSButtonCell
trackMouse:inRect:ofView:untilMouseUp:] + 697
    frame #21: 0x00007fff22ecca72 AppKit`-[NSControl mouseDown:] + 722
    frame #22: 0x00007fff22ecae5e AppKit`-[NSWindow(NSEventRouting)
_handleMouseDownEvent:isDelayedEvent:] + 4961
    frame #23: 0x00007fff22e3a648 AppKit`-[NSWindow(NSEventRouting)
_reallySendEvent:isDelayedEvent:] + 2594
    frame #24: 0x00007fff22e39a06 AppKit`-[NSWindow(NSEventRouting)
sendEvent:] + 347
    frame #25: 0x00007fff22e37e14 AppKit`-[NSApplication(NSEvent)
sendEvent:] + 352
    frame #26: 0x0000000101ebec29 qemu-system-x86_64`-[QemuApplication
sendEvent:](self=3D0x00007fa9f90374e0, _cmd=3D"sendEvent:",
event=3D0x00007fa9f6ef1920) at cocoa.m:1582:9
    frame #27: 0x00007fff23110be1 AppKit`-[NSApplication _handleEvent:] + 6=
5
    frame #28: 0x00007fff22ca0c8e AppKit`-[NSApplication run] + 623
    frame #29: 0x0000000101ebef45 qemu-system-x86_64`main(argc=3D3,
argv=3D0x00007ffeedd71a20) at cocoa.m:1947:5
    frame #30: 0x00007fff203ccf3d libdyld.dylib`start + 1
  thread #2
    frame #0: 0x00007fff2037ecde libsystem_kernel.dylib`__psynch_cvwait + 1=
0
    frame #1: 0x00007fff203b1e49 libsystem_pthread.dylib`_pthread_cond_wait
+ 1298
    frame #2: 0x00000001026b7837
qemu-system-x86_64`qemu_futex_wait(ev=3D0x0000000102e88eb8, val=3D429496729=
5)
at qemu-thread-posix.c:386:9
    frame #3: 0x00000001026b77b0
qemu-system-x86_64`qemu_event_wait(ev=3D0x0000000102e88eb8) at
qemu-thread-posix.c:481:9
    frame #4: 0x00000001026c56be
qemu-system-x86_64`call_rcu_thread(opaque=3D0x0000000000000000) at
rcu.c:261:21
    frame #5: 0x00000001026b7b76
qemu-system-x86_64`qemu_thread_start(args=3D0x00007fa9f9105320) at
qemu-thread-posix.c:556:9
    frame #6: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +
224
    frame #7: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 15
  thread #3
    frame #0: 0x00007fff2037c2f6 libsystem_kernel.dylib`semaphore_wait_trap
+ 10
    frame #1: 0x00007fff20207c9b libdispatch.dylib`_dispatch_sema4_wait + 1=
6
    frame #2: 0x00007fff2020816d
libdispatch.dylib`_dispatch_semaphore_wait_slow + 98
    frame #3: 0x0000000101f6ac1b
qemu-system-x86_64`vmnet_cleanup_common(nc=3D0x00007fa9f7019400) at
vmnet-common.m:330:5
    frame #4: 0x0000000101f5c6cd
qemu-system-x86_64`qemu_cleanup_net_client(nc=3D0x00007fa9f7019400) at
net.c:361:9
    frame #5: 0x0000000101f5c4cf
qemu-system-x86_64`qemu_del_net_client(nc=3D0x00007fa9f7019400) at
net.c:417:13
    frame #6: 0x0000000101f5e751 qemu-system-x86_64`net_cleanup at
net.c:1447:13
    frame #7: 0x000000010228f548 qemu-system-x86_64`qemu_cleanup at
runstate.c:820:5
    frame #8: 0x0000000101e9950d qemu-system-x86_64`qemu_main(argc=3D3,
argv=3D0x00007ffeedd71a20, envp=3D0x00007ffeedd71a40) at main.c:51:5
    frame #9: 0x0000000101ebefb4
qemu-system-x86_64`call_qemu_main(opaque=3D0x0000000000000000) at
cocoa.m:1897:14
    frame #10: 0x00000001026b7b76
qemu-system-x86_64`qemu_thread_start(args=3D0x00007fa9f9105320) at
qemu-thread-posix.c:556:9
    frame #11: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +
224
    frame #12: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 15
  thread #4
    frame #0: 0x00007fff20384e22 libsystem_kernel.dylib`__sigwait + 10
    frame #1: 0x00007fff203b1fff libsystem_pthread.dylib`sigwait + 29
    frame #2: 0x00000001026b3541
qemu-system-x86_64`sigwait_compat(opaque=3D0x00007fa9f6d0a3f0) at
compatfd.c:36:15
    frame #3: 0x00000001026b7b76
qemu-system-x86_64`qemu_thread_start(args=3D0x00007fa9f6d09ec0) at
qemu-thread-posix.c:556:9
    frame #4: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +
224
    frame #5: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 15
  thread #7
    frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_mutexwait
+ 10
    frame #1: 0x00007fff203af2ab
libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_wait + 76
    frame #2: 0x00007fff203ad192
libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_slow + 204
    frame #3: 0x00007fff203b1ee1 libsystem_pthread.dylib`_pthread_cond_wait
+ 1450
    frame #4: 0x00000001026b6d92
qemu-system-x86_64`qemu_cond_wait_impl(cond=3D0x00007fa9f6c2edf0,
mutex=3D0x0000000102e758f0, file=3D"../softmmu/cpus.c", line=3D423) at
qemu-thread-posix.c:195:11
    frame #5: 0x000000010227c716
qemu-system-x86_64`qemu_wait_io_event(cpu=3D0x00007fa9f949a000) at
cpus.c:423:9
    frame #6: 0x000000010239c94e
qemu-system-x86_64`mttcg_cpu_thread_fn(arg=3D0x00007fa9f949a000) at
tcg-accel-ops-mttcg.c:123:9
    frame #7: 0x00000001026b7b76
qemu-system-x86_64`qemu_thread_start(args=3D0x00007fa9f6c2f5e0) at
qemu-thread-posix.c:556:9
    frame #8: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +
224
    frame #9: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 15
  thread #8
    frame #0: 0x00007fff2037d95e libsystem_kernel.dylib`__workq_kernreturn
+ 10
    frame #1: 0x00007fff203ae4c1 libsystem_pthread.dylib`_pthread_wqthread
+ 414
    frame #2: 0x00007fff203ad42f libsystem_pthread.dylib`start_wqthread + 1=
5
  thread #9, queue =3D 'org.qemu.vmnet.if_queue'
    frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_mutexwait
+ 10
    frame #1: 0x00007fff203af2ab
libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_wait + 76
    frame #2: 0x00007fff203ad192
libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_slow + 204
    frame #3: 0x00000001026b67ea
qemu-system-x86_64`qemu_mutex_lock_impl(mutex=3D0x0000000102e758f0,
file=3D"../net/vmnet-common.m", line=3D91) at qemu-thread-posix.c:80:11
    frame #4: 0x000000010227c9d2
qemu-system-x86_64`qemu_mutex_lock_iothread_impl(file=3D"../net/vmnet-commo=
n.m",
line=3D91) at cpus.c:497:5
    frame #5: 0x0000000101f6ae9e
qemu-system-x86_64`vmnet_send(nc=3D0x00007fa9f7019400,
event_id=3DVMNET_INTERFACE_PACKETS_AVAILABLE, event=3D0x00007fa9f6d3b860) a=
t
vmnet-common.m:91:5
    frame #6: 0x0000000101f6acf3
qemu-system-x86_64`__vmnet_register_event_callback_block_invoke(.block_desc=
riptor=3D0x00007fa9f9034240,
event_id=3DVMNET_INTERFACE_PACKETS_AVAILABLE, event=3D0x00007fa9f6d3b860) a=
t
vmnet-common.m:121:15
    frame #7: 0x00007fff6f385a3d
vmnet`__vmnet_interface_set_event_callback_block_invoke_3 + 195
    frame #8: 0x00007fff20207806 libdispatch.dylib`_dispatch_client_callout
+ 8
    frame #9: 0x00007fff2020a1b0
libdispatch.dylib`_dispatch_continuation_pop + 423
    frame #10: 0x00007fff2021a564 libdispatch.dylib`_dispatch_source_invoke
+ 2061
    frame #11: 0x00007fff2020d493
libdispatch.dylib`_dispatch_lane_serial_drain + 263
    frame #12: 0x00007fff2020e0ad libdispatch.dylib`_dispatch_lane_invoke +
366
    frame #13: 0x00007fff20217c0d
libdispatch.dylib`_dispatch_workloop_worker_thread + 811
    frame #14: 0x00007fff203ae45d libsystem_pthread.dylib`_pthread_wqthread
+ 314
    frame #15: 0x00007fff203ad42f libsystem_pthread.dylib`start_wqthread +
15
  thread #11, name =3D 'com.apple.NSEventThread'
    frame #0: 0x00007fff2037c2ba libsystem_kernel.dylib`mach_msg_trap + 10
    frame #1: 0x00007fff2037c62c libsystem_kernel.dylib`mach_msg + 60
    frame #2: 0x00007fff204aab2f CoreFoundation`__CFRunLoopServiceMachPort
+ 316
    frame #3: 0x00007fff204a920f CoreFoundation`__CFRunLoopRun + 1328
    frame #4: 0x00007fff204a861c CoreFoundation`CFRunLoopRunSpecific + 563
    frame #5: 0x00007fff22e3623a AppKit`_NSEventThread + 124
    frame #6: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +
224
    frame #7: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 15

Though I doubt it is the cause of your deadlock. This deadlock would
> not happen frequently since vmnet_send will not be queued if the
> device is not used.
>
>
Having two-three connected nics causes deadlock almost every
time. With only one nic it happens one time out of two or three.

An interesting thing is that using qemu_send_packet() instead
of qemu_send_packet_async() fixes the problem. Hope to
start investigating this next week.

Regards,
> Akihiko Odaki
>
> >
> >
> >> Thanks,
> >> Roman
> >>
> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >> > ---
> >> >  net/clients.h       |  11 ++++
> >> >  net/meson.build     |   7 +++
> >> >  net/net.c           |  10 ++++
> >> >  net/vmnet-bridged.m |  25 +++++++++
> >> >  net/vmnet-common.m  |  20 +++++++
> >> >  net/vmnet-host.c    |  24 ++++++++
> >> >  net/vmnet-shared.c  |  25 +++++++++
> >> >  net/vmnet_int.h     |  25 +++++++++
> >> >  qapi/net.json       | 133
> +++++++++++++++++++++++++++++++++++++++++++-
> >> >  9 files changed, 278 insertions(+), 2 deletions(-)
> >> >  create mode 100644 net/vmnet-bridged.m
> >> >  create mode 100644 net/vmnet-common.m
> >> >  create mode 100644 net/vmnet-host.c
> >> >  create mode 100644 net/vmnet-shared.c
> >> >  create mode 100644 net/vmnet_int.h
> >> >
> >> > diff --git a/net/net.c b/net/net.c
> >> > index f0d14dbfc1..1dbb64b935 100644
> >> > --- a/net/net.c
> >> > +++ b/net/net.c
> >> > @@ -1021,6 +1021,11 @@ static int (* const
> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >> >  #ifdef CONFIG_L2TPV3
> >> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
> >> >  #endif
> >> > +#ifdef CONFIG_VMNET
> >> > +        [NET_CLIENT_DRIVER_VMNET_HOST] =3D net_init_vmnet_host,
> >> > +        [NET_CLIENT_DRIVER_VMNET_SHARED] =3D net_init_vmnet_shared,
> >> > +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] =3D net_init_vmnet_bridge=
d,
> >> > +#endif /* CONFIG_VMNET */
> >> >  };
> >> >
> >> >
> >> > @@ -1106,6 +1111,11 @@ void show_netdevs(void)
> >> >  #endif
> >> >  #ifdef CONFIG_VHOST_VDPA
> >> >          "vhost-vdpa",
> >> > +#endif
> >> > +#ifdef CONFIG_VMNET
> >> > +        "vmnet-host",
> >> > +        "vmnet-shared",
> >> > +        "vmnet-bridged",
> >> >  #endif
> >> >      };
> >> >
> >> > diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> >> > new file mode 100644
> >> > index 0000000000..4e42a90391
> >> > --- /dev/null
> >> > +++ b/net/vmnet-bridged.m
> >> > @@ -0,0 +1,25 @@
> >> > +/*
> >> > + * vmnet-bridged.m
> >> > + *
> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com=
>
> >> > + *
> >> > + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> >> > + * See the COPYING file in the top-level directory.
> >> > + *
> >> > + */
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "qapi/qapi-types-net.h"
> >> > +#include "vmnet_int.h"
> >> > +#include "clients.h"
> >> > +#include "qemu/error-report.h"
> >> > +#include "qapi/error.h"
> >> > +
> >> > +#include <vmnet/vmnet.h>
> >> > +
> >> > +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
> >> > +                           NetClientState *peer, Error **errp)
> >> > +{
> >> > +  error_setg(errp, "vmnet-bridged is not implemented yet");
> >> > +  return -1;
> >> > +}
> >> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >> > new file mode 100644
> >> > index 0000000000..532d152840
> >> > --- /dev/null
> >> > +++ b/net/vmnet-common.m
> >> > @@ -0,0 +1,20 @@
> >> > +/*
> >> > + * vmnet-common.m - network client wrapper for Apple vmnet.framewor=
k
> >> > + *
> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com=
>
> >> > + * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
> >> > + *
> >> > + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> >> > + * See the COPYING file in the top-level directory.
> >> > + *
> >> > + */
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "qapi/qapi-types-net.h"
> >> > +#include "vmnet_int.h"
> >> > +#include "clients.h"
> >> > +#include "qemu/error-report.h"
> >> > +#include "qapi/error.h"
> >> > +
> >> > +#include <vmnet/vmnet.h>
> >> > +
> >> > diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> >> > new file mode 100644
> >> > index 0000000000..4a5ef99dc7
> >> > --- /dev/null
> >> > +++ b/net/vmnet-host.c
> >> > @@ -0,0 +1,24 @@
> >> > +/*
> >> > + * vmnet-host.c
> >> > + *
> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com=
>
> >> > + *
> >> > + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> >> > + * See the COPYING file in the top-level directory.
> >> > + *
> >> > + */
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "qapi/qapi-types-net.h"
> >> > +#include "vmnet_int.h"
> >> > +#include "clients.h"
> >> > +#include "qemu/error-report.h"
> >> > +#include "qapi/error.h"
> >> > +
> >> > +#include <vmnet/vmnet.h>
> >> > +
> >> > +int net_init_vmnet_host(const Netdev *netdev, const char *name,
> >> > +                        NetClientState *peer, Error **errp) {
> >> > +  error_setg(errp, "vmnet-host is not implemented yet");
> >> > +  return -1;
> >> > +}
> >> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >> > new file mode 100644
> >> > index 0000000000..f8c4a4f3b8
> >> > --- /dev/null
> >> > +++ b/net/vmnet-shared.c
> >> > @@ -0,0 +1,25 @@
> >> > +/*
> >> > + * vmnet-shared.c
> >> > + *
> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com=
>
> >> > + *
> >> > + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> >> > + * See the COPYING file in the top-level directory.
> >> > + *
> >> > + */
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "qapi/qapi-types-net.h"
> >> > +#include "vmnet_int.h"
> >> > +#include "clients.h"
> >> > +#include "qemu/error-report.h"
> >> > +#include "qapi/error.h"
> >> > +
> >> > +#include <vmnet/vmnet.h>
> >> > +
> >> > +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> >> > +                          NetClientState *peer, Error **errp)
> >> > +{
> >> > +  error_setg(errp, "vmnet-shared is not implemented yet");
> >> > +  return -1;
> >> > +}
> >> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >> > new file mode 100644
> >> > index 0000000000..c5982259a4
> >> > --- /dev/null
> >> > +++ b/net/vmnet_int.h
> >> > @@ -0,0 +1,25 @@
> >> > +/*
> >> > + * vmnet_int.h
> >> > + *
> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com=
>
> >> > + *
> >> > + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> >> > + * See the COPYING file in the top-level directory.
> >> > + *
> >> > + */
> >> > +#ifndef VMNET_INT_H
> >> > +#define VMNET_INT_H
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "vmnet_int.h"
> >> > +#include "clients.h"
> >> > +
> >> > +#include <vmnet/vmnet.h>
> >> > +
> >> > +typedef struct VmnetCommonState {
> >> > +  NetClientState nc;
> >> > +
> >> > +} VmnetCommonState;
> >> > +
> >> > +
> >> > +#endif /* VMNET_INT_H */
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index 7fab2e7cd8..b922e2e34f 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -452,6 +452,120 @@
> >> >      '*vhostdev':     'str',
> >> >      '*queues':       'int' } }
> >> >
> >> > +##
> >> > +# @NetdevVmnetHostOptions:
> >> > +#
> >> > +# vmnet (host mode) network backend.
> >> > +#
> >> > +# Allows the vmnet interface to communicate with other vmnet
> >> > +# interfaces that are in host mode and also with the host.
> >> > +#
> >> > +# @start-address: The starting IPv4 address to use for the interfac=
e.
> >> > +#                 Must be in the private IP range (RFC 1918). Must =
be
> >> > +#                 specified along with @end-address and @subnet-mas=
k.
> >> > +#                 This address is used as the gateway address. The
> >> > +#                 subsequent address up to and including end-addres=
s
> are
> >> > +#                 placed in the DHCP pool.
> >> > +#
> >> > +# @end-address: The DHCP IPv4 range end address to use for the
> >> > +#               interface. Must be in the private IP range (RFC
> 1918).
> >> > +#               Must be specified along with @start-address and
> >> > +#               @subnet-mask.
> >> > +#
> >> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> >> > +#               be specified along with @start-address and
> @subnet-mask.
> >> > +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that vmnet interface is not able to communicat=
e
> >> > +#            with any other vmnet interfaces. Only communication wi=
th
> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
> >> > +#
> >> > +# @net-uuid: The identifier (UUID) to uniquely identify the isolate=
d
> >> > +#            network vmnet interface should be added to. If
> >> > +#            set, no DHCP service is provided for this interface an=
d
> >> > +#            network communication is allowed only with other
> interfaces
> >> > +#            added to this network identified by the UUID. Availabl=
e
> >> > +#            since macOS Big Sur 11.0.
> >> > +#
> >> > +# Since: 7.0
> >> > +##
> >> > +{ 'struct': 'NetdevVmnetHostOptions',
> >> > +  'data': {
> >> > +    '*start-address': 'str',
> >> > +    '*end-address':   'str',
> >> > +    '*subnet-mask':   'str',
> >> > +    '*isolated':      'bool',
> >> > +    '*net-uuid':      'str' },
> >> > +  'if': 'CONFIG_VMNET' }
> >> > +
> >> > +##
> >> > +# @NetdevVmnetSharedOptions:
> >> > +#
> >> > +# vmnet (shared mode) network backend.
> >> > +#
> >> > +# Allows traffic originating from the vmnet interface to reach the
> >> > +# Internet through a network address translator (NAT).
> >> > +# The vmnet interface can communicate with the host and with
> >> > +# other shared mode interfaces on the same subnet. If no DHCP
> >> > +# settings, subnet mask and IPv6 prefix specified, the interface ca=
n
> >> > +# communicate with any of other interfaces in shared mode.
> >> > +#
> >> > +# @start-address: The starting IPv4 address to use for the interfac=
e.
> >> > +#                 Must be in the private IP range (RFC 1918). Must =
be
> >> > +#                 specified along with @end-address and @subnet-mas=
k.
> >> > +#                 This address is used as the gateway address. The
> >> > +#                 subsequent address up to and including end-addres=
s
> are
> >> > +#                 placed in the DHCP pool.
> >> > +#
> >> > +# @end-address: The DHCP IPv4 range end address to use for the
> >> > +#               interface. Must be in the private IP range (RFC
> 1918).
> >> > +#               Must be specified along with @start-address and
> @subnet-mask.
> >> > +#
> >> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> >> > +#                be specified along with @start-address and
> @subnet-mask.
> >> > +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that vmnet interface is not able to communicat=
e
> >> > +#            with any other vmnet interfaces. Only communication wi=
th
> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
> >> > +#
> >> > +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be=
 a
> >> > +#                unique local address i.e. start with fd00::/8 and
> have
> >> > +#                length of 64.
> >> > +#
> >> > +# Since: 7.0
> >> > +##
> >> > +{ 'struct': 'NetdevVmnetSharedOptions',
> >> > +  'data': {
> >> > +    '*start-address': 'str',
> >> > +    '*end-address':   'str',
> >> > +    '*subnet-mask':   'str',
> >> > +    '*isolated':      'bool',
> >> > +    '*nat66-prefix':  'str' },
> >> > +  'if': 'CONFIG_VMNET' }
> >> > +
> >> > +##
> >> > +# @NetdevVmnetBridgedOptions:
> >> > +#
> >> > +# vmnet (bridged mode) network backend.
> >> > +#
> >> > +# Bridges the vmnet interface with a physical network interface.
> >> > +#
> >> > +# @ifname: The name of the physical interface to be bridged.
> >> > +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that vmnet interface is not able to communicat=
e
> >> > +#            with any other vmnet interfaces. Only communication wi=
th
> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
> >> > +#
> >> > +# Since: 7.0
> >> > +##
> >> > +{ 'struct': 'NetdevVmnetBridgedOptions',
> >> > +  'data': {
> >> > +    'ifname':     'str',
> >> > +    '*isolated':  'bool' },
> >> > +  'if': 'CONFIG_VMNET' }
> >> > +
> >> >  ##
> >> >  # @NetClientDriver:
> >> >  #
> >> > @@ -460,10 +574,16 @@
> >> >  # Since: 2.7
> >> >  #
> >> >  #        @vhost-vdpa since 5.1
> >> > +#        @vmnet-host since 7.0
> >> > +#        @vmnet-shared since 7.0
> >> > +#        @vmnet-bridged since 7.0
> >> >  ##
> >> >  { 'enum': 'NetClientDriver',
> >> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde'=
,
> >> > -            'bridge', 'hubport', 'netmap', 'vhost-user',
> 'vhost-vdpa' ] }
> >> > +            'bridge', 'hubport', 'netmap', 'vhost-user',
> 'vhost-vdpa',
> >> > +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> >> > +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> >> > +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
> >> >
> >> >  ##
> >> >  # @Netdev:
> >> > @@ -477,6 +597,9 @@
> >> >  # Since: 1.2
> >> >  #
> >> >  #        'l2tpv3' - since 2.1
> >> > +#        'vmnet-host' - since 7.0
> >> > +#        'vmnet-shared' - since 7.0
> >> > +#        'vmnet-bridged' - since 7.0
> >> >  ##
> >> >  { 'union': 'Netdev',
> >> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> >> > @@ -492,7 +615,13 @@
> >> >      'hubport':  'NetdevHubPortOptions',
> >> >      'netmap':   'NetdevNetmapOptions',
> >> >      'vhost-user': 'NetdevVhostUserOptions',
> >> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> >> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> >> > +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
> >> > +                    'if': 'CONFIG_VMNET' },
> >> > +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
> >> > +                      'if': 'CONFIG_VMNET' },
> >> > +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
> >> > +                       'if': 'CONFIG_VMNET' } } }
> >> >
> >> >  ##
> >> >  # @RxState:
> >> > --
> >> > 2.23.0
> >> >
> >
> >
> >
> > --
> > Best Regards,
> >
> > Vladislav Yaroshchuk
>


--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000007c66ba05d6a54582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 21 =D1=8F=D0=BD=D0=B2. =
2022 =D0=B3. =D0=B2 16:03, Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odak=
i@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jan 21, 2022 at 9:1=
9 PM Vladislav Yaroshchuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; =D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:32, Roman =
Bolshakov &lt;<a href=3D"mailto:roman@roolebo.dev" target=3D"_blank">roman@=
roolebo.dev</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wro=
te:<br>
&gt;&gt; &gt; Create separate netdevs for each vmnet operating mode:<br>
&gt;&gt; &gt; - vmnet-host<br>
&gt;&gt; &gt; - vmnet-shared<br>
&gt;&gt; &gt; - vmnet-bridged<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Sure I&#39;m late to the party but what if we add only one backend=
 - vmnet<br>
&gt;&gt; with default mode set to shared and all parameters are added there=
?<br>
&gt;&gt;<br>
&gt;&gt; The CLI would look more reasonable for the most typical use case:<=
br>
&gt;&gt;=C2=A0 -netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1<br>
&gt;&gt;<br>
&gt;&gt; That would remove duplication of options in QAPI schema (e.g. isol=
ated<br>
&gt;&gt; is available in all backends now, altough I&#39;m not sure if it m=
akes sense<br>
&gt;&gt; for bridged mode):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 -netdev vmnet,id=3Dif1,isolated=3Dyes<br>
&gt;&gt;<br>
&gt;&gt; start-address, end-address and subnet-mask are also used by both s=
hared<br>
&gt;&gt; and host modes.<br>
&gt;&gt;<br>
&gt;&gt; Bridged netdev would lool like:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 -netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1<br>
&gt;&gt;<br>
&gt;&gt; Checksum offloading also seems to be available for all backends fr=
om<br>
&gt;&gt; Monterey.<br>
&gt;&gt;<br>
&gt;&gt; The approach might simplify integration of the changes to libvirt =
and<br>
&gt;&gt; discovery of upcoming vmnet features via qapi.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I can rewrite this if it sounds more suitable to use<br>
&gt; single `vmnet` netdev instead of three different ones.<br>
&gt; We can discuss this with Markus as a QAPI reviewer.<br>
&gt; Markus, what is your opinion about single netdev?<br>
&gt;<br>
&gt; P.S. Seems we have enough time for discussion:<br>
&gt; I started fixing memory leaks found by Akihiko and<br>
&gt; met a strange deadlock on QEMU shutdown on<br>
&gt; `qemu_mutex_lock_iothread()` during careful<br>
&gt; interface destruction with added semaphore.<br>
&gt; Need to go deeper to understand what&#39;s the<br>
&gt; problem, it will take some time.<br>
&gt;<br>
&gt; Mentioned part of Akihiko&#39;s review:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20220113172219.66372-1-yaroshchuk2=
000@gmail.com/20220113172219.66372-4-yaroshchuk2000@gmail.com/" rel=3D"nore=
ferrer" target=3D"_blank">https://patchew.org/QEMU/20220113172219.66372-1-y=
aroshchuk2000@gmail.com/20220113172219.66372-4-yaroshchuk2000@gmail.com/</a=
><br>
<br></blockquote><div><br>&gt; Actually I thought it would be tricky to imp=
lement.<br>=C2=A0<br>You mean single netdev type?<br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Actually I thought it would be tricky to implement. A deadlock will<br>
occur in a simple implementation if vmnet_send is already queued but<br>
not executed yet when destructing:<br>
- vmnet_send tries to lock the iothread and waits for the destructor to unl=
ock.<br>
- vmnet_stop_interface waits for vmnet_send finishing.<br>
<br></blockquote><div><br></div><div>Sounds like that&#39;s what happens ac=
tually.<br>With added semaphore:<br>--- a/net/vmnet-common.m<br>+++ b/net/v=
mnet-common.m<br>@@ -320,13 +320,14 @@ void vmnet_cleanup_common(NetClientS=
tate *nc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;org.qemu.vmnet.destroy=
&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISPATCH_QUEUE_SERIAL<br>=C2=
=A0 =C2=A0 =C2=A0);<br>-<br>+ =C2=A0 =C2=A0dispatch_semaphore_t if_destroy_=
sem =3D dispatch_semaphore_create(0);<br>=C2=A0 =C2=A0 =C2=A0vmnet_stop_int=
erface(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;vmnet_if,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if_destroy_q,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
^(vmnet_return_t status) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0di=
spatch_semaphore_signal(if_destroy_sem);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0});<br>-<br>+ =C2=A0 =C2=A0dispatch_semaphore_wait(if_destroy_sem, DISPA=
TCH_TIME_FOREVER);<br>=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; VMNET_PA=
CKETS_LIMIT; ++i) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(s-&gt;iov_b=
uf[i].iov_base);<br>=C2=A0 =C2=A0 =C2=A0}<br>--=C2=A0<br><br>I see this thr=
ead dump on deadlock:<br><br>(lldb) bt all<br>* thread #1, queue =3D &#39;c=
om.apple.main-thread&#39;, stop reason =3D signal SIGSTOP<br>=C2=A0 * frame=
 #0: 0x00007fff2037ebb2 libsystem_kernel.dylib`__semwait_signal + 10<br>=C2=
=A0 =C2=A0 frame #1: 0x00007fff202fec1a libsystem_c.dylib`nanosleep + 196<b=
r>=C2=A0 =C2=A0 frame #2: 0x00007fff212c4bb8 Foundation`+[NSThread sleepFor=
TimeInterval:] + 170<br>=C2=A0 =C2=A0 frame #3: 0x0000000101ebce3a qemu-sys=
tem-x86_64`-[QemuCocoaAppController applicationWillTerminate:](self=3D0x000=
07fa9f91a1de0, _cmd=3D&quot;applicationWillTerminate:&quot;, aNotification=
=3D@&quot;NSApplicationWillTerminateNotification&quot;) at cocoa.m:1202:5<b=
r>=C2=A0 =C2=A0 frame #4: 0x00007fff204a00cd CoreFoundation`__CFNOTIFICATIO=
NCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__ + 12<br>=C2=A0 =C2=A0 frame #5: 0x0=
0007fff2053bb1c CoreFoundation`___CFXRegistrationPost_block_invoke + 49<br>=
=C2=A0 =C2=A0 frame #6: 0x00007fff2053ba9a CoreFoundation`_CFXRegistrationP=
ost + 454<br>=C2=A0 =C2=A0 frame #7: 0x00007fff2047134e CoreFoundation`_CFX=
NotificationPost + 736<br>=C2=A0 =C2=A0 frame #8: 0x00007fff211e1bb8 Founda=
tion`-[NSNotificationCenter postNotificationName:object:userInfo:] + 59<br>=
=C2=A0 =C2=A0 frame #9: 0x00007fff22f585b3 AppKit`-[NSApplication terminate=
:] + 1377<br>=C2=A0 =C2=A0 frame #10: 0x0000000101ebcf1f qemu-system-x86_64=
`-[QemuCocoaAppController windowShouldClose:](self=3D0x00007fa9f91a1de0, _c=
md=3D&quot;windowShouldClose:&quot;, sender=3D0x00007fa9f91a7810) at cocoa.=
m:1231:5<br>=C2=A0 =C2=A0 frame #11: 0x00007fff230417c9 AppKit`__19-[NSWind=
ow __close]_block_invoke + 153<br>=C2=A0 =C2=A0 frame #12: 0x00007fff230417=
23 AppKit`-[NSWindow __close] + 284<br>=C2=A0 =C2=A0 frame #13: 0x00007fff2=
2ed12bb AppKit`-[NSApplication(NSResponder) sendAction:to:from:] + 288<br>=
=C2=A0 =C2=A0 frame #14: 0x00007fff22ed115f AppKit`-[NSControl sendAction:t=
o:] + 86<br>=C2=A0 =C2=A0 frame #15: 0x00007fff22ed1091 AppKit`__26-[NSCell=
 _sendActionFrom:]_block_invoke + 131<br>=C2=A0 =C2=A0 frame #16: 0x00007ff=
f22ed0f98 AppKit`-[NSCell _sendActionFrom:] + 171<br>=C2=A0 =C2=A0 frame #1=
7: 0x00007fff22ed0ede AppKit`-[NSButtonCell _sendActionFrom:] + 96<br>=C2=
=A0 =C2=A0 frame #18: 0x00007fff22ecdfc7 AppKit`NSControlTrackMouse + 1820<=
br>=C2=A0 =C2=A0 frame #19: 0x00007fff22ecd883 AppKit`-[NSCell trackMouse:i=
nRect:ofView:untilMouseUp:] + 130<br>=C2=A0 =C2=A0 frame #20: 0x00007fff22e=
cd74a AppKit`-[NSButtonCell trackMouse:inRect:ofView:untilMouseUp:] + 697<b=
r>=C2=A0 =C2=A0 frame #21: 0x00007fff22ecca72 AppKit`-[NSControl mouseDown:=
] + 722<br>=C2=A0 =C2=A0 frame #22: 0x00007fff22ecae5e AppKit`-[NSWindow(NS=
EventRouting) _handleMouseDownEvent:isDelayedEvent:] + 4961<br>=C2=A0 =C2=
=A0 frame #23: 0x00007fff22e3a648 AppKit`-[NSWindow(NSEventRouting) _really=
SendEvent:isDelayedEvent:] + 2594<br>=C2=A0 =C2=A0 frame #24: 0x00007fff22e=
39a06 AppKit`-[NSWindow(NSEventRouting) sendEvent:] + 347<br>=C2=A0 =C2=A0 =
frame #25: 0x00007fff22e37e14 AppKit`-[NSApplication(NSEvent) sendEvent:] +=
 352<br>=C2=A0 =C2=A0 frame #26: 0x0000000101ebec29 qemu-system-x86_64`-[Qe=
muApplication sendEvent:](self=3D0x00007fa9f90374e0, _cmd=3D&quot;sendEvent=
:&quot;, event=3D0x00007fa9f6ef1920) at cocoa.m:1582:9<br>=C2=A0 =C2=A0 fra=
me #27: 0x00007fff23110be1 AppKit`-[NSApplication _handleEvent:] + 65<br>=
=C2=A0 =C2=A0 frame #28: 0x00007fff22ca0c8e AppKit`-[NSApplication run] + 6=
23<br>=C2=A0 =C2=A0 frame #29: 0x0000000101ebef45 qemu-system-x86_64`main(a=
rgc=3D3, argv=3D0x00007ffeedd71a20) at cocoa.m:1947:5<br>=C2=A0 =C2=A0 fram=
e #30: 0x00007fff203ccf3d libdyld.dylib`start + 1<br>=C2=A0 thread #2<br>=
=C2=A0 =C2=A0 frame #0: 0x00007fff2037ecde libsystem_kernel.dylib`__psynch_=
cvwait + 10<br>=C2=A0 =C2=A0 frame #1: 0x00007fff203b1e49 libsystem_pthread=
.dylib`_pthread_cond_wait + 1298<br>=C2=A0 =C2=A0 frame #2: 0x00000001026b7=
837 qemu-system-x86_64`qemu_futex_wait(ev=3D0x0000000102e88eb8, val=3D42949=
67295) at qemu-thread-posix.c:386:9<br>=C2=A0 =C2=A0 frame #3: 0x0000000102=
6b77b0 qemu-system-x86_64`qemu_event_wait(ev=3D0x0000000102e88eb8) at qemu-=
thread-posix.c:481:9<br>=C2=A0 =C2=A0 frame #4: 0x00000001026c56be qemu-sys=
tem-x86_64`call_rcu_thread(opaque=3D0x0000000000000000) at rcu.c:261:21<br>=
=C2=A0 =C2=A0 frame #5: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_s=
tart(args=3D0x00007fa9f9105320) at qemu-thread-posix.c:556:9<br>=C2=A0 =C2=
=A0 frame #6: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start + 2=
24<br>=C2=A0 =C2=A0 frame #7: 0x00007fff203ad443 libsystem_pthread.dylib`th=
read_start + 15<br>=C2=A0 thread #3<br>=C2=A0 =C2=A0 frame #0: 0x00007fff20=
37c2f6 libsystem_kernel.dylib`semaphore_wait_trap + 10<br>=C2=A0 =C2=A0 fra=
me #1: 0x00007fff20207c9b libdispatch.dylib`_dispatch_sema4_wait + 16<br>=
=C2=A0 =C2=A0 frame #2: 0x00007fff2020816d libdispatch.dylib`_dispatch_sema=
phore_wait_slow + 98<br>=C2=A0 =C2=A0 frame #3: 0x0000000101f6ac1b qemu-sys=
tem-x86_64`vmnet_cleanup_common(nc=3D0x00007fa9f7019400) at vmnet-common.m:=
330:5<br>=C2=A0 =C2=A0 frame #4: 0x0000000101f5c6cd qemu-system-x86_64`qemu=
_cleanup_net_client(nc=3D0x00007fa9f7019400) at net.c:361:9<br>=C2=A0 =C2=
=A0 frame #5: 0x0000000101f5c4cf qemu-system-x86_64`qemu_del_net_client(nc=
=3D0x00007fa9f7019400) at net.c:417:13<br>=C2=A0 =C2=A0 frame #6: 0x0000000=
101f5e751 qemu-system-x86_64`net_cleanup at net.c:1447:13<br>=C2=A0 =C2=A0 =
frame #7: 0x000000010228f548 qemu-system-x86_64`qemu_cleanup at runstate.c:=
820:5<br>=C2=A0 =C2=A0 frame #8: 0x0000000101e9950d qemu-system-x86_64`qemu=
_main(argc=3D3, argv=3D0x00007ffeedd71a20, envp=3D0x00007ffeedd71a40) at ma=
in.c:51:5<br>=C2=A0 =C2=A0 frame #9: 0x0000000101ebefb4 qemu-system-x86_64`=
call_qemu_main(opaque=3D0x0000000000000000) at cocoa.m:1897:14<br>=C2=A0 =
=C2=A0 frame #10: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(a=
rgs=3D0x00007fa9f9105320) at qemu-thread-posix.c:556:9<br>=C2=A0 =C2=A0 fra=
me #11: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start + 224<br>=
=C2=A0 =C2=A0 frame #12: 0x00007fff203ad443 libsystem_pthread.dylib`thread_=
start + 15<br>=C2=A0 thread #4<br>=C2=A0 =C2=A0 frame #0: 0x00007fff20384e2=
2 libsystem_kernel.dylib`__sigwait + 10<br>=C2=A0 =C2=A0 frame #1: 0x00007f=
ff203b1fff libsystem_pthread.dylib`sigwait + 29<br>=C2=A0 =C2=A0 frame #2: =
0x00000001026b3541 qemu-system-x86_64`sigwait_compat(opaque=3D0x00007fa9f6d=
0a3f0) at compatfd.c:36:15<br>=C2=A0 =C2=A0 frame #3: 0x00000001026b7b76 qe=
mu-system-x86_64`qemu_thread_start(args=3D0x00007fa9f6d09ec0) at qemu-threa=
d-posix.c:556:9<br>=C2=A0 =C2=A0 frame #4: 0x00007fff203b18fc libsystem_pth=
read.dylib`_pthread_start + 224<br>=C2=A0 =C2=A0 frame #5: 0x00007fff203ad4=
43 libsystem_pthread.dylib`thread_start + 15<br>=C2=A0 thread #7<br>=C2=A0 =
=C2=A0 frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_mutexwa=
it + 10<br>=C2=A0 =C2=A0 frame #1: 0x00007fff203af2ab libsystem_pthread.dyl=
ib`_pthread_mutex_firstfit_lock_wait + 76<br>=C2=A0 =C2=A0 frame #2: 0x0000=
7fff203ad192 libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_slow + 20=
4<br>=C2=A0 =C2=A0 frame #3: 0x00007fff203b1ee1 libsystem_pthread.dylib`_pt=
hread_cond_wait + 1450<br>=C2=A0 =C2=A0 frame #4: 0x00000001026b6d92 qemu-s=
ystem-x86_64`qemu_cond_wait_impl(cond=3D0x00007fa9f6c2edf0, mutex=3D0x00000=
00102e758f0, file=3D&quot;../softmmu/cpus.c&quot;, line=3D423) at qemu-thre=
ad-posix.c:195:11<br>=C2=A0 =C2=A0 frame #5: 0x000000010227c716 qemu-system=
-x86_64`qemu_wait_io_event(cpu=3D0x00007fa9f949a000) at cpus.c:423:9<br>=C2=
=A0 =C2=A0 frame #6: 0x000000010239c94e qemu-system-x86_64`mttcg_cpu_thread=
_fn(arg=3D0x00007fa9f949a000) at tcg-accel-ops-mttcg.c:123:9<br>=C2=A0 =C2=
=A0 frame #7: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(args=
=3D0x00007fa9f6c2f5e0) at qemu-thread-posix.c:556:9<br>=C2=A0 =C2=A0 frame =
#8: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start + 224<br>=C2=
=A0 =C2=A0 frame #9: 0x00007fff203ad443 libsystem_pthread.dylib`thread_star=
t + 15<br>=C2=A0 thread #8<br>=C2=A0 =C2=A0 frame #0: 0x00007fff2037d95e li=
bsystem_kernel.dylib`__workq_kernreturn + 10<br>=C2=A0 =C2=A0 frame #1: 0x0=
0007fff203ae4c1 libsystem_pthread.dylib`_pthread_wqthread + 414<br>=C2=A0 =
=C2=A0 frame #2: 0x00007fff203ad42f libsystem_pthread.dylib`start_wqthread =
+ 15<br>=C2=A0 thread #9, queue =3D &#39;org.qemu.vmnet.if_queue&#39;<br>=
=C2=A0 =C2=A0 frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_=
mutexwait + 10<br>=C2=A0 =C2=A0 frame #1: 0x00007fff203af2ab libsystem_pthr=
ead.dylib`_pthread_mutex_firstfit_lock_wait + 76<br>=C2=A0 =C2=A0 frame #2:=
 0x00007fff203ad192 libsystem_pthread.dylib`_pthread_mutex_firstfit_lock_sl=
ow + 204<br>=C2=A0 =C2=A0 frame #3: 0x00000001026b67ea qemu-system-x86_64`q=
emu_mutex_lock_impl(mutex=3D0x0000000102e758f0, file=3D&quot;../net/vmnet-c=
ommon.m&quot;, line=3D91) at qemu-thread-posix.c:80:11<br>=C2=A0 =C2=A0 fra=
me #4: 0x000000010227c9d2 qemu-system-x86_64`qemu_mutex_lock_iothread_impl(=
file=3D&quot;../net/vmnet-common.m&quot;, line=3D91) at cpus.c:497:5<br>=C2=
=A0 =C2=A0 frame #5: 0x0000000101f6ae9e qemu-system-x86_64`vmnet_send(nc=3D=
0x00007fa9f7019400, event_id=3DVMNET_INTERFACE_PACKETS_AVAILABLE, event=3D0=
x00007fa9f6d3b860) at vmnet-common.m:91:5<br>=C2=A0 =C2=A0 frame #6: 0x0000=
000101f6acf3 qemu-system-x86_64`__vmnet_register_event_callback_block_invok=
e(.block_descriptor=3D0x00007fa9f9034240, event_id=3DVMNET_INTERFACE_PACKET=
S_AVAILABLE, event=3D0x00007fa9f6d3b860) at vmnet-common.m:121:15<br>=C2=A0=
 =C2=A0 frame #7: 0x00007fff6f385a3d vmnet`__vmnet_interface_set_event_call=
back_block_invoke_3 + 195<br>=C2=A0 =C2=A0 frame #8: 0x00007fff20207806 lib=
dispatch.dylib`_dispatch_client_callout + 8<br>=C2=A0 =C2=A0 frame #9: 0x00=
007fff2020a1b0 libdispatch.dylib`_dispatch_continuation_pop + 423<br>=C2=A0=
 =C2=A0 frame #10: 0x00007fff2021a564 libdispatch.dylib`_dispatch_source_in=
voke + 2061<br>=C2=A0 =C2=A0 frame #11: 0x00007fff2020d493 libdispatch.dyli=
b`_dispatch_lane_serial_drain + 263<br>=C2=A0 =C2=A0 frame #12: 0x00007fff2=
020e0ad libdispatch.dylib`_dispatch_lane_invoke + 366<br>=C2=A0 =C2=A0 fram=
e #13: 0x00007fff20217c0d libdispatch.dylib`_dispatch_workloop_worker_threa=
d + 811<br>=C2=A0 =C2=A0 frame #14: 0x00007fff203ae45d libsystem_pthread.dy=
lib`_pthread_wqthread + 314<br>=C2=A0 =C2=A0 frame #15: 0x00007fff203ad42f =
libsystem_pthread.dylib`start_wqthread + 15<br>=C2=A0 thread #11, name =3D =
&#39;com.apple.NSEventThread&#39;<br>=C2=A0 =C2=A0 frame #0: 0x00007fff2037=
c2ba libsystem_kernel.dylib`mach_msg_trap + 10<br>=C2=A0 =C2=A0 frame #1: 0=
x00007fff2037c62c libsystem_kernel.dylib`mach_msg + 60<br>=C2=A0 =C2=A0 fra=
me #2: 0x00007fff204aab2f CoreFoundation`__CFRunLoopServiceMachPort + 316<b=
r>=C2=A0 =C2=A0 frame #3: 0x00007fff204a920f CoreFoundation`__CFRunLoopRun =
+ 1328<br>=C2=A0 =C2=A0 frame #4: 0x00007fff204a861c CoreFoundation`CFRunLo=
opRunSpecific + 563<br>=C2=A0 =C2=A0 frame #5: 0x00007fff22e3623a AppKit`_N=
SEventThread + 124<br>=C2=A0 =C2=A0 frame #6: 0x00007fff203b18fc libsystem_=
pthread.dylib`_pthread_start + 224<br>=C2=A0 =C2=A0 frame #7: 0x00007fff203=
ad443 libsystem_pthread.dylib`thread_start + 15<br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Though I doubt it is the cause of your deadlock. This deadlock would<br>
not happen frequently since vmnet_send will not be queued if the<br>
device is not used.<br>
<br></blockquote><div><br></div><div>Having two-three connected nics causes=
 deadlock=C2=A0almost every</div><div>time. With only one nic it happens on=
e time out of two or three.</div><div><br>An interesting thing is that usin=
g qemu_send_packet() instead<br>of=C2=A0qemu_send_packet_async() fixes the =
problem. Hope to<br>start investigating this next week.<br><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Roman<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<b=
r>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++++=
<br>
&gt;&gt; &gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +++<=
br>
&gt;&gt; &gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 10 ++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-bridged.m |=C2=A0 25 +++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-common.m=C2=A0 |=C2=A0 20 +++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 |=C2=A0 24 ++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-shared.c=C2=A0 |=C2=A0 25 +++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++++++++=
<br>
&gt;&gt; &gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0| 133 +++++++++=
++++++++++++++++++++++++++++++++++-<br>
&gt;&gt; &gt;=C2=A0 9 files changed, 278 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/net/net.c b/net/net.c<br>
&gt;&gt; &gt; index f0d14dbfc1..1dbb64b935 100644<br>
&gt;&gt; &gt; --- a/net/net.c<br>
&gt;&gt; &gt; +++ b/net/net.c<br>
&gt;&gt; &gt; @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fu=
n[NET_CLIENT_DRIVER__MAX])(<br>
&gt;&gt; &gt;=C2=A0 #ifdef CONFIG_L2TPV3<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_L2TPV3]=
=C2=A0 =C2=A0 =3D net_init_l2tpv3,<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt; +#ifdef CONFIG_VMNET<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_HOST] =
=3D net_init_vmnet_host,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_SHARED]=
 =3D net_init_vmnet_shared,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_BRIDGED=
] =3D net_init_vmnet_bridged,<br>
&gt;&gt; &gt; +#endif /* CONFIG_VMNET */<br>
&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -1106,6 +1111,11 @@ void show_netdevs(void)<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;=C2=A0 #ifdef CONFIG_VHOST_VDPA<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vhost-vdpa&quot;,<br>
&gt;&gt; &gt; +#endif<br>
&gt;&gt; &gt; +#ifdef CONFIG_VMNET<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-host&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-shared&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-bridged&quot;,<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..4e42a90391<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/net/vmnet-bridged.m<br>
&gt;&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * vmnet-bridged.m<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mai=
lto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a=
>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This work is licensed under the terms of the GNU GPL, ver=
sion 2 or later.<br>
&gt;&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt; +#include &quot;clients.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +int net_init_vmnet_bridged(const Netdev *netdev, const char =
*name,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetClientState *peer, Error **errp)<b=
r>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 error_setg(errp, &quot;vmnet-bridged is not implement=
ed yet&quot;);<br>
&gt;&gt; &gt; +=C2=A0 return -1;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..532d152840<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/net/vmnet-common.m<br>
&gt;&gt; &gt; @@ -0,0 +1,20 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * vmnet-common.m - network client wrapper for Apple vmnet.f=
ramework<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mai=
lto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a=
>&gt;<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Phillip Tennen &lt;<a href=3D"mailto:ph=
illip@axleos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This work is licensed under the terms of the GNU GPL, ver=
sion 2 or later.<br>
&gt;&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt; +#include &quot;clients.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/net/vmnet-host.c b/net/vmnet-host.c<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..4a5ef99dc7<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/net/vmnet-host.c<br>
&gt;&gt; &gt; @@ -0,0 +1,24 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * vmnet-host.c<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mai=
lto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a=
>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This work is licensed under the terms of the GNU GPL, ver=
sion 2 or later.<br>
&gt;&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt; +#include &quot;clients.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +int net_init_vmnet_host(const Netdev *netdev, const char *na=
me,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp) {<br>
&gt;&gt; &gt; +=C2=A0 error_setg(errp, &quot;vmnet-host is not implemented =
yet&quot;);<br>
&gt;&gt; &gt; +=C2=A0 return -1;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..f8c4a4f3b8<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/net/vmnet-shared.c<br>
&gt;&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * vmnet-shared.c<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mai=
lto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a=
>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This work is licensed under the terms of the GNU GPL, ver=
sion 2 or later.<br>
&gt;&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;&gt; &gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt; +#include &quot;clients.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +int net_init_vmnet_shared(const Netdev *netdev, const char *=
name,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 error_setg(errp, &quot;vmnet-shared is not implemente=
d yet&quot;);<br>
&gt;&gt; &gt; +=C2=A0 return -1;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..c5982259a4<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/net/vmnet_int.h<br>
&gt;&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * vmnet_int.h<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mai=
lto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a=
>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This work is licensed under the terms of the GNU GPL, ver=
sion 2 or later.<br>
&gt;&gt; &gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +#ifndef VMNET_INT_H<br>
&gt;&gt; &gt; +#define VMNET_INT_H<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;&gt; &gt; +#include &quot;clients.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +typedef struct VmnetCommonState {<br>
&gt;&gt; &gt; +=C2=A0 NetClientState nc;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +} VmnetCommonState;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#endif /* VMNET_INT_H */<br>
&gt;&gt; &gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt;&gt; &gt; index 7fab2e7cd8..b922e2e34f 100644<br>
&gt;&gt; &gt; --- a/qapi/net.json<br>
&gt;&gt; &gt; +++ b/qapi/net.json<br>
&gt;&gt; &gt; @@ -452,6 +452,120 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&=
#39;str&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;int&#39; } }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetHostOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (host mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Allows the vmnet interface to communicate with other vmnet=
<br>
&gt;&gt; &gt; +# interfaces that are in host mode and also with the host.<b=
r>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @start-address: The starting IPv4 address to use for the i=
nterface.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Must be in the private IP range (RFC 1918). Must be<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0specified along with @end-address and @subnet-mask.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0This address is used as the gateway address. The<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0subsequent address up to and including end-address are<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0placed in the DHCP pool.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @end-address: The DHCP IPv4 range end address to use for t=
he<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rface. Must be in the private IP range (RFC 1918).<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must=
 be specified along with @start-address and<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@sub=
net-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface=
. Must<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be s=
pecified along with @start-address and @subnet-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmne=
t interface is not able to communicate<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vm=
net interfaces. Only communication with<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. =
Available since macOS Big Sur 11.0.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @net-uuid: The identifier (UUID) to uniquely identify the =
isolated<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network vmnet int=
erface should be added to. If<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set, no DHCP serv=
ice is provided for this interface and<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network communica=
tion is allowed only with other interfaces<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added to this net=
work identified by the UUID. Available<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 since macOS Big S=
ur 11.0.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Since: 7.0<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 &#39;data&#39;: {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;=
bool&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*net-uuid&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;=
str&#39; },<br>
&gt;&gt; &gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetSharedOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (shared mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Allows traffic originating from the vmnet interface to rea=
ch the<br>
&gt;&gt; &gt; +# Internet through a network address translator (NAT).<br>
&gt;&gt; &gt; +# The vmnet interface can communicate with the host and with=
<br>
&gt;&gt; &gt; +# other shared mode interfaces on the same subnet. If no DHC=
P<br>
&gt;&gt; &gt; +# settings, subnet mask and IPv6 prefix specified, the inter=
face can<br>
&gt;&gt; &gt; +# communicate with any of other interfaces in shared mode.<b=
r>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @start-address: The starting IPv4 address to use for the i=
nterface.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Must be in the private IP range (RFC 1918). Must be<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0specified along with @end-address and @subnet-mask.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0This address is used as the gateway address. The<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0subsequent address up to and including end-address are<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0placed in the DHCP pool.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @end-address: The DHCP IPv4 range end address to use for t=
he<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rface. Must be in the private IP range (RFC 1918).<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must=
 be specified along with @start-address and @subnet-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface=
. Must<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be =
specified along with @start-address and @subnet-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmne=
t interface is not able to communicate<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vm=
net interfaces. Only communication with<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. =
Available since macOS Big Sur 11.0.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @nat66-prefix: The IPv6 prefix to use into guest network. =
Must be a<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uni=
que local address i.e. start with fd00::/8 and have<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len=
gth of 64.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Since: 7.0<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 &#39;data&#39;: {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;=
bool&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*nat66-prefix&#39;:=C2=A0 &#39;str&#39; }=
,<br>
&gt;&gt; &gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetBridgedOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (bridged mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Bridges the vmnet interface with a physical network interf=
ace.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @ifname: The name of the physical interface to be bridged.=
<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmne=
t interface is not able to communicate<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vm=
net interfaces. Only communication with<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. =
Available since macOS Big Sur 11.0.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Since: 7.0<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +{ &#39;struct&#39;: &#39;NetdevVmnetBridgedOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 &#39;data&#39;: {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;ifname&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&=
#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 &#39;bool&#39; },<b=
r>
&gt;&gt; &gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 ##<br>
&gt;&gt; &gt;=C2=A0 # @NetClientDriver:<br>
&gt;&gt; &gt;=C2=A0 #<br>
&gt;&gt; &gt; @@ -460,10 +574,16 @@<br>
&gt;&gt; &gt;=C2=A0 # Since: 2.7<br>
&gt;&gt; &gt;=C2=A0 #<br>
&gt;&gt; &gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-host since 7.0<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-shared since 7.0<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-bridged since 7.0<br>
&gt;&gt; &gt;=C2=A0 ##<br>
&gt;&gt; &gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;,=
 &#39;user&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vd=
e&#39;,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, =
&#39;hubport&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&=
#39; ] }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, =
&#39;hubport&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&=
#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: =
&#39;vmnet-host&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: =
&#39;vmnet-shared&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: =
&#39;vmnet-bridged&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; }] }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 ##<br>
&gt;&gt; &gt;=C2=A0 # @Netdev:<br>
&gt;&gt; &gt; @@ -477,6 +597,9 @@<br>
&gt;&gt; &gt;=C2=A0 # Since: 1.2<br>
&gt;&gt; &gt;=C2=A0 #<br>
&gt;&gt; &gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;l2tpv3&#39; - since 2=
.1<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-host&#39; - since 7.=
0<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-shared&#39; - since =
7.0<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-bridged&#39; - since=
 7.0<br>
&gt;&gt; &gt;=C2=A0 ##<br>
&gt;&gt; &gt;=C2=A0 { &#39;union&#39;: &#39;Netdev&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;base&#39;: { &#39;id&#39;: &#39;str&#39;, &=
#39;type&#39;: &#39;NetClientDriver&#39; },<br>
&gt;&gt; &gt; @@ -492,7 +615,13 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hubport&#39;:=C2=A0 &#39;NetdevHubPo=
rtOptions&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;netmap&#39;:=C2=A0 =C2=A0&#39;Netdev=
NetmapOptions&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;vhost-user&#39;: &#39;NetdevVhostUse=
rOptions&#39;,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOpti=
ons&#39; } }<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOpti=
ons&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;vmnet-host&#39;: { &#39;type&#39;: &#39;N=
etdevVmnetHostOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;vmnet-shared&#39;: { &#39;type&#39;: &#39=
;NetdevVmnetSharedOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;vmnet-bridged&#39;: { &#39;type&#39;: &#3=
9;NetdevVmnetBridgedOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;CONFIG_VMNET&#39; } } }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 ##<br>
&gt;&gt; &gt;=C2=A0 # @RxState:<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.23.0<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Vladislav Yaroshchuk<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><br>=
<div>Vladislav Yaroshchuk</div></div></div></div></div>

--0000000000007c66ba05d6a54582--

