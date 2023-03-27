Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E76CAE05
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 20:59:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgs2u-0002HS-Ke; Mon, 27 Mar 2023 14:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgs2s-0002Gw-GX
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:58:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgs2q-0006Tf-O9
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:58:18 -0400
Received: by mail-wr1-x431.google.com with SMTP id v1so9850855wrv.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679943495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YulKSywmoEZhU1eaiXxBiciG0ib2EKj2IC7qqRcGzWg=;
 b=ncrwu/cN//AYbTxZ/DHirRmc/lgnP4o0T4CcK9rGylnv1HsFj2Z42m1MfEA6yyQhyj
 6PrH6lNUZvXn3cCg3Xoa9K23EI3cJBQFuhCL60Ei28Zri1hGzgeQS7jE4+ggSQLOAr2H
 7nHSoYSpMIb704X49hgUupR7uWn8doa79M9/3YtkHw5Kz22sb0lNwjcxCFJwQ0KLJSq9
 wQt5nGQd0UoUovDYhttaZgfn0iy/hZckQdqBgcp4jVeb2dxKR7fhcO43VKF64WP3z8bc
 /Qpiss2NzTRPaFlveBBxf7DG117m0qyfknM4Zbd3l9nKJscQ4VmBUsQr95DDDGPaWOjM
 Hd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679943495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YulKSywmoEZhU1eaiXxBiciG0ib2EKj2IC7qqRcGzWg=;
 b=yDjiHABprTLg+DwtnYWBsnJvdBxoCjnfW5xGrzHwS91DGET7QNfme6aqtsSlBRsx+O
 jQY2FO1k2mkWdtziCtIonyL0hXZOqNYqVCpqCBukDw8KTazd614EGid2QBXqd8xKb/T6
 vjZvjQTkvGQVdA/f0wpYOI4vu+i36IVAzys6/KJQE1s/Ma+X983QAtQQ2PHdPbNQKS9f
 ep3S0Kdz+jTfCX565KeO02UNvL6SKk+o9Q50zJUG+9JDI9tsaNloshQtllsBWnEeBZn5
 vSODGOH7TMi6BSInDq8HiS8YW0MBS2ho7j2SQySS80m3+rIZmSn+Eox3eqgimOMsVdO1
 FXxQ==
X-Gm-Message-State: AAQBX9e4vkggkAJn0bw6iRsNC8pSvYiloVcSt0Qjd2vfDYjT/mHWQuRT
 4nGDnGtQp49onjCDxA0lFyVGMg==
X-Google-Smtp-Source: AKy350b9SmtYaKojegfFddKSPRTZtnjRPhfRCvCCc7mQlNLUbO8IAD35bZOQmY4cXrkBQSWihQGi5Q==
X-Received: by 2002:a05:6000:1a47:b0:2d8:4f02:66b6 with SMTP id
 t7-20020a0560001a4700b002d84f0266b6mr10915288wry.9.1679943495202; 
 Mon, 27 Mar 2023 11:58:15 -0700 (PDT)
Received: from [192.168.69.115] (4be54-h02-176-184-9-157.dsl.sta.abo.bbox.fr.
 [176.184.9.157]) by smtp.gmail.com with ESMTPSA id
 c15-20020adffb0f000000b002c6e8cb612fsm25581848wrr.92.2023.03.27.11.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:58:14 -0700 (PDT)
Message-ID: <e4a0b994-965a-2bd4-5517-b11e31b002ee@linaro.org>
Date: Mon, 27 Mar 2023 20:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
 Julio Faracco <jcfaracco@gmail.com>
References: <20230327151349.97572-1-philmd@linaro.org>
 <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

+Marc-André & Paolo

On 27/3/23 19:08, Stefan Weil wrote:
> Am 27.03.23 um 17:13 schrieb Philippe Mathieu-Daudé:
> 
>> When liblzfe (Apple LZFSE compression library) is present
>> (for example installed via 'brew') on Darwin, QEMU build
>> fails as:
>>
>>    Has header "lzfse.h" : YES
>>    Library lzfse found: YES
>>
>>      Dependencies
>>        lzo support                  : NO
>>        snappy support               : NO
>>        bzip2 support                : YES
>>        lzfse support                : YES
>>        zstd support                 : YES 1.5.2
>>
>>      User defined options
>>        dmg                          : enabled
>>        lzfse                        : enabled
>>
>>    [221/903] Compiling C object libblock.fa.p/block_dmg-lzfse.c.o
>>    FAILED: libblock.fa.p/block_dmg-lzfse.c.o
>>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: error: this 
>> function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>>    LZFSE_API size_t lzfse_encode_scratch_size();
>>                                              ^
>>                                               void
>>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:94:43: error: this 
>> function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>>    LZFSE_API size_t lzfse_decode_scratch_size();
>>                                              ^
>>                                               void
>>    2 errors generated.
>>    ninja: build stopped: subcommand failed.
>>
>> This issue has been reported in the lzfse project in 2016:
>> https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719
>>
>> Since the project seems unmaintained, simply ignore the
>> strict-prototypes warning check for the <lzfse.h> header,
>> similarly to how we deal with the GtkItemFactoryCallback
>> prototype from <gtk/gtkitemfactory.h>, indirectly included
>> by <gtk/gtk.h>.
>>
>> Cc: Julio Faracco <jcfaracco@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   block/dmg-lzfse.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
>> index 6798cf4fbf..0abc970bf6 100644
>> --- a/block/dmg-lzfse.c
>> +++ b/block/dmg-lzfse.c
>> @@ -23,7 +23,12 @@
>>    */
>>   #include "qemu/osdep.h"
>>   #include "dmg.h"
>> +
>> +/* Work around an -Wstrict-prototypes warning in LZFSE headers */
> 
> 
> "Work around a -Wstrict-prototypes" ("a" instead of "an")?
> 
> 
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wstrict-prototypes"
>>   #include <lzfse.h>
>> +#pragma GCC diagnostic pop
>>   static int dmg_uncompress_lzfse_do(char *next_in, unsigned int 
>> avail_in,
>>                                      char *next_out, unsigned int 
>> avail_out)
> 
> 
> The warning can also be suppressed if the build uses `-isystem 
> /opt/homebrew/include` instead of `-I/opt/homebrew/include` as I just 
> have tested.

IIUC by design meson only allows including *relative* directories,
and manage the system ones:
https://mesonbuild.com/Include-directories.html

> If we can find a solution how to implement that I thing it would look 
> nicer. Technically the patch looks good.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Thanks!

