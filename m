Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51726D44E2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:52:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJeu-0007A1-J8; Mon, 03 Apr 2023 08:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichao@loongson.cn>)
 id 1pjHCJ-00065N-3h
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:13:59 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lichao@loongson.cn>) id 1pjHCF-0001dW-Uf
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:13:58 -0400
Received: from loongson.cn (unknown [10.40.24.149])
 by gateway (Coremail) with SMTP id _____8BxMI_YpipkugIWAA--.34174S3;
 Mon, 03 Apr 2023 18:13:44 +0800 (CST)
Received: from [10.40.24.149] (unknown [10.40.24.149])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxB73Vpipkx14UAA--.16654S3; 
 Mon, 03 Apr 2023 18:13:42 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------q1W7P05EB1Ffogyg0VeLiJ2W"
Message-ID: <aa56f4de-e50e-7a7f-3e0e-39e5fa20df29@loongson.cn>
Date: Mon, 3 Apr 2023 18:13:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [edk2-devel] On integrating LoongArch EDK2 firmware into QEMU
 build process
To: devel@edk2.groups.io, maobibo@loongson.cn
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>,
 Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
 <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
 <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
From: Chao Li <lichao@loongson.cn>
In-Reply-To: <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
X-CM-TRANSID: AQAAf8DxB73Vpipkx14UAA--.16654S3
X-CM-SenderInfo: xolfxt3r6o00pqjv00gofq/1tbiAQAKCGQpcHcbxAABsX
X-Coremail-Antispam: 1Uk129KBjvJXoWxCFWDtrW5WF1fKrWxuryrCrg_yoW5uw15pF
 W3Z3sxtF9Yqr9Y93y8Gw17WFsYv395Kry5XF98K3ykZr43uFWIvw18KrZYvFyUuws09ayj
 qr1rX3s5G3WUZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG
 8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aV
 AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8GjcxK6IxK0xII
 j40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjxUz4SrUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=lichao@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.37, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Apr 2023 08:51:34 -0400
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
--------------q1W7P05EB1Ffogyg0VeLiJ2W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bibo,

Thanks for Cc to me.


Hi Gerd,

This problem is because the gcc-12 does not yet to support the option 
'mno-explicit-reloc', this option is used to open the new reloaction 
type for LoongArch, this new feature is very important for LoongArch, 
because it can reduce the binary size and improve code execution 
efficiency, so we turn it on when submitting the code to the EDK2 repo.

gcc-13 will support this new feature, so we expect this issue to be 
resolved when using gcc-13, which may be released at this month.

If Fedora38 does not plan to use gcc-13 now, I suggest that CI can 
download a LoongArch cross gcc-13 when creating a docker image, just 
like EDK2 CI process. You can refer following link for more information: 
https://github.com/tianocore/containers/blob/main/Fedora-37/Dockerfile . 
EDK2 CI uses Fedora35 and Fedora37 docker images for LoongArch,  they 
will download a LoongArch cross gcc-13 when the CI targets is LoongArch.

We are really sorry about that, I think this solution will make more 
work for you, but I think it is the best way for now, and I believe it 
will be solved when Fedora uses gcc-13 in the future.


