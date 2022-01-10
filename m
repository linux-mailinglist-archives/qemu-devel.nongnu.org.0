Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79D489C17
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:22:56 +0100 (CET)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wVb-0005WP-DK
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6wLM-000361-IV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:12:22 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43920
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6wLJ-0005fy-5d
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:12:20 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4A11B600FB;
 Mon, 10 Jan 2022 23:11:59 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641827519; bh=kRfW26g/qgQtbqMIeYPOtSM2fP/YZ4OYhhMyOPuZlxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C0IrR8XPSx9ze4zk3ils5y8leNjZmZAmyfukmgjN/zxAYN832Wq+e6jYXX2N8KbqO
 SOTO5MLJAE5XUDPgA3dBCehLCJaUhqMxO4hMzq1RbeFiFrEfSYgjyHs5MxlI5lzGEz
 iHp2DXfALha4NTE8C++BFmotJ4RdUo4hn0NuCafE=
Content-Type: multipart/alternative;
 boundary="------------JMpGovTZLMvWom0tSBIE0Ic5"
Message-ID: <7e47cd41-b62f-161f-a8f1-b8a7b17acd15@xen0n.name>
Date: Mon, 10 Jan 2022 23:11:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
 <ed3902cd-261e-2ee3-6fe4-8171bbbc03f4@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <ed3902cd-261e-2ee3-6fe4-8171bbbc03f4@loongson.cn>
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
--------------JMpGovTZLMvWom0tSBIE0Ic5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 1/10/22 21:00, gaosong wrote:
>
> Hi,
>
> On 2022/1/9 下午5:25, WANG Xuerui wrote:
>>> +
>>> +const char * const fregnames[32] = {
>>> +    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
>>> +    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
>>> +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
>>> +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
>>> +};
>>> +
>>> +static const char * const excp_names[EXCP_LAST + 1] = {
>>> +    [EXCP_SYSCALL] = "Syscall",
>>> +    [EXCP_BREAK] = "Break",
>>> +    [EXCP_INE] = "Instruction Non-existent",
>> Nit: "Instruction Non-Existent" (or is there any authoritative source 
>> for this spelling? the English translation of the manual?) 
> I must admit that your English is really good, But 'Instruction Non-existent' is what you pointed out in v7.  I have a history [1],
> [1]https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/
> > +static const char * const excp_names[EXCP_LAST + 1] = {
> > +    [EXCP_ADE] = "Address error",
> > +    [EXCP_SYSCALL] = "Syscall",
> > +    [EXCP_BREAK] = "Break",
> > +    [EXCP_INE] = "Inst. Not Exist",
> Nit: "Instruction Non-existent", no need to shorten "instruction" like
> this IMO; no other similar usages exist so this would not be consistent.
> In any case thank you for your other suggestions.

Well, I do make my mistakes sometimes, and I'll explain a bit: in the 
former review what I noticed was the broken English, and I pointed that 
out, but meanwhile I've forgotten I had done that, and why I didn't 
write "Non-Existent" was because the "Address error" wasn't in full 
Title Case. However, in this revision, what I noticed is the 
inconsistent casing (with EXCP_ADE removed, all other strings are in 
Title Case now), hence the reply.

No need to go full self-defense over this; I think what matters after 
all is just consistency.

>
> Thanks
> Song
--------------JMpGovTZLMvWom0tSBIE0Ic5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 1/10/22 21:00, gaosong wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ed3902cd-261e-2ee3-6fe4-8171bbbc03f4@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi,<br>
      </p>
      <div class="moz-cite-prefix">On 2022/1/9 下午5:25, WANG Xuerui
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name">
        <blockquote type="cite" style="color: #000000;">+ <br>
          +const char * const fregnames[32] = { <br>
          +    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7", <br>
          +    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15", <br>
          +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23", <br>
          +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31", <br>
          +}; <br>
          + <br>
          +static const char * const excp_names[EXCP_LAST + 1] = { <br>
          +    [EXCP_SYSCALL] = "Syscall", <br>
          +    [EXCP_BREAK] = "Break", <br>
          +    [EXCP_INE] = "Instruction Non-existent", <br>
        </blockquote>
        Nit: "Instruction Non-Existent" (or is there any authoritative
        source for this spelling? the English translation of the
        manual?) </blockquote>
      <pre>I must admit that your English is really good, But 'Instruction Non-existent' is what you pointed out in v7.  I have a history [1], 
</pre>
      <pre>[1] <a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/" moz-do-not-send="true">https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/</a></pre>
      <pre class="body-full" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 5px; margin: 0px 0px 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(255, 255, 255); border: none; border-radius: 4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&gt; +static const char * const excp_names[EXCP_LAST + 1] = {
&gt; +    [EXCP_ADE] = "Address error",
&gt; +    [EXCP_SYSCALL] = "Syscall",
&gt; +    [EXCP_BREAK] = "Break",
&gt; +    [EXCP_INE] = "Inst. Not Exist",
Nit: "Instruction Non-existent", no need to shorten "instruction" like 
this IMO; no other similar usages exist so this would not be consistent.</pre>
      <pre>In any case thank you for your other suggestions.</pre>
    </blockquote>
    <p>Well, I do make my mistakes sometimes, and I'll explain a bit: in
      the former review what I noticed was the broken English, and I
      pointed that out, but meanwhile I've forgotten I had done that,
      and why I didn't write "Non-Existent" was because the "Address
      error" wasn't in full Title Case. However, in this revision, what
      I noticed is the inconsistent casing (with EXCP_ADE removed, all
      other strings are in Title Case now), hence the reply.<br>
    </p>
    <p>No need to go full self-defense over this; I think what matters
      after all is just consistency.<br>
    </p>
    <blockquote type="cite"
      cite="mid:ed3902cd-261e-2ee3-6fe4-8171bbbc03f4@loongson.cn">
      <pre>

Thanks
Song
</pre>
    </blockquote>
  </body>
</html>

--------------JMpGovTZLMvWom0tSBIE0Ic5--

