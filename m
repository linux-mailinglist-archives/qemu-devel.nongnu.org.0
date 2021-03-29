Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526CF34D19B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 15:46:45 +0200 (CEST)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQsE8-0006h0-6O
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 09:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lQsCa-00060r-1J; Mon, 29 Mar 2021 09:45:08 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:51594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lQsCU-0005TJ-BU; Mon, 29 Mar 2021 09:45:06 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 931AA2E1760;
 Mon, 29 Mar 2021 16:44:55 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 sv25XqjSx6-is0S9ra8; Mon, 29 Mar 2021 16:44:55 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617025495; bh=CQMJ6aF3ZClpf75yuIzz3LeJWPqLHNzhXx8stS239kI=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=QUyQa5mTiPnRYexNHsIX20FM9kW9TQFR+yBXQCrC6qmrCpHOw69VzN19+bGcawJye
 HMDtJrXTt0UY8NoJS37CAO4z3YEkVPSIl+Qr29xoZH7vWIRUXO5pbi1OH5hKgOdvp2
 xPru6rYbIWoERMStYfc0s1cc/hc2Gc6qPPkFjT4I=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8824::1:c])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Tc2V3wblvd-ispetLFu; Mon, 29 Mar 2021 16:44:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v3 0/3] vhost-user-blk: fix bug on device disconnection
 during initialization
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
Message-ID: <a1ab7e04-86cd-7004-9687-c00382dc2e14@yandex-team.ru>
Date: Mon, 29 Mar 2021 16:44:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------9107A538A33C6514228E9481"
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9107A538A33C6514228E9481
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping!

On 25.03.2021 18:12, Denis Plotnikov wrote:
> v3:
>    * 0003: a new patch added fixing the problem on vm shutdown
>      I stumbled on this bug after v2 sending.
>    * 0001: gramma fixing (Raphael)
>    * 0002: commit message fixing (Raphael)
>
> v2:
>    * split the initial patch into two (Raphael)
>    * rename init to realized (Raphael)
>    * remove unrelated comment (Raphael)
>
> When the vhost-user-blk device lose the connection to the daemon during
> the initialization phase it kills qemu because of the assert in the code.
> The series fixes the bug.
>
> 0001 is preparation for the fix
> 0002 fixes the bug, patch description has the full motivation for the series
> 0003 (added in v3) fix bug on vm shutdown
>
> Denis Plotnikov (3):
>    vhost-user-blk: use different event handlers on initialization
>    vhost-user-blk: perform immediate cleanup if disconnect on
>      initialization
>    vhost-user-blk: add immediate cleanup on shutdown
>
>   hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
>   1 file changed, 48 insertions(+), 31 deletions(-)
>

--------------9107A538A33C6514228E9481
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="+1"><tt>ping!</tt></font><br>
    </p>
    <div class="moz-cite-prefix">On 25.03.2021 18:12, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210325151217.262793-1-den-plotnikov@yandex-team.ru">
      <pre class="moz-quote-pre" wrap="">v3:
  * 0003: a new patch added fixing the problem on vm shutdown
    I stumbled on this bug after v2 sending.
  * 0001: gramma fixing (Raphael)
  * 0002: commit message fixing (Raphael)

v2:
  * split the initial patch into two (Raphael)
  * rename init to realized (Raphael)
  * remove unrelated comment (Raphael)

When the vhost-user-blk device lose the connection to the daemon during
the initialization phase it kills qemu because of the assert in the code.
The series fixes the bug.

0001 is preparation for the fix
0002 fixes the bug, patch description has the full motivation for the series
0003 (added in v3) fix bug on vm shutdown

Denis Plotnikov (3):
  vhost-user-blk: use different event handlers on initialization
  vhost-user-blk: perform immediate cleanup if disconnect on
    initialization
  vhost-user-blk: add immediate cleanup on shutdown

 hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 31 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------9107A538A33C6514228E9481--