Thanks,
Chao
在 2023/4/3 16:51, maobibo 写道:
> Cc to Chao Li who is maintainer of edk2 about LoongArch support.
>
> Hi Chao,
>
> Fedora38 is used to build edk2 binary in qemu CI, cross gcc-12 is
> integrated on Fedora38. There is one issue when gcc-12 is used to
> build edk2 loongarch like this:
>> ... but when trying to use them to compile the loongarch firmware gcc
>> throws errors:
>>
>> loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-reloc
> what is your option about this issue?
>
> Regards
> Bibo, Mao
>
> 在 2023/4/1 13:11, maobibo 写道:
>>
>> On 2023/3/31 20:12, Gerd Hoffmann wrote:
>>> On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
>>>> Xuerui,
>>>>
>>>> Thanks for your mail, it is a good suggestion. Now we are planing to
>>>> move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
>>>> bios supporting LoongArch can be auto compiled and uploaded to qemu
>>>> repo. Only that process is somwhat slow since lacking of hands,
>>>> however we are doing this.
>>> Good, so I think it makes sense for qemu to just wait for that to
>>> happen.
>>>
>>> Related question:  What are the requirements to build the firmware?
>>> Fedora 38 ships cross compiler packages ...
>>>
>>>     binutils-loongarch64-linux-gnu-2.39-3.fc38.x86_64
>>>     gcc-loongarch64-linux-gnu-12.2.1-5.fc38.x86_64
>>>
>>> ... but when trying to use them to compile the loongarch firmware gcc
>>> throws errors:
>>>
>>> loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-relocs’
>>>
>>> I suspect gcc-12 is just too old?
>> There is a little different about relocation between gcc-12 and gcc-13 on LoongArch, gcc-13 is required for edk2 compiler now.
>>
>> However I think it is actually is one issue if gcc-12 can not be used and gcc-12 is popular latest compiler for all architectures. We will solve this problem.
>>
>> Regards
>> Bibo, Mao
>>
>>
>>> take care,
>>>     Gerd
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#102377):https://edk2.groups.io/g/devel/message/102377
> Mute This Topic:https://groups.io/mt/98030924/6496846
> Group Owner:devel+owner@edk2.groups.io
> Unsubscribe:https://edk2.groups.io/g/devel/unsub  [lichao@loongson.cn]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------q1W7P05EB1Ffogyg0VeLiJ2W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="2">Hi Bibo,</font></p>
    <p><font size="2">Thanks for Cc to me.</font></p>
    <p><br>
    </p>
    <p><font size="2">Hi Gerd,</font></p>
    <p><font size="2">This problem is because the gcc-12 does not yet to
        support the option 'mno-explicit-reloc', this option is used to
        open the new reloaction type for LoongArch, this new feature is
        very important for LoongArch, because it can reduce the binary
        size and improve code execution efficiency, so we turn it on
        when submitting the code to the EDK2 repo.</font></p>
    <p><font size="2">gcc-13 will support this new feature, so we expect
        this issue to be resolved when using gcc-13, which may be
        released at this month.</font></p>
    <p><font size="2">If Fedora38 does not plan to use gcc-13 now, I
        suggest that CI can download a LoongArch cross gcc-13 when
        creating a docker image, just like EDK2 CI process. You can
        refer following link for more information:
        <a class="moz-txt-link-freetext" href="https://github.com/tianocore/containers/blob/main/Fedora-37/Dockerfile">https://github.com/tianocore/containers/blob/main/Fedora-37/Dockerfile</a>
        . EDK2 CI uses Fedora35 and Fedora37 docker images for
        LoongArch,  they will download a LoongArch cross gcc-13 when the
        CI targets is LoongArch.</font></p>
    <p><font size="2">We are really sorry about that, I think this
        solution will make more work for you, but I think it is the best
        way for now, and I believe it will be solved when Fedora uses
        gcc-13 in the future.<br>
      </font></p>
    <div class="moz-signature"
      signature-switch-id="18b8a24a-8ce6-4aca-a108-921eeebcd5e9"><br>
      <div
        style="width:15%;height:1px;background-color:grey;transform:scaleY(0.3)"></div>
      <div style="color:grey;font-size:11px">Thanks,<br>
        Chao<br>
      </div>
    </div>
    <div class="moz-cite-prefix">在 2023/4/3 16:51, maobibo 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn">
      <pre class="moz-quote-pre" wrap="">Cc to Chao Li who is maintainer of edk2 about LoongArch support.

Hi Chao, 

Fedora38 is used to build edk2 binary in qemu CI, cross gcc-12 is
integrated on Fedora38. There is one issue when gcc-12 is used to
build edk2 loongarch like this:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">... but when trying to use them to compile the loongarch firmware gcc
throws errors:

loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-reloc
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
what is your option about this issue?

Regards
Bibo, Mao

在 2023/4/1 13:11, maobibo 写道:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 2023/3/31 20:12, Gerd Hoffmann wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Xuerui,

Thanks for your mail, it is a good suggestion. Now we are planing to
move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
bios supporting LoongArch can be auto compiled and uploaded to qemu
repo. Only that process is somwhat slow since lacking of hands,
however we are doing this.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Good, so I think it makes sense for qemu to just wait for that to
happen.

Related question:  What are the requirements to build the firmware?
Fedora 38 ships cross compiler packages ...

   binutils-loongarch64-linux-gnu-2.39-3.fc38.x86_64
   gcc-loongarch64-linux-gnu-12.2.1-5.fc38.x86_64

... but when trying to use them to compile the loongarch firmware gcc
throws errors:

loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-relocs’

I suspect gcc-12 is just too old?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">There is a little different about relocation between gcc-12 and gcc-13 on LoongArch, gcc-13 is required for edk2 compiler now.

However I think it is actually is one issue if gcc-12 can not be used and gcc-12 is popular latest compiler for all architectures. We will solve this problem.

Regards
Bibo, Mao


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
take care,
   Gerd

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#102377): <a class="moz-txt-link-freetext" href="https://edk2.groups.io/g/devel/message/102377">https://edk2.groups.io/g/devel/message/102377</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://groups.io/mt/98030924/6496846">https://groups.io/mt/98030924/6496846</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:devel+owner@edk2.groups.io">devel+owner@edk2.groups.io</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://edk2.groups.io/g/devel/unsub">https://edk2.groups.io/g/devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:lichao@loongson.cn">lichao@loongson.cn</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------q1W7P05EB1Ffogyg0VeLiJ2W--


