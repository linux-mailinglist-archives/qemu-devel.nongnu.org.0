Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C364545D534
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:11:54 +0100 (CET)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq8vA-0007yb-IH
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mq8sy-0006xO-AR
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:09:36 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:53494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mq8su-0001AA-2P
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:09:34 -0500
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 3BC112E0D82;
 Thu, 25 Nov 2021 10:09:25 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 fgQ5plfsOQ-9MsiRKhb; Thu, 25 Nov 2021 10:09:25 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637824165; bh=HrIbQHrvgYOLL8b8xiEj8fWjdgG+9WlEvL8y+803dJ0=;
 h=In-Reply-To:Date:References:To:From:Subject:Message-ID:Cc;
 b=OoTyUmmTKFha4AsTzixQdc5+au0D/g7pIW+hjiWr7RcxNyfF20LQKyGHDpyTol+La
 3fKTyUVUWDFl8i0zwcEWp6UnLq7SZ2eivShP/5tqIogYYuRlBNb15bNxCrVBrNBTRU
 oYejeZUlXaHn4lo8npq65AHsvcliNYgAag19Fp8o=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:8015::1:29] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8015::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7fJFcJLt7y-9Mw8wR03; Thu, 25 Nov 2021 10:09:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: [PING][Ping] [PATCH v1 0/2] vl: flush all task from rcu queue before
 exiting
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
 <6d2b4b4f-707f-9d5b-7ffe-c6d8d05ffb06@yandex-team.ru>
Message-ID: <9c80d44e-3d51-7209-d037-e96deb4ca2bc@yandex-team.ru>
Date: Thu, 25 Nov 2021 10:09:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6d2b4b4f-707f-9d5b-7ffe-c6d8d05ffb06@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------39283D931D4A7AF6F5D6AC0B"
Content-Language: en-US
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------39283D931D4A7AF6F5D6AC0B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping ping

On 19.11.2021 12:42, Denis Plotnikov wrote:
>
> Ping!
>
> On 15.11.2021 12:41, Denis Plotnikov wrote:
>> v1 -> v0:
>>   * move monitor cleanup to the very end of qemu cleanup [Paolo]
>>
>> The goal is to notify management layer about device destruction on qemu shutdown.
>> Without this series DEVICE_DELETED event may not be sent because of stuck tasks
>> in the rcu thread. The rcu tasks may stuck on qemu shutdown because the rcu
>> not always have enough time to run them.
>>
>>
>> Denis Plotnikov (2):
>>    monitor: move monitor destruction to the very end of qemu cleanup
>>    vl: flush all task from rcu queue before exiting
>>
>>   include/qemu/rcu.h |  1 +
>>   monitor/monitor.c  |  6 ++++++
>>   softmmu/runstate.c |  4 +++-
>>   util/rcu.c         | 12 ++++++++++++
>>   4 files changed, 22 insertions(+), 1 deletion(-)
>>

--------------39283D931D4A7AF6F5D6AC0B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="+1"><font face="monospace">ping ping</font></font><br>
    </p>
    <div class="moz-cite-prefix">On 19.11.2021 12:42, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6d2b4b4f-707f-9d5b-7ffe-c6d8d05ffb06@yandex-team.ru">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><font size="+1"><font face="monospace">Ping!</font></font><br>
      </p>
      <div class="moz-cite-prefix">On 15.11.2021 12:41, Denis Plotnikov
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20211115094143.157399-1-den-plotnikov@yandex-team.ru">
        <pre class="moz-quote-pre" wrap="">v1 -&gt; v0:
 * move monitor cleanup to the very end of qemu cleanup [Paolo]

The goal is to notify management layer about device destruction on qemu shutdown.
Without this series DEVICE_DELETED event may not be sent because of stuck tasks
in the rcu thread. The rcu tasks may stuck on qemu shutdown because the rcu
not always have enough time to run them. 


Denis Plotnikov (2):
  monitor: move monitor destruction to the very end of qemu cleanup
  vl: flush all task from rcu queue before exiting

 include/qemu/rcu.h |  1 +
 monitor/monitor.c  |  6 ++++++
 softmmu/runstate.c |  4 +++-
 util/rcu.c         | 12 ++++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------39283D931D4A7AF6F5D6AC0B--

