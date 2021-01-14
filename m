Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D82F687E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:59:51 +0100 (CET)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06uU-0002yO-4Q
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l06jH-0002FJ-Mw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l06jF-0006cT-BK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5rTSsfnSwXPVvu3FLT/JH0eOTxHGYmoMr3OodSAS3c=;
 b=RHiiBcVv1mo+QYKJkf50vNExnI776gBweqBEjlePs8Gj0ZJHOud3IeMM0pkdcZY3GXprkH
 KVgX6i7rvxvHJ/ghSjhhxgp22hHfL7mONNpR7XCpUyOHqFr4KkSCVuZpEn0no7JYpLOMzJ
 ARnsXjNfQGbv53S2+804gccZU004Kj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-GtCUKa2cPUqTygX2Ybhcdg-1; Thu, 14 Jan 2021 12:48:11 -0500
X-MC-Unique: GtCUKa2cPUqTygX2Ybhcdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D4184A5E7;
 Thu, 14 Jan 2021 17:48:10 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3822C01E;
 Thu, 14 Jan 2021 17:48:03 +0000 (UTC)
Subject: Re: qmp-shell TUI (was: Re: Call for Google Summer of Code 2021
 project ideas)
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
 <e8938b53-a933-426c-0719-981ab0df123f@redhat.com>
 <20210114135234.GC292902@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <e82f00bc-336d-a260-a43a-50eac34ee59a@redhat.com>
Date: Thu, 14 Jan 2021 12:48:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114135234.GC292902@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 8:52 AM, Stefan Hajnoczi wrote:
> On Wed, Jan 13, 2021 at 01:59:43PM -0500, John Snow wrote:
>> On 1/13/21 3:53 AM, Stefan Hajnoczi wrote:
>>> On Tue, Jan 12, 2021 at 9:10 PM John Snow <jsnow@redhat.com> wrote:
>>> 2. Ability to watch QMP activity on a running QEMU process, e.g. even
>>> when libvirt is directly connected to the monitor.
>>>
>>
>> That *WOULD* be extremely cool, and moves a lot closer to how mitmproxy
>> works.
>>
>> (Actually, mitmproxy could theoretically be taught how to read and
>> understand QMP traffic, but that's not something I know how to do or would
>> be prepared to mentor.)
>>
>> Is this possible to do in a post-hoc fashion? Let's say you are using
>> production environment QEMU, how do we attach the QMP listener to it? Or
>> does this idea require that we start QEMU in a specific fashion with a
>> second debug socket that qmp-shell can connect to in order to listen?
>>
>> ... Or do we engineer qmp-shell to open its own socket that libvirt connects
>> to ...?
> 
> Here is the QEMU command-line that libvirt uses on my F33 system:
> 
>    -chardev socket,id=charmonitor,fd=36,server,nowait
>    -mon chardev=charmonitor,id=monitor,mode=control
> 
> Goals for this feature:
> 
> 1. No manual steps required for setup.
> 2. Ability to start/stop monitoring traffic at runtime without
>     restarting QEMU.
> 3. Available to unprivileged users.
> 

Excellent goals, and I agree completely.

> I think the easiest way to achieve this is through a new QEMU monitor
> command. Approaches that come to mind:
> 
> 1. Add a -mon debug-chardev property and a QMP command to set it at
>     runtime. The debug-chardev receives both monitor input (commands) and
>     output (responses and events). This does not allow MITM, rather it
>     mirrors traffic.
> 

So you have a socket that relays I/O. I wonder if it needs to modify the 
stream format to some extent to annotate directionality?

For now, directionality can be inferred, but maybe that's brittle.
(greeting messages, events and return statements are from the server; 
negotiation and execute statements are from the client.)

Maybe if we used a hypothetical qmp-shell log format, we could add 
timestamps here instead of relying on the client to produce them. This 
might be interesting for analyzing race conditions and measuring 
response delays as experienced by the server.

{"message": original_json_message_here, "direction": "in", "timestamp": 
1610627721}

(Downside: JSON is still not a streaming message format, but I guess 
it's one we already use all over the place anyway.)

> 2. Add a chardev-get-fd command that fetches the fd from a chardev and
>     then use the existing chardev-change command to replace the monitor
>     chardev with a chardev connected to qmp-shell. This inserts qmp-shell
>     as a proxy between the QMP client and server. qmp-shell can remove
>     itself again with another chardev-change command. This approach
>     allows MITM. The downside is it assumes the QMP chardev is a file
>     descriptor, so it won't work with all types of chardev.
> 

It seems a little more prone to failure if the insertion/removal fails, 
and has some downsides about which configurations it can inject into.

> 3. Add a new chardev-proxy type that aggregates 3 chardevs: 1. an origin
>     source chardev, 2. a monitoring sink chardev, and 3. a monitoring
>     source chardev. The data flow is origin <-> monitoring sink <->
>     monitoring source <-> QMP monitor. qmp-shell creates the monitoring
>     sink (for receiving incoming QMP commands) and monitoring source
>     chardev (for forwarding QMP commands or MITM commands), and then it
>     uses change-chardev to instantiate a chardev-proxy that directs the
>     original libvirt chardev through the monitoring sink and source.
> 

I'm not sure I understand the topology here, exactly. I could stand to 
be a little more familiar with how chardevs are modeled in QEMU ...

>     This is the most complex but also completely contained within the
>     QEMU chardev layer.
> 
> In all these approaches qmp-shell uses virsh qemu-monitor-command or an
> equivalent API to start/stop monitoring a running VM without manual
> setup steps.
> 

Gotcha. I think I am leaning towards the first suggestion, but maybe the 
third one that I don't quite grasp yet is good too.

> Stefan
> 


