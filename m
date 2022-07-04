Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE365650BB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:27:57 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IN2-0003mA-5s
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ILw-000365-4Z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:26:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ILt-0003w8-Uq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:26:47 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2761492pjn.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kVvBmDUDCQj7nztMzMgVh1po80mu+n+qR/T5S4owCzk=;
 b=nVyONBVnCm/PBcblGeHvAJeZnyyLSPV8kNktr89LLQSW7GZfkNoPS2guvDZKKiKRK1
 I1SaKr692IUtLsS1XcoSOqnlwpc3SSsj2KE20wEnXozC3++GT7d6jpBUzB0MNyc5dy4e
 b3QjfzGaDS47Hntqnp0nO3RCh3O8eggu8uj0WDMnQyFnDuY2c/12ZVVdXfC9sAXeCqTS
 6pyTeh1dEuaGO2kIFNsw/kaOPmVH+svHl/kODnGhJT0ik9zvCqJiosUroZy/YXRRluVF
 EmF0cwwY/53zlzuUQOJGIz/dnX/riEZKeJ98eIjVINKZQ8VRIaLqAWT6W1DbNP+uIdFP
 03dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kVvBmDUDCQj7nztMzMgVh1po80mu+n+qR/T5S4owCzk=;
 b=n3+Pe4SUnjiYXL8k5P2dA4/kpDPYIlen8FmJ1m24xzr4y4eG6jpVY1vIYsJT0rv/SD
 JF3uOKrI/rHPG0IXB/Ok+t6XGWweXQD/s3yw3QIugGppav8ELGZAOfIoiNDgmlMUykNX
 FBtJ56aKIkg+YzGnxR01PqBvz8qtnb5P8XCfHWX+NK/dugZi0nedcIne2s/RpUgx9ZFO
 f1FsLO+MxaXMYnA1LrkU00WNFE5E88mFU2jsWqFY3cXqPiSxygBhKH3xO5F0ZXoQqdn4
 jfcDb8WJi0pJTVClFMPy6uxHc7p0HEHF3P3jwsp/HCeawjuyrpOb8d+/nUWRPxRO2OXj
 UHpw==
X-Gm-Message-State: AJIora983Mt1FNlEjryd9psYv0zwatT6r/bu4WnRNtstLBeVd5h0wxB6
 I+Ya4NRbuJAOoA9CLX/qqfsiIw==
X-Google-Smtp-Source: AGRyM1uS9fCLUtPhqp6hFbumlj5gi06JR00J2ewJbpE2HdIAmXg4l62U4AzhJ0N2cUJs3IbhbGsAgA==
X-Received: by 2002:a17:90b:3812:b0:1ec:ca8a:f15c with SMTP id
 mq18-20020a17090b381200b001ecca8af15cmr34288215pjb.187.1656926804173; 
 Mon, 04 Jul 2022 02:26:44 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170903120600b0016a0bf0ce32sm11452842plh.70.2022.07.04.02.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:26:43 -0700 (PDT)
Message-ID: <45b326ba-a5d7-d46c-6c34-5daad36f6488@linaro.org>
Date: Mon, 4 Jul 2022 14:56:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/11] hw/intc/loongarch_ipi: Fix mail send and any send
 function
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-12-yangxiaojuan@loongson.cn>
 <b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org>
 <ba0bcdad-4e03-9544-6e76-b3efaa05c747@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ba0bcdad-4e03-9544-6e76-b3efaa05c747@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/4/22 14:40, gaosong wrote:
> After fix these problem, should we only send these two patches?

Correct.  I will merge the other loongarch patches today, so you should be able to rebase 
on master.


r~

