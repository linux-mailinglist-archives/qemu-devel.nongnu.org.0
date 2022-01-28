Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE04A0413
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:07:54 +0100 (CET)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaLR-0004af-B6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nDaEh-0005DB-Al
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:58 -0500
Received: from [2607:f8b0:4864:20::229] (port=38746
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nDaEQ-0006AH-6A
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:53 -0500
Received: by mail-oi1-x229.google.com with SMTP id g205so15182585oif.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SKzkD2C1UtnYErZ2DYl+6fjif50LmlIremTpOTVmrWU=;
 b=AfNHdBB6Z4dU9t2OggP7Eb5ISH+868omRuvYIEGd5W0ZYkDguGdn8LM+Zct3/+sTSO
 8b7mQFtOXsYvrfxpXCsda03Rg6WaIzzIhQMZ8QyeNkYRPEjeHoFYxgZZWK+nTVi2vSrt
 t15FYn15Nyy1eRU9BMd6cLYhaclRADGYK5JYlF2V/yZ58Z7o9eZb6PlXBOeismEIszzw
 dSqL691HnHgpJeZzuJlwvGTUFTbL0+Os39HEX4+0bo367lWJbr0ECkB59POp1RgFM98u
 voUtaE+0URFgvSwD8RzUY/NDIlA2wqBbVQIgRa8eZXae05/WAmpvTdwlZ1Vd5x7DsyNO
 2pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SKzkD2C1UtnYErZ2DYl+6fjif50LmlIremTpOTVmrWU=;
 b=VUbDQIuKsQX12/+mr1V1LB3cusWnCJ3hIK7fYt64i9GtkR8bYhvQzTpP6xVIRHexa2
 dMyicpYF82DUlPGeW6umt4LSicpuiZMNlitHI+ksaGSVHtGKQgmp0Fk0l4C7UgoA80qh
 0xQ88csae/fsdoALKh9ZEJZaJdwwYBoypfQmclO5dtOrdybNT7CuCSPjb00TTcyy3RVp
 o2SfvCkPp7xrU0sYyHGRTVY8zX+KBcJf2CE+LEkLyT9UVhMMIBo+sB+YCIE6d+NZGIAQ
 4/xSjq6EvLPS2xcy6V06A2usTVxWC70ymkKIKK9s66ZH99qqEa4VdlW7o86eM3+zmfuH
 clMg==
X-Gm-Message-State: AOAM533QNYwnTd6cm4DpyBq4QNYd3Gmg49QSYJYk0lOZFBipsjgJdQEa
 shdgfykA0q5G5VVS3EE6bHOcldUSh++VMpstgdg=
X-Google-Smtp-Source: ABdhPJzWFZgM9V5NGIvN2D2JTB/ePfE2sMOqrWirPMEF+TR4eDZro58hqIbdcZ445cZe5adsKRO/nLIQ1Meb0aCh1PM=
X-Received: by 2002:a05:6808:1283:: with SMTP id
 a3mr12197694oiw.57.1643410817182; 
 Fri, 28 Jan 2022 15:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <YekeHW1GdrIZk3dO@roolebo.dev>
 <CADO9X9QZj+Vgtm6xC1sgjm8w0Szpeph7esVx9G44uq4nfaezWA@mail.gmail.com>
 <CAMVc7JWTOp7apYcz_EeZ-cDcUuFqhF7ChnDamDiAL+aqQDjSUw@mail.gmail.com>
 <CADO9X9Rw+mcEeXDsE2kzqW5oSPE0Kvc2mn9c-rFTp3x42kEpww@mail.gmail.com>
In-Reply-To: <CADO9X9Rw+mcEeXDsE2kzqW5oSPE0Kvc2mn9c-rFTp3x42kEpww@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 29 Jan 2022 08:00:05 +0900
Message-ID: <CAMVc7JW+dtt=m-+mb=72oUZ3r6g2QWhyq+T17cdabLupCjdLjA@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jan 28, 2022 at 11:30 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D0=BF=D1=82, 21 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 16:03, Akihiko O=
daki <akihiko.odaki@gmail.com>:
>>
>> On Fri, Jan 21, 2022 at 9:19 PM Vladislav Yaroshchuk
>> <yaroshchuk2000@gmail.com> wrote:
>> >
>> >
>> > =D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:32, Roman =
Bolshakov <roman@roolebo.dev>:
>> >>
>> >> On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
>> >> > Create separate netdevs for each vmnet operating mode:
>> >> > - vmnet-host
>> >> > - vmnet-shared
>> >> > - vmnet-bridged
>> >> >
>> >>
>> >> Sure I'm late to the party but what if we add only one backend - vmne=
t
>> >> with default mode set to shared and all parameters are added there?
>> >>
>> >> The CLI would look more reasonable for the most typical use case:
>> >>  -netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1
>> >>
>> >> That would remove duplication of options in QAPI schema (e.g. isolate=
d
>> >> is available in all backends now, altough I'm not sure if it makes se=
nse
>> >> for bridged mode):
>> >>
>> >>  -netdev vmnet,id=3Dif1,isolated=3Dyes
>> >>
>> >> start-address, end-address and subnet-mask are also used by both shar=
ed
>> >> and host modes.
>> >>
>> >> Bridged netdev would lool like:
>> >>
>> >>  -netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1
>> >>
>> >> Checksum offloading also seems to be available for all backends from
>> >> Monterey.
>> >>
>> >> The approach might simplify integration of the changes to libvirt and
>> >> discovery of upcoming vmnet features via qapi.
>> >>
>> >
>> > I can rewrite this if it sounds more suitable to use
>> > single `vmnet` netdev instead of three different ones.
>> > We can discuss this with Markus as a QAPI reviewer.
>> > Markus, what is your opinion about single netdev?
>> >
>> > P.S. Seems we have enough time for discussion:
>> > I started fixing memory leaks found by Akihiko and
>> > met a strange deadlock on QEMU shutdown on
>> > `qemu_mutex_lock_iothread()` during careful
>> > interface destruction with added semaphore.
>> > Need to go deeper to understand what's the
>> > problem, it will take some time.
>> >
>> > Mentioned part of Akihiko's review:
>> > https://patchew.org/QEMU/20220113172219.66372-1-yaroshchuk2000@gmail.c=
om/20220113172219.66372-4-yaroshchuk2000@gmail.com/
>>
>
> > Actually I thought it would be tricky to implement.
>
> You mean single netdev type?

I meant the semaphore causing the deadlock, but I also think
implementing the single netdev type would have a difficulty because it
would need a redundant encapsulation of the option type as Phillip
Tennen's original patch series did.

>
>> Actually I thought it would be tricky to implement. A deadlock will
>> occur in a simple implementation if vmnet_send is already queued but
>> not executed yet when destructing:
>> - vmnet_send tries to lock the iothread and waits for the destructor to =
unlock.
>> - vmnet_stop_interface waits for vmnet_send finishing.
>>
>
> Sounds like that's what happens actually.
> With added semaphore:
> --- a/net/vmnet-common.m
> +++ b/net/vmnet-common.m
> @@ -320,13 +320,14 @@ void vmnet_cleanup_common(NetClientState *nc)
>          "org.qemu.vmnet.destroy",
>          DISPATCH_QUEUE_SERIAL
>      );
> -
> +    dispatch_semaphore_t if_destroy_sem =3D dispatch_semaphore_create(0)=
;
>      vmnet_stop_interface(
>          s->vmnet_if,
>          if_destroy_q,
>          ^(vmnet_return_t status) {
> +            dispatch_semaphore_signal(if_destroy_sem);
>          });
> -
> +    dispatch_semaphore_wait(if_destroy_sem, DISPATCH_TIME_FOREVER);
>      for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
>          g_free(s->iov_buf[i].iov_base);
>      }
> --
>
> I see this thread dump on deadlock:
>
> (lldb) bt all
> * thread #1, queue =3D 'com.apple.main-thread', stop reason =3D signal SI=
GSTOP
>   * frame #0: 0x00007fff2037ebb2 libsystem_kernel.dylib`__semwait_signal =
+ 10
>     frame #1: 0x00007fff202fec1a libsystem_c.dylib`nanosleep + 196
>     frame #2: 0x00007fff212c4bb8 Foundation`+[NSThread sleepForTimeInterv=
al:] + 170
>     frame #3: 0x0000000101ebce3a qemu-system-x86_64`-[QemuCocoaAppControl=
ler applicationWillTerminate:](self=3D0x00007fa9f91a1de0, _cmd=3D"applicati=
onWillTerminate:", aNotification=3D@"NSApplicationWillTerminateNotification=
") at cocoa.m:1202:5
>     frame #4: 0x00007fff204a00cd CoreFoundation`__CFNOTIFICATIONCENTER_IS=
_CALLING_OUT_TO_AN_OBSERVER__ + 12
>     frame #5: 0x00007fff2053bb1c CoreFoundation`___CFXRegistrationPost_bl=
ock_invoke + 49
>     frame #6: 0x00007fff2053ba9a CoreFoundation`_CFXRegistrationPost + 45=
4
>     frame #7: 0x00007fff2047134e CoreFoundation`_CFXNotificationPost + 73=
6
>     frame #8: 0x00007fff211e1bb8 Foundation`-[NSNotificationCenter postNo=
tificationName:object:userInfo:] + 59
>     frame #9: 0x00007fff22f585b3 AppKit`-[NSApplication terminate:] + 137=
7
>     frame #10: 0x0000000101ebcf1f qemu-system-x86_64`-[QemuCocoaAppContro=
ller windowShouldClose:](self=3D0x00007fa9f91a1de0, _cmd=3D"windowShouldClo=
se:", sender=3D0x00007fa9f91a7810) at cocoa.m:1231:5
>     frame #11: 0x00007fff230417c9 AppKit`__19-[NSWindow __close]_block_in=
voke + 153
>     frame #12: 0x00007fff23041723 AppKit`-[NSWindow __close] + 284
>     frame #13: 0x00007fff22ed12bb AppKit`-[NSApplication(NSResponder) sen=
dAction:to:from:] + 288
>     frame #14: 0x00007fff22ed115f AppKit`-[NSControl sendAction:to:] + 86
>     frame #15: 0x00007fff22ed1091 AppKit`__26-[NSCell _sendActionFrom:]_b=
lock_invoke + 131
>     frame #16: 0x00007fff22ed0f98 AppKit`-[NSCell _sendActionFrom:] + 171
>     frame #17: 0x00007fff22ed0ede AppKit`-[NSButtonCell _sendActionFrom:]=
 + 96
