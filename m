Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B029D5FFE6D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 11:28:41 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojzwm-0005qH-8a
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 05:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ojzuW-0002GH-0x
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 05:26:20 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:47238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ojzuS-000618-Kf
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 05:26:19 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id CEEC160E17;
 Sun, 16 Oct 2022 12:25:51 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b641::1:2d] (unknown
 [2a02:6b8:b081:b641::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WZ7GVggHOd-PnOmD6Nl; Sun, 16 Oct 2022 12:25:50 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665912350; bh=PsyH9QvLGh5/ga83Ks7QeyC8NeSSc9hCSWK25rgHrx4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1zAxupGH4JN0VB9DwkmyNv3uPTaud+/YUOi4+Mkmc+G69qrOhRU+cBs4Z2GCnBiJW
 ErKPh/+2qdzbbzON9m553GFUYass+qBPDhxCm/jGZOoBaIsMsTCkmv/uVJD/E2xV3G
 XNV5o/GGtZwfgyKvvVGZTo8dzadTtfDpzinaBDS0=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a2ff7f2d-1655-19fa-8cad-baf9fe65a4fe@yandex-team.ru>
Date: Sun, 16 Oct 2022 12:25:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com,
 vsementsov@yandex-team.ru, marcandre.lureau@gmail.com
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org> <Y0gxfqMXi3gLH/3H@redhat.com>
 <8735bqu4ym.fsf@pond.sub.org> <Y0lIfTS4/5UMItkk@redhat.com>
 <87zgdypnq5.fsf@pond.sub.org> <Y0lhzBo8fx1ptEfn@redhat.com>
Content-Language: en-US
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
In-Reply-To: <Y0lhzBo8fx1ptEfn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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


On 14.10.2022 16:19, Daniel P. Berrangé wrote:
> On Fri, Oct 14, 2022 at 02:57:06PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Fri, Oct 14, 2022 at 11:31:13AM +0200, Markus Armbruster wrote:
>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>
>>>>> On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
>>>>>> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
>>>>>>
>>>>>>> Add "start" & "end" time values to qmp command responses.
>>>>>> Please spell it QMP.  More of the same below.
>>>>>>
>>>>>>> These time values are added to let the qemu management layer get the exact
>>>>>>> command execution time without any other time variance which might be brought by
>>>>>>> other parts of management layer or qemu internals. This is particulary useful
>>>>>>> for the management layer logging for later problems resolving.
>>>>>> I'm still having difficulties seeing the value add over existing
>>>>>> tracepoints and logging.
>>>>>>
>>>>>> Can you tell me about a problem you cracked (or could have cracked) with
>>>>>> the help of this?
>>>>> Consider your QMP client is logging all commands and replies in its
>>>>> own logfile (libvirt can do this). Having this start/end timestamps
>>>>> included means the QMP client log is self contained.
>>>> A QMP client can include client-side timestamps in its log.  What value
>>>> is being added by server-side timestamps?  According to the commit
>>>> message, it's for getting "the exact command execution time without any
>>>> other time variance which might be brought by other parts of management
>>>> layer or qemu internals."  Why is that useful?  In particular, why is
>>>> excluding network and QEMU queueing delays (inbound and outbound)
>>>> useful?
>>> Lets, say some commands normally runs in ~100ms, but occasionally
>>> runs in 2secs, and you want to understand why.
>>>
>>> A first step is understanding whether a given command itself is
>>> slow at executing, or whether its execution has merely been
>>> delayed because some other aspect of QEMU has delayed its execution.
>>> If the server timestamps show it was very fast, then that indicates
>>> delayed processing. Thus instead of debugging the slow command, I
>>> can think about what scenarios would be responsible for the delay.
>>> Perhaps a previous QMP command was very slow, or maybe there is
>>> simply a large volume of QMP commands backlogged, or some part of
>>> QEMU got blocked.
>>>
>>> Another case would be a command that is normally fast, and sometimes
>>> is slower, but still relatively fast. The network and queueing side
>>> might be a significant enough proportion of the total time to obscure
>>> the slowdown. If you can eliminate the non-execution time, you can
>>> see the performance trends over time to spot the subtle slowdowns
>>> and detect abnormal behaviour before it becomes too terrible.
>> This is troubleshooting.  Asking for better troubleshooting tools is
>> fair.
>>
>> However, the proposed timestamps provide much more limited insight than
>> existing tracepoints.  For instance, enabling
> tracepoints are absolutely great and let you get a hell of alot
> more information, *provided* you are in a position to actually
> use tracepoints. This is, unfortunately, frequently not the case
> when supporting real world production deployments.
Exactly!!! Thanks for the pointing out!
>
> Bug reports from customers typically include little more than a
> log file they got from the mgmt client at time the problem happened.
> The problem experianced may no longer exist, so asking them to run
> a tracepoint script is not possible. They may also be reluctant to
> actually run tracepoint scripts on a production system, or simply
> lack the ability todo so at all, due to constraints of the deployment
> environment. Logs from libvirt are something that are collected by
> default for many mgmt apps, or can be turned on by the user with
> minimal risk of disruption.
>
> Overall, there's a compelling desire to be proactive in collecting
> information ahead of time, that might be useful in diagnosing
> future bug reports.

This is the main reason. When you encounter a problem one of the first 
questions is "Was there something similar in the past. Another question 
is how often does it happen.

With the timestamps these questions answering becomes easier.

Another thing is that with the qmp command timestamps you can build a 
monitoring system which will report about the cases when 
execution_time_from_mgmt_perspective - excution_time_qmp_command > 
some_threshold which in turn proactively tell you about the potential 
problems. And then you'll start using the qmp tracepoints (and other 
means) to figure out the real reason of the execution time variance.

Thanks, Denis

>
> So it isn't an 'either / or' decision of QMP reply logs vs use of
> tracepoints, both are beneficial, with their own pros/cons.
>
> With regards,
> Daniel

