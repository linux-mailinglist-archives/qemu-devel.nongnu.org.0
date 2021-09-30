Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D041DCED
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:02:47 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxaA-0004Bn-74
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mVwQe-0004p6-LP
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:48:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mVwQb-0001MN-Q5
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:48:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id m22so4737296wrb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=fJAemPiFH0wQd63/cZyx+CFc1Z44a1AIBcDZUwoMZ5w=;
 b=mixJxZSGP6xU31G51+mrQPU0Sr2G6VWy8BRCyBmHWNcAdK0FZ3t9tQUNgPAuZU2ag0
 7Az/5pzWZb0g6oenQ5zBq8mDNa0wIrQLwNKhw1TnkL2LYYTe7eLLog/4ytB8s9iCA/f+
 1nnTcK30TCIAEZW5Z38U5rVI7wRgL5/o3dbZerX/ORnkstKffopG3XyRO+ysL8qDHyGH
 3CNs2p607u69XWBeyMIbi44c9jr3aF+Sk+xlB2W979ufJfq1aAZLBDuRsevEYd55/fGq
 YO5A0W5XTR72Gi/5MVAQA9pZs1dcomLAPtYcNQUQO1h+vyPtLCNTOpEVt1E6ejuuf5bG
 WCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=fJAemPiFH0wQd63/cZyx+CFc1Z44a1AIBcDZUwoMZ5w=;
 b=lVFVbWBAzDNvD27e3T2vD9pn2xTdday7TvvsOIHIes6jMWZd4/daS57XOxOAv8o6sI
 FxSJ1TWuIS5KJkvHG7uWNXy5aMaBJpKAGE8OztT1zcBKqr5JbVcQVqXsr73tAQAJRLIX
 GzI+CLyaQ3GF5bwOQmzO2bHGoFQt8lEsP7Ct6+FNOwfOBCmG71QxKe5j8DusnAOJ+h+X
 DtXl7EAuN8edKoH7HYON0fD1uC9ujo1EU3wTl55QA9sBJAYmrg/IxLN2p2XUZNlcvHmF
 uVdrlVyyr4iWX8eoLsB4yYhgMh2in+RRwaOHm4jVYw2stgHFKcv+/knPn1LWxHRyhghm
 kguQ==
X-Gm-Message-State: AOAM532mmG1MNZpuxqJVzo5vvjEHjrDD/jwpEbodk/Xr9bk+qi2fFatn
 gAgq22PU4P31zH7jRzwH2Bj4vpg1rjaEvg==
X-Google-Smtp-Source: ABdhPJxtmS918iy9/khwzAX4iJ7yBEela8ZjVHGv4RSDJksqb5WXjQuelbShiJe95ljCJwzPYXJIIw==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr6516544wrt.423.1633009726367; 
 Thu, 30 Sep 2021 06:48:46 -0700 (PDT)
Received: from gmail.com ([2001:41d0:fc88:4700:250:b6ff:fe1f:8e7])
 by smtp.gmail.com with ESMTPSA id q10sm2959193wmq.12.2021.09.30.06.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:48:46 -0700 (PDT)
Date: Thu, 30 Sep 2021 15:48:44 +0200
From: Remy Noel <remy.noel@shadow.tech>
To: qemu-devel@nongnu.org
Subject: Strange qemu6 regression cauing disabled usb controller.
Message-ID: <20210930134844.f4kh72vpeknr2vmk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: permerror client-ip=2a00:1450:4864:20::430;
 envelope-from=remy.noel@shadow.tech; helo=mail-wr1-x430.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FSL_HELO_FAKE=3.096, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Sep 2021 10:58:27 -0400
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm encountering a nagging issue with usbredir and a windows guest, but although I did pinpoint the commit that caused the issue, I have a hard time understanding it.

The issue occurs when a two usbredir devices are added to a guest windows vm. When the second device is added, the UHCI usb controller is disabled by windows with an error code 43 (can be seen with in the usb adapters section of the device manager).

The commit causing the issue (everything works well when reverting it) is 7bed89958bfbf40df9ca681cefbdca63abdde39d : device_core: use drain_call_rcu in in qmp_device_add.

I narrowed the problem to the unlock of the iothread: the minimum drain_call_rcu code that still reproduce the issue is:

void drain_call_rcu(void)
{
     bool locked = qemu_mutex_iothread_locked();
     if (locked) {
         qemu_mutex_unlock_iothread();
     }
     usleep(50000); // time spent draining the rcu on a few slow cases.

     if (locked) {
         qemu_mutex_lock_iothread();
     }
}

The issue can be reproduced from a basic windows home instalation and the following qemu command line:

qemu-system-x86_64 -M pc -cpu host,hv_time,hv_synic,hv_stimer,hv_vpindex -enable-kvm -m 4096 -device piix3-usb-uhci,id=uhci -qmp tcp:127.0.0.1:4444,server=on,wait=off,ipv4 -drive <disk-parameters> -snapshot

Note that the hv parameters are needed to trigger the issue I do not know why.

Two usbredir devices are then added to the vm (qmp client script added at the end of the mail) in order to trigger the issue.

The second device can be added right after or much later than the first and the bug still triggers.

I tried to find what was able to take avantage of the free iothread lock, but the only thing I got so far is that the iothread lock is not taken during the first drain (from the first device add), but is taken many times during the second drain by physmem's IOs (from kvm-accel, but at this point, I'm a bit lost).

I'm looking for pointers as to what could trigger the issue in order to narrow it down, as, so far, I do not understand exactly what causes the regression.
I am unsure of how this would even transcribe in a linux vm so i didn't try to reproduce the issue with one.

Below is the reproduction script (python):

import asyncio
import json
import socket
import sys
import time

char1 = {
     "execute": "chardev-add",
     "arguments": {
         "id": "r-usb0",
         "backend": {
             "type": "socket",
             "data": {
                 "nodelay": True,
                 "addr": {
                     "type": "inet",
                     "data": {
                         "host": "::",
                         "port": "10100"
                     }
                 }
             }
         }
     }
}
dev1 = {
     "execute": "device_add",
     "arguments": {
         "driver": "usb-redir",
         "id": "r-usb0",
         "chardev": "r-usb0",
         "bus": "uhci.0"
     }
}
char2 = {
     "execute": "chardev-add",
     "arguments": {
         "id": "r-usb1",
         "backend": {
             "type": "socket",
             "data": {
                 "nodelay": True,
                 "addr": {
                     "type": "inet",
                     "data": {
                         "host": "::",
                         "port": "10101"
                     }
                 }
             }
         }
     }
}
dev2 = {
     "execute": "device_add",
     "arguments": {
         "driver": "usb-redir",
         "id": "r-usb1",
         "chardev": "r-usb1",
         "bus": "uhci.0"
     }
}


cond = None
ids = {}

async def pull_answers(reader):
     while True:
         data = await reader.read(1024)
         if not data:
             sys.exit(0)
         data = data.decode('ascii')
         while data:
             try:
                 msg, remain = json.JSONDecoder().raw_decode(data)
             except ValueError as vae:
                 break
             if not msg:
                 break
             msg_id = msg.get('id')
             if msg_id:
                 async with cond:
                     ids[msg_id] = msg
                     cond.notify_all()
             else:
                 print("QMP:", msg)
             data = data[remain:]


async def wait_answer(async_msg_id):
     async with cond:
         msg_id = await async_msg_id
         await cond.wait_for(lambda : msg_id in ids)
         return ids[msg_id]


ID = 0

async def send_message(writer, obj):
     global ID
     obj['id'] = ID
     ID += 1
     writer.write(json.dumps(obj).encode())
     await writer.drain()
     return obj['id']


async def main():
     global cond
     cond = asyncio.Condition()
     with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
         sock.connect(('127.0.0.1', 4444))
         reader, writer = await asyncio.open_connection(sock=sock)
         waiter = asyncio.create_task(pull_answers(reader))
         await send_message(writer, {'execute': 'qmp_capabilities'})
         sender = asyncio.create_task(send_message(writer, char1))
         resp = await wait_answer(sender)
         sender = asyncio.create_task(send_message(writer, dev1))
         resp = await wait_answer(sender)
         time.sleep(.01)
         sender = send_message(writer, char2)
         resp = await wait_answer(sender)
         sender = send_message(writer, dev2)
         resp = await wait_answer(sender)
         print("Added. Awaiting disconnect ...")
         await waiter
         return 0


asyncio.run(main())