>     frame #18: 0x00007fff22ecdfc7 AppKit`NSControlTrackMouse + 1820
>     frame #19: 0x00007fff22ecd883 AppKit`-[NSCell trackMouse:inRect:ofVie=
w:untilMouseUp:] + 130
>     frame #20: 0x00007fff22ecd74a AppKit`-[NSButtonCell trackMouse:inRect=
:ofView:untilMouseUp:] + 697
>     frame #21: 0x00007fff22ecca72 AppKit`-[NSControl mouseDown:] + 722
>     frame #22: 0x00007fff22ecae5e AppKit`-[NSWindow(NSEventRouting) _hand=
leMouseDownEvent:isDelayedEvent:] + 4961
>     frame #23: 0x00007fff22e3a648 AppKit`-[NSWindow(NSEventRouting) _real=
lySendEvent:isDelayedEvent:] + 2594
>     frame #24: 0x00007fff22e39a06 AppKit`-[NSWindow(NSEventRouting) sendE=
vent:] + 347
>     frame #25: 0x00007fff22e37e14 AppKit`-[NSApplication(NSEvent) sendEve=
nt:] + 352
>     frame #26: 0x0000000101ebec29 qemu-system-x86_64`-[QemuApplication se=
ndEvent:](self=3D0x00007fa9f90374e0, _cmd=3D"sendEvent:", event=3D0x00007fa=
9f6ef1920) at cocoa.m:1582:9
>     frame #27: 0x00007fff23110be1 AppKit`-[NSApplication _handleEvent:] +=
 65
