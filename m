Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F282F6D56B5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 04:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjWLe-00030Q-Ad; Mon, 03 Apr 2023 22:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichao@loongson.cn>)
 id 1pjWLb-00030F-Hq
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 22:24:35 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lichao@loongson.cn>) id 1pjWLY-0001e7-K9
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 22:24:35 -0400
Received: from loongson.cn (unknown [10.40.24.149])
 by gateway (Coremail) with SMTP id _____8DxXNpZiitkmEsWAA--.22928S3;
 Tue, 04 Apr 2023 10:24:25 +0800 (CST)
Received: from [10.40.24.149] (unknown [10.40.24.149])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur1WiitkSOIUAA--.18919S3; 
 Tue, 04 Apr 2023 10:24:22 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------u3DaISOVAHtz3Qrrm9alBZjE"
Message-ID: <84a503cd-82a4-5509-9629-da93c9e3ba64@loongson.cn>
Date: Tue, 4 Apr 2023 10:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [edk2-devel] On integrating LoongArch EDK2 firmware into QEMU
 build process
To: devel@edk2.groups.io, kraxel@redhat.com, mcb30@ipxe.org
Cc: maobibo@loongson.cn, WANG Xuerui <i.qemu@xen0n.name>,
 qemu-devel <qemu-devel@nongnu.org>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?B?5p2o5bCP5aif?= <yangxiaojuan@loongson.cn>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
 <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
 <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
 <aa56f4de-e50e-7a7f-3e0e-39e5fa20df29@loongson.cn>
 <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>
 <wkju3vayu3e2wtqmxakigrliv7ifj4ecd7ympkgwlacf7h4ckx@jnkqqqujdycf>
From: Chao Li <lichao@loongson.cn>
In-Reply-To: <wkju3vayu3e2wtqmxakigrliv7ifj4ecd7ympkgwlacf7h4ckx@jnkqqqujdycf>
X-CM-TRANSID: AQAAf8Cxur1WiitkSOIUAA--.18919S3
X-CM-SenderInfo: xolfxt3r6o00pqjv00gofq/1tbiAQALCGQqwfgLFQABsq
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF17try5ur43KryrCFWDtwb_yoW5WFWUpF
 47u39Iyr1qy3WIvrW0gw1Ig3WF9a109F15Jas0v3y0yF4fuFs5tw17Kr4qya4fZwnYva12
 vFyYq345JF4DC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG
 8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aV
 AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8GjcxK6IxK0xII
 j40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjxUruWlDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=lichao@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.349, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------u3DaISOVAHtz3Qrrm9alBZjE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2023/4/3 19:04, Gerd Hoffmann 写道:

> On Mon, Apr 03, 2023 at 10:29:52AM +0000, Michael Brown wrote:
>> On 03/04/2023 11:13, Chao Li wrote:
>>> This problem is because the gcc-12 does not yet to support the option
>>> 'mno-explicit-reloc', this option is used to open the new reloaction
>>> type for LoongArch, this new feature is very important for LoongArch,
>>> because it can reduce the binary size and improve code execution
>>> efficiency, so we turn it on when submitting the code to the EDK2 repo.
>> Is it possible to produce a _functional_ LoongArch64 EDK2 binary without
>> this option, even if the resulting binary is less efficient?
> MdePkg/Include/IndustryStandard/PeImage.h lists a single loongarch
> relocation type only, which I expect being the new type.  So I suspect
> the answer is "no" because the edk2 pe loader isn't able to handle the
> old relocation type(s).

Yes, the answer is "no", but the opposite is ture, the 
MdePkg/Include/IndustryStandard/PeImage.h LoongArch relocation type is 
older, this type appears in this list for compatiblility with binaries 
using the old reloaction type. If you use this type, you have to turn on 
the option '-mla-global-with-abs' in gcc,all global symbols will be 
created as "mark la" type, PE loader will use this rule to handle them. 
This option is mutually exclusive with 'mno-explicit-reloc',  new 
reloaction type(s) doesn't require special type(s) to be expressed in 
PeImage.h, PE loader doesn't need to do anything about relocation, all 
of reloaction process is done in BaseTools/Source/C/GenFw/Elf64Convert.c.


