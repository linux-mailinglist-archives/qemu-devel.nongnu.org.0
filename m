Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B91544E5A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:06:58 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIoL-00063y-Fs
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nzGbl-0000yF-Qs
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:45:50 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nzGbj-00011Z-Ms
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:45:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id a10so21130176pju.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1uWRq0qALlsYTQq3er3sD+PXamQFroMLzNzNZ5Baq/E=;
 b=nDYk9F2UkksG7vJXwzdocA1HGXnEFw3FhR+DLGD+lBRr8jWzyttCTlkhOU/M6RtFod
 AtQ7el+DjbiVebfgHf/rkjH+pSUcLBsGXJbLqR5fvzb6ML5W8QC8nA8Dhwbw3uL8SVke
 0hfFTKNtxfZzeospUYTn17XH33tx0FFHrA5ebXazRYhs3mf3nmMvLTiKJzzX+14wpB7o
 dzHgB+4+x2f++5WPxFhGhZeb/glqK+FJlGPWxTpDqsGqHmpyMs4MU+9VJsEvl+MzIpF2
 FgEvPSDwZDYe2ztAARR1NlDLaCM7lo8UtkbRcij8JLSD0Yd96Ngkkn2rQe4ESwX1S5jq
 /VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1uWRq0qALlsYTQq3er3sD+PXamQFroMLzNzNZ5Baq/E=;
 b=jNfLqBTYmid88wRCHckuZb+Q8LokmS25a6Z3uzQnZNhxMzJitFc+2/85US0O2jyuBN
 34SWffM7qQNW3mfK4M4EAlfl4K1mwMxtYI9yd/P3YcnMKQJqh3A3Am7x74wvQ4AHn567
 nsT0teqc7fNsCYACfwa0TVmlEWIKah63h87z/7++8cSqUXn+YHL+/fYPZp2WKthPHEy+
 FiZ2q2f8o/RW5mWTu/H2bw1Qx6JsW2AcPPM6tXiVbXiLqY6NZ9el4lJsiTLnLMI2lDO+
 PttBS8kw6Ev5bcDmhUNmBZuEDq5mIv6LoSQUVfNAjTnrANAOGo/zqdF6fjovcHebqPK5
 +axQ==
X-Gm-Message-State: AOAM533fdAqet/07XQBd0vmwmEnhpMO3pmdw24YXAzGSsLOtABO3rRNt
 O9YWUg82SzctlRSQL1i0dqQ=
X-Google-Smtp-Source: ABdhPJy6NBGODlL2qFbVm78WCpoq/0vnl33flGVIgU6549lot3LxsKE9L21JFV8c0odlHFpFhjRTgw==
X-Received: by 2002:a17:90a:e7c5:b0:1e3:3cf1:6325 with SMTP id
 kb5-20020a17090ae7c500b001e33cf16325mr3066860pjb.178.1654775145812; 
 Thu, 09 Jun 2022 04:45:45 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa792ce000000b0050dc76281b5sm17501351pfa.143.2022.06.09.04.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 04:45:45 -0700 (PDT)
Message-ID: <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
Date: Thu, 9 Jun 2022 20:45:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/06/09 19:28, Gerd Hoffmann wrote:
>> --- a/include/ui/console.h
>> +++ b/include/ui/console.h
>> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>>       int       yoff;
>>       uint32_t  width;
>>       uint32_t  height;
>> +    uint32_t  refresh_rate;
>>   } QemuUIInfo;
>>   
>>   /* cursor data format is 32bit RGBA */
>> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>>       void (*gfx_update)(void *opaque);
>>       bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>>       void (*text_update)(void *opaque, console_ch_t *text);
>> -    void (*update_interval)(void *opaque, uint64_t interval);
>>       void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>>       void (*gl_block)(void *opaque, bool block);
>>   } GraphicHwOps;
> 
> So you are dropping update_interval, which isn't mentioned in the commit
> message at all.  Also this patch is rather big.  I'd suggest:
> 
> (1) add refresh_rate
> (2) update users one by one
> (3) finally drop update_interval when no user is left.
> 
> thanks,
>    Gerd
> 

I think 1 and 3 should have to be done once since refresh_rate and 
update_interval would interfere with each other otherwise. Does that 
make sense?

Regards,
Akihiko Odaki

