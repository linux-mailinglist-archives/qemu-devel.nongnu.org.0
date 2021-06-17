Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC423ABC2F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:56:51 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxC6-0007KQ-5n
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1ltxAf-0006Jy-Fe; Thu, 17 Jun 2021 14:55:21 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1ltxAZ-0003Vc-Pn; Thu, 17 Jun 2021 14:55:21 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5WPV1X0zz6yrn;
 Fri, 18 Jun 2021 02:51:58 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 02:55:09 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 02:55:08 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 18 Jun 2021 02:55:08 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>
Subject: Re: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Thu, 17 Jun 2021 18:55:08 +0000
Message-ID: <962a136475b749949a49311daf8f5fbc@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
 <d8acff2435364e019931b8d13296ad69@huawei.com>
 <e0acc7f58dea1847c2838ffb0b06e8ec10358db8.camel@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=andrey.shinkevich@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, "Cota@braap.org" <Cota@braap.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?Windows-1252?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 8:44 PM, shashi.mallela@linaro.org wrote:=0A=
> Hi Andrey,=0A=
> =0A=
> The issue doesnt seem related to ITS patchset as the implementation has=
=0A=
> no changes around MTTCG or vCPU configurations.=0A=
> =0A=
> if this patchset were not applied(with only commit 3e9f48b),do you=0A=
> still see the hang issue?=0A=
=0A=
No, I don't. Even with the patchset applied, the 'gic-version=3D2' turns =
=0A=
the guest to normal running.=0A=
With the 'gic-version=3D3' and '-smp 3' (1,2 or 3 vCPUs), the guest starts =
=0A=
and runs OK as well.=0A=
=0A=
Andrey=0A=
=0A=
> =0A=
> Thanks=0A=
> Shashi=0A=
> =0A=
> =0A=
> On Thu, 2021-06-17 at 16:43 +0000, Andrey Shinkevich wrote:=0A=
>> Dear Shashi,=0A=
>>=0A=
>> I have applied the version 4 of the series "GICv3 LPI and ITS=0A=
>> feature=0A=
>> implementation" right after the commit 3e9f48b as before (because=0A=
>> the=0A=
>> GCCv7.5 is unavailable in the YUM repository for CentOS-7.9).=0A=
>>=0A=
>> The guest OS still hangs at its start when QEMU is configured with 4=0A=
>> or=0A=
>> more vCPUs (with 1 to 3 vCPUs the guest starts and runs OK and the=0A=
>> MTTCG=0A=
>> works properly):=0A=
>>=0A=
>> Welcome to EulerOS 2.0 ... (Initramfs)!=0A=
>>=0A=
>> =85=0A=
>>=0A=
>> [  OK  ] Mounted Kernel Configuration File System.=0A=
>>=0A=
>> [  OK  ] Started udev Coldplug all Devices.=0A=
>>=0A=
>> [  OK  ] Reached target System Initialization.=0A=
>>=0A=
>> [  OK  ] Reached target Basic System.=0A=
>>=0A=
>>=0A=
>>=0A=
>> IT HANGS HERE=0A=
>>    (with 4 or more vCPUs)!!!=0A=
>>=0A=
>>=0A=
>> [  OK  ] Found device /dev/mapper/euleros-root.=0A=
>>=0A=
>> [  OK  ] Reached target Initrd Root Device.=0A=
>>=0A=
>> [  OK  ] Started dracut initqueue hook.=0A=
>>=0A=
>>            Starting File System Check on /dev/mapper/euleros-root...=0A=
>>=0A=
>> [  OK  ] Reached target Remote File Systems (Pre).=0A=
>>=0A=
>> [  OK  ] Reached target Remote File Systems.=0A=
>>=0A=
>> [  OK  ] Started File System Check on /dev/mapper/euleros-root.=0A=
>>=0A=
>>            Mounting /sysroot...=0A=
>>=0A=
>> [  OK  ] Mounted /sysroot.=0A=
>>=0A=
>> =85=0A=
>>=0A=
>>=0A=
>> The back trace of threads in QEMU looks like a dead lock in MTTCG,=0A=
>> doesn't it?=0A=
>>=0A=
>> Thread 7 (Thread 0x7f476e489700 (LWP 24967)):=0A=
>>=0A=
...=0A=
>>=0A=
>> Thread 5 (Thread 0x7f461f9ff700 (LWP 24971)):=0A=
>>=0A=
...=0A=
>>=0A=
>> Thread 4 (Thread 0x7f461f1fe700 (LWP 24972)):=0A=
>>=0A=
...=0A=
>>=0A=
>> Thread 3 (Thread 0x7f461e9fd700 (LWP 24973)...=0A=
>>=0A=
>> Thread 2 (Thread 0x7f461e1fc700 (LWP 24974)):=0A=
>>=0A=
>> #0  0x00007f477c59ca35 in pthread_cond_wait@@GLIBC_2.3.2 () at=0A=
>> /lib64/libpthread.so.0=0A=
>>=0A=
>> ---Type <return> to continue, or q <return> to quit---=0A=
>>=0A=
>> #1  0x000055747d419b1d in qemu_cond_wait_impl (cond=3D0x55747fa626c0,=0A=
>> mutex=3D0x55747e04dc00 <qemu_global_mutex>, file=3D0x55747d5dbe5c=0A=
>> "../softmmu/cpus.c", line=3D417) at ../util/qemu-thread-posix.c:174=0A=
>>=0A=
>> #2  0x000055747d20ae36 in qemu_wait_io_event=0A=
>> (cpu=3Dcpu@entry=3D0x55747f9fcf00) at ../softmmu/cpus.c:417=0A=
>>=0A=
>> #3  0x000055747d18d6a1 in mttcg_cpu_thread_fn=0A=
>> (arg=3Darg@entry=3D0x55747f9fcf00) at ../accel/tcg/tcg-accel-ops-=0A=
>> mttcg.c:98=0A=
>>=0A=
>> #4  0x000055747d419406 in qemu_thread_start (args=3D<optimized out>)=0A=
>> at=0A=
>> ../util/qemu-thread-posix.c:521=0A=
>>=0A=
>> #5  0x00007f477c598ea5 in start_thread () at /lib64/libpthread.so.0=0A=
>>=0A=
>> #6  0x00007f477c2c19fd in clone () at /lib64/libc.so.6=0A=
>>=0A=
>>=0A=
>> Thread 1 (Thread 0x7f4781db4d00 (LWP 24957)):=0A=
>>=0A=
...=0A=
>>=0A=
>> (gdb)=0A=
>>=0A=
>>=0A=
>> I run QEMU with virt-manager as this:=0A=
>>=0A=
>> qemu      7311     1 70 19:15 ?        00:00:05=0A=
>> /usr/local/bin/qemu-system-aarch64 -name=0A=
>> guest=3DEulerOS-2.8-Rich,debug-threads=3Don -S -object=0A=
>> secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-=
95-=0A=
>> EulerOS-2.8-Rich/master-key.aes=0A=
>> -machine virt-6.1,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff,gic-=0A=
>> version=3D3=0A=
>> -cpu max -drive=0A=
>> file=3D/usr/share/AAVMF/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=3D0,=
reado=0A=
>> nly=3Don=0A=
>> -drive=0A=
>> file=3D/var/lib/libvirt/qemu/nvram/EulerOS-2.8-=0A=
>> Rich_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1=0A=
>> -m 4096 -smp 4,sockets=3D4,cores=3D1,threads=3D1=0A=
...=0A=
>>=0A=
>> The issue is reproducible and persists.=0A=
>> 1. Do you think that applying the series results in the dead lock in=0A=
>> MTTCG? Or it may be other reason?=0A=
>> 2. Which piece of QEMU source code should I investigate to locate the=0A=
>> issue?=0A=
>>=0A=
>> Best regards,=0A=
>> Andrey Shinkevich=0A=
>>=0A=
...=0A=
> =0A=
> =0A=
=0A=

