Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D174D9A6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:33:17 +0100 (CET)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5QS-0000Sh-3e
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:33:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU5Eh-0001Kb-6t
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:07 -0400
Received: from [2607:f8b0:4864:20::435] (port=38871
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU5Ef-0008VU-Mn
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id f8so19124708pfj.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TqgFaETjAdExQLKV/t97HSClzhhq9y1e+r3vLbwcx28=;
 b=B4ZtvTjZWcq71nQYaJD9jeeO4lnNTTl+bF3uQO9oKqmrcTozCjp6TY0KJ6IHi+KlGv
 FJUUK9R/ELt/ew0L/a4qMe0AmgOCl9r/HZi/lM2kOewbKkWwEZlDhky7dXkA2/RBTA3h
 VAdcpPv5dpA9Oo7IxWQR50JvU5tSsowKiMfE4jkVv3qoQRmWUIfXtlJfhQK1aKOA9LWz
 frWmJLP1I3yUcS9zuyrpkSbMqy7JJhBk3DzfSXkT8hitbirzMR4YsfGRyxXJ57ilj8KM
 Z5Kk+YJTq3OdG5WdY4JsRYzxcFWOnGBcYiaoCHH9px09SPQpTTo1vx6VH0JehcyzVP71
 faWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TqgFaETjAdExQLKV/t97HSClzhhq9y1e+r3vLbwcx28=;
 b=g3NcYuM7Ad4WE80jfsCDIwm9tF2/fN/ygLlsFZjkmaOhbJHLftvVhcsCHjL0U8Jaxh
 7jtxmretdQhX7dljJCiTzu7gaV/diws60MWMnIe5SWSfzt0Ftsevo4gz9BD6ZFajuP2S
 mpXhlSL4BguLWIdXaDgDnND/O4Y40x624nKN6sLrzvOuK1YdEiH1vxD3HKZXPmNtEonF
 LY7Auq6N/n7/421rjlJTwRBtTGgBi7zkQvMKW4oF6jM3mZO9UH6lHo6RrGJfcpW2PeC1
 P39etQzom3+wcgGyNDIVFv4NfMrEhdP60JeFBaHk4C7RKS2N8rmE/9zepfRHm1UH/kws
 vfUQ==
X-Gm-Message-State: AOAM53089sRzAMktboUa75HNXT6hqfmDph9qncUOIH7lbzh6Pq/Ianqa
 euuzVWO2DpI+DrRe959W/5k=
X-Google-Smtp-Source: ABdhPJzKSUmTLZwtoGSUNmpZIa0sOLWMubqVBvUvxX/Q/wyue3B2suGExPg0yrU8ImScq7Doq6GB6Q==
X-Received: by 2002:a63:2b94:0:b0:380:7ee:e641 with SMTP id
 r142-20020a632b94000000b0038007eee641mr23862946pgr.584.1647343264312; 
 Tue, 15 Mar 2022 04:21:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a17090abf1600b001bf4b374d1dsm2773904pjs.47.2022.03.15.04.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:21:04 -0700 (PDT)
Message-ID: <98d712c8-39c2-87bd-c964-7a09db8b20dc@gmail.com>
Date: Tue, 15 Mar 2022 12:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0 v3] softmmu: List CPU types again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
 <2334bd32-0494-37e1-e0ec-7ccb48928c0d@gmail.com>
 <93d1e0a6-01f2-af15-d43b-0767f8ec4c30@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <93d1e0a6-01f2-af15-d43b-0767f8ec4c30@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 12:13, Thomas Huth wrote:
> On 15/03/2022 12.11, Philippe Mathieu-Daudé wrote:
>> Hi Paolo,
>>
>> Could you take this patch?
> 
> I'm planning a PR for today ... I can add it there ("-cpu help" also 
> does not work on s390x, so I dare to say that it is related) if Paolo 
> does not plan a PR for rc0.

I was hesitating between asking Paolo or you :) I just missed
Paolo's pullreq, so if you can take it that would be great.

Thanks,

Phil.