>     frame #28: 0x00007fff22ca0c8e AppKit`-[NSApplication run] + 623
>     frame #29: 0x0000000101ebef45 qemu-system-x86_64`main(argc=3D3, argv=
=3D0x00007ffeedd71a20) at cocoa.m:1947:5
>     frame #30: 0x00007fff203ccf3d libdyld.dylib`start + 1
>   thread #2
>     frame #0: 0x00007fff2037ecde libsystem_kernel.dylib`__psynch_cvwait +=
 10
>     frame #1: 0x00007fff203b1e49 libsystem_pthread.dylib`_pthread_cond_wa=
it + 1298
>     frame #2: 0x00000001026b7837 qemu-system-x86_64`qemu_futex_wait(ev=3D=
0x0000000102e88eb8, val=3D4294967295) at qemu-thread-posix.c:386:9
>     frame #3: 0x00000001026b77b0 qemu-system-x86_64`qemu_event_wait(ev=3D=
0x0000000102e88eb8) at qemu-thread-posix.c:481:9
>     frame #4: 0x00000001026c56be qemu-system-x86_64`call_rcu_thread(opaqu=
e=3D0x0000000000000000) at rcu.c:261:21
>     frame #5: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(arg=
s=3D0x00007fa9f9105320) at qemu-thread-posix.c:556:9
>     frame #6: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +=
 224
>     frame #7: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 1=
5
>   thread #3
>     frame #0: 0x00007fff2037c2f6 libsystem_kernel.dylib`semaphore_wait_tr=
ap + 10
>     frame #1: 0x00007fff20207c9b libdispatch.dylib`_dispatch_sema4_wait +=
 16
