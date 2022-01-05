Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B494859F6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:22:42 +0100 (CET)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Cnw-0007m0-Sa
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Cld-0005wK-2I
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:20:19 -0500
Received: from [2607:f8b0:4864:20::1031] (port=52896
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Clb-00084j-17
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:20:16 -0500
Received: by mail-pj1-x1031.google.com with SMTP id co15so220514pjb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 12:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A7R+PaPF52zWl0O8gcrZ0otibH1jNgSWnkOGh5vSpWU=;
 b=k9wMbbGICt8uN9BTTcGa8EUIXUVzDsviQydikeheRjaNE7j3WMrBn8e1qcFzdSC/6k
 HVvX+GBhqH/jL0/MC2GLnJe72xSMWciMX6l6j9NOpoKcW8geJ6h7exT9FmNBkY2b6H5G
 PXNR0NecCRzQEf4Dt3rvYCEoCYkVUbmKuRiQUfDMk8TA5ezB5fJT3PRcjmeUj2zfyyBd
 FoviYOri6p25UTU10iPgC4uPCAFg5gZ1fyYO0QjuG1VOI3B/DFo//og8QreAwA1dMhKj
 Wk4Qnf7oDShWMOoAmWp9XNABi1rN64Gdv6khZ6hW3DMo+9jlUTwgHXKjBRtyFbjxiHTd
 Am9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A7R+PaPF52zWl0O8gcrZ0otibH1jNgSWnkOGh5vSpWU=;
 b=EDdYbVTzsb1DrhZ+GP7R/MX4jR/UuukcfHao9GVfe/okfPCJE3YHn7EMYqwx1aEQ6o
 krNhp6YQxjmVO6YopZloCoO8exEdeHiCSeTG4CCUQS9yn3xjwmDQtsOeOe9TEot/Wdts
 yjC7/XlTO1yetn2QssZHrv7xd1yOQPsdXIsLbVhMlJeJnrZexh42uHZgqM+nvBfbpO1l
 tjL2i/1gOiG5NssBtacD6cOs4nTc4PYgkSN/Mq+saj9EXBnTpEOB+8WXPLgMP5ujR94Z
 hzGzLxZyFg1mH99WkFuLB0bOzBDHR25jXWapJa9U3PVNRWjhenbHHe8AJDR3fg4FC+el
 xNHQ==
X-Gm-Message-State: AOAM530XqY9i/sH6GHRCxJxJdqVb1CideO7l2Fd2EmwRTHkD5ISyd14i
 HxxXUh7mGn7/Nl5/qbe7yrI6Ug==
X-Google-Smtp-Source: ABdhPJybPAi71LKPT/XVhG8aegyz+2CEHMDXOeXGhsTq1CuAWaZcOd1QPY4R4ACSKBZQAQoVestbpQ==
X-Received: by 2002:a17:90a:4a11:: with SMTP id
 e17mr1673514pjh.237.1641414013483; 
 Wed, 05 Jan 2022 12:20:13 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mh3sm3699741pjb.26.2022.01.05.12.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 12:20:13 -0800 (PST)
Subject: Re: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
To: "Schwarz, Konrad" <konrad.schwarz@siemens.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
 <676fcd9a-4a1a-2c03-e0c6-60128e3a50ae@linaro.org>
 <395769321dbe459d803ba78f610eaf3a@siemens.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1be2c825-c153-1efd-17c5-da9e3928aefc@linaro.org>
Date: Wed, 5 Jan 2022 12:20:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <395769321dbe459d803ba78f610eaf3a@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 6:04 AM, Schwarz, Konrad wrote:
> So the problem is that these files are generated -- somewhat ironically
> via XSLT from complete GDB target descriptions, which are themselves
> generated from a mixture of AWK and shell scripts that I have in a
> different project and which you would probably not want to have
> contributed.  Those scripts generate a variety of other definitions
> for C and assembly besides the GDB XML target descriptions, so would
> probably need to be reduced for just QEMU usage.

You may be right that we don't want your original scripts, but that also  implies that the 
fact your files are generated is irrelevant to us.  Why should we care?  I think it makes 
more sense to manually edit csr.c and be done with it.

>  I tried to
> work around this by using C99's designated initializer syntax,
> adding in the new data at the end of the table, and using specific
> enough initializers to not disturb the existing data.
> 
> However, this did not work out: despite using very specific initializers,
> the previously initialized CSR structures in the csr_ops array
> were reset to their default values, i.e., 0, breaking the code.
> This was not the way I expected this feature to work in C99 and
> my reading of the C99 standard does not support this either.  But
> that’s what GCC does, at least on my machine.

I'm sure your syntax was incorrect.  You probably used

>>> +  [CSR_CYCLE] { .gdb_type = "uint64", .gdb_group = "user" },

which does indeed overwrite the entire entry in the array.  You could have used

     [CSR_CYCLE].gdb_type = "uint64"

which will just set the one field.

That said, I don't think that we want this distributed initialization.

>> I think you should be able to use "unsigned long" as a proxy for the native register size.
> 
> `unsigned long' is not listed in section `G.3 Predefined Target Types'
> of the GDB manual.

Hmm.  I didn't look at the docs; I looked at gdbtypes.h and saw the existence of 
builtin_unsigned_long.  I suppose this might not be plumbed into the xml.

In which case, since we're generating everything dynamically anyway, we could just as 
easily make NULL map to "uint<XLEN>" when generating the xml.  Or instead of a string, 
perhaps some enum which distinguishes data_ptr/code_ptr/uint<xlen>/uint<min(n,xlen)> which 
is then filled in during generation.

> I also have to say that GDB does not handle the target descriptions
> correctly in all cases.  In particular, I suspect a bug when
> a field crosses a 32-bit boundary: GDB is showing twice the
> field value.

I wonder if this is an issue of using "uint32" for the field type?  You could, for the 
moment, drop all of the bitfield descriptions and leave the interpretation to the user. 
Giving an accurate integral value for the register as a whole is more helpful than giving 
inaccurate field values.

> As I wrote Alistair, I'm not sure this reasoning is correct.  Even if a 64-bit
> machine is running in 32-bit mode, the machine itself remains a 64-bit machine,
> and it's CSRs are so too.

And that's where we're mis-communicating.

We're working toward having exactly one qemu-system-riscv binary, which will emulate both 
RV32 and RV64 (and RV128) cpus, selected by -cpu foo.  At which point there will be no 
CONFIG_RISCV32 define at all.  The way to distinguish the three cases is 
cpu->env.misa_mxl_max.

> We can have the situation of a 64-bit kernel and 32-bit
> user-mode process; would we want the CSRs to change when switching between the two?

Well ideally yes...

> Even if we did, the GDB remote protocol does not have the ability to say "API change,
> please reread the target description" (AFAIK).

... but as you rightly note, gdb can't handle it.


r~

