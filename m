Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC95D332B57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:59:51 +0100 (CET)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJely-0002fc-TN
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJeOV-0008LR-Rd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:35:36 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:30749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJeOS-0002AV-VY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:35:35 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615304124; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=r1uoUt4dgk/RB3lIdbIaOoWxsR1toAY5zRpbcy+bEQFjWbo6dH3yW8OZVKGmLjJrbO
 cdISTljoL0EYz7o4IYJR5RNG2Gzxi2NYXEtRxH3QsO5qEZFQYiJFHo9FwutNKS0aRPlJ
 BMVBl+IO9jLSPGLYZ4Y8JVi/rqKB9WOmpiuClmLAzou+7KRWz/hLhlSETkxdDk9h0uhb
 xG7wV2YO3P+fuNbfL1b3cnsX6IRtbtsaoREbVlY0D9k8OCd2p3ymlqW5j6IU7XgjkbVl
 GZFWKr9SuQkrVDYFq51qeIvsJ71lC0jl/w9UxQXzo+3kC2ACpxa4/VZGtWhJpWG7B2kb
 HOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615304124;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=RqOiIrXVJZiBq4p3O3z/tQfVLJvgSlFsbpVX3hMtdKg=;
 b=U25T5L5emqjavgN4AqlTvYt7eDSvdNpcxq5OWJIHtWY//Vi7F+WJFXHIIIWtwz2Uor
 RsGa/rfu41naFdHjZ8d9bCklaHTc6XQQ13+X8u+ILgja8bDv2dKt4QVSTwuW3BIUcnuP
 8x50GpKhYPr/yRiJ/4UDBCBcKLCrT4cRd8MH4nuB+J6KyIwJKN5y5jlh86twvCKb/l0A
 97mr0cXYl5NxonVGbf3Wy5FkwDgQ0zyqOAXTfGLhUd9iZvy6xOOB3P4s0tzoeKFcnYVd
 Z7ETtHtSjZ9erVN1FMp3sM8RvtZ1JnlhUOhrjx+xmUNmybopiDTPuC83hdYe/iURGL3p
 V1xg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615304124;
 s=strato-dkim-0002; d=ulal.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=RqOiIrXVJZiBq4p3O3z/tQfVLJvgSlFsbpVX3hMtdKg=;
 b=FZTdJDGi7TOqaTmOMkyMLw9vdcB5PvsE23JGbBJJQBEwphr73W6C49ByVT/6UbmTtS
 kvWQ1hC58AGfyB1MFEvCxp9tYQBmC/dogaYR9jv9W6teCzRLpWXDhOcZ3WP5/uOtW1Ts
 HHymf89VnHM8yF8K29WxYEdRxrY9X7fV/vVlOgSTvNU8lUTjZiZEqGyZ2PagIIe8tuPJ
 dH1izai9FapGigdCsH63ZtYPo4RGV4mmFlIjJdfvKArmuHw0vd4OUBE0+vxNzJ8TAh24
 +fv6bwPPF9RF6SlAwK8hVNHihXT6AP7EjaJ2yFRZewTpr462z7SWd3gFmc4aNUmqWJFd
 friA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JSSHyzkN3ON0Uun6F+zrkVqc/ZmTClqkOE9IdMVvnQ2O6vlW7Z+qlJRBbUq68WzKpoQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c3:9719:3d00:bb52:98ae:ee53:17cd]
 by smtp.strato.de (RZmta 47.20.3 AUTH)
 with ESMTPSA id c075a1x29FZNHmz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Mar 2021 16:35:23 +0100 (CET)
Subject: Re: [PATCH] hw/char: disable ibex uart receive if the buffer is full
To: Alistair Francis <alistair23@gmail.com>
References: <20210215231528.2718086-1-alexander.wagner@ulal.de>
 <CAKmqyKM4ewocr51Qhx8R1XR=r2rcgyuBLTqhpi-MYVpFko_Rcg@mail.gmail.com>
 <19c50d64-fe9d-8c72-2002-3586abac821c@ulal.de>
 <CAKmqyKMhDyHkfn7zszhDOiKY5k=JRzmYjz7-QD9j8Ntr=T8Qag@mail.gmail.com>
