Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B810E546763
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:31:44 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzejn-0002Ja-J7
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzeiV-0001VI-63; Fri, 10 Jun 2022 09:30:23 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzeiT-0008KZ-PV; Fri, 10 Jun 2022 09:30:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id h1so22756936plf.11;
 Fri, 10 Jun 2022 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RZl4pSKB/CQRRRoINtteKarwl6x6867yn9Z3xM3nFxQ=;
 b=QdO6Ah5jev0UbbU9rdZyCcEuLAH3bg3lwZlafRjPzOku6LwcDe08krx58hsmQLVxu6
 VrerildiM9Xd9WNDdDd110rCSPrD492XMnGVT3X63Mlbi2aIgbHh5d88LsID+LxIegs7
 EOIU4CD1OT6nPw+9Exz7ThhSYprLAy4DUWbSL5SClEDXTeLuEYmMbxObo6Db6NnEJ5Sc
 IRhS8Wbqi/boHwVX9orwj+Cfilo2RqnI0fkH2lHwM6kiB6hlJpVgycAdYqohlI6JM+Gh
 vwJlZ4xMPcMrru3c/C9eDqwc50gaNl6evDrF/yJnplDHAveiZPiFtZw9lisCPweGcVVX
 lkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RZl4pSKB/CQRRRoINtteKarwl6x6867yn9Z3xM3nFxQ=;
 b=TMvt9Jb8qHuzH1ysCJE2bsA6h87tQOLMdtxaKjQitV/j141EI6VGl2Cu/2+oqS5LD9
 pBK9hjQpgyDXJrVFd9OCUd9Lad57m5xvbZGXzSVm2izv0GHXIBc7i8hwKZaf6906ODNB
 rNI9RlpJwN9mnSVtwEaLzIiZAcB5g25BKNAxe1y+RXOp9KCLuwV+N1Q5TKSJnECblPjK
 2EdZMJdvPllZ5hQNlFzqQRiW89v12SaKwMi09xT5IFhk+2aAumlUs5C3mHmNO0jR4qKa
 SdVWRokCMswSL03Ity4yJa7CS2mDTZ2ulv2kHXIzE2fS2eNc/EZDi8PbyuSlyl8NBT6C
 0gsQ==
X-Gm-Message-State: AOAM53223CF5IJKzmeoO2mlUqBYWroSpBdicrFKgfcgGoVIVif59mh4V
 pO4fW558+3ZgeQgZ7ZGD1b8=
X-Google-Smtp-Source: ABdhPJzkcgIpb7udjjf6AT8Hl84UW9mTojGjIGlTctNVE+eo1B43cZOgR/n/tl5GMVVzuW3uszCXWw==
X-Received: by 2002:a17:90b:4c0c:b0:1ea:87ef:546a with SMTP id
 na12-20020a17090b4c0c00b001ea87ef546amr850408pjb.209.1654867820119; 
 Fri, 10 Jun 2022 06:30:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902eb8f00b0015e8d4eb25asm18554418plg.164.2022.06.10.06.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:30:19 -0700 (PDT)
Message-ID: <fc60eb9e-8391-8811-4a95-f94466208f94@amsat.org>
Date: Fri, 10 Jun 2022 15:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] qsd: Do not use error_report() before monitor_init
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220609122852.21140-1-hreitz@redhat.com>
In-Reply-To: <20220609122852.21140-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/6/22 14:28, Hanna Reitz wrote:
> error_report() only works once monitor_init_globals_core() has been
> called, which is not the case when parsing the --daemonize option.  Use
> fprintf(stderr, ...) instead.
> 
> Fixes: 2525edd85fec53e23fda98974a15e3b3c8957596 ("qsd: Add --daemonize")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   storage-daemon/qemu-storage-daemon.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


