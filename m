Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18D58D03E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:40:06 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBPp-0006tO-Da
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ly@xryan.net>) id 1oLBKG-0000mU-18
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:34:20 -0400
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
 ([173.201.192.103]:42090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ly@xryan.net>) id 1oLBKE-0001EN-6N
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:34:19 -0400
Received: from [192.168.2.110] ([107.142.220.210]) by :SMTPAUTH: with ESMTPSA
 id LBK7opZUvBOETLBK7oobum; Mon, 08 Aug 2022 15:34:11 -0700
X-CMAE-Analysis: v=2.4 cv=C98sdSD+ c=1 sm=1 tr=0 ts=62f18f63
 a=PWyw4K0K+Bg32SwyYQrI8A==:117 a=PWyw4K0K+Bg32SwyYQrI8A==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=euVAq6GfPUX-5EkfIswA:9 a=QEXdDO2ut3YA:10
 a=20KFwNOVAAAA:8 a=Pldcp7o8um4Ow70791gA:9 a=UEAPylMccqjpRAL0:21
 a=_W_S_7VecoQA:10
X-SECURESERVER-ACCT: ly@xryan.net
Content-Type: multipart/alternative;
 boundary="------------Um1QinVLOFh9srzcs97Bi527"
Message-ID: <00b60f59-a793-0d74-ec70-114da18455d7@xryan.net>
Date: Mon, 8 Aug 2022 18:34:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <50e25c56-5624-fe2d-1327-665fc7b9bf05@xryan.net>
 <YukaB8WarCdMFMmU@redhat.com>
From: Liang Yan <ly@xryan.net>
Subject: Re: Deadlock between bdrv_drain_all_begin and prepare_mmio_access
In-Reply-To: <YukaB8WarCdMFMmU@redhat.com>
X-CMAE-Envelope: MS4xfHIIEw/I9dbxSHX2Ss8Q1/8x3yUMb6Bcr2VSi+nowB+pZyIYVtHGebgTyunh8N28zaxadTGWoBjTuFwppUqnIam2l1oHieT6lhOaKHcnc845BnkAV8dl
 ZkA2fuCGYu9hzLrBTZqgnqTvE7Umog4+MucZcreuCnmsDzvje0v8zZDUDCa6IK0AeQ44uQz0YVZ9LHBrQ7Xj3UEcQPM55fWldhgozowqC+bVe0avcAau7wDt
 NPKx0Xvx3Q9wSuGw/3lQYg==
Received-SPF: pass client-ip=173.201.192.103; envelope-from=ly@xryan.net;
 helo=p3plsmtpa06-02.prod.phx3.secureserver.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This is a multi-part message in MIME format.
--------------Um1QinVLOFh9srzcs97Bi527
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/2/22 08:35, Kevin Wolf wrote:
> Am 24.07.2022 um 23:41 hat Liang Yan geschrieben:
>> Hello All,
>>
>> I am facing a lock situation between main-loop thread 1 and vcpu thread 4
>> when doing a qmp snapshot. QEMU is running on 6.0.x, checked the upstream
>> code and did not see any big change since between. Guest is a Windows 10 VM.
>> Unfortunately, I could not get into the windows vm or reproduce the issue by
>> myself. No iothread is used here, native aio only.
>>
>>  From the code,
>>
>> -> AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
>>
>> --> aio_poll(qemu_get_aio_context(), true);
>>
>> Mainloop mutex is locked when start snapshot in thread 1, vcpu released
>> thread lock when address_space_rw and try to get thread lock again in
>> prepare_mmio_access.
>>
>> It seems main loop thread is stuck at aio_poll with blocking, but I can not
>> figure out what the addr=4275044592 belongs to from mmio read.
>>
>> I do not quite understand what really happens here, either block jobs never
>> drained out or maybe a block io read from vcpu and cause a deadlock? I hope
>> domain experts here could help figure out the root cause, thanks in advance
>> and let me know if need any further information.
> This does not look like a deadlock to me: Thread 4 is indeed waiting for
> thread 1 to release the lock, but I don't think thread 1 is waiting in
> any way for thread 4.
>
> In thread 1, bdrv_drain_all_begin() waits for all in-flight I/O requests
> to complete. So it looks a bit like some I/O request got stuck. If you
> want to debug this a bit further, try to check what it is that makes
> bdrv_drain_poll() still return true.

Thanks for the reply.

I agree it is not a pure deadlock. thread 1 seems have more 
responsibility here.

Do you know if there is a way to check in-flight I/O requests here? Is 
it possible that the i/o request is the mmio_read from thread 4?

I could only see the addr=4275044592, but could not identify which 
address space it is belonged.


I am also pretty curious why bdrv_drain_poll() always return true.  Any 
chance that it is blocked in aio_poll(qemu_get_aio_context(), true)?

