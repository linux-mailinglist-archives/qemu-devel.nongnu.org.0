Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50342C99D9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:50:18 +0100 (CET)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1MY-0001Ft-1K
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1KK-000063-EZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:48:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1KI-0007jY-UJ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:48:00 -0500
Received: by mail-wm1-x343.google.com with SMTP id k10so1585116wmi.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rN1pc+R7Zmqt9Zodf0mz4VhjJnowteCY8JjgpV+rkw0=;
 b=h0sb/fdKXGajZ1T6Pj9CRYmypku0CxBYGeQGhwpDWCXqrS1/edaYyOntXLCGiw9jAj
 pbVidyHR7BsgN0WYPKkdcCodUfY2hZOvAOLIT4TK87N2VcpihFDCJTf2F8jxDuN3jKu2
 0xk0l54WW9uYHTgg7zguTyxIi+TWNVSWtCBLoSvKs4z0xjBpv/65sLU33w/ExPQ2fJqo
 X9N2HLCUl2Jx8xHXJLbMYPAHSp7RFIF8E4HulCTFZ5vRPIaFxlMOo7tGCJr3cGPhim/R
 eswL/X+e4XzCaLStrlS4+Ke/N/U3Taw+Ak9N9lRTi7LmXKAcp3tI6xMkueDck03GR0sz
 39uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rN1pc+R7Zmqt9Zodf0mz4VhjJnowteCY8JjgpV+rkw0=;
 b=IUC4oSv9lcZ5IXAkyCHbNmovnPvab/l2MgzxBQxRAs0L5DrIioOcWcvNW8/IQEWepA
 tl4naOOU93pn+CtYZqnFtjofes+HoeiR1oE6HYifzXSD05/LeqaQUbc7zxwEguvzEqGb
 ovrq1N+G+20oMwiEhzzlhTnbcjNfkT4dAZSVZaYOSzdQHhiPQoFHmwA72TSdgbDfhBHb
 yZk3diqVLqyaO0VcMJdL6qm8C4Go1sQ6w6yX0DhHZM1k999vCfB4DlRJ2vqby8WjvkTa
 Tfo1lpxndBeoFiu6LCZoo7CVhmFekYmgKd44uzRBkCLSq6tcSGbvMA35dQ7EAiRtZAx+
 6Kuw==
X-Gm-Message-State: AOAM53249amriXRxF5pcdWfVo+hXv4zPIvzESWpbZE4dzjH5y7WaQJRg
 Vdezn3DEfHRcDlcSFWnNF1I=
X-Google-Smtp-Source: ABdhPJxGCGA7nrXxDXIWW1iSjE5a0nwWhzAFXEDfMupKkBTbzbBWH0YJACV4LXYaZQYng+hyDcy7Vw==
X-Received: by 2002:a05:600c:215:: with SMTP id
 21mr1604906wmi.118.1606812477166; 
 Tue, 01 Dec 2020 00:47:57 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e1sm2086643wra.22.2020.12.01.00.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 00:47:56 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow use of hex/bin format for argument
 field values
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201130122639.2431070-1-f4bug@amsat.org>
 <080ab4ac-aa73-a5c6-6dec-7c91d0337111@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <77f905bd-53a8-9054-64b0-8572c291fab4@amsat.org>
Date: Tue, 1 Dec 2020 09:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <080ab4ac-aa73-a5c6-6dec-7c91d0337111@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:22 PM, Richard Henderson wrote:
> On 11/30/20 6:26 AM, Philippe Mathieu-Daudé wrote:
>>          # 'Foo=number' sets an argument field to a constant value
>> -        if re.fullmatch(re_C_ident + '=[+-]?[0-9]+', t):
>> +        if re.fullmatch(re_C_ident + '=[+-]?(0[bx])?[0-9]+', t):
>>              (fname, value) = t.split('=')
>> -            value = int(value)
>> +            if re.fullmatch('[+-]?0b[0-9]+', value):
>> +                base = 2
>> +            elif re.fullmatch('[+-]?0x[0-9]+', value):
>> +                base = 16
>> +            else:
>> +                base = 10
>> +            value = int(value, base)
>>              flds = add_field(lineno, flds, fname, ConstField(value))
>>              continue
> 
> Well, the regxps are off.  No letters for the hex, and 9 accepted for binary.
> I think with the right regexps, just trusting int(value, 0) is good enough.

OK!

> 
> So maybe something like
> 
>   re_C_ident + "=[+-]?([0-9]+|0x[0-9a-fA-F]+|0b[01]+)"

Better indeed :)

Thanks,

Phil.

