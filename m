Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E363AE1B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:52:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhMg-0004tF-DC; Mon, 28 Nov 2022 11:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozhMb-0004rf-98
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:52:13 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozhMZ-00070D-NW
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:52:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id x5so17876957wrt.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8xSMDG6pIq3VVGRhzSQSaX8YOlvi2kw37PoKCNMyIE=;
 b=JqqQKH4uqUVHOolIJArhckXaEGwQzezTcZm0raAT2DMYQfkzSpgH5xlVZAZRVH6MDH
 den6fL/bPwb0obNClguzGy5SAGRVH4XPCDRDFIHUMZTDvpFBptRbJl2TgDTfzIAseS3K
 IbOJn5kkaHtnbbYgXYeLl72AZ5ndXUZfeRebiYIv3BW97RPFDkdyc8PrdfUMq9z33RKe
 AmFtkBMRCW8bfIgjSvr5K2aKX3sZU4R0qf0/U6EvT3YJmfsdX2nJYykQ18wB/Da4z9SI
 F+g9Wmbta2TXB+4P37HwMqMPm5rch2gR+973IuaUIApJ1W6p/yA2VSFgdJDC34FqU3jN
 ZHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8xSMDG6pIq3VVGRhzSQSaX8YOlvi2kw37PoKCNMyIE=;
 b=IxGkC+ruMknOVwr9BRp+YEZjJ75vHgOlHASmRU56/m2j8pdoo+JN9UO6YgM/NChkne
 QPBXp9J3vqKDPD8vPLk5Vc2lWISqA0dLuHWxQQTXAvrltIvsnOIZh3FnU6TpippG5SfO
 MtCxAmGRIcSy/3MHYxpe34l5PFDdvuwv5Cr2yKrBekiTggpwnjmQqM13mZyMPq1RCu6O
 0MvGhRDH3iirP3W2Fh+OFiwSJxNaZ0qaDHhg9NAaAyWGchFk91UAMX/NxC1D/Lp694KP
 nnAzEso/MzZNkGYAA3hW0Ua6AROo4n1NlRREn0b14G2vDVaR62Hte8GCdNKfJIgbtQtS
 1sFg==
X-Gm-Message-State: ANoB5pkvpC2AhIM7xmKevzfZ8TUH5QUqwOYK6wMaW6xZEY8CddgaIhg0
 YZRCgvOnOV3/H1hvRhYGgHkQtQ==
X-Google-Smtp-Source: AA0mqf51qPghWDf96RaM0H/hbop1yUWu5nKHUmhNXx5exOa4CUcsHX0L0Gq4t0CvA39egTDZ1obIyA==
X-Received: by 2002:adf:e58b:0:b0:242:16c3:f1ed with SMTP id
 l11-20020adfe58b000000b0024216c3f1edmr3880045wrm.500.1669654329182; 
 Mon, 28 Nov 2022 08:52:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003a3442f1229sm21448911wms.29.2022.11.28.08.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 08:52:08 -0800 (PST)
Message-ID: <d388abd3-2a65-a306-0192-29e85cc13267@linaro.org>
Date: Mon, 28 Nov 2022 17:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Wu <peter@lekensteyn.nl>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
 <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
 <655e51b2-99ef-a48d-9be3-ddbc15275e7f@linaro.org>
 <c64522e4-4bb9-8dbf-fd93-151b77f5156a@linaro.org>
 <9a8debf0-8a49-1ba7-a009-eb1e5b383590@linaro.org>
In-Reply-To: <9a8debf0-8a49-1ba7-a009-eb1e5b383590@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 28/11/22 17:29, Philippe Mathieu-Daudé wrote:
> On 28/11/22 17:18, Philippe Mathieu-Daudé wrote:
>> On 28/11/22 16:41, Philippe Mathieu-Daudé wrote:
>>> On 28/11/22 16:08, Gerd Hoffmann wrote:
>>
>>>> Also at least one code path (processing SPICE_CURSOR_TYPE_MONO in
>>>> qxl_cursor) goes access chunk.data[] without calling
>>>> qxl_unpack_chunks(), that needs additional verification too (or
>>>> switch it to call qxl_unpack_chunks, or just drop it because nobody
>>>> uses mono chrome cursors anyway).
>> Per commit 36ffc122dc ("qxl: support mono cursors with inverted colors")
>> "Monochrome cursors are still used by Windows guests" (i.e. Win2008R2)
>> :/
> 
> Hmm I guess I'm missing something in qxl_cursor() following the
> SPICE_CURSOR_TYPE_MONO case.
> 
> - cursor_alloc() allocate QEMUCursor* c but doesn't set c->data,

Sorry long day, cursor_alloc() does allocate c->data:

typedef struct QEMUCursor {
     int                 width, height;
     int                 hot_x, hot_y;
     int                 refcount;
     uint32_t            data[];
} QEMUCursor;

QEMUCursor *cursor_alloc(int width, int height)
{
     QEMUCursor *c;
     size_t datasize = width * height * sizeof(uint32_t);

     if (width > 512 || height > 512) {
         return NULL;
     }

     c = g_malloc0(sizeof(QEMUCursor) + datasize);


> - nothing seems to set c->data
> - cursor_set_mono() is called and *(c->data) is assigned...
> 
> ?
> 


