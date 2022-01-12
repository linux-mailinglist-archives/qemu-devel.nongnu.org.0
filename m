Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9848C24E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:29:12 +0100 (CET)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7asS-0002RX-0y
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:29:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n7apt-0006lN-MZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:26:34 -0500
Received: from mail.xen0n.name ([115.28.160.31]:39572
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n7apq-0002bO-Dk
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:26:33 -0500
Received: from [100.100.57.236] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E9A76600FB;
 Wed, 12 Jan 2022 18:26:17 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641983178; bh=nJh1gWF4Xh7+M7GqVXCy/8izzPmHdNid4FGXre2hmPE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JZ4BH7tJjzUDpvrG1eOiCA4DHBURClgmrFTMBjd004nxO9OA0TvoTIsA3mCxRzlX5
 cPnrwYNFFKVveQ8g/PXkhpogH56+vArYl2T9KUAGQAzeeGUkAg1/rGD3wqYMV1Y+dr
 NeIEho5N9JOune81GwTjQVp5WN5ToasqVOJL3Odo=
Content-Type: multipart/alternative;
 boundary="------------DkrYEOwp58yVdUzpO4fesyOY"
Message-ID: <d13f1bff-191a-d3e9-d313-de7a44ce0f4a@xen0n.name>
Date: Wed, 12 Jan 2022 18:26:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:97.0)
 Gecko/20100101 Thunderbird/97.0a1
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
 <fbb7f1b4-aad9-9514-050d-78418c6401ea@loongson.cn>
 <7e5eac9c-a6d6-82eb-3209-dc5e07479cfa@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <7e5eac9c-a6d6-82eb-3209-dc5e07479cfa@loongson.cn>
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------DkrYEOwp58yVdUzpO4fesyOY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2022/1/12 18:17, gaosong wrote:
>
> Hi,
>
> On 2022/1/12 下午5:28, gaosong wrote:
>>>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
>>>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
>>>> +    env->cpucfg[16] = data;
>>>> +
>>>> +    data = 0;
>>>> +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
>>>
>>> This seems out-of-place, according to the manual this field is Way-1
>>> for the L1I cache, so you have 0x8004=32772 ways in this cache?
>>>
>>> Same for all similar constructions below.
>>>
>> I have time to reply to your comment now.
>> As in the previous comments, I don't remember which one,these values should be the same as the values of the physical environment. I dumped 'CPUCFG17' value again,
>> the value is no problem. Maybe you didn't think about dumping these values when you commented. The value of  'L11U_SIZE' is dumped to be 0. and cpucfg[i] has been 
>> initialized to 0 before. There is no need to set it again.
> Not quite right,  cpucfg[17] is '0x60800003', I missed a '0',  I don't know from which version it's wrong
> Thank you very much,  if I hadn't dumped the value today, I wouldn't have realized the wrong.  

Still not quite right; maybe you made a typo there as the value is
`0x06080003` (the fields are all whole bytes/shorts, so very easy to
recognize).

I used the following snippet to get real values from the 3A5000 system:

    #include <stdio.h>

    int cpucfg(const int sel)
    {
            int ret;
            __asm__ __volatile__("cpucfg %0, %1" : "=r"(ret) : "r"(sel));
            return ret;
    }

    int main(void)
    {
            int i;
            int c;
            for (i = 0; i < 64; i++) {
                    c = cpucfg(i);
                    if (!c) {
                            continue;
                    }
                    printf("CPUCFG.0x%-2x = 0x%08x\n", i, c);
            }

            return 0;
    }

And I got the following output so we can cross-check:

    CPUCFG.0x0  = 0x0014c010
    CPUCFG.0x1  = 0x03f2f2fe
    CPUCFG.0x2  = 0x007ccfc7
    CPUCFG.0x3  = 0x0000fcff
    CPUCFG.0x4  = 0x05f5e100
    CPUCFG.0x5  = 0x00010001
    CPUCFG.0x6  = 0x00007f33
    CPUCFG.0x10 = 0x00002c3d
    CPUCFG.0x11 = 0x06080003
    CPUCFG.0x12 = 0x06080003
    CPUCFG.0x13 = 0x0608000f
    CPUCFG.0x14 = 0x060e000f
    CPUCFG.0x30 = 0x0000000e

