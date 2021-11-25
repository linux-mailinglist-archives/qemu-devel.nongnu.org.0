Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17F45DA77
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:54:19 +0100 (CET)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqEGY-0006R2-MF
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mqEFC-0005VU-J9
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:52:54 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58752 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mqEF9-0006dz-4d
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:52:54 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKNIeh59hNl8BAA--.3433S3;
 Thu, 25 Nov 2021 20:52:46 +0800 (CST)
Subject: Re: [PATCH] linux-user: move target_signal.h generic definitions to
 generic/signal.h
To: WANG Xuerui <i.qemu@xen0n.name>
References: <1637830541-3222-1-git-send-email-gaosong@loongson.cn>
 <f53f4fef-2ed9-3e9f-3104-ac4780819115@xen0n.name>
From: gaosong <gaosong@loongson.cn>
Message-ID: <01e80f0e-035d-8352-b225-d6dce9d943d0@loongson.cn>
Date: Thu, 25 Nov 2021 20:52:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f53f4fef-2ed9-3e9f-3104-ac4780819115@xen0n.name>
Content-Type: multipart/alternative;
 boundary="------------5C444E79B968161A95881B59"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxKNIeh59hNl8BAA--.3433S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW5ZFWfZw43Zry8AF15CFg_yoWfJrb_Cr
 9a93y7Ww1UWay8Jw4jyr45Zr95KFWq9w18A398KwsFyrWrKrWkJws5GrZ7W34fZw48Crna
 vwsYvana9r1I9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
 s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
 kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
 Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
 W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4
 vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI
 7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x07UiL05UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.1, SPF_HELO_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------5C444E79B968161A95881B59
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
On 2021/11/25 下午6:08, WANG Xuerui wrote:
>> +
>> +#define TARGET_MINSIGSTKSZ     2048
> While all the architectures you de-duplicated here have
> TARGET_MINSIGSTACKSZ as 2048, some others specify a different value
> (mostly 4096, e.g. alpha), as can be seen in your next patch (which
> should belong to this series, btw).
Surely   I 'll add a patch to delete TARGET_SIGSTKSZ.
>   Do you mean to change semantics
> here? Or you might have to allow arches to override this value.
>
>
mips64, sparc, alpha, mips, hppa, their signal definitions are defined 
in /linux-user/XXX/target_signal.h,
but their target_signal.h don't include generic/signal.h.  they don't 
use generic/signal.h at all.
It's hard to move their some generic definitions to generic/signal.h,  
because their definitions are too defferent with generic.

Thanks
Song Gao






--------------5C444E79B968161A95881B59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi,<br>
    <div class="moz-cite-prefix">On 2021/11/25 下午6:08, WANG Xuerui
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f53f4fef-2ed9-3e9f-3104-ac4780819115@xen0n.name">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">+
+#define TARGET_MINSIGSTKSZ     2048
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">While all the architectures you de-duplicated here have
TARGET_MINSIGSTACKSZ as 2048, some others specify a different value
(mostly 4096, e.g. alpha), as can be seen in your next patch (which
should belong to this series, btw). </pre>
    </blockquote>
    Surely   I 'll add a patch to delete TARGET_SIGSTKSZ.
    <blockquote type="cite"
      cite="mid:f53f4fef-2ed9-3e9f-3104-ac4780819115@xen0n.name">
      <pre class="moz-quote-pre" wrap=""> Do you mean to change semantics
here? Or you might have to allow arches to override this value.


</pre>
    </blockquote>
    mips64, sparc, alpha, mips, hppa, their signal definitions are
    defined in /linux-user/XXX/target_signal.h, <br>
    but their target_signal.h don't include generic/signal.h.  they
    don't use generic/signal.h at all.  <br>
    It's hard to move their some generic definitions to
    generic/signal.h,  because their definitions are too defferent with
    generic.<br>
      <br>
    Thanks<br>
    Song Gao<br>
    <p><br>
    </p>
    <p><br>
      <br>
    </p>
    <br>
  </body>
</html>

--------------5C444E79B968161A95881B59--


