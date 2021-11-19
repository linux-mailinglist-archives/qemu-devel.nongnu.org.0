Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7869456C8A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:43:54 +0100 (CET)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Qz-00023k-GR
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mo0PN-0000s6-HL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:42:13 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:32796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mo0PJ-0001tS-1v
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:42:11 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id F420C2E0AFF;
 Fri, 19 Nov 2021 12:42:02 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 E2gZnejqVp-g2sOwaER; Fri, 19 Nov 2021 12:42:02 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637314922; bh=AZsyY6Iw6UarF2jkx5TjKXxwmCMw4bx/NaSglLiZEqE=;
 h=In-Reply-To:Date:References:To:From:Subject:Message-ID:Cc;
 b=KSlIg5YZt62Y4Vg+zLE/aKx2vLHL2Ce+EmXfApVLoe2/EvvDrJG2w8vH9aEkZoCtz
 fwdYrmzr5YjICjR7Ubv2OxQT/ZDFkUIfucd+3Nrtep2B07OrjNIqfDKRMJi63UxNEV
 WdGv001//vp5PcNhIs/YnCGaSfFJXPwWWTGBUzL8=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:8014::1:2e] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8014::1:2e])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 GXUJmGbLyS-g2wiC040; Fri, 19 Nov 2021 12:42:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: [Ping] [PATCH v1 0/2] vl: flush all task from rcu queue before exiting
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
Message-ID: <6d2b4b4f-707f-9d5b-7ffe-c6d8d05ffb06@yandex-team.ru>
Date: Fri, 19 Nov 2021 12:42:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------89151EB8E9969BE07B98CC15"
Content-Language: en-US
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
--------------89151EB8E9969BE07B98CC15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping!

On 15.11.2021 12:41, Denis Plotnikov wrote:
> v1 -> v0:
>   * move monitor cleanup to the very end of qemu cleanup [Paolo]
>
> The goal is to notify management layer about device destruction on qemu shutdown.
> Without this series DEVICE_DELETED event may not be sent because of stuck tasks
> in the rcu thread. The rcu tasks may stuck on qemu shutdown because the rcu
> not always have enough time to run them.
>
>
> Denis Plotnikov (2):
>    monitor: move monitor destruction to the very end of qemu cleanup
>    vl: flush all task from rcu queue before exiting
>
>   include/qemu/rcu.h |  1 +
>   monitor/monitor.c  |  6 ++++++
>   softmmu/runstate.c |  4 +++-
>   util/rcu.c         | 12 ++++++++++++
>   4 files changed, 22 insertions(+), 1 deletion(-)
>

--------------89151EB8E9969BE07B98CC15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
  </body>
</html>

--------------89151EB8E9969BE07B98CC15--

