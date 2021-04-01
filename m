Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573223511F5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:24:34 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtZ3-00083I-Ds
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lRtWl-0006Bw-Ty; Thu, 01 Apr 2021 05:22:11 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:50792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lRtWh-0006Ep-5o; Thu, 01 Apr 2021 05:22:09 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 214C22E16D2;
 Thu,  1 Apr 2021 12:22:01 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6HipgWJrBO-M00iuZN4; Thu, 01 Apr 2021 12:22:01 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617268921; bh=Lm1y7SxPqttepjOId/Dkr3lTOKTzmkQX5I1yAMewSYU=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=vGYXAZtgsyFWpQCI2vfY1llkYp+Ww8blMcmhTNkz2606p2VUQ6tMZ0S6yRWEdnSTt
 wZ/xfFrSZkFw+bLbvOUdcZb8FrY5fM1cehziApo5iBEmptQ1OmDhSBj8ENJxGNJnl3
 EgWp6xC9ZKXoZOQUtFer5rWHdAr7EUefr+CNQ8GA=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8822::1:15])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FvV3HU48uv-M0o8sFqO; Thu, 01 Apr 2021 12:22:00 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [BUG FIX][PATCH v3 0/3] vhost-user-blk: fix bug on device
 disconnection during initialization
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
 <a1ab7e04-86cd-7004-9687-c00382dc2e14@yandex-team.ru>
Message-ID: <7735213d-f3ac-ab49-ecaf-0878808167aa@yandex-team.ru>
Date: Thu, 1 Apr 2021 12:21:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1ab7e04-86cd-7004-9687-c00382dc2e14@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------5C71974781E72D8C70499849"
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
--------------5C71974781E72D8C70499849
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This is a series fixing a bug in host-user-blk.
Is there any chance for it to be considered for the next rc?

Thanks!

Denis

On 29.03.2021 16:44, Denis Plotnikov wrote:
>
> ping!
>
> On 25.03.2021 18:12, Denis Plotnikov wrote:
>> v3:
>>    * 0003: a new patch added fixing the problem on vm shutdown
>>      I stumbled on this bug after v2 sending.
>>    * 0001: gramma fixing (Raphael)
>>    * 0002: commit message fixing (Raphael)
>>
>> v2:
>>    * split the initial patch into two (Raphael)
>>    * rename init to realized (Raphael)
>>    * remove unrelated comment (Raphael)
>>
>> When the vhost-user-blk device lose the connection to the daemon during
>> the initialization phase it kills qemu because of the assert in the code.
>> The series fixes the bug.
>>
>> 0001 is preparation for the fix
>> 0002 fixes the bug, patch description has the full motivation for the series
>> 0003 (added in v3) fix bug on vm shutdown
>>
>> Denis Plotnikov (3):
>>    vhost-user-blk: use different event handlers on initialization
>>    vhost-user-blk: perform immediate cleanup if disconnect on
>>      initialization
>>    vhost-user-blk: add immediate cleanup on shutdown
>>
>>   hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++---------------
>>   1 file changed, 48 insertions(+), 31 deletions(-)
>>

--------------5C71974781E72D8C70499849
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="+1"><tt>This is a series fixing a bug in
          host-user-blk. <br>
          Is there any chance for it to be considered for the next rc?</tt></font></p>
    <p><font size="+1"><tt>Thanks!</tt></font></p>
    <p><font size="+1"><tt>Denis<br>
        </tt></font></p>
    <div class="moz-cite-prefix">On 29.03.2021 16:44, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a1ab7e04-86cd-7004-9687-c00382dc2e14@yandex-team.ru">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </blockquote>
  </body>
</html>

--------------5C71974781E72D8C70499849--

