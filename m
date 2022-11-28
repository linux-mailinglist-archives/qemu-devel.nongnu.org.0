Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AA63ACCC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgG8-0006Qy-KV; Mon, 28 Nov 2022 10:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgG2-0006Qm-1U
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:41:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgFz-0003P5-8z
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:41:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so8676721wmg.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8NiFPK/LqHawLgwx0sm3q+UdxYLR/RJ7BAGNErA3bas=;
 b=lXaA86aXgbu3VuQrjseTNyKMJbbQwPcJhaZ12iU383Hb9ojt5T2ha9p6z9+yGeY4pP
 irXmcf72uZD03HPd690Jy3L8u5LkpL9hERRe3qZXQpqTVck1iSe0BmWxYDjcjxxYoEkq
 9dbX8YHXF74tE92JrF7Vw/ahQTt658pzcoTJiycankTsWie+8iFFhuA25aSYA+qodTLB
 1LsrrSxGWbb76+ZfZrlzCxllaugHpqNAERgtS9T/X7zi4mRBcL8xsrs+RAzFuLeionlQ
 yy+iPvaZKXrHPu552p1IEEhEkTIYcMYrX+uta8uIXtwOehnmVASJUbSkIPM4cG643HyA
 Kq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8NiFPK/LqHawLgwx0sm3q+UdxYLR/RJ7BAGNErA3bas=;
 b=M6paqYKquQNI/1bLjXGiS4WntjkXwKdr7nwgUhjbia2aL+GSBZ5F+VSq5OcPcBNwrj
 2deioRn0YkaYHxkLcIwVngx1I7n2y6WoBHiLMdETiradRLBxD9KE615wnh4btDBQ3uJz
 tGlzxMWYBJ6GXew/UwRmG5HBWTmYOqbpKVsXxYOQjUzGt4LFOFWGqI8hqdromMrRhQAi
 0H+pDkHB4cjAizt3Arq2zUx1TV9FQdUTjy97AzgoS7BG0eWpuP2qONlzatg3wNgwL77C
 fT89tdMjSC9D73iwG8idD0UXaJbVkA/J/TvAL1LmYrf1I8RfB25frGha4IIe5u2we3FG
 F7Ew==
X-Gm-Message-State: ANoB5pnJqaH2nHgBlb0oF8Sctrz3lZHZGiUiodIR4cYZUpRL3JSYC22k
 akDpIweIeCP9g1qSPwsVaZ0qAw==
X-Google-Smtp-Source: AA0mqf7pz237A0fGdf5VG1SsC8QYiqgFeJpuJwJ39k3uH8JE5mz8MT0SGTJfldYLj0kY/Fw3BUZKYw==
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id
 l22-20020a7bc456000000b003a5f600502emr29287923wmi.39.1669650076737; 
 Mon, 28 Nov 2022 07:41:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w8-20020a5d6088000000b0024165454262sm11197203wrt.11.2022.11.28.07.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 07:41:16 -0800 (PST)
Message-ID: <655e51b2-99ef-a48d-9be3-ddbc15275e7f@linaro.org>
Date: Mon, 28 Nov 2022 16:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
 <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 28/11/22 16:08, Gerd Hoffmann wrote:
>> @@ -228,7 +230,7 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
>>           if (offset == size) {
>>               return;
>>           }
>> -        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
>> +        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id, bytes);
>>           if (!chunk) {
>>               return;
>>           }
> 
> Naa, its not that simple.  You get a QXLDataChunk passed in which
> typically is verified *excluding* dynamically-sized chunk->data.

OK so IIUC 1/ this line should be:

   chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
                         sizeof(QXLDataChunk));

but 2/ we should check chunk->data[chunk->data_size] is valid (within
the MR) before calling the memcpy(), right?

> Also at least one code path (processing SPICE_CURSOR_TYPE_MONO in
> qxl_cursor) goes access chunk.data[] without calling
> qxl_unpack_chunks(), that needs additional verification too (or
> switch it to call qxl_unpack_chunks, or just drop it because nobody
> uses mono chrome cursors anyway).

OK I'll look at that.

Thanks,

Phil.


