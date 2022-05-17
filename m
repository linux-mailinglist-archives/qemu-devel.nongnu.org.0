Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D42529E89
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:54:43 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtuc-0001cx-UN
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtrQ-0006TF-Cn
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtrO-0007o8-0q
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652781081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvHvBRqxs9jjB8jdv2UB9ASflkmIVV6hKA+LgIwy8uA=;
 b=FCPySZ/1G6hu76ypVs7jdx5vdBCzuu/BJ66bi0YN0hzjyRHU4OuTKgP1+6y2LqBYMDGZ3L
 3Tnggu3Wu/8aCbvICoNf9JKXMYvvEbPTbAXJMkqsXmmeoUxBaEbwWPfatBPFnuat0ydoKU
 FcRPYVbkGtJ2stjzxx3blE0KBWFY0vE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-kw4pHtMHONW0PyYd21lRPQ-1; Tue, 17 May 2022 05:51:19 -0400
X-MC-Unique: kw4pHtMHONW0PyYd21lRPQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7d789000000b0042ab9d77febso2720218edq.16
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UvHvBRqxs9jjB8jdv2UB9ASflkmIVV6hKA+LgIwy8uA=;
 b=uT30Nck9FGkeAlzow3sC2+fCKt4rr+iFrkJ9sN0UDiOq1voFxfRq8Xh7ngwrFGGOYX
 qJOSfrwUudAvmgjHVyGf/6JWszpP0Dq+nuqo6FKuaknxDIsiNqaXHrn2KfBHTcdHfHWN
 yPgJIh7zkqpdPufgdQYy1Q0zVPmVc//0QtWSBII74hIbIiX9JlsOSZaMeD0B1vw5s69J
 FtJNKvPKVa+QVgTL4L9aixu0LP/XuwhZeRLnd4RyZyIljaznmzAzm/1Q0SIOxTRPiGwe
 nYNtrNHHJCYoxMb52KLF76PigIMcpYXY71wupifAD7sUiShMZjnpfjW3thTLdTjdv/LT
 tGZA==
X-Gm-Message-State: AOAM530/RrqRgZmarR3A7y+YahV/lYwZH3Tf2fUUKCsjSNBKVCR3y2nC
 NStKWflSTn9ihpUQOfkVLwk+T7Z4wM7kOE2AVvUfCL/RIAEfxsvZEvqZ+xosADj/lktJHRAuTx7
 cPDOUQ2mBwT3We/E=
X-Received: by 2002:a17:907:86a0:b0:6f4:fc1f:30d9 with SMTP id
 qa32-20020a17090786a000b006f4fc1f30d9mr18774592ejc.708.1652781078785; 
 Tue, 17 May 2022 02:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTij0teufZdgERVbuDL6U59X5n9wqxpqckyTaj3wuQ+qBC4hfsCYjqmFIag7zhG0Yl0Y/vcQ==
X-Received: by 2002:a17:907:86a0:b0:6f4:fc1f:30d9 with SMTP id
 qa32-20020a17090786a000b006f4fc1f30d9mr18774580ejc.708.1652781078549; 
 Tue, 17 May 2022 02:51:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 e16-20020a170906845000b006f3ef214da0sm848046ejy.6.2022.05.17.02.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:51:18 -0700 (PDT)
Message-ID: <f595fe33-130e-c974-4376-00b5486e2eed@redhat.com>
Date: Tue, 17 May 2022 11:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/26] block: add missing coroutine_fn annotations
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-8-pbonzini@redhat.com>
 <20220513212613.laydrlckh63wett4@redhat.com>
 <ab3b2d59-109c-43d4-f97b-1c8ee1ee1f2c@redhat.com>
 <CAELaAXykoYHvPpvNOgp0XUnzZAhL2ru5AkLSikeRVxaBn+wN9Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAELaAXykoYHvPpvNOgp0XUnzZAhL2ru5AkLSikeRVxaBn+wN9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 5/16/22 20:49, Alberto Faria wrote:
> Thanks for the heads up. In fact, looking at block-backend-io.h,
> there's quite a few functions that (AFAICT) we could implement using
> generated_co_wrapper:
> 
>      - blk_pread, blk_preadv, blk_preadv_part
>      - blk_pwrite, blk_pwritev, blk_pwritev_part
>      - blk_pwrite_compressed, blk_pwrite_zeroes
>      - blk_pdiscard
>      - blk_flush
>      - blk_truncate, blk_ioctl
> 
> Would this make sense?

Yes, I think so.

Paolo


