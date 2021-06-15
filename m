Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C983A788F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:53:41 +0200 (CEST)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3tE-00059G-AU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3nZ-0005C4-Hf
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3nX-0006ru-0x
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KA9nxfWSv3Mf0KIRRm0NnFSepryn+oNwFbJBviT4/8Y=;
 b=dY3clA1N2cR6FUy4MwXKNv6fwAWS9SxFh1U3jOcjQZdMNo2K1zGb2D29cy23u9SRwujGpy
 CU6FTVPogweyXf1cGOBGfSHnjFPEL88FQCH0Dm9OzAp8EZ0LFPEta5GRQ3z+NCDzR9xUku
 3svQ2ELzQnSPzNOANreFrV7J3wQj7QE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-AayIs9nLNw2GTrDAZe5YNA-1; Tue, 15 Jun 2021 03:47:44 -0400
X-MC-Unique: AayIs9nLNw2GTrDAZe5YNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso567904wrs.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KA9nxfWSv3Mf0KIRRm0NnFSepryn+oNwFbJBviT4/8Y=;
 b=HbuBUl6xw9OA8GWlSiUvPdLbJjRy7UsK0hWsTZ/+mqw7mYonjWrp7raRA7vrhVq8a9
 QLg/EgCtFBkNtMWSf1JsKvo0dMyzZTAFwTkOZjB/R87AeHGMRYP7NS5j6FZAl0trKxRw
 +w3p+PDz/eA1hkNnD53JuJqUO5pzp4oad72uan0LipOBXAF3eyDOQoZ5uxcfsZSkDktY
 UfRcG4Izdbc5CaU2L5z9V1oBBbrxbrwfWyQboyPZV2ciJspqBzN7RYgWLxbDwCE4E7xr
 QBF5IaYzbzNuZ1Dj+M2xb7gTPhdr7RwxFVsEytHL/tgPJIGWaIq3qgBHlpIXKsmx1lMz
 hVtw==
X-Gm-Message-State: AOAM532ncbd5Wxq+h++ksLgrAbBCcz0KtQjjrzpDFuPfYblsl3g6iqDq
 GrGZQnkZo53sI7Afzn0pRpp8dEtBfvf/TJXCoow/fC72VHwUsqqljjiFOqC7YJu815c7Njbzei4
 KGEmbcf5WuNclbGg=
X-Received: by 2002:adf:bd84:: with SMTP id l4mr23645551wrh.346.1623743263579; 
 Tue, 15 Jun 2021 00:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsIhz3k35QvnICQhKt2RCsp1zMGNVNESNk7mX18ft+YddXSiVHK2txrm61PGrCRmkqY96mTw==
X-Received: by 2002:adf:bd84:: with SMTP id l4mr23645542wrh.346.1623743263473; 
 Tue, 15 Jun 2021 00:47:43 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6136.dip0.t-ipconnect.de. [91.12.97.54])
 by smtp.gmail.com with ESMTPSA id
 c12sm20843355wrr.90.2021.06.15.00.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:47:43 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/s390x: Expose load_psw and get_psw_mask to
 cpu.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <28b93a58-3a60-d66f-5982-a07d7fe0480f@redhat.com>
Date: Tue, 15 Jun 2021 09:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.06.21 05:07, Richard Henderson wrote:
> Rename to s390_cpu_set_psw and s390_cpu_get_psw_mask at the
> same time.  Adjust so that they compile for user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


