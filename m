Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2838FB4B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 08:55:42 +0200 (CEST)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llQyb-0006hp-6h
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 02:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1llQwi-0004iC-9n
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:53:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1llQwf-0004U2-6e
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:53:44 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq4Sx2KP7zQrM0;
 Tue, 25 May 2021 14:49:53 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:53:29 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:53:28 +0800
Subject: Re: A bug of Monitor Chardev ?
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com>
 <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <6b0a3f5a-f289-6eed-9a11-a378eeb45e32@huawei.com>
Date: Tue, 25 May 2021 14:53:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=longpeng2@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenjiashang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

在 2021/5/22 0:59, Marc-André Lureau 写道:
> Hi
> 
> On Fri, May 21, 2021 at 8:56 PM Daniel P. Berrangé <berrange@redhat.com
> <mailto:berrange@redhat.com>> wrote:
> 
>     On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrangé wrote:
>     > On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:
>     > >
>     > > I think the original problem was that if qemu_chr_fe_set_handlers() is
>     called
>     > > in main thread, it can start to race somehow within execution of the
>     function
>     > > qemu_chr_fe_set_handlers() right after we switch context at:
>     > >
>     > >     qemu_chr_be_update_read_handlers(s, context);
>     > >
>     > > Then the rest code in qemu_chr_fe_set_handlers() will continue to run in
>     main
>     > > thread for sure, but the should be running with the new iothread
>     context, which
>     > > introduce a race condition.
>     > >
>     > > Running qemu_chr_be_update_read_handlers() in BH resolves that because
>     then all
>     > > things run in the monitor iothread only and natually serialized.
>     >
>     > The first message in this thread, however, claims that it is *not*
>     > in fact serialized, when using the BH.
>     >
>     > > So the new comment looks indeed not fully right, as the chr device should be
>     > > indeed within main thread context before qemu_chr_fe_set_handlers(),
>     it's just
>     > > that the race may start right away if without BH when context switch happens
>     > > for the chr.
>     >
>     > It sounds like both the comment and the code are potentially wrong.
> 
> 
>     I feel like our root cause problem that the original code was trying to
>     workaround, is that the chardev is "active" from the very moment it is
>     created, regardless of whether the frontend is ready to use it.
> 
>     IIUC, in this case the socket chardev is already listen()ing and
>     accept()ing incoming clients off the network, before the monitor
>     has finished configuring its hooks into the chardev. This means
>     that the initial listen()/accept() I/O watches are using the
>     default GMainContext, and the monitor *has* to remove them and
>     put in new watches on the thread private GMainContext.
> 
>     To eliminate any risk of races, we need to make it possible for the
>     monitor to configure the GMainContext on the chardevs *before* any
>     I/O watches are configured.
> 
>     This in turn suggests that we need to split the chardev initialization
>     into two phases. First we have the basic chardev creation, with object
>     creation, option parsing/sanity checking, socket creation, and then
>     second we have the actual activation where the I/O watches are added.
> 
>     IOW,  qemu_chr_new() is the former and gets run from generic code in
>     the main() method, or in QMP chardev_add.  A new 'qemu_chr_activate'
>     method would be called by whatever frontend is using the chardev,
>     after registering a custom GMainContext.
> 
>     This would involve updating every single existing user of chardevs
>     to add a call to qemu_chr_activate, but that's worth it to eliminate
>     the race by design, rather than workaround it.
> 
> 
> 
> What about my earlier suggestion to add a new "qemu_chr_be_disable_handlers()"
> (until update_read_handlers is called again to enable them and the set a
> different context)?
> 

In this case, the BH calls the update_read_handlers, so the new added
"qemu_chr_be_disable_handlers" will be called in the monitor iothread BH ? If
so, I'm not sure whether it is safe enough, because the Chardev may still be
accessed in parallel by main loop and iothread for a while.

How about call "qemu_chr_be_disable_handlers" before set the
monitor_qmp_setup_handlers_bh ?

I think Daniel's soluation is perfect, but it's beyond my ability, I'm not
expert in Chardev/QMP, it's difficult to guarantee no other bugs will be
introduced, so we prefer to take the simplest and safest way to fix the bug in
our production.

> 
> -- 
> Marc-André Lureau

