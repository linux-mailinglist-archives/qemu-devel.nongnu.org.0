Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047A3945B4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 18:16:19 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmf9m-0005JF-59
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 12:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmf81-0003UR-41
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:14:29 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmf7y-0007XZ-H1
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:14:28 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q25so3615343pfn.1
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CjgDq14DnELNp2cnaiheqno6z98Bl1JYG6doqEISyGQ=;
 b=WgRMuxjxlsALA7D30BoU45x2EcIv7VZ1bOQiX3TtUsCCtHPlB3U1MdeAkrwWDuz0zm
 xlmlr4ZQB01JWDf/ZFfmW7gjFurQzI++UGPwM/baOUmNAnhCZw9BlwSRL7I1ngqouKjN
 WQk7XuEKh1Q0jSTrajTST58Fy/kHr5OzuNeEwJN8RBx8SG1lmY5JY9IBS0GFqYYZ0SYq
 r5WY2ureV+VwL2NR050yWyEj40w/cj+hcWQ95cK8YVQZ+TAhas/+dbBExyuDUSvBdCG/
 APfmsYgL306iXaDhc0JHBdh4NxioAjWjLM5Lj21ddaz8p2H8OZgrYdRsByz67WJ3ORnw
 1wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CjgDq14DnELNp2cnaiheqno6z98Bl1JYG6doqEISyGQ=;
 b=BMeVJB0ZlC0dIbacipTO2qbH+YlQg5qm7f2ucBTjS3OCSkBnezmfOo+VBTFtzeTHkD
 hM8WjDPmBm0IcHpDrGA3p+5VIFc5bo8ozQwiekYn3JQXTv7OqrmXu0UkdjOB09Mt73UN
 hiG3tajJbsXh5/Zatc/g/6ohdrKdeE2hxJw805tLSrB+YvCPaMq8w6dzIWWJp9pd+gyH
 KH2Z/0HQCR2KM9hzVo5jhKRpmFkdp+kL8tYF2I57opGMFNRotQcrfE9eCCICQfaWKHf4
 hRUWO3QdZSIxhgG3gAuxhV6zgLSsWwR5YpfiQ5HSIcJjOzMKnPVyZmiiMnegDdPgGdAL
 n2qg==
X-Gm-Message-State: AOAM532j5+iIjwwVTx2l3dTl85Q60+fZ7v/F4LIr5aQzouugqkI1l7oI
 2eDMK1NMi1Fy8ltnc2bI9fElqw==
X-Google-Smtp-Source: ABdhPJwK/Qc/7PpkSMl6aMDtQQPktbduVOVN7VNV+Nqxv798gE1XGo1Byl2aUnlaCSsCyvO/SWPLNA==
X-Received: by 2002:a63:1465:: with SMTP id 37mr9617726pgu.113.1622218465128; 
 Fri, 28 May 2021 09:14:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v18sm4934527pff.90.2021.05.28.09.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 09:14:24 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] target/ppc: removed all mentions to PPC_DUMP_CPU
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210527180801.40513-1-bruno.larsen@eldorado.org.br>
 <20210527180801.40513-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <379d415a-06b8-2433-0783-77f5e69d4ba8@linaro.org>
Date: Fri, 28 May 2021 09:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527180801.40513-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, groug@kaod.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 11:08 AM, Bruno Larsen (billionai) wrote:
> This feature will no longer be useful as ppc moves to using decotree for

decodetree

> TCG. And building with it enabled is no longer possible, due to changes
> in opc_handler_t. Since the last commit that mentions it happened in
> 2014, I think it is safe to remove it.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu_init.c  | 205 -----------------------------------------
>   target/ppc/internal.h  |   2 -
>   target/ppc/translate.c | 105 ---------------------
>   3 files changed, 312 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