From: Alexander Wagner <alexander.wagner@ulal.de>
Message-ID: <0f1e36fb-6ac4-b709-a9ba-2754e3f1fe78@ulal.de>
Date: Tue, 9 Mar 2021 16:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMhDyHkfn7zszhDOiKY5k=JRzmYjz7-QD9j8Ntr=T8Qag@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------9D5936DC0AA7FBA8D2BFAF6B"
Content-Language: en-US
Received-SPF: none client-ip=81.169.146.166;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p01-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9D5936DC0AA7FBA8D2BFAF6B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09.03.21 15:29, Alistair Francis wrote:
> On Tue, Mar 9, 2021 at 2:27 AM Alexander Wagner
> <alexander.wagner@ulal.de> wrote:
>>
>> On 08.03.21 14:47, Alistair Francis wrote:
>>>>    hw/char/ibex_uart.c         | 20 +++++++++++++++-----
>>>>    include/hw/char/ibex_uart.h |  4 ++++
>>>>    2 files changed, 19 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
>>>> index 89f1182c9b..dac09d53d6 100644
>>>> --- a/hw/char/ibex_uart.c
>>>> +++ b/hw/char/ibex_uart.c
>>>> @@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
>>>>    {
>>>>        IbexUartState *s = opaque;
>>>>
>>>> -    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
>>>> +    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
>>>> +           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
>>>>            return 1;
>>>>        }
>>>>
>>>> @@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
>>>>
>>>>        s->uart_status &= ~R_STATUS_RXIDLE_MASK;
>>>>        s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
>>>> +    s->uart_status |= R_STATUS_RXFULL_MASK;
>>> Doesn't this mean we set RXFULL on every receive? Shouldn't this check
>>> the rx_level first?
>>>
>>> Alistair
>> Thank you for having a look! :)
>>
>> Yes, this is correct. The RXFULL is currently set on every receive. The
>> RXFULL is used to indicate to QEMU that the device cannot receive any
>> further bytes.
>>
>> As the FIFO buffers are currently not yet implemented I thought it would
>> make sense to behave like the OT UART could only receive one byte at a time.
> Ah, good point.
>
> Can you add a comment where it is set describing that then?
>
> Alistair
>
Sure, I just added a comment and emailed this as patch v2.

Alex


--------------9D5936DC0AA7FBA8D2BFAF6B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09.03.21 15:29, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKMhDyHkfn7zszhDOiKY5k=JRzmYjz7-QD9j8Ntr=T8Qag@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Mar 9, 2021 at 2:27 AM Alexander Wagner
<a class="moz-txt-link-rfc2396E" href="mailto:alexander.wagner@ulal.de">&lt;alexander.wagner@ulal.de&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 08.03.21 14:47, Alistair Francis wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">  hw/char/ibex_uart.c         | 20 +++++++++++++++-----
  include/hw/char/ibex_uart.h |  4 ++++
  2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 89f1182c9b..dac09d53d6 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
  {
      IbexUartState *s = opaque;

-    if (s-&gt;uart_ctrl &amp; R_CTRL_RX_ENABLE_MASK) {
+    if ((s-&gt;uart_ctrl &amp; R_CTRL_RX_ENABLE_MASK)
+           &amp;&amp; !(s-&gt;uart_status &amp; R_STATUS_RXFULL_MASK)) {
          return 1;
      }

@@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)

      s-&gt;uart_status &amp;= ~R_STATUS_RXIDLE_MASK;
      s-&gt;uart_status &amp;= ~R_STATUS_RXEMPTY_MASK;
+    s-&gt;uart_status |= R_STATUS_RXFULL_MASK;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Doesn't this mean we set RXFULL on every receive? Shouldn't this check
the rx_level first?

Alistair
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thank you for having a look! :)

Yes, this is correct. The RXFULL is currently set on every receive. The
RXFULL is used to indicate to QEMU that the device cannot receive any
further bytes.

As the FIFO buffers are currently not yet implemented I thought it would
make sense to behave like the OT UART could only receive one byte at a time.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ah, good point.

Can you add a comment where it is set describing that then?

Alistair

</pre>
    </blockquote>
    <pre>Sure, I just added a comment and emailed this as patch v2.

Alex
</pre>
  </body>
</html>

--------------9D5936DC0AA7FBA8D2BFAF6B--

