Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724E4DCF12
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 20:55:52 +0100 (CET)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUwDu-0002ak-TM
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 15:55:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUwCX-0001va-I6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:54:25 -0400
Received: from [2607:f8b0:4864:20::631] (port=47030
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUwCV-0002pY-T6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:54:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id w4so5300814ply.13
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5B5yiP8FB6jZSku1lkMBC53neYOy4ErD00L9xY2PbYo=;
 b=v4oj8p7E4GX1NHDsrbbD5ZcmINgXMn0DfOAvNRD7rL2NlqP7KGWDsIpTNuE7mfHkuD
 LgNRiwmRNispcpmeZAKhGzjPegEda7K23jyvsPrq5jYbU8R1oJsx4F89jWpIKvT+CWfE
 geYAj41q3yT+JPEfPNY/2CpnUnJExo/GFUa50FEkPRjVHWv2RXTTcX2evN3uG75mx9ba
 9SyrlJoGmodP8WEOAu0fixYUQkQyQ+TekorgdDRUBxZuaMDdHrl/3sYBFmFyy36AfMSc
 Hm70SNPv7KmoQboL/AI1s2qF0n34zQ3C9F2eRlDP7w3Mx7mcRWwNfFUK347QLdyRGxgr
 ueaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5B5yiP8FB6jZSku1lkMBC53neYOy4ErD00L9xY2PbYo=;
 b=NJBSHepWLzaEMQNeMgpkwQ8aTsspbUacBaxwqLa8GBmWsbbw2Xl+1qK0BmoxQkB82m
 GvjLXC+zGmQ6XrJuuH1CUFCyr4ZUO2U8iTBdvFJUan4gMvFvprU/qR80okX5s3LEe13F
 DZhCrRhu/+gBVRparI4T8HbMh9fdNXUOCiLv5gnJETaM7Gx0f9MlWx2/3aFGwl891RXe
 wN0JV+Ao7CoOu4AOeXezkr++notOg98DKHV7beIg2ssOuU3RqMID7eX9rOQ8PFvD1DD6
 L3D5TPt5gfmr+XiaiAQ024kPnL7iLfAGIEbFgmIXTYUtgONLNl7lj2MQvzOhy6J9oTG3
 syzg==
X-Gm-Message-State: AOAM531FtekU4i7jZ0rpZgXKT3B2xhKXbrVY5FUrSBuv0Urv4v8K3SXD
 JjtS7tNCFInoTikbqCTMyJmGVw==
X-Google-Smtp-Source: ABdhPJxe4ug2p3Hfg2LeXSRpD3B6P5X9J8G9NtiwzhhQuM4m4OEj6Z1aXcrYnKkBFNPI2+zHhSLZdg==
X-Received: by 2002:a17:90b:4d09:b0:1c3:801a:8415 with SMTP id
 mw9-20020a17090b4d0900b001c3801a8415mr18074548pjb.108.1647546861973; 
 Thu, 17 Mar 2022 12:54:21 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056a001a9200b004f759dcd841sm7290371pfv.42.2022.03.17.12.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 12:54:21 -0700 (PDT)
Message-ID: <6888a783-4ce6-8d1d-568c-58f6131808f8@linaro.org>
Date: Thu, 17 Mar 2022 12:54:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 44/51] target/nios2: Implement EIC interrupt
 processing
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-45-richard.henderson@linaro.org>
 <CAFEAcA_63vwGgWdiPozkzSus6vzoSGm0Ndn=QXLUrxzP9NVQFQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_63vwGgWdiPozkzSus6vzoSGm0Ndn=QXLUrxzP9NVQFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 12:11, Peter Maydell wrote:
>> +    new_status &= ~R_CR_STATUS_CRS_MASK;
> 
> We're missing the "copy status.CRS to status.PRS" part of
> taking an exception, I think ?

Whoops, yes.


r~