>     frame #2: 0x00007fff2020816d libdispatch.dylib`_dispatch_semaphore_wa=
it_slow + 98
>     frame #3: 0x0000000101f6ac1b qemu-system-x86_64`vmnet_cleanup_common(=
nc=3D0x00007fa9f7019400) at vmnet-common.m:330:5
>     frame #4: 0x0000000101f5c6cd qemu-system-x86_64`qemu_cleanup_net_clie=
nt(nc=3D0x00007fa9f7019400) at net.c:361:9
>     frame #5: 0x0000000101f5c4cf qemu-system-x86_64`qemu_del_net_client(n=
c=3D0x00007fa9f7019400) at net.c:417:13
>     frame #6: 0x0000000101f5e751 qemu-system-x86_64`net_cleanup at net.c:=
1447:13
>     frame #7: 0x000000010228f548 qemu-system-x86_64`qemu_cleanup at runst=
ate.c:820:5
>     frame #8: 0x0000000101e9950d qemu-system-x86_64`qemu_main(argc=3D3, a=
rgv=3D0x00007ffeedd71a20, envp=3D0x00007ffeedd71a40) at main.c:51:5
>     frame #9: 0x0000000101ebefb4 qemu-system-x86_64`call_qemu_main(opaque=
=3D0x0000000000000000) at cocoa.m:1897:14
>     frame #10: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(ar=
gs=3D0x00007fa9f9105320) at qemu-thread-posix.c:556:9
>     frame #11: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start =
+ 224
>     frame #12: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + =
15
>   thread #4
>     frame #0: 0x00007fff20384e22 libsystem_kernel.dylib`__sigwait + 10
>     frame #1: 0x00007fff203b1fff libsystem_pthread.dylib`sigwait + 29
>     frame #2: 0x00000001026b3541 qemu-system-x86_64`sigwait_compat(opaque=
=3D0x00007fa9f6d0a3f0) at compatfd.c:36:15
>     frame #3: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(arg=
s=3D0x00007fa9f6d09ec0) at qemu-thread-posix.c:556:9
>     frame #4: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +=
 224
>     frame #5: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 1=
5
>   thread #7
>     frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_mutexwai=
t + 10
>     frame #1: 0x00007fff203af2ab libsystem_pthread.dylib`_pthread_mutex_f=
irstfit_lock_wait + 76
>     frame #2: 0x00007fff203ad192 libsystem_pthread.dylib`_pthread_mutex_f=
irstfit_lock_slow + 204
>     frame #3: 0x00007fff203b1ee1 libsystem_pthread.dylib`_pthread_cond_wa=
it + 1450
>     frame #4: 0x00000001026b6d92 qemu-system-x86_64`qemu_cond_wait_impl(c=
ond=3D0x00007fa9f6c2edf0, mutex=3D0x0000000102e758f0, file=3D"../softmmu/cp=
us.c", line=3D423) at qemu-thread-posix.c:195:11
>     frame #5: 0x000000010227c716 qemu-system-x86_64`qemu_wait_io_event(cp=
u=3D0x00007fa9f949a000) at cpus.c:423:9
>     frame #6: 0x000000010239c94e qemu-system-x86_64`mttcg_cpu_thread_fn(a=
rg=3D0x00007fa9f949a000) at tcg-accel-ops-mttcg.c:123:9
>     frame #7: 0x00000001026b7b76 qemu-system-x86_64`qemu_thread_start(arg=
s=3D0x00007fa9f6c2f5e0) at qemu-thread-posix.c:556:9
>     frame #8: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +=
 224
>     frame #9: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 1=
5
>   thread #8
>     frame #0: 0x00007fff2037d95e libsystem_kernel.dylib`__workq_kernretur=
n + 10
>     frame #1: 0x00007fff203ae4c1 libsystem_pthread.dylib`_pthread_wqthrea=
d + 414
>     frame #2: 0x00007fff203ad42f libsystem_pthread.dylib`start_wqthread +=
 15
>   thread #9, queue =3D 'org.qemu.vmnet.if_queue'
>     frame #0: 0x00007fff2037e4ca libsystem_kernel.dylib`__psynch_mutexwai=
t + 10
>     frame #1: 0x00007fff203af2ab libsystem_pthread.dylib`_pthread_mutex_f=
irstfit_lock_wait + 76
>     frame #2: 0x00007fff203ad192 libsystem_pthread.dylib`_pthread_mutex_f=
irstfit_lock_slow + 204
>     frame #3: 0x00000001026b67ea qemu-system-x86_64`qemu_mutex_lock_impl(=
mutex=3D0x0000000102e758f0, file=3D"../net/vmnet-common.m", line=3D91) at q=
emu-thread-posix.c:80:11
>     frame #4: 0x000000010227c9d2 qemu-system-x86_64`qemu_mutex_lock_iothr=
ead_impl(file=3D"../net/vmnet-common.m", line=3D91) at cpus.c:497:5
>     frame #5: 0x0000000101f6ae9e qemu-system-x86_64`vmnet_send(nc=3D0x000=
07fa9f7019400, event_id=3DVMNET_INTERFACE_PACKETS_AVAILABLE, event=3D0x0000=
7fa9f6d3b860) at vmnet-common.m:91:5
>     frame #6: 0x0000000101f6acf3 qemu-system-x86_64`__vmnet_register_even=
t_callback_block_invoke(.block_descriptor=3D0x00007fa9f9034240, event_id=3D=
VMNET_INTERFACE_PACKETS_AVAILABLE, event=3D0x00007fa9f6d3b860) at vmnet-com=
mon.m:121:15
>     frame #7: 0x00007fff6f385a3d vmnet`__vmnet_interface_set_event_callba=
ck_block_invoke_3 + 195
>     frame #8: 0x00007fff20207806 libdispatch.dylib`_dispatch_client_callo=
ut + 8
>     frame #9: 0x00007fff2020a1b0 libdispatch.dylib`_dispatch_continuation=
_pop + 423
>     frame #10: 0x00007fff2021a564 libdispatch.dylib`_dispatch_source_invo=
ke + 2061
>     frame #11: 0x00007fff2020d493 libdispatch.dylib`_dispatch_lane_serial=
_drain + 263
>     frame #12: 0x00007fff2020e0ad libdispatch.dylib`_dispatch_lane_invoke=
 + 366
