Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524752EF6F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:41:36 +0200 (CEST)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4kx-0004jX-Ls
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4jb-0003xb-7v
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:40:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4jX-0007T3-8p
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:40:09 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so7658034plr.9
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9Q0jueeLLLnbJGZJy8pvub6blG5miJhhsft06RM4Vio=;
 b=wK38qVYl9g7ZIGCmviGNtcsA87zWSstswDHKkYyrSWXTYJ0q4O9CekvxG363SnsEYY
 6uzKEbDXKk76w9itviiv1DHlkVrLDqE3pghuyn18DtnCFVjx3QYLBKfk/vtT+HFkZZLA
 xuxMbUYWRiBbDTjrw3z3xsWwpTA/92fbw3zkZr4gB/28r48XBEv0kzHOqPS7jnC1HjDB
 I3Hj1Lnn7wK+QgDvrmBM1XyXrDNSMV8G70EbYlH93pIk5pin1xNgry9Ef6lotWm/wSul
 E+oX4OcWQhA/iGpnA3fQhDYghl+WE1a1nnCLI6Ul2xs26OZMR2FAtjbuF9yB6CSoXavH
 L/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Q0jueeLLLnbJGZJy8pvub6blG5miJhhsft06RM4Vio=;
 b=AJAL0SLIZQAEw/dR+watyHI5SI8L0cpl92CiXYCX8IJFiwCt0i++DLjVOrAjM5IXqo
 kJBFyFxC3pLMHVTLi+OkeTmRVbPNiPRmWEUPXs5puKUcaPtwPo9i1HQxMkz6JMrmBzvO
 k8l/4zUZqJ1qIXSlvLnlx5ObPSvzm3yI2fqdF3mq2Smr96fP1yIND9TMZYaG+K+BwwRC
 PBPX3Cvlf1luchRF5eCXmF5kHMt2P3oaLmNCcsZTnvFVXG2ZLKLeFscbM2BDudTBFlCC
 +XC+m1qOF4Ed6HiMnxbuMa83Hn8XQwP+mGIVToDnVgYRR3e1IkKgwXdiIN5w0kJMiuTp
 0E2Q==
X-Gm-Message-State: AOAM530Wy1whS91qCxw4YGfxz3PDpyTUuyUDAD1zWPC2MwluNxw9ZpNj
 zMQsYtxB9hLvqXOXZbMizlfBnkq/5Av+Yg==
X-Google-Smtp-Source: ABdhPJzBBhTNRxtnTUl9IJW1Ar6htGcBiZKsYuDkq2LVm+itLVtxa4cwCZitgs7tXoAbi/8QCf3ihA==
X-Received: by 2002:a17:902:e851:b0:15e:d129:fb20 with SMTP id
 t17-20020a170902e85100b0015ed129fb20mr10142814plg.140.1653061205764; 
 Fri, 20 May 2022 08:40:05 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i3-20020aa796e3000000b0050dc76281c8sm1925993pfq.162.2022.05.20.08.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:40:05 -0700 (PDT)
Message-ID: <91d68cca-be27-d4eb-fe0f-29ce2465c976@linaro.org>
Date: Fri, 20 May 2022 08:40:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] contrib/elf2dmp: add ELF dump header checking
Content-Language: en-US
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>, thuth@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, yan@daynix.com, viktor.prutyanov@phystech.edu
References: <20220520084339.171684-1-viktor.prutyanov@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220520084339.171684-1-viktor.prutyanov@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 5/20/22 01:43, Viktor Prutyanov wrote:
> Add ELF header checking to prevent processing input file which is not
> QEMU x86_64 guest memory dump or even not ELF.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1013
> 
> Signed-off-by: Viktor Prutyanov<viktor.prutyanov@redhat.com>
> ---
>   contrib/elf2dmp/qemu_elf.c | 53 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

