Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09A404864
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:25:36 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHFP-0003wr-2h
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kripper@imatronix.cl>)
 id 1mOHE5-0003Gy-07; Thu, 09 Sep 2021 06:24:13 -0400
Received: from ip27.imatronix.com ([200.63.97.108]:37244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kripper@imatronix.cl>)
 id 1mOHE1-0002ut-1P; Thu, 09 Sep 2021 06:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=superfactura.cl; s=default; h=Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhaRn7KeKJ4+USzYE670oOmvI+9/ZCwnMQjkmI6hdJw=; b=EB8NL0izfpvhcRCRaPywTdse0s
 /7ZWzfkORVFJtGK4T87yWxdU3rEO4wSHw+ooKDlMoR1fotAqMAc4b0nVO3qG8IDnqudMw2xrNaDkp
 y2+syRgzFyRED7bY+a+yREVEe7FSwP+GHd/0GAfbpnDiFZTOf1dXYj5kJPTWBYgkTfNqg+vQdl1gm
 tv/oHIYju4F3K5JqtXEbRT5N5ynSZSXb/j3ot7sDxH8LNjbGv8/k2JzufowfHNmcGkdtmT65HVp8x
 4Zz63EcANI2dgbZpeL8uOsyMvN4imaVGybSr2zKBbuez0tLWuekMtcag9oW0kAi6ooISYYvhVz5K2
 bR2x8Z2Q==;
Received: from [200.73.112.45]
 by cpanel.imatronix.com with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.94.2) (envelope-from <kripper@imatronix.cl>)
 id 1mOHDx-00011W-8w   ; Thu, 09 Sep 2021 07:24:03 -0300
Subject: Re: qcow2 perfomance: read-only IO on the guest generates high write
 IO on the host
To: Kevin Wolf <kwolf@redhat.com>
References: <55980bc8-97ad-77a4-1bb7-a086f2712ea1@imatronix.cl>
 <YSUSNCR6kZVnCBKF@redhat.com>
From: Christopher Pereira <kripper@imatronix.cl>
Organization: IMATRONIX S.A.
Message-ID: <d28a48c8-48af-e5c7-b333-071f648b7b79@imatronix.cl>
Date: Thu, 9 Sep 2021 07:23:56 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YSUSNCR6kZVnCBKF@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------A19125F1FBA61FE84814F263"
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.imatronix.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - imatronix.cl
X-Get-Message-Sender-Via: cpanel.imatronix.com: authenticated_id:
 soporte@superfactura.cl
X-Authenticated-Sender: cpanel.imatronix.com: soporte@superfactura.cl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=200.63.97.108; envelope-from=kripper@imatronix.cl;
 helo=ip27.imatronix.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-1.922, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A19125F1FBA61FE84814F263
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24-08-2021 11:37, Kevin Wolf wrote:
> [ Cc: qemu-block ]
>
> Am 11.08.2021 um 13:36 hat Christopher Pereira geschrieben:
>> Hi,
>>
>> I'm reading a directory with 5.000.000 files (2,4 GB) inside a guest using
>> "find | grep -c".
>>
>> On the host I saw high write IO (40 MB/s !) during over 1 hour using
>> virt-top.
>>
>> I later repeated the read-only operation inside the guest and no additional
>> data was written on the host. The operation took only some seconds.
>>
>> I believe QEMU was creating some kind of cache or metadata map the first
>> time I accessed the inodes.
> No, at least in theory, QEMU shouldn't allocate anything when you're
> just reading.
Hmm...interesting.
> Are you sure that this isn't activity coming from your guest OS?

Yes. iotop was showing only read IOs on the guest, and on the host iotop 
and virt-top where showing strong write IOs for hours.
Stopping the "find" command on the guest also stopped the write IOs on 
the host.

>> But I wonder why the cache or metadata map wasn't available the first time
>> and why QEMU had to recreate it?
>>
>> The VM has "compressed base <- snap 1" and base was converted without
>> prealloc.
>>
>> Is it because we created the base using convert without metadata prealloc
>> and so the metadata map got lost?
>>
>> I will do some experiments soon using convert + metadata prealloc and
>> probably find out myself, but I will happy to read your comments and gain
>> some additional insights.
>> If it the problem persists, I would try again without compression.
> What were the results of your experiments? Is the behaviour related to
> any of these options?

I will do the experiments and report back.

It's also strange that the second time I repeat the "find" command, I 
see no more write IOs and it takes only seconds instead of hours.

I was assuming QEMU was creating some kind of map or cache on the 
snapshot for the content present in the base, but now I got more curious.


--------------A19125F1FBA61FE84814F263
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 24-08-2021 11:37, Kevin Wolf wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YSUSNCR6kZVnCBKF@redhat.com">
      <pre class="moz-quote-pre" wrap="">[ Cc: qemu-block ]

Am 11.08.2021 um 13:36 hat Christopher Pereira geschrieben:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

I'm reading a directory with 5.000.000 files (2,4 GB) inside a guest using
"find | grep -c".

On the host I saw high write IO (40 MB/s !) during over 1 hour using
virt-top.

I later repeated the read-only operation inside the guest and no additional
data was written on the host. The operation took only some seconds.

I believe QEMU was creating some kind of cache or metadata map the first
time I accessed the inodes.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, at least in theory, QEMU shouldn't allocate anything when you're
just reading.</pre>
    </blockquote>
    Hmm...interesting.<br>
    <blockquote type="cite" cite="mid:YSUSNCR6kZVnCBKF@redhat.com">
      <pre class="moz-quote-pre" wrap="">Are you sure that this isn't activity coming from your guest OS?</pre>
    </blockquote>
    <p><font size="+1">Yes. iotop was showing only read IOs on the
        guest, and on the host iotop and virt-top where showing strong
        write IO<font size="+1">s for hours.</font></font><br>
      <font size="+1"><font size="+1">Stopping the "find" command on the
          guest also stopped the write IOs on the host.</font></font>
    </p>
    <blockquote type="cite" cite="mid:YSUSNCR6kZVnCBKF@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But I wonder why the cache or metadata map wasn't available the first time
and why QEMU had to recreate it?

The VM has "compressed base &lt;- snap 1" and base was converted without
prealloc.

Is it because we created the base using convert without metadata prealloc
and so the metadata map got lost?

I will do some experiments soon using convert + metadata prealloc and
probably find out myself, but I will happy to read your comments and gain
some additional insights.
If it the problem persists, I would try again without compression.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What were the results of your experiments? Is the behaviour related to
any of these options?</pre>
    </blockquote>
    <p>I will do the experiments and report back.<br>
    </p>
    <p>It's also strange that the second time I repeat the "find"
      command, I see no more write IOs and it takes only seconds instead
      of hours.</p>
    <p>I was assuming QEMU was creating some kind of map or cache on the
      snapshot for the content present in the base, but now I got more
      curious.<br>
    </p>
  </body>
</html>

--------------A19125F1FBA61FE84814F263--

