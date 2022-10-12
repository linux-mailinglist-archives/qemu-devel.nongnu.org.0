Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E55FC499
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:59:47 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaOo-0007LE-8F
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oiaIr-0001Zq-4S
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:53:37 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49674
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oiaIn-0002oY-VB
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1665575606; bh=t5Z4NrWpQcjNkEhFmyAHpRKbrFHiuLf0N4styzlXpPw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oqy0X35YHnFB10oaeSYSZZsf+/0Nh5uxJf9bY34XLSETdS6sV0p7GAswFXwNJtfo5
 A6td44p31hpq9tsRmCNOY4Lz4VQRKssmZTI9BtPHFmXqh0Jxa1nAkADfkTPLe4AIjQ
 Gnmt/AnVxiqKvxNXtgGYvqqqKB6Nx1zCgMCrctoo=
Received: from [100.100.57.122] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A6F35600CF;
 Wed, 12 Oct 2022 19:53:26 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------JImr0rU2UZtx0mknNWZrleEj"
Message-ID: <5da652b8-bee2-9c34-29c6-717068ed39fb@xen0n.name>
Date: Wed, 12 Oct 2022 19:53:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH 2/2] tcg/loongarch64: Add direct jump support
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, Qi Hu <huqi@loongson.cn>,
 WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <cover.1665405913.git.huqi@loongson.cn>
 <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
 <d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name>
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.528, SPF_HELO_NONE=0.001,
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
--------------JImr0rU2UZtx0mknNWZrleEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/10/12 19:34, WANG Xuerui wrote:
>> +    tcg_insn_unit i1, i2;
>> +
>> +    ptrdiff_t offset = addr - jmp_rx;
>> +
>> +    if (offset == sextreg(offset, 0, 28)) {
>> +        i1 = OPC_B | ((offset >> 18) & 0x3ff) | ((offset << 8) & 
>> 0x3fffc00);
> Use encode_sd10k16_insn instead. No need to juggle the bits yourself 
> and you get nice range assertion for free.
>> +        i2 = NOP; 

One more thing. I think there's a certain trend of making sure 
potentially bad things don't happen and stopping speculative insn 
fetch/execution by making the NOP here a BREAK instead. Although I'm not 
sure if LoongArch or TCG is affected by the various speculation 
vulnerabilities out there, to any degree, it might not hurt to just make 
it a BREAK? Performance shouldn't get affected in any way but one could 
probably sleep better with a guaranteed termination of execution flow 
after the B.

And you should change the "tcg_out32(s, NOP)" some lines above into just 
a "tcg_out_andi(s, 0, 0, 0)". This way you wouldn't have to define a NOP 
constant at all... Or, maybe better, make a "tcg_out_nop" helper right 
after the insn-defs include and after the "TCG intrinsics" section (it 
isn't one, but there isn't a better place), then use it here, so you get 
to include some more comments while still not having to define a NOP. Like:

static void tcg_out_nop(TCGContext *s)
{
	/* Conventional NOP in LoongArch is `andi zero, zero, 0`.  */
	tcg_out_opc_andi(s, 0, 0, 0);
}

--------------JImr0rU2UZtx0mknNWZrleEj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/10/12 19:34, WANG Xuerui wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name">
      <blockquote type="cite">+    tcg_insn_unit i1, i2;
        <br>
        +
        <br>
        +    ptrdiff_t offset = addr - jmp_rx;
        <br>
        +
        <br>
        +    if (offset == sextreg(offset, 0, 28)) {
        <br>
        +        i1 = OPC_B | ((offset &gt;&gt; 18) &amp; 0x3ff) |
        ((offset &lt;&lt; 8) &amp; 0x3fffc00);
        <br>
      </blockquote>
      Use encode_sd10k16_insn instead. No need to juggle the bits
      yourself and you get nice range assertion for free.
      <br>
      <blockquote type="cite">+        i2 = NOP;
      </blockquote>
    </blockquote>
    <p>One more thing. I think there's a certain trend of making sure
      potentially bad things don't happen and stopping speculative insn
      fetch/execution by making the NOP here a BREAK instead. Although
      I'm not sure if LoongArch or TCG is affected by the various
      speculation vulnerabilities out there, to any degree, it might not
      hurt to just make it a BREAK? Performance shouldn't get affected
      in any way but one could probably sleep better with a guaranteed
      termination of execution flow after the B.</p>
    <p>And you should change the "tcg_out32(s, NOP)" some lines above
      into just a "tcg_out_andi(s, 0, 0, 0)". This way you wouldn't have
      to define a NOP constant at all... Or, maybe better, make a
      "tcg_out_nop" helper right after the insn-defs include and after
      the "TCG intrinsics" section (it isn't one, but there isn't a
      better place), then use it here, so you get to include some more
      comments while still not having to define a NOP. Like:<br>
    </p>
    <pre>static void tcg_out_nop(TCGContext *s)
{
	/* Conventional NOP in LoongArch is `andi zero, zero, 0`.  */
	tcg_out_opc_andi(s, 0, 0, 0);
}</pre>
  </body>
</html>

--------------JImr0rU2UZtx0mknNWZrleEj--

