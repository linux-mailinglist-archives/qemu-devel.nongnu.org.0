Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA934887AF
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 06:11:16 +0100 (CET)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6QU6-0008At-Ri
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 00:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6QSW-0007Qz-0y
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 00:09:36 -0500
Received: from mail.xen0n.name ([115.28.160.31]:53282
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6QSR-0007tH-0a
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 00:09:35 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 529D4600FB;
 Sun,  9 Jan 2022 13:09:19 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641704959; bh=ceBy7Tdj5Xxd6vx2sxYUhhXxWLtse8EflSE8ibLnMTU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DCu1QK1lPkkGcSH2sHp5gVvq6l/SCwmk6Ipk5b6zMytMFt0BW90NGSnX8V3+aVq3q
 UjZ/HHzf///AzhQI9V4Mcy7ec3VdIu4nFpkmRkfI00U9VhvD2Y5KDbPY2QnEG23PQT
 As2m37DTxPq1Hdyweryj5ITwqB4dEaSoW0z/woco=
Content-Type: multipart/alternative;
 boundary="------------0ZRNBbd7FzOwcwSDS6OxQk5L"
Message-ID: <4cc1a7e4-90b7-ba6c-38e3-2de2571b226a@xen0n.name>
Date: Sun, 9 Jan 2022 13:09:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v14 00/26] Add LoongArch linux-user emulation support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org>
 <7d25de8d-f75b-d2b6-cc93-0b1276bbc7f5@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <7d25de8d-f75b-d2b6-cc93-0b1276bbc7f5@loongson.cn>
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.199, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0ZRNBbd7FzOwcwSDS6OxQk5L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 1/7/22 15:59, gaosong wrote:
> Hi Richard.
> On 2022/1/7 下午1:01, Richard Henderson wrote:
>> On 1/6/22 1:41 AM, Song Gao wrote:
>>> Based-on:<20220106074740.1754661-1-gaosong@loongson.cn>
>>>
>>> Hi all,
>>>
>>> This series only support linux-user emulation.
>>> More about LoongArch at:https://github.com/loongson/
>>>
>>> The latest kernel:
>>>    *https://github.com/loongson/linux/tree/loongarch-next
>>>
>>> Patches need review:
>>>    * 0018-linux-user-Add-LoongArch-specific-structures.patch
>>>    * 0019-linux-user-Add-LoongArch-signal-support.patch
>>
>> You're still blocked on no upstream kernel support.
>> As shown in patch 19, the kernel abi is still in flux.
>>
> We hope the kernel will support as soon as possible. but ...
>> It would be best if you could work toward getting full system 
>> emulation completed.  Then all of the basic cpu emulation can be 
>> merged and all you'd need to keep updating is the linux-user portions.
>>
> We are going to submit V4 system emulation, maybe tommorrow or next-week, and We'll keep updating the linux-user portions.