Thanks,
Chao
在 2023/4/3 19:04, Gerd Hoffmann 写道:
> On Mon, Apr 03, 2023 at 10:29:52AM +0000, Michael Brown wrote:
>> On 03/04/2023 11:13, Chao Li wrote:
>>> This problem is because the gcc-12 does not yet to support the option
>>> 'mno-explicit-reloc', this option is used to open the new reloaction
>>> type for LoongArch, this new feature is very important for LoongArch,
>>> because it can reduce the binary size and improve code execution
>>> efficiency, so we turn it on when submitting the code to the EDK2 repo.
>> Is it possible to produce a _functional_ LoongArch64 EDK2 binary without
>> this option, even if the resulting binary is less efficient?
> MdePkg/Include/IndustryStandard/PeImage.h lists a single loongarch
> relocation type only, which I expect being the new type.  So I suspect
> the answer is "no" because the edk2 pe loader isn't able to handle the
> old relocation type(s).
>
> take care,
>    Gerd
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#102384):https://edk2.groups.io/g/devel/message/102384
> Mute This Topic:https://groups.io/mt/98030924/6496846
> Group Owner:devel+owner@edk2.groups.io
> Unsubscribe:https://edk2.groups.io/g/devel/unsub  [lichao@loongson.cn]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------u3DaISOVAHtz3Qrrm9alBZjE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>在 2023/4/3 19:04, Gerd Hoffmann 写道:<br>
    </p>
    <blockquote type="cite"
cite="mid:wkju3vayu3e2wtqmxakigrliv7ifj4ecd7ympkgwlacf7h4ckx@jnkqqqujdycf">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 03, 2023 at 10:29:52AM +0000, Michael Brown wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 03/04/2023 11:13, Chao Li wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This problem is because the gcc-12 does not yet to support the option
'mno-explicit-reloc', this option is used to open the new reloaction
type for LoongArch, this new feature is very important for LoongArch,
because it can reduce the binary size and improve code execution
efficiency, so we turn it on when submitting the code to the EDK2 repo.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Is it possible to produce a _functional_ LoongArch64 EDK2 binary without
this option, even if the resulting binary is less efficient?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">MdePkg/Include/IndustryStandard/PeImage.h lists a single loongarch
relocation type only, which I expect being the new type.  So I suspect
the answer is "no" because the edk2 pe loader isn't able to handle the
old relocation type(s).</pre>
    </blockquote>
    <p><font size="2"></font></p>
    <p><font size="2">Yes, the answer is "no", but the opposite is ture,
        the MdePkg/Include/IndustryStandard/PeImage.h LoongArch
        relocation type is older, this type appears in this list for
        compatiblility with binaries using the old reloaction type. If
        you use this type, you have to turn on the option
        '-mla-global-with-abs' in gcc,</font><font size="2"> all global
        symbols will be created as "mark la" type, PE loader will use
        this rule to handle them. This option is mutually exclusive with
        'mno-explicit-reloc',  new reloaction type(s) doesn't require
        special type(s) to be expressed in PeImage.h, PE loader doesn't
        need to do anything about relocation, all of reloaction process
        is done in BaseTools/Source/C/GenFw/Elf64Convert.c.</font></p>
    <div class="moz-signature"
      signature-switch-id="18b8a24a-8ce6-4aca-a108-921eeebcd5e9"><br>
      <div
        style="width:15%;height:1px;background-color:grey;transform:scaleY(0.3)"></div>
      <div style="color:grey;font-size:11px">Thanks,<br>
        Chao<br>
      </div>
    </div>
    <div class="moz-cite-prefix">在 2023/4/3 19:04, Gerd Hoffmann 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:wkju3vayu3e2wtqmxakigrliv7ifj4ecd7ympkgwlacf7h4ckx@jnkqqqujdycf">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 03, 2023 at 10:29:52AM +0000, Michael Brown wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 03/04/2023 11:13, Chao Li wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This problem is because the gcc-12 does not yet to support the option
'mno-explicit-reloc', this option is used to open the new reloaction
type for LoongArch, this new feature is very important for LoongArch,
because it can reduce the binary size and improve code execution
efficiency, so we turn it on when submitting the code to the EDK2 repo.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Is it possible to produce a _functional_ LoongArch64 EDK2 binary without
this option, even if the resulting binary is less efficient?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
MdePkg/Include/IndustryStandard/PeImage.h lists a single loongarch
relocation type only, which I expect being the new type.  So I suspect
the answer is "no" because the edk2 pe loader isn't able to handle the
old relocation type(s).

take care,
  Gerd



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#102384): <a class="moz-txt-link-freetext" href="https://edk2.groups.io/g/devel/message/102384">https://edk2.groups.io/g/devel/message/102384</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://groups.io/mt/98030924/6496846">https://groups.io/mt/98030924/6496846</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:devel+owner@edk2.groups.io">devel+owner@edk2.groups.io</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://edk2.groups.io/g/devel/unsub">https://edk2.groups.io/g/devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:lichao@loongson.cn">lichao@loongson.cn</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------u3DaISOVAHtz3Qrrm9alBZjE--