>     frame #13: 0x00007fff20217c0d libdispatch.dylib`_dispatch_workloop_wo=
rker_thread + 811
>     frame #14: 0x00007fff203ae45d libsystem_pthread.dylib`_pthread_wqthre=
ad + 314
>     frame #15: 0x00007fff203ad42f libsystem_pthread.dylib`start_wqthread =
+ 15
>   thread #11, name =3D 'com.apple.NSEventThread'
>     frame #0: 0x00007fff2037c2ba libsystem_kernel.dylib`mach_msg_trap + 1=
0
>     frame #1: 0x00007fff2037c62c libsystem_kernel.dylib`mach_msg + 60
>     frame #2: 0x00007fff204aab2f CoreFoundation`__CFRunLoopServiceMachPor=
t + 316
>     frame #3: 0x00007fff204a920f CoreFoundation`__CFRunLoopRun + 1328
>     frame #4: 0x00007fff204a861c CoreFoundation`CFRunLoopRunSpecific + 56=
3
>     frame #5: 0x00007fff22e3623a AppKit`_NSEventThread + 124
>     frame #6: 0x00007fff203b18fc libsystem_pthread.dylib`_pthread_start +=
 224
>     frame #7: 0x00007fff203ad443 libsystem_pthread.dylib`thread_start + 1=
5
>
>> Though I doubt it is the cause of your deadlock. This deadlock would
>> not happen frequently since vmnet_send will not be queued if the
>> device is not used.
>>
>
> Having two-three connected nics causes deadlock almost every
> time. With only one nic it happens one time out of two or three.
>
> An interesting thing is that using qemu_send_packet() instead
> of qemu_send_packet_async() fixes the problem. Hope to
> start investigating this next week.

A proper fix is to add a flag to tell if it is being destroyed and
code to check it and then lock iothread in a critical section.

Looking at qemu_send_packet_async, I found some other problems.
send_enabled is accessed by both a dispatch queue thread and an
iothread but not protected for multi-thread use.
Another problem is that VMNET_INTERFACE_PACKETS_AVAILABLE is silently
ignored when send_enabled is not set. It should call vmnet_read after
setting send_enabled.
Finally, vmnet_send clamps pkt_cnt, but the remaining available
packets should also be read.

Regards,
Akihiko Odaki

