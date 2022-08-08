Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EFA58C4D0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 10:18:42 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKxy6-0004TQ-0P
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 04:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKxoW-0005Wf-El
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKxoT-0002NR-CB
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659946116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHKaxKERvWCuejXfe2p4/Ep7b9wOBF5O2kpGO7xa8XA=;
 b=eGWAdGeEMp7oes/14be4eoBpleANhsmmYjzBmXnCh4Yf9G0/uOGFWAXzCNzqdMhKotjelt
 7Wx5wALtKa0vTTa8yFOLyyQ+R8eTClqtsgFaMJh6FYqcftzu8N2ctoJH1SCXYSEFE53bYc
 w4AkvwC7/MyICQyOejgNfOrjTo063yw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-8j7CX2ewM1ucdCyaNWpbQA-1; Mon, 08 Aug 2022 04:08:35 -0400
X-MC-Unique: 8j7CX2ewM1ucdCyaNWpbQA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d6-20020adfa346000000b002206e4c29caso1246520wrb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 01:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NHKaxKERvWCuejXfe2p4/Ep7b9wOBF5O2kpGO7xa8XA=;
 b=SEeLJHEBUjYkg+QLrLaAFXSZ0SfebX7G2+wAxixxYmHtPwAOjHvet4zw4kHogabDPj
 xILIXGh2Gsogdy+dHbLxl+UApsZqNk3oHCMmQDk1xuXz8eLd5uG1U/+c97D6s0Ikh0ti
 yGW0f83/9j3+3g6AUG4XZJnhrrBXQjiTrBHcBgZgHjRtJNKZKQ5IID+iIqb7CJML8Gro
 U0wRMXuDUBy8YRSbcYknrEWXpmVja+uhxmtXP+3RVlnKPYS2qQeIoUCWz8lj+et++4rn
 xepeXsbUpsZadsAPKu1iDKsoRnVLYwnWrjqdw5l2Qjx+rAh4MUKfV4Otd+JJjUkxYP2K
 T8Eg==
X-Gm-Message-State: ACgBeo05Jc5UnsAxa60FdxBfEeKSG+co33dAXUN1nLux7j1SdV9/oU5p
 ndcslGJ7Qm+lkzrsA5V27037YVwTZjJJ6rtzHvoeVEC0nojpVX/trdPipaUzB+TCTHqBAgBIoBI
 AQwF706QyAFlG8kk=
X-Received: by 2002:a05:600c:34c6:b0:3a3:2549:1905 with SMTP id
 d6-20020a05600c34c600b003a325491905mr11463134wmq.204.1659946114207; 
 Mon, 08 Aug 2022 01:08:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LRpsN2LYIpelNzJ5PhhtsBIL2/bHcZ/1WJhiUNkILdp07+EK5d5ecvv6r9dpNcdbR/KFT2Q==
X-Received: by 2002:a05:600c:34c6:b0:3a3:2549:1905 with SMTP id
 d6-20020a05600c34c600b003a325491905mr11463117wmq.204.1659946113934; 
 Mon, 08 Aug 2022 01:08:33 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b002205c907474sm10705084wrs.107.2022.08.08.01.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 01:08:33 -0700 (PDT)
Message-ID: <4a5c4a35-908d-4cb5-e90d-13d4eb8ab551@redhat.com>
Date: Mon, 8 Aug 2022 10:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] Test code for AVX512 support for
 xbzrle_encode_buffer
Content-Language: en-US
To: ling xu <ling1.xu@intel.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, Zhou Zhao
 <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-3-ling1.xu@intel.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220808074837.1484760-3-ling1.xu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/08/2022 09.48, ling xu wrote:
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>   tests/unit/test-xbzrle.c | 307 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 290 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
> index ef951b6e54..653016826f 100644
> --- a/tests/unit/test-xbzrle.c
> +++ b/tests/unit/test-xbzrle.c
> @@ -38,111 +38,280 @@ static void test_uleb(void)
>       g_assert(val == 0);
>   }
>   
> -static void test_encode_decode_zero(void)
> +static float *test_encode_decode_zero(void)
>   {
>       uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
>       uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
> +    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
> +    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
>       int i = 0;
> -    int dlen = 0;
> +    int dlen = 0, dlen512 = 0;
>       int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
>   
>       for (i = diff_len; i > 0; i--) {
>           buffer[1000 + i] = i;
> +        buffer512[1000 + i] = i;
>       }
>   
>       buffer[1000 + diff_len + 3] = 103;
>       buffer[1000 + diff_len + 5] = 105;
>   
> +    buffer512[1000 + diff_len + 3] = 103;
> +    buffer512[1000 + diff_len + 5] = 105;
> +
>       /* encode zero page */
> +    time_t t_start, t_end, t_start512, t_end512;
> +    t_start = clock();
>       dlen = xbzrle_encode_buffer(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
>                          XBZRLE_PAGE_SIZE);
> +    t_end = clock();
> +    float time_val = difftime(t_end, t_start);
>       g_assert(dlen == 0);
>   
> +    t_start512 = clock();
> +    dlen512 = xbzrle_encode_buffer_512(buffer512, buffer512, XBZRLE_PAGE_SIZE,
> +                                       compressed512, XBZRLE_PAGE_SIZE);

Does this also still work on systems without AVX? If I've got patch 1/2 
right, this function is only defined if CONFIG_AVX512BW_OPT has been set, so 
using it unconditionally here seems to be wrong?

  Thomas


