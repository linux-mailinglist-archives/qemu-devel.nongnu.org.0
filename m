Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F24458B85
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:29:36 +0100 (CET)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5dn-0003sX-6A
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mp5bK-0002DE-Si
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mp5bJ-0005c7-HO
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637573219;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qIO2RIUfY+huj2Vba/JjcB5Y9clSZuz7uekKzJHJJ8g=;
 b=dmUxh3pH3+oMItdyrpwFOfDKKpYbRvrV0b55p6I4Z0bKELtjgn6AoFgiuS2awqWehOEFZ3
 nVcuoRVJkxZaGHJHAVxXSukOXEJGnlzkzscHZtq/SBNhd+s0zu5RlXmS1OPpIWSFVyTyKy
 57lZWVzJW/tYdwz/RUbcUf3ZZBzA3ZE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88--S-snVgaP-eL-VPbSy-Vfw-1; Mon, 22 Nov 2021 04:26:57 -0500
X-MC-Unique: -S-snVgaP-eL-VPbSy-Vfw-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso2943987wru.13
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qIO2RIUfY+huj2Vba/JjcB5Y9clSZuz7uekKzJHJJ8g=;
 b=5qYMh3FiCEe+mLbQiKKO0kbI/v52GE6F56+6oktIDWGGMPalO+jEG3/F/PMEBWCvXM
 MfJAzkynrFi5ypeTZahKz1guQ9wwClej4qZH0UWZf/+1tM64tMUmFv8Pr5xa3UcBKhsL
 4nMP1LbT2L37NVjsRp3326jncFgk0Mye5kqDYGQ+au64iVNg2F9jdPIBroAtlkQug06r
 vQlsZsHlpAKFjp0FULpCXNE9Y8DYUXeCy2BX3V13uW9jxGUkB/INsUXvo/nDa78jU95q
 KwSPjTcDjjfo0BrBAl86FbngJZnGdefjJJ8kQfkTdIENGIctiVO6a1XLNK+5zfZf2YtX
 +qJg==
X-Gm-Message-State: AOAM531mBJRG8ZWdtXo1hYXrmDfd2SkUk/L0bE6phMwasfjF9gXoBkiS
 FGft4TFT7hQ+InLqTB0ggA4pySnRpa95PkPoY/6sbXRBBALS0lGyQFEmBLq5f5+LZLckVCrvC+e
 okmBnac4Mx7gYNks=
X-Received: by 2002:a05:600c:6016:: with SMTP id
 az22mr27802348wmb.11.1637573215899; 
 Mon, 22 Nov 2021 01:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3NRbYsMiy8g0Lg5ViSq2gSoSuvW4lJunb73bAHWRIeQP9dIH9Ticzbf1rNYZhubs1QJJYaA==
X-Received: by 2002:a05:600c:6016:: with SMTP id
 az22mr27802315wmb.11.1637573215668; 
 Mon, 22 Nov 2021 01:26:55 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l7sm10005434wry.86.2021.11.22.01.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:26:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/11] multifd: Fill offset and block for reception
In-Reply-To: <cd4f7997-7860-8145-0200-ad0d7df92c6c@linaro.org> (Richard
 Henderson's message of "Sat, 20 Nov 2021 13:26:43 +0100")
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-4-quintela@redhat.com>
 <cd4f7997-7860-8145-0200-ad0d7df92c6c@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 22 Nov 2021 10:26:54 +0100
Message-ID: <8735nor15t.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 11/19/21 5:58 PM, Juan Quintela wrote:
>> We were using the iov directly, but we will need this info on the
>> following patch.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/multifd.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 7c9deb1921..e2adcdffa1 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -364,6 +364,8 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>>                          offset, block->used_length);
>>               return -1;
>>           }
>> +        p->pages->offset[i] = offset;
>> +        p->pages->block = block;
>>           p->pages->iov[i].iov_base = block->host + offset;
>>           p->pages->iov[i].iov_len = qemu_target_page_size();
>>       }
>> 
>
> Block should be stored one outside the loop.

Done.

Thanks, Juan.