>
>> Regards,
>> Akihiko Odaki
>>
>> >
>> >
>> >> Thanks,
>> >> Roman
>> >>
>> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> >> > ---
>> >> >  net/clients.h       |  11 ++++
>> >> >  net/meson.build     |   7 +++
>> >> >  net/net.c           |  10 ++++
>> >> >  net/vmnet-bridged.m |  25 +++++++++
>> >> >  net/vmnet-common.m  |  20 +++++++
>> >> >  net/vmnet-host.c    |  24 ++++++++
>> >> >  net/vmnet-shared.c  |  25 +++++++++
>> >> >  net/vmnet_int.h     |  25 +++++++++
>> >> >  qapi/net.json       | 133 ++++++++++++++++++++++++++++++++++++++++=
+++-
>> >> >  9 files changed, 278 insertions(+), 2 deletions(-)
>> >> >  create mode 100644 net/vmnet-bridged.m
>> >> >  create mode 100644 net/vmnet-common.m
>> >> >  create mode 100644 net/vmnet-host.c
>> >> >  create mode 100644 net/vmnet-shared.c
>> >> >  create mode 100644 net/vmnet_int.h
>> >> >
>> >> > diff --git a/net/net.c b/net/net.c
>> >> > index f0d14dbfc1..1dbb64b935 100644
>> >> > --- a/net/net.c
>> >> > +++ b/net/net.c
>> >> > @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_=
CLIENT_DRIVER__MAX])(
>> >> >  #ifdef CONFIG_L2TPV3
>> >> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
>> >> >  #endif
>> >> > +#ifdef CONFIG_VMNET
>> >> > +        [NET_CLIENT_DRIVER_VMNET_HOST] =3D net_init_vmnet_host,
>> >> > +        [NET_CLIENT_DRIVER_VMNET_SHARED] =3D net_init_vmnet_shared=
,
>> >> > +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] =3D net_init_vmnet_bridg=
ed,
>> >> > +#endif /* CONFIG_VMNET */
>> >> >  };
>> >> >
>> >> >
>> >> > @@ -1106,6 +1111,11 @@ void show_netdevs(void)
>> >> >  #endif
>> >> >  #ifdef CONFIG_VHOST_VDPA
>> >> >          "vhost-vdpa",
>> >> > +#endif
>> >> > +#ifdef CONFIG_VMNET
>> >> > +        "vmnet-host",
>> >> > +        "vmnet-shared",
>> >> > +        "vmnet-bridged",
>> >> >  #endif
>> >> >      };
>> >> >
>> >> > diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
>> >> > new file mode 100644
>> >> > index 0000000000..4e42a90391
>> >> > --- /dev/null
>> >> > +++ b/net/vmnet-bridged.m
>> >> > @@ -0,0 +1,25 @@
>> >> > +/*
>> >> > + * vmnet-bridged.m
>> >> > + *
>> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.co=
m>
>> >> > + *
>> >> > + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>> >> > + * See the COPYING file in the top-level directory.
>> >> > + *
>> >> > + */
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "qapi/qapi-types-net.h"
>> >> > +#include "vmnet_int.h"
>> >> > +#include "clients.h"
>> >> > +#include "qemu/error-report.h"
>> >> > +#include "qapi/error.h"
>> >> > +
>> >> > +#include <vmnet/vmnet.h>
>> >> > +
>> >> > +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
>> >> > +                           NetClientState *peer, Error **errp)
>> >> > +{
>> >> > +  error_setg(errp, "vmnet-bridged is not implemented yet");
>> >> > +  return -1;
>> >> > +}
>> >> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>> >> > new file mode 100644
>> >> > index 0000000000..532d152840
>> >> > --- /dev/null
>> >> > +++ b/net/vmnet-common.m
>> >> > @@ -0,0 +1,20 @@
>> >> > +/*
>> >> > + * vmnet-common.m - network client wrapper for Apple vmnet.framewo=
rk
>> >> > + *
>> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.co=
m>
>> >> > + * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
>> >> > + *
>> >> > + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>> >> > + * See the COPYING file in the top-level directory.
>> >> > + *
>> >> > + */
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "qapi/qapi-types-net.h"
>> >> > +#include "vmnet_int.h"
>> >> > +#include "clients.h"
>> >> > +#include "qemu/error-report.h"
>> >> > +#include "qapi/error.h"
>> >> > +
>> >> > +#include <vmnet/vmnet.h>
>> >> > +
>> >> > diff --git a/net/vmnet-host.c b/net/vmnet-host.c
>> >> > new file mode 100644
>> >> > index 0000000000..4a5ef99dc7
>> >> > --- /dev/null
>> >> > +++ b/net/vmnet-host.c
>> >> > @@ -0,0 +1,24 @@
>> >> > +/*
>> >> > + * vmnet-host.c
>> >> > + *
>> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.co=
m>
>> >> > + *
>> >> > + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>> >> > + * See the COPYING file in the top-level directory.
>> >> > + *
>> >> > + */
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "qapi/qapi-types-net.h"
>> >> > +#include "vmnet_int.h"
>> >> > +#include "clients.h"
>> >> > +#include "qemu/error-report.h"
>> >> > +#include "qapi/error.h"
>> >> > +
>> >> > +#include <vmnet/vmnet.h>
>> >> > +
>> >> > +int net_init_vmnet_host(const Netdev *netdev, const char *name,
>> >> > +                        NetClientState *peer, Error **errp) {
>> >> > +  error_setg(errp, "vmnet-host is not implemented yet");
>> >> > +  return -1;
>> >> > +}
>> >> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>> >> > new file mode 100644
>> >> > index 0000000000..f8c4a4f3b8
>> >> > --- /dev/null
>> >> > +++ b/net/vmnet-shared.c
>> >> > @@ -0,0 +1,25 @@
>> >> > +/*
>> >> > + * vmnet-shared.c
>> >> > + *
>> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.co=
m>
>> >> > + *
>> >> > + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>> >> > + * See the COPYING file in the top-level directory.
>> >> > + *
>> >> > + */
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "qapi/qapi-types-net.h"
>> >> > +#include "vmnet_int.h"
>> >> > +#include "clients.h"
>> >> > +#include "qemu/error-report.h"
>> >> > +#include "qapi/error.h"
>> >> > +
>> >> > +#include <vmnet/vmnet.h>
>> >> > +
>> >> > +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>> >> > +                          NetClientState *peer, Error **errp)
>> >> > +{
>> >> > +  error_setg(errp, "vmnet-shared is not implemented yet");
>> >> > +  return -1;
>> >> > +}
>> >> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>> >> > new file mode 100644
>> >> > index 0000000000..c5982259a4
>> >> > --- /dev/null
>> >> > +++ b/net/vmnet_int.h
>> >> > @@ -0,0 +1,25 @@
>> >> > +/*
>> >> > + * vmnet_int.h
>> >> > + *
>> >> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.co=
m>
>> >> > + *
>> >> > + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>> >> > + * See the COPYING file in the top-level directory.
>> >> > + *
>> >> > + */
>> >> > +#ifndef VMNET_INT_H
>> >> > +#define VMNET_INT_H
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "vmnet_int.h"
>> >> > +#include "clients.h"
>> >> > +
>> >> > +#include <vmnet/vmnet.h>
>> >> > +
>> >> > +typedef struct VmnetCommonState {
>> >> > +  NetClientState nc;
>> >> > +
>> >> > +} VmnetCommonState;
>> >> > +
>> >> > +
>> >> > +#endif /* VMNET_INT_H */
>> >> > diff --git a/qapi/net.json b/qapi/net.json
>> >> > index 7fab2e7cd8..b922e2e34f 100644
>> >> > --- a/qapi/net.json
>> >> > +++ b/qapi/net.json
>> >> > @@ -452,6 +452,120 @@
>> >> >      '*vhostdev':     'str',
>> >> >      '*queues':       'int' } }
>> >> >
>> >> > +##
>> >> > +# @NetdevVmnetHostOptions:
>> >> > +#
>> >> > +# vmnet (host mode) network backend.
>> >> > +#
>> >> > +# Allows the vmnet interface to communicate with other vmnet
>> >> > +# interfaces that are in host mode and also with the host.
>> >> > +#
>> >> > +# @start-address: The starting IPv4 address to use for the interfa=
ce.
>> >> > +#                 Must be in the private IP range (RFC 1918). Must=
 be