Obviously the 0x30 leaf is undocumented, but not implementing it
shouldn't matter either, as userspace has no way to make use of that
when people aren't even aware of its existence. The other fields are of
course to be checked to only leave the implemented bits set in the QEMU
implementation.

Hope that helps!

--------------DkrYEOwp58yVdUzpO4fesyOY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/1/12 18:17, gaosong wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7e5eac9c-a6d6-82eb-3209-dc5e07479cfa@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi,<br>
      </p>
      <div class="moz-cite-prefix">On 2022/1/12 下午5:28, gaosong wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:fbb7f1b4-aad9-9514-050d-78418c6401ea@loongson.cn">
        <blockquote type="cite"
          cite="mid:b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name">
          <blockquote type="cite">+    data = FIELD_DP32(data, CPUCFG16,
            L3_IUUNIFY, 1); <br>
            +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1); <br>
            +    env-&gt;cpucfg[16] = data; <br>
            + <br>
            +    data = 0; <br>
            +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003); <br>
          </blockquote>
          <br>
          This seems out-of-place, according to the manual this field is
          Way-1 for the L1I cache, so you have 0x8004=32772 ways in this
          cache? <br>
          <br>
          Same for all similar constructions below. <br>
          <br>
        </blockquote>
        <pre>I have time to reply to your comment now.</pre>
        <pre>As in the previous comments, I don't remember which one,these values should be the same as the values of the physical environment. I dumped 'CPUCFG17' value again,
the value is no problem. Maybe you didn't think about dumping these values when you commented. The value of  'L11U_SIZE' is dumped to be 0. and cpucfg[i] has been 
initialized to 0 before. There is no need to set it again.</pre>
      </blockquote>
      <pre>Not quite right,  cpucfg[17] is '0x60800003', I missed a '0',  I don't know from which version it's wrong
Thank you very much,  if I hadn't dumped the value today, I wouldn't have realized the wrong.  
</pre>
    </blockquote>
    <p>Still not quite right; maybe you made a typo there as the value
      is `<font face="monospace">0x06080003</font>` (the fields are all
      whole bytes/shorts, so very easy to recognize).</p>
    <p>I used the following snippet to get real values from the 3A5000
      system:</p>
    <blockquote>
      <p><font face="monospace">#include &lt;stdio.h&gt;<br>
          <br>
          int cpucfg(const int sel)<br>
          {<br>
                  int ret;<br>
                  __asm__ __volatile__("cpucfg %0, %1" : "=r"(ret) :
          "r"(sel));<br>
                  return ret;<br>
          }<br>
          <br>
          int main(void)<br>
          {<br>
                  int i;<br>
                  int c;<br>
                  for (i = 0; i &lt; 64; i++) {<br>
                          c = cpucfg(i);<br>
                          if (!c) {<br>
                                  continue;<br>
                          }<br>
                          printf("CPUCFG.0x%-2x = 0x%08x\n", i, c);<br>
                  }<br>
          <br>
                  return 0;<br>
          }</font><br>
      </p>
    </blockquote>
    <p>And I got the following output so we can cross-check:</p>
    <blockquote>
      <p><font face="monospace">CPUCFG.0x0  = 0x0014c010<br>
          CPUCFG.0x1  = 0x03f2f2fe<br>
          CPUCFG.0x2  = 0x007ccfc7<br>
          CPUCFG.0x3  = 0x0000fcff<br>
          CPUCFG.0x4  = 0x05f5e100<br>
          CPUCFG.0x5  = 0x00010001<br>
          CPUCFG.0x6  = 0x00007f33<br>
          CPUCFG.0x10 = 0x00002c3d<br>
          CPUCFG.0x11 = 0x06080003<br>
          CPUCFG.0x12 = 0x06080003<br>
          CPUCFG.0x13 = 0x0608000f<br>
          CPUCFG.0x14 = 0x060e000f<br>
          CPUCFG.0x30 = 0x0000000e</font></p>
    </blockquote>
    <p>Obviously the 0x30 leaf is undocumented, but not implementing it
      shouldn't matter either, as userspace has no way to make use of
      that when people aren't even aware of its existence. The other
      fields are of course to be checked to only leave the implemented
      bits set in the QEMU implementation.</p>
    <p>Hope that helps!<br>
    </p>
  </body>
</html>

--------------DkrYEOwp58yVdUzpO4fesyOY--

