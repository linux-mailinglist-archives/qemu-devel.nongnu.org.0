Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FA4ADD6D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:49:29 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSkB-0003n0-Mc
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:49:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHRm6-0007wU-32
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:47:22 -0500
Received: from [2607:f8b0:4864:20::1033] (port=45943
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHRm3-0002M4-UL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:47:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3007151pjm.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ahq2bVQPr1vbgBazgiM7c+KInHZxI2RzLK4lQeWL/Bk=;
 b=osjOZqoMYSWDM06arjvxkGGUx1WZ262AIuFWybGa4fIX7LiOQkeKARtPj7nfMX7h8V
 AWLw4uz6YyNJTIaJu2P00uYkvmA7HDv4P3X2UzCM6EiE+vft1m9ahQelZCODePxgWTWC
 5A2h9WWxtiv0sHkKzYeHyI5p6YI8/Q3DWTLJQsoJNbWV+k/W4y79mYX5Iw8kgbWHX3yY
 v7xGZrFLBx06U2z+XdVGSLkWC68M9TncYmOEo/CaeWFVPCla+rShCRebo6IBb2VotIJG
 ZTHnNqnVVbWwsoFDcugR0BmbebqEFc4HDTLEaErghslODP2aROhHIbplw7eQTcbvjCfC
 jzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ahq2bVQPr1vbgBazgiM7c+KInHZxI2RzLK4lQeWL/Bk=;
 b=0gwBIS0mTyk1zBaHPIBGLuS78fAOfqQQhF6cW4UnnIJqjSltQ9Apr/sMntGrQzWQ1y
 TbwbzuqPjo5u8shd3RXVDJKyviq/NWXqOtHyqIkMcNEE3wzlTx0+kuIen0ddCNWsZfGr
 GL5w9z3RtGI1k7EGm5g0FzgLTPK1Mv70BfCFnStwyY3qItDAqEtjuj5gT5FqVwbrd2UV
 JWCrG0jAGX9naE3GL+B2Zp5wuGFkhD4aHm1WMQB21r1xYrxN3rGI5kiyDr4qnpekNYUI
 JBzc/61YUYd+Z1voxsh8WFNPtGxZDN5JB8Bg4Gzr3+BJZChhzaewlEsF+uuwkJl66oYY
 7+5A==
X-Gm-Message-State: AOAM531fXzykUIszMcl0RTzevUJoX7ESIMr2mjDyBTL52solqu1S/Trm
 g99TtT76EjopBSahvUyZAms=
X-Google-Smtp-Source: ABdhPJw+BiaZal6UGdtypqFXaTT7Yk2HQpP+MofbvqfUkfGJZvIwguxKcfbVzN4DFsO8d6sQmuImbw==
X-Received: by 2002:a17:902:8603:: with SMTP id
 f3mr5101507plo.134.1644331638461; 
 Tue, 08 Feb 2022 06:47:18 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oo7sm3632123pjb.33.2022.02.08.06.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 06:47:18 -0800 (PST)
Message-ID: <7e1c6ffb-1b92-126c-2d16-9310fd327db1@amsat.org>
Date: Tue, 8 Feb 2022 15:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 2/3] net: initialize global variables early
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mirela.grujic@greensocs.com, armbru@redhat.com,
 damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com
References: <20220208144458.1079634-1-pbonzini@redhat.com>
 <20220208144458.1079634-3-pbonzini@redhat.com>
In-Reply-To: <20220208144458.1079634-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 15:44, Paolo Bonzini wrote:
> Initialize global variables separately from net_init_clients, so
> that calling net_cleanup does not crash miserably.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/net/xen_nic.c   | 20 ++++++++++----------
>   include/net/net.h  |  1 +
>   net/net.c          |  5 ++++-
>   softmmu/runstate.c |  1 +
>   4 files changed, 16 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

