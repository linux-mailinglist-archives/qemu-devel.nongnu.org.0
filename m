Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911605F6550
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:40:11 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPEY-000564-2i
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOqA-0001yy-Nv; Thu, 06 Oct 2022 07:14:58 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOq9-0005ff-7P; Thu, 06 Oct 2022 07:14:58 -0400
Received: by mail-pl1-x636.google.com with SMTP id l4so1403323plb.8;
 Thu, 06 Oct 2022 04:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=2OoRN9LEWNoLUS7jRehhoJv18hilbJr4/Y3PnSMBACM=;
 b=jnMn4CQKu1FlorNGgik2kqskhcHi4EHZN6aQj3y/4mCBPYfOly+4Bu/ANaW7pOIFX9
 EeT0iegKV41UY4q5vmMJ6Po4msXj1gifPDfp2tTSSz5Nf//E8GGVHY+kD0MHvCVyfvVg
 FLG8ymUPiLYZAAwTQWXD6oImAF4JVcte1/KUd3EFDi8kGwIA+u+DQXPufM6n0xwq86Cd
 kyuGGHilnjj/823mMwXZ+K1Mh7CH525amQ3+a43zng/SEEAID5TU0Mon+1vUInun86K4
 Jqcz3QkpWPIcYn1HM+M31yHlfQq5/6ERam3OC1h22fUItCNCbxpcyIMqBbtNDDrEwNca
 39vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OoRN9LEWNoLUS7jRehhoJv18hilbJr4/Y3PnSMBACM=;
 b=PaNBHLlCad9YhIxv+c3ZskXOV1ZTOJ9dFs1gyvEqORiTn58DejAvmgetf56q+0948E
 jr/cWhYj6f9JwjsC1P70UqK/7CS2DVLFby1xa/+DTdHaz/zrvKXnLU7oUfmTFz6oESBB
 luLDCRRa6If5ncX2dNjIZDW9HqZTueLRnrrsBHxs4FkEDtkQPTLyXpKTjmfcm/CVAVhy
 0eOe+vwvU5Gj5SMnD8CFN5nTM9Yoe9A0S01FUR1Jx9724zwHHlJz2eAlisGjccPl1aDs
 1TdAAm2v8m4yA94sIHyw27zwI0SVfWP5huoKNdDr63ygsT7+Zz1ehIYCa68AFBAE1Hjk
 IiPQ==
X-Gm-Message-State: ACrzQf05S/AlDNgXLSiL/96uaVi5bSE+uIWRySqtSPBib29/8fZ9V7nR
 OZ7E7MwdSdqz5CZqhS80zh4=
X-Google-Smtp-Source: AMsMyM4UAwFCbpClUhFLS0eY/bHsrRI3xh4FwxjXdqxsojSxiuTYZwsD5HodoTL5D8qJIQHrg7BhIg==
X-Received: by 2002:a17:90b:1bcd:b0:203:27a3:6d0f with SMTP id
 oa13-20020a17090b1bcd00b0020327a36d0fmr4775731pjb.234.1665054895474; 
 Thu, 06 Oct 2022 04:14:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a626401000000b0053e8f4a10c1sm12596774pfb.217.2022.10.06.04.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 04:14:55 -0700 (PDT)
Message-ID: <f98d71c2-994d-28d5-b5e0-52913cc656df@amsat.org>
Date: Thu, 6 Oct 2022 13:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] docs/nuvoton: Update URL for images
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Havard Skinnemoen
 <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20221004050042.22681-1-joel@jms.id.au>
In-Reply-To: <20221004050042.22681-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/10/22 07:00, Joel Stanley wrote:
> openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
> images can be found these days.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   docs/system/arm/nuvoton.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


