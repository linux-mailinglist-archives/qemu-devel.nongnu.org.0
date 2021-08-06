Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A030F3E22DE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 07:28:33 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBsPI-0003v9-Mf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 01:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsOU-0003D8-UQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:27:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsOT-0000rj-GV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628227660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHTs8FyPeQh2WFBzWxIPtRPsEhOxUXXnC7+gNvPyl6I=;
 b=Kcmv1zcA3x2Uh+mf1X0zt8tq0oFS4tpJuhAVs5uf7z8lT45+GPugn/u+tvcL0RqnHfBmww
 XNPLP1QRxLvzLuomLllgoF2m1lpe547Mi8bWG0PjJpio8/sT1aYeesXyAxOWcdcCeB52UY
 HC4RvD+q97/pyxxivFvTBBjCSfQ4ozQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-rEffIeCXNUq55zpcwR8eTQ-1; Fri, 06 Aug 2021 01:27:37 -0400
X-MC-Unique: rEffIeCXNUq55zpcwR8eTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so2760178wrl.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 22:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yHTs8FyPeQh2WFBzWxIPtRPsEhOxUXXnC7+gNvPyl6I=;
 b=Fm7XRi9sIHh8tDbIqWC6S6vYddMLeizwH/qHf9TNGEF0zkIkp7TRw5p/4pc7EhHVVj
 ZrEKYZXTlRMZaJ4BKH0Q0FDIUAS3GMCYIKMh/8L+xGev4kw0Y4ai+H/Qc+90gEyS7/dy
 bi13HLXKjl1/ps2MZ5fcEutGZNhAz/N0GVtv5b/mNr8RwDgG+eKKouExuhKdR1enyWsm
 tWw7YTaB5pGIXXxzKKay5cKOkcQ09L/5OE4l9SgdbPliyqpjgueHytKAsDObm3xz77Xj
 V3J61WW525nDpOXunNsTMXLkhMYOo9dgcc5Razoxg7WCPAIbM+FurJR+r/UuGDyP+PPY
 ElUg==
X-Gm-Message-State: AOAM532EFc/g2+y/mxQ2V1cgtcvfC1whtVH9/g3BRXxL7YnMtnnEdueY
 4iwszwQHMNU1854xitvBgCtNva0fcxOqXcjjskkA8hAr6qbJG1ujlXG9jvTl/2OG5L/5EuSLH+K
 FoEVG7Z8IKkcNerQ=
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr1350553wmc.83.1628227656366; 
 Thu, 05 Aug 2021 22:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGxpBH8WSAfl3Hd1mSqgMccb4wYkuqC0QWXg+wi0PtLmEMQL0sOBLQd4nD5MhU1QzQkw5j5Q==
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr1350543wmc.83.1628227656242; 
 Thu, 05 Aug 2021 22:27:36 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id i29sm7638264wmb.20.2021.08.05.22.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 22:27:35 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805143753.86520-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <badeebbe-0d74-f576-4a68-06ba48c00852@redhat.com>
Date: Fri, 6 Aug 2021 07:27:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805143753.86520-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 16.37, David Hildenbrand wrote:
> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
> "css" test, which fails with:
> 
>    FAIL: Channel Subsystem: measurement block format1: Unaligned MB origin:
>    Program interrupt: expected(21) == received(0)
> 
> Because we end up not injecting an operand program exception.
> 
> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be aligned")
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Pierre Morel <pmorel@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/ioinst.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index 4eb0a7a9f8..bdae5090bc 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -123,7 +123,7 @@ static int ioinst_schib_valid(SCHIB *schib)
>       }
>       /* for MB format 1 bits 26-31 of word 11 must be 0 */
>       /* MBA uses words 10 and 11, it means align on 2**6 */
> -    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
> +    if ((be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
>           (be64_to_cpu(schib->mba) & 0x03fUL)) {
>           return 0;
>       }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


