Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CA3A0839
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 02:22:06 +0200 (CEST)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlyu-0007yD-V8
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 20:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1lqlyA-0007G3-Ox
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:21:18 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1lqly7-0007xX-MX
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:21:18 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G071d6zSXzWtHH;
 Wed,  9 Jun 2021 08:16:05 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 08:20:57 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 08:20:56 +0800
Subject: Re: A bug of Monitor Chardev ?
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <87o8cgxxel.fsf@dusky.pond.sub.org> <YL+Op6F7wFoVYum2@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <6528dfe1-7cc7-c530-a56f-06517a627cda@huawei.com>
Date: Wed, 9 Jun 2021 08:20:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YL+Op6F7wFoVYum2@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: chenjiashang@huawei.com, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/8 23:37, Daniel P. Berrangé 写道:
> On Tue, Jun 08, 2021 at 04:07:30PM +0200, Markus Armbruster wrote:
>> "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
>> <longpeng2@huawei.com> writes:
>>
>>> We find a race during QEMU starting, which would case the QEMU process coredump.
>>>
>>> <main loop>                             |    <MON iothread>
>>>                                         |
>>> [1] create MON chardev                  |
>>> qemu_create_early_backends              |
>>>   chardev_init_func                     |
>>>                                         |
>>> [2] create MON iothread                 |
>>> qemu_create_late_backends               |
>>>   mon_init_func                         |
>>> 	aio_bh_schedule-----------------------> monitor_qmp_setup_handlers_bh
>>> [3] enter main loog                     |    tcp_chr_update_read_handler
>>> (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
>>> tcp_chr_new_client                      |
>>>   update_ioc_handlers                   |
>>>                                         |
>>>     [4] create new hup_source           |
>>>         s->hup_source = *PTR1*          |
>>>           g_source_attach(s->hup_source)|
>>>                                         |        [5] remove_hup_source(*PTR1*)
>>>                                         |            (create new hup_source)
>>>                                         |             s->hup_source = *PTR2*
>>>         [6] g_source_attach_unlocked    |
>>>               *PTR1* is freed by [5]    |
>>> 			
>>> Do you have any suggestion to fix this bug ? Thanks!
>>
>> Do we?  We talked, but I'm not sure we reached a conclusion.
> 
> Seems like we ended up with two options.
> 
>   1. A workaround for the current  specific problem by rearranging
>      the initilization code in the monitor a little.
> 
>   2. A design fix of splitting the chardev creation into two
>      parts, one creation, and one activation.
> 
> The latter is significantly more work, but is a better long term bet IMHO.
> But what we really is someone motivated to actually implement one of the
> two options.
> 

How about the following implementation of option-1 ? We've tested it for several
weeks, it works fine.

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index a484641..ecb3db9 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -722,6 +722,19 @@ static void tcp_chr_update_read_handler(Chardev *chr)
     update_ioc_handlers(s);
 }

+static void tcp_chr_disable_handler(Chardev *chr)
+{
+    SocketChardev *s = SOCKET_CHARDEV(chr);
+
+    if (s->listener && s->state == TCP_CHARDEV_STATE_DISCONNECTED) {
+        qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
+                                              NULL, chr->gcontext);
+    }
+
+    remove_fd_in_watch(chr);
+    remove_hup_source(s);
+}
+
 static bool tcp_chr_is_connected(Chardev *chr)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
@@ -1703,6 +1716,7 @@ static void char_socket_class_init(ObjectClass *oc, void
*data)
     cc->chr_add_watch = tcp_chr_add_watch;
     cc->chr_set_reconnect_time = tcp_chr_set_reconnect_time;
     cc->chr_update_read_handler = tcp_chr_update_read_handler;
+    cc->chr_disable_handler = tcp_chr_disable_handler;
     cc->chr_is_connected = tcp_chr_is_connected;
     cc->chr_get_connect_id = tcp_chr_get_connect_id;

diff --git a/chardev/char.c b/chardev/char.c
index ff0a3cf..990fe4f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -238,6 +238,15 @@ void qemu_chr_be_update_read_handlers(Chardev *s,
     }
 }

+void qemu_chr_be_disable_handlers(Chardev *s)
+{
+    ChardevClass *cc = CHARDEV_GET_CLASS(s);
+
+    if (cc->chr_disable_handler) {
+        cc->chr_disable_handler(s);
+    }
+}
+
 int qemu_chr_add_client(Chardev *s, int fd)
 {
     return CHARDEV_GET_CLASS(s)->chr_add_client ?
diff --git a/include/chardev/char.h b/include/chardev/char.h
index d1ec628..7a8c740 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -212,6 +212,8 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);
 void qemu_chr_be_update_read_handlers(Chardev *s,
                                       GMainContext *context);

+void qemu_chr_be_disable_handlers(Chardev *s);
+
 /**
  * qemu_chr_be_event:
  * @event: the event to send
@@ -282,6 +284,7 @@ typedef struct ChardevClass {
     int (*chr_sync_read)(Chardev *s, const uint8_t *buf, int len);
     GSource *(*chr_add_watch)(Chardev *s, GIOCondition cond);
     void (*chr_update_read_handler)(Chardev *s);
+    void (*chr_disable_handler)(Chardev *s);
     int (*chr_ioctl)(Chardev *s, int cmd, void *arg);
     int (*get_msgfds)(Chardev *s, int* fds, int num);
     int (*set_msgfds)(Chardev *s, int *fds, int num);
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 9a69ae4..2c2248c 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -413,11 +413,13 @@ void monitor_init_qmp(Chardev *chr, bool pretty)
          * e.g. the chardev is in client mode, with wait=on.
          */
         remove_fd_in_watch(chr);
+
         /*
-         * We can't call qemu_chr_fe_set_handlers() directly here
-         * since chardev might be running in the monitor I/O
-         * thread.  Schedule a bottom half.
+         * Before schedule a bottom half, we should clean up the handler in the
+         * default context to prevent the race between main thread and iothread
          */
+        qemu_chr_be_disable_handlers(chr);
+
         aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
                                 monitor_qmp_setup_handlers_bh, mon);
         /* The bottom half will add @mon to @mon_list */
-- 
1.8.3.1


> Regards,
> Daniel
> 