>> >> > +#                 specified along with @end-address and @subnet-ma=
sk.
>> >> > +#                 This address is used as the gateway address. The
>> >> > +#                 subsequent address up to and including end-addre=
ss are
>> >> > +#                 placed in the DHCP pool.
>> >> > +#
>> >> > +# @end-address: The DHCP IPv4 range end address to use for the
>> >> > +#               interface. Must be in the private IP range (RFC 19=
18).
>> >> > +#               Must be specified along with @start-address and
>> >> > +#               @subnet-mask.
>> >> > +#
>> >> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
>> >> > +#               be specified along with @start-address and @subnet=
-mask.
>> >> > +#
>> >> > +# @isolated: Enable isolation for this interface. Interface isolat=
ion
>> >> > +#            ensures that vmnet interface is not able to communica=
te
>> >> > +#            with any other vmnet interfaces. Only communication w=
ith
>> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> >> > +#
>> >> > +# @net-uuid: The identifier (UUID) to uniquely identify the isolat=
ed
>> >> > +#            network vmnet interface should be added to. If
>> >> > +#            set, no DHCP service is provided for this interface a=
nd
>> >> > +#            network communication is allowed only with other inte=
rfaces
>> >> > +#            added to this network identified by the UUID. Availab=
le
>> >> > +#            since macOS Big Sur 11.0.
>> >> > +#
>> >> > +# Since: 7.0
>> >> > +##
>> >> > +{ 'struct': 'NetdevVmnetHostOptions',
>> >> > +  'data': {
>> >> > +    '*start-address': 'str',
>> >> > +    '*end-address':   'str',
>> >> > +    '*subnet-mask':   'str',
>> >> > +    '*isolated':      'bool',
>> >> > +    '*net-uuid':      'str' },
>> >> > +  'if': 'CONFIG_VMNET' }
>> >> > +
>> >> > +##
>> >> > +# @NetdevVmnetSharedOptions:
>> >> > +#
>> >> > +# vmnet (shared mode) network backend.
>> >> > +#
>> >> > +# Allows traffic originating from the vmnet interface to reach the
>> >> > +# Internet through a network address translator (NAT).
>> >> > +# The vmnet interface can communicate with the host and with
>> >> > +# other shared mode interfaces on the same subnet. If no DHCP
>> >> > +# settings, subnet mask and IPv6 prefix specified, the interface c=
an
>> >> > +# communicate with any of other interfaces in shared mode.
>> >> > +#
>> >> > +# @start-address: The starting IPv4 address to use for the interfa=
ce.
>> >> > +#                 Must be in the private IP range (RFC 1918). Must=
 be