while((cond)) { \
if(ctx_) { \
aio_context_release(ctx_); \
} \
aio_poll(qemu_get_aio_context(), true);


As mentioned, I only have a dump file, could not reproduce it in my 
local environment.

Though, I have been working on a log patch to print all fd/aio-handlers 
that main-loop is dispatched.


> Please also add the QEMU command line you're using, especially the
> configuration of the block device backends (for example, does this use
> Linux AIO, the thread pool or io_uring?).

it uses native linux aio, and no extra io-thread is assigned here.

-blockdev 
{"driver":"file","filename":"****.raw","aio":"native","node-name":"libvirt-2-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}

-device 
virtio-blk-pci,bus=pci.0,addr=0x6,drive=libvirt-2-format,id=virtio-disk0,bootindex=1,write-cache=on


Let me now if you need more information and thanks for looking into this 
issue.

~Liang

> Kevin
>
>
--------------Um1QinVLOFh9srzcs97Bi527
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/2/22 08:35, Kevin Wolf wrote:<br>=

    </div>
    <blockquote type=3D"cite" cite=3D"mid:YukaB8WarCdMFMmU@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Am 24.07.2022 um 23:41 hat L=
iang Yan geschrieben:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hello All,

I am facing a lock situation between main-loop thread 1 and vcpu thread 4=

when doing a qmp snapshot. QEMU is running on 6.0.x, checked the upstream=

code and did not see any big change since between. Guest is a Windows 10 =
VM.
Unfortunately, I could not get into the windows vm or reproduce the issue=
 by
myself. No iothread is used here, native aio only.

=46rom the code,

-&gt; AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());

--&gt; aio_poll(qemu_get_aio_context(), true);

Mainloop mutex is locked when start snapshot in thread 1, vcpu released
thread lock when address_space_rw and try to get thread lock again in
prepare_mmio_access.

It seems main loop thread is stuck at aio_poll with blocking, but I can n=
ot
figure out what the addr=3D4275044592 belongs to from mmio read.

I do not quite understand what really happens here, either block jobs nev=
er
drained out or maybe a block io read from vcpu and cause a deadlock? I ho=
pe
domain experts here could help figure out the root cause, thanks in advan=
ce
and let me know if need any further information.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This does not look like a deadlock to me: Thread 4 is indeed waiting for
thread 1 to release the lock, but I don't think thread 1 is waiting in
any way for thread 4.

In thread 1, bdrv_drain_all_begin() waits for all in-flight I/O requests
to complete. So it looks a bit like some I/O request got stuck. If you
want to debug this a bit further, try to check what it is that makes
bdrv_drain_poll() still return true.
</pre>
    </blockquote>
    <p>Thanks for the reply. <br>
    </p>
    <p>I agree it is not a pure deadlock. thread 1 seems have more
      responsibility here. <br>
    </p>
    <p>Do you know if there is a way to check in-flight I/O requests
      here? Is it possible that the i/o request is the mmio_read from
      thread 4?</p>
    <p>I could only see the addr=3D4275044592, but could not identify
      which address space it is belonged.</p>
    <p><br>
    </p>
    <p> I am also pretty curious why bdrv_drain_poll() always return
      true.=C2=A0 Any chance that it is blocked in aio_poll<span
        style=3D"color: #569cd6;">(</span><span style=3D"color: #dcdcaa;"=
>qemu_get_aio_context</span><span
        style=3D"color: #569cd6;">(), true)</span>? <br>
    </p>
    <div style=3D"color: #d4d4d4;background-color: #1e1e1e;font-family: '=
Droid Sans Mono', 'monospace', monospace;font-weight: normal;font-size: 1=
4px;line-height: 19px;white-space: pre;"><div><span style=3D"color: #569c=
d6;">        </span><span style=3D"color: #c586c0;">while</span><span sty=
le=3D"color: #569cd6;"> ((cond)) {                                       =
    </span><span style=3D"color: #d7ba7d;">\</span></div><div><span style=
=3D"color: #569cd6;">            </span><span style=3D"color: #c586c0;">i=
f</span><span style=3D"color: #569cd6;"> (ctx_) {                        =
                    </span><span style=3D"color: #d7ba7d;">\</span></div>=
<div><span style=3D"color: #569cd6;">                </span><span style=3D=
"color: #dcdcaa;">aio_context_release</span><span style=3D"color: #569cd6=
;">(ctx_);                         </span><span style=3D"color: #d7ba7d;"=
>\</span></div><div><span style=3D"color: #569cd6;">            }        =
                                              </span><span style=3D"color=
: #d7ba7d;">\</span></div><div><span style=3D"color: #569cd6;">          =
  </span><span style=3D"color: #dcdcaa;">aio_poll</span><span style=3D"co=
lor: #569cd6;">(</span><span style=3D"color: #dcdcaa;">qemu_get_aio_conte=
xt</span><span style=3D"color: #569cd6;">(), true);  </span></div></div>
    <p><br>
    </p>
    <p>As mentioned, I only have a dump file, could not reproduce it in
      my local environment.=C2=A0 <br>
    </p>
    <p>Though, I have been working on a log patch to print all
      fd/aio-handlers that main-loop is dispatched.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:YukaB8WarCdMFMmU@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Please also add the QEMU command line you're using, especially the
configuration of the block device backends (for example, does this use
Linux AIO, the thread pool or io_uring?).
</pre>
    </blockquote>
    <p>it uses native linux aio, and no extra io-thread is assigned
      here.<br>
    </p>
    <p>-blockdev
{"driver":"file","filename":"****.raw","aio":"native","node-name":"libvir=
t-2-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":tr=
ue,"discard":"unmap"}<br>
    </p>
    <p>-device
virtio-blk-pci,bus=3Dpci.0,addr=3D0x6,drive=3Dlibvirt-2-format,id=3Dvirti=
o-disk0,bootindex=3D1,write-cache=3Don</p>
    <p><br>
    </p>
    <p>Let me now if you need more information and thanks for looking
      into this issue.<br>
    </p>
    <p>~Liang<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:YukaB8WarCdMFMmU@redhat.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Kevin


</pre>
    </blockquote>
  </body>
</html>

--------------Um1QinVLOFh9srzcs97Bi527--

