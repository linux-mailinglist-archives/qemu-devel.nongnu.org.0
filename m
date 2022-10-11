Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940045FAA51
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 03:51:06 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi4QD-00083C-8P
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 21:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oi4OU-0006ap-KP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 21:49:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48774 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oi4OS-0004O9-6Y
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 21:49:18 -0400
Received: from [192.168.124.2] (unknown [36.5.191.229])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxkOByy0RjxZQqAA--.23136S3; 
 Tue, 11 Oct 2022 09:48:34 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------A83QbqwfvZCBB7hTDfJDNh4L"
Message-ID: <46a1dfa1-72c9-d466-7b3f-0d62a8d24660@loongson.cn>
Date: Tue, 11 Oct 2022 09:48:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RISU PATCH 2/5] loongarch: Add LoongArch basic test support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-3-gaosong@loongson.cn>
 <CAFEAcA_ArAZT57=Rjog+vBrVsdpvUrQKrBA1ChyD8vxdfjM4hA@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
In-Reply-To: <CAFEAcA_ArAZT57=Rjog+vBrVsdpvUrQKrBA1ChyD8vxdfjM4hA@mail.gmail.com>
X-CM-TRANSID: AQAAf8CxkOByy0RjxZQqAA--.23136S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYq7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr
 1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFNVyDUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.007, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A83QbqwfvZCBB7hTDfJDNh4L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/10/10 23:34, Peter Maydell 写道:
>> +int get_risuop(struct reginfo *ri)
>> +{
>> +    /* Return the risuop we have been asked to do
>> +     * (or -1 if this was a SIGILL for a non-risuop insn)
>> +     */
>> +    uint32_t insn = ri->faulting_insn;
>> +    uint32_t op = insn & 0xf;
>> +    uint32_t key = insn & ~0xf;
>> +    uint32_t risukey = 0x000001f0;
>> +    return (key != risukey) ? -1 : op;
>> +}
> You'll probably find this needs tweaking when you rebase
> on current risu git, because a recent refactor means this
> function should now return a RisuOp, not an int. The changes
> should be minor, though.
Ok,  I will correct it  on v2.

Thanks.
Song Gao


--------------A83QbqwfvZCBB7hTDfJDNh4L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/10/10 23:34, Peter Maydell 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA_ArAZT57=Rjog+vBrVsdpvUrQKrBA1ChyD8vxdfjM4hA@mail.gmail.com">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">+int get_risuop(struct reginfo *ri)
+{
+    /* Return the risuop we have been asked to do
+     * (or -1 if this was a SIGILL for a non-risuop insn)
+     */
+    uint32_t insn = ri-&gt;faulting_insn;
+    uint32_t op = insn &amp; 0xf;
+    uint32_t key = insn &amp; ~0xf;
+    uint32_t risukey = 0x000001f0;
+    return (key != risukey) ? -1 : op;
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">You'll probably find this needs tweaking when you rebase
on current risu git, because a recent refactor means this
function should now return a RisuOp, not an int. The changes
should be minor, though.</pre>
    </blockquote>
    Ok,  I will correct it  on v2.<br>
    <br>
    Thanks.<br>
    Song Gao<br>
    <p><br>
    </p>
  </body>
</html>

--------------A83QbqwfvZCBB7hTDfJDNh4L--


