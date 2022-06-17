Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B754F7D3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:50:38 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BQr-0008HR-Gt
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o2BOA-0005Dx-Th
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:47:50 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36384 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o2BO6-0000co-E3
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:47:49 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-01 (Coremail) with SMTP id qwCowACHVFnid6xi8WSRBA--.15998S2;
 Fri, 17 Jun 2022 20:47:31 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YqxrXgLeMdVKFQ4P@apples>
Date: Fri, 17 Jun 2022 20:47:29 +0800
Cc: qemu-devel@nongnu.org,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <75D77EF8-3A0E-4CFB-A7CB-2342C28CB60C@ict.ac.cn>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <YqxrXgLeMdVKFQ4P@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACHVFnid6xi8WSRBA--.15998S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1fur48tF48Xr48XryrJFb_yoW5AF4fpa
 yY9F13tF4kWr17Gws3KF17JF1Fqws3XrWkWFsrJw17GFn0kFyaqa4Ykr18uF90vrs2gw4S
 yFWqqry7G34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-Originating-IP: [202.38.79.134]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 17, 2022, at 7:54 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> On Jun 16 20:34, Jinhao Fan wrote:
>> This patch adds shadow doorbell buffer support in NVMe 1.3 to QEMU
>> NVMe. The Doorbell Buffer Config admin command is implemented for the
>> guest to enable shadow doobell buffer. When this feature is enabled, =
each
>> SQ/CQ is associated with two buffers, i.e., Shadow Doorbell buffer =
and
>> EventIdx buffer. According to the Spec, each queue's doorbell =
register
>> is only updated when the Shadow Doorbell buffer value changes from =
being
>> less than or equal to the value of the corresponding EventIdx buffer
>> entry to being greater than that value. Therefore, the number of =
MMIO's
>> on the doorbell registers is greatly reduced.
>>=20
>> This patch is adapted from Huaicheng Li's patch[1] in 2018.
>>=20
>> [1] =
https://patchwork.kernel.org/project/qemu-devel/patch/20180305194906.GA363=
0@gmail.com/
>>=20
>> IOPS comparison with FIO:
>>=20
>> iodepth    1      2      4      8
>>  QEMU   25.1k  25.9k  24.5k  24.0k
>> +dbbuf  29.1k  60.1k  99.8k  82.5k
>>=20
>> MMIO's per IO measured by perf-kvm:
>>=20
>> iodepth    1      2      4      8
>>  QEMU   2.01   1.99   1.99   1.99
>> +dbbuf  1.00   0.52   0.27   0.46
>>=20
>> The tests are done on Ubuntu 22.04 with 5.15.0-33 kernel with =
Intel(R)=20
>> Xeon(R) Gold 6248R CPU @ 3.00GHz.
>>=20
>> QEMU set up:
>>=20
>> bin/x86_64-softmmu/qemu-system-x86_64 \
>>    -name "nvme-test" \
>>    -machine accel=3Dkvm \
>>    -cpu host \
>>    -smp 4 \
>>    -m 8G \
>>    -daemonize \
>>    -device virtio-scsi-pci,id=3Dscsi0 \
>>    -device scsi-hd,drive=3Dhd0 \
>>    -drive =
file=3D$OSIMGF,if=3Dnone,aio=3Dnative,cache=3Dnone,format=3Dqcow2,id=3Dhd0=
,snapshot=3Don \
>>    -drive =
"id=3Dnvm,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,format=3Draw" =
\
>>    -device nvme,serial=3Ddeadbeef,drive=3Dnvm \
>>    -net user,hostfwd=3Dtcp::8080-:22 \
>>    -net nic,model=3Dvirtio
>>=20
>> FIO configuration:
>>=20
>> [global]
>> ioengine=3Dlibaio
>> filename=3D/dev/nvme0n1
>> thread=3D1
>> group_reporting=3D1
>> direct=3D1
>> verify=3D0
>> time_based=3D1
>> ramp_time=3D0
>> runtime=3D30
>> ;size=3D1G
>> ;iodepth=3D1
>> rw=3Drandread
>> bs=3D4k
>>=20
>> [test]
>> numjobs=3D1
>>=20
>> Changes since v2:
>>  - Do not ignore admin queue updates in nvme_process_db and =
nvme_post_cqes
>>  - Calculate db_addr and ei_addr in hard-coded way
>>=20
>> Changes since v1:
>>  - Add compatibility with hosts that do not use admin queue shadow =
doorbell
>>=20
>> Jinhao Fan (2):
>>  hw/nvme: Implement shadow doorbell buffer support
>>  hw/nvme: Add trace events for shadow doorbell buffer
>>=20
>> hw/nvme/ctrl.c       | 118 =
++++++++++++++++++++++++++++++++++++++++++-
>> hw/nvme/nvme.h       |   8 +++
>> hw/nvme/trace-events |   5 ++
>> include/block/nvme.h |   2 +
>> 4 files changed, 132 insertions(+), 1 deletion(-)
>>=20
>> --=20
>> 2.25.1
>>=20
>=20
> LGTM,
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>=20

Great!

I have two questions:

How many =E2=80=9CReviewed-by=E2=80=9D=E2=80=99s do I need to get my =
patch applied?

Do I need to post a v4 patch to add the =E2=80=9CReviewed-by=E2=80=9D=E2=80=
=99s in my commit=20
message?

Thanks,
Jinhao Fan


