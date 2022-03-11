Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69A4D68D1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:57:01 +0100 (CET)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkRg-0002Ss-T8
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkQ2-000118-0F
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkPz-0000L9-I2
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647024914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VOr+zLjCirZgpKsphdVkSbdq4Hqydtm6z32DR/LkxA=;
 b=HioenSFq5aU1ELV2AVN4K1nnLtqO7TYxdtRNwDp9eCtISjCLnHcMZakK92NejY/CFBwqaX
 pnFz9ytmKOUkpDRmxRL8yNSACoLv+OHqJwDTRcIxhvLuHlb8ly8mgNUGd88nKkWp6PvFCv
 dkEdAAy05BFLMDeb0NKmIluvpyab+yU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-LN98qTxDMOqjwySvQ9xKJQ-1; Fri, 11 Mar 2022 13:55:13 -0500
X-MC-Unique: LN98qTxDMOqjwySvQ9xKJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 14-20020a05600c104e00b003897a167353so3760315wmx.8
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 10:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0VOr+zLjCirZgpKsphdVkSbdq4Hqydtm6z32DR/LkxA=;
 b=TySUsCoI+XUET5qlx9ZfxQ9G41s59vNMBnxfw1EmP0NmSlkwJu9C0aGap+a/yCidBE
 gq4gU0T3E/qTRox3Ts6lpOzXYX9wwxgOye7jUSdiC3YpkwBsfdkCmfAqqpsRx5ysbVh1
 j9DQ51j1P2SbI3OrE8YsqiqjfXQBClcGpC9o0vAZ9sgikj8LBPkWzNB29K549IUjuB4b
 t0fTv0/M7jPE2nu24DiQ1MpOn7C2SaspvgC7kzJcVjI7yGzcwRi9vN6WtugwWKw7A2iT
 u/AeB7lh3s0bi1/lJxe+Z3JlhRnvSZZUY7RrFi5Pqy4hm/sQ6xVflIa1KUcnq/ugJ5Og
 B1nA==
X-Gm-Message-State: AOAM530Fhfa8ErKxq39LdeNzYlW0YJrJXxVAKKcYPESUewsq1v/WphwB
 G6d8ZpsPez9qwWBo1UbrvQ/lQvbMkJ8EfddPDfojN38PNlyKv2EVBv0jHw4HnNIBoCFAjVv0iTy
 tSnVRyAQbxGDT+rQ=
X-Received: by 2002:a05:600c:4791:b0:388:dd8a:a091 with SMTP id
 k17-20020a05600c479100b00388dd8aa091mr8455085wmo.179.1647024912319; 
 Fri, 11 Mar 2022 10:55:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoB3HrKDkZ5FKBpKV92NIi2a+HaFDfqs4wSpK6PrjMCHKRzK42NIv3WFwUh1ClgaXopFERRQ==
X-Received: by 2002:a05:600c:4791:b0:388:dd8a:a091 with SMTP id
 k17-20020a05600c479100b00388dd8aa091mr8455062wmo.179.1647024911952; 
 Fri, 11 Mar 2022 10:55:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6784000000b001f1f7b814d7sm7398803wru.69.2022.03.11.10.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 10:55:11 -0800 (PST)
Message-ID: <875c508c-3d1b-196e-86d8-a557494db41d@redhat.com>
Date: Fri, 11 Mar 2022 19:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] s390x/tcg: Fix BRASL with a large negative offset
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220311184911.557245-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.22 19:49, Ilya Leoshkevich wrote:
> When RI2 is 0x80000000, qemu enters an infinite loop instead of jumping
> backwards. Fix by adding a missing cast, like in in2_ri2().
> 
> Fixes: 8ac33cdb8bfb ("Convert BRANCH AND SAVE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 904b51542f..41c8696185 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1597,7 +1597,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
>  static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
>  {
>      pc_to_link_info(o->out, s, s->pc_tmp);
> -    return help_goto_direct(s, s->base.pc_next + 2 * get_field(s, i2));
> +    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
>  }
>  
>  static DisasJumpType op_bc(DisasContext *s, DisasOps *o)

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