I believe what Richard meant is suggesting you to re-order your patches 
so that the CPU emulation part (first half of this series) and the 
system emulation part (Xiaojuan's series) would be combined to one new 
series, to be reviewed and merged independent of the still-unstable 
Linux ABI that's blocking this series at the moment. To "keep updating 
the linux-user portions" without re-arranging the series will just delay 
inclusion further, IMO.

In case the description above is not clear enough:

We basically have 3 parts for full LoongArch target support: (a) CPU 
emulation, (b) privileged architecture & hw emulation, and (c) 
linux-user emulation. Currently this series consists of (a) and (c), 
while Xiaojuan's series has (b). And the tcg-dev branch you seem to be 
staging your work at [1] has the same ordering: (a) then (c) then (b), 
which is consistent with Xiaojuan's series cover letter.

However, because (c) is blocked by kernel port upstreaming, (a) could 
not be merged, and by re-combining (a) with (b) we can speed up review 
and inclusion of things. This would require you to coordinate with 
Xiaojuan and reorder your patches in the tcg-dev branch, so that you can 
generate the right series to send.

[1]: https://github.com/loongson/qemu/tree/tcg-dev

>
> Thanks
> Song
>> r~
--------------0ZRNBbd7FzOwcwSDS6OxQk5L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 1/7/22 15:59, gaosong wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7d25de8d-f75b-d2b6-cc93-0b1276bbc7f5@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre>Hi Richard.
</pre>
      <div class="moz-cite-prefix">On 2022/1/7 下午1:01, Richard Henderson
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">On
        1/6/22 1:41 AM, Song Gao wrote: <br>
        <blockquote type="cite">Based-on:<a
            class="moz-txt-link-rfc2396E"
            href="mailto:20220106074740.1754661-1-gaosong@loongson.cn"
            moz-do-not-send="true">&lt;20220106074740.1754661-1-gaosong@loongson.cn&gt;</a>
          <br>
          <br>
          Hi all, <br>
          <br>
          This series only support linux-user emulation. <br>
          More about LoongArch at:<a class="moz-txt-link-freetext"
            href="https://github.com/loongson/" moz-do-not-send="true">https://github.com/loongson/</a>
          <br>
          <br>
          The latest kernel: <br>
             *<a class="moz-txt-link-freetext"
            href="https://github.com/loongson/linux/tree/loongarch-next"
            moz-do-not-send="true">https://github.com/loongson/linux/tree/loongarch-next</a>
          <br>
          <br>
          Patches need review: <br>
             * 0018-linux-user-Add-LoongArch-specific-structures.patch <br>
             * 0019-linux-user-Add-LoongArch-signal-support.patch <br>
        </blockquote>
        <br>
        You're still blocked on no upstream kernel support. <br>
        As shown in patch 19, the kernel abi is still in flux. <br>
        <br>
      </blockquote>
      <pre>We hope the kernel will support as soon as possible. but ...</pre>
      <blockquote type="cite"
        cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">It
        would be best if you could work toward getting full system
        emulation completed.  Then all of the basic cpu emulation can be
        merged and all you'd need to keep updating is the linux-user
        portions. <br>
        <br>
      </blockquote>
      <pre>We are going to submit V4 system emulation, maybe tommorrow or next-week, and We'll keep updating the linux-user portions.</pre>
    </blockquote>
    <p>I believe what Richard meant is suggesting you to re-order your
      patches so that the CPU emulation part (first half of this series)
      and the system emulation part (Xiaojuan's series) would be
      combined to one new series, to be reviewed and merged independent
      of the still-unstable Linux ABI that's blocking this series at the
      moment. To "keep updating the linux-user portions" without
      re-arranging the series will just delay inclusion further, IMO.</p>
    <p>In case the description above is not clear enough:</p>
    <p>We basically have 3 parts for full LoongArch target support: (a)
      CPU emulation, (b) privileged architecture &amp; hw emulation, and
      (c) linux-user emulation. Currently this series consists of (a)
      and (c), while Xiaojuan's series has (b). And the tcg-dev branch
      you seem to be staging your work at [1] has the same ordering: (a)
      then (c) then (b), which is consistent with Xiaojuan's series
      cover letter.<br>
    </p>
    <p>However, because (c) is blocked by kernel port upstreaming, (a)
      could not be merged, and by re-combining (a) with (b) we can speed
      up review and inclusion of things. This would require you to
      coordinate with Xiaojuan and reorder your patches in the tcg-dev
      branch, so that you can generate the right series to send.</p>
    <p>[1]: <a class="moz-txt-link-freetext" href="https://github.com/loongson/qemu/tree/tcg-dev">https://github.com/loongson/qemu/tree/tcg-dev</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:7d25de8d-f75b-d2b6-cc93-0b1276bbc7f5@loongson.cn">
      <pre>

Thanks
Song
</pre>
      <blockquote type="cite"
        cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">r~ <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0ZRNBbd7FzOwcwSDS6OxQk5L--

