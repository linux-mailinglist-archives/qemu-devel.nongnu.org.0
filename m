Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC262F3C45
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:22:37 +0100 (CET)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzS3g-0008BV-Ia
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzS15-0006t2-Nc
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:19:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzS13-0001Yz-Hu
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:19:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so3271110wmz.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e3Px7M/V4tuoVvPuEf5ywbUNHF6NMHXkmYFcbWb/MpY=;
 b=G5YgU/ctK6Qfp9erok+hQ2lBxOwhgda3eskFgrtZR/nb8QJX7tmmQHVUxhds4COpPw
 DUmTHqAdX7/NFP+lCHH7HU8F2b9Il668EY1JDBvrK5ljb8gr9aTIHLQzsufXEYaiHX9V
 urD+oNW1GnZHw7Pn+0keZlV4Rgc36ryG5x4RoriZJ/Zdp2j45P/EGetWDGBBQ9PNHbGH
 90YHzbclfB8wLjdPdvSr+Ohjhtn1esPn5zjXt43CSI2UAWMkLpgurbWvQAtK0gjcsxxa
 6+mcuaiQXxWs45eCFnL9zXEUiAKcXoOW9ccVp2Z1PAOY0GxSaj1Jiq/18FsPIH/TLsda
 xpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e3Px7M/V4tuoVvPuEf5ywbUNHF6NMHXkmYFcbWb/MpY=;
 b=jjgbYUTmyzksKEzdBFDrIb+dRr9Vh/yoJZVGO4jVXByDFPmubps49jATmxnubWS53E
 rekNJsGoYeZwX4kg+/440fvqZjHlfzNxYAnH70NH61pN6fiSd+FF44ksOCJcWuItVZte
 XCkLqIzmXhmETmoawuNfQpMtcOgS2d2ivoXu2B178TOHYubmHEnn32m5OP+Opd5eETB4
 TRKlVF/4ih0EONRk+6QsU4fudvfleIRbNu1g8xNf/15gCGToF7BWhYehWEGO7TagDII6
 b0qdzZXdyttlWLEXTusWdjLRJ+12+dzAljc3wr97mKXhNWJagUc9NsqWGTKbdwX7Dg5A
 Q/hA==
X-Gm-Message-State: AOAM532dejd3+iyv0uEusBwczibG1F0qJDAYkdR910ai/BvP0m/1NR34
 caXW19VmaN2wslQkqqiJ/Zw=
X-Google-Smtp-Source: ABdhPJxanEJIOYcTopaBi84Rb55WBoAzfG9Yq2uq+98ZHjF2PDkwiynCbTMWgG7ZckxMcu0ZxD/2Ww==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr1195757wma.147.1610489992092; 
 Tue, 12 Jan 2021 14:19:52 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id h184sm6162753wmh.23.2021.01.12.14.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:19:51 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210112184156.2014305-1-f4bug@amsat.org>
 <20210112210516.GB4161@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <07d6b362-8d32-5c8e-2d65-aa29a1a38e42@amsat.org>
Date: Tue, 12 Jan 2021 23:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112210516.GB4161@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 10:05 PM, Eduardo Habkost wrote:
> On Tue, Jan 12, 2021 at 07:41:56PM +0100, Philippe Mathieu-Daudé wrote:
>> Some ISA use a dot in their opcodes. Allow the decodetree
>> script to process them. The dot is replaced by an underscore
>> in the generated code.
> 
> Will something break if we just use underscores instead of dots
> in the input file?

No, but then the opcode doesn't really match the spec.

> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  scripts/decodetree.py | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
>> index 47aa9caf6d1..b7572589e64 100644
>> --- a/scripts/decodetree.py
>> +++ b/scripts/decodetree.py
>> @@ -49,7 +49,7 @@
>>  re_arg_ident = '&[a-zA-Z0-9_]*'
>>  re_fld_ident = '%[a-zA-Z0-9_]*'
>>  re_fmt_ident = '@[a-zA-Z0-9_]*'
>> -re_pat_ident = '[a-zA-Z0-9_]*'
>> +re_pat_ident = '[a-zA-Z0-9_.]*'
> 
> If pattern identifiers are going to follow different rules,
> doesn't this need to be documented at docs/devel/decodetree.rst?

I checked and luckily for me the opcode pattern identifiers is
not documented <:)

> 
>>  
>>  def error_with_file(file, lineno, *args):
>>      """Print an error message from file:line and args and exit."""
>> @@ -1082,6 +1082,7 @@ def parse_file(f, parent_pat):
>>          elif re.fullmatch(re_fmt_ident, name):
>>              parse_generic(start_lineno, None, name[1:], toks)
>>          elif re.fullmatch(re_pat_ident, name):
>> +            name = name.replace('.', '_')
>>              parse_generic(start_lineno, parent_pat, name, toks)
> 
> Do we want error messages generated by the script to use the
> modified identifier with underscores, or the original identifier
> with dots?  (This patch does the former)

You are right, we want the former in the error message (the input
format).

Thanks,

Phil.