>> >> > +#                 specified along with @end-address and @subnet-ma=
sk.
>> >> > +#                 This address is used as the gateway address. The
>> >> > +#                 subsequent address up to and including end-addre=
ss are
>> >> > +#                 placed in the DHCP pool.
>> >> > +#
>> >> > +# @end-address: The DHCP IPv4 range end address to use for the
>> >> > +#               interface. Must be in the private IP range (RFC 19=
18).
>> >> > +#               Must be specified along with @start-address and @s=
ubnet-mask.
>> >> > +#
>> >> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
>> >> > +#                be specified along with @start-address and @subne=
t-mask.
>> >> > +#
>> >> > +# @isolated: Enable isolation for this interface. Interface isolat=
ion
>> >> > +#            ensures that vmnet interface is not able to communica=
te
>> >> > +#            with any other vmnet interfaces. Only communication w=
ith
>> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> >> > +#
>> >> > +# @nat66-prefix: The IPv6 prefix to use into guest network. Must b=
e a
>> >> > +#                unique local address i.e. start with fd00::/8 and=
 have
>> >> > +#                length of 64.
>> >> > +#
>> >> > +# Since: 7.0
>> >> > +##
>> >> > +{ 'struct': 'NetdevVmnetSharedOptions',
>> >> > +  'data': {
>> >> > +    '*start-address': 'str',
>> >> > +    '*end-address':   'str',
>> >> > +    '*subnet-mask':   'str',
>> >> > +    '*isolated':      'bool',
>> >> > +    '*nat66-prefix':  'str' },
>> >> > +  'if': 'CONFIG_VMNET' }
>> >> > +
>> >> > +##
>> >> > +# @NetdevVmnetBridgedOptions:
>> >> > +#
>> >> > +# vmnet (bridged mode) network backend.
>> >> > +#
>> >> > +# Bridges the vmnet interface with a physical network interface.
>> >> > +#
>> >> > +# @ifname: The name of the physical interface to be bridged.
>> >> > +#
>> >> > +# @isolated: Enable isolation for this interface. Interface isolat=
ion
>> >> > +#            ensures that vmnet interface is not able to communica=
te
>> >> > +#            with any other vmnet interfaces. Only communication w=
ith
>> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> >> > +#
>> >> > +# Since: 7.0
>> >> > +##
>> >> > +{ 'struct': 'NetdevVmnetBridgedOptions',
>> >> > +  'data': {
>> >> > +    'ifname':     'str',
>> >> > +    '*isolated':  'bool' },
>> >> > +  'if': 'CONFIG_VMNET' }
>> >> > +
>> >> >  ##
>> >> >  # @NetClientDriver:
>> >> >  #
>> >> > @@ -460,10 +574,16 @@
>> >> >  # Since: 2.7
>> >> >  #
>> >> >  #        @vhost-vdpa since 5.1
>> >> > +#        @vmnet-host since 7.0
>> >> > +#        @vmnet-shared since 7.0
>> >> > +#        @vmnet-bridged since 7.0
>> >> >  ##
>> >> >  { 'enum': 'NetClientDriver',
>> >> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde=
',
>> >> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vd=
pa' ] }
>> >> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vd=
pa',
>> >> > +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>> >> > +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>> >> > +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>> >> >
>> >> >  ##
>> >> >  # @Netdev:
>> >> > @@ -477,6 +597,9 @@
>> >> >  # Since: 1.2
>> >> >  #
>> >> >  #        'l2tpv3' - since 2.1
>> >> > +#        'vmnet-host' - since 7.0
>> >> > +#        'vmnet-shared' - since 7.0
>> >> > +#        'vmnet-bridged' - since 7.0
>> >> >  ##
>> >> >  { 'union': 'Netdev',
>> >> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
>> >> > @@ -492,7 +615,13 @@
>> >> >      'hubport':  'NetdevHubPortOptions',
>> >> >      'netmap':   'NetdevNetmapOptions',
>> >> >      'vhost-user': 'NetdevVhostUserOptions',
>> >> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
>> >> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
>> >> > +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
>> >> > +                    'if': 'CONFIG_VMNET' },
>> >> > +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
>> >> > +                      'if': 'CONFIG_VMNET' },
>> >> > +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
>> >> > +                       'if': 'CONFIG_VMNET' } } }
>> >> >
>> >> >  ##
>> >> >  # @RxState:
>> >> > --
>> >> > 2.23.0
>> >> >
>> >
>> >
>> >
>> > --
>> > Best Regards,
>> >
>> > Vladislav Yaroshchuk
>
>
>
> --
> Best Regards,
>
> Vladislav Yaroshchuk

