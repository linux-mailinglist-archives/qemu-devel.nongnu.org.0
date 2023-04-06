Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103C6D8FC8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:54:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJV7-0000kn-Oi; Thu, 06 Apr 2023 02:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkJV6-0000ke-D3
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:53:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkJV4-0000MU-Im
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:53:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id t4so33204718wra.7
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680764016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94zSwfpY2q/6uKNnRXyYp97rr7nbxkDDGisgB8/b8Co=;
 b=LYlwI0F5ArFkJ1VB6XdF9H9TJmAlOjxMN3v3PM69QDO7DCvbPpjYwVzROj+8IFX0Zk
 s5kKuVN1f4zbCGpPnH6owokNb1L1+J2h9lcOw/MnzF86WSeHsz+qT1jUBLPvZCeqqqXb
 etH3qUuN7AqpKcz41Sl2Y2D8MYRvwj4VCLQaVhZe8hfzHZsHE4UStZp5DXs8QmjxXHPx
 NjInuzg7oAaee/H6QJORSikQ+hvbZGaNyXA/WpGcZ5Ht4lvRlM+qamxB9yU4tmIol1qf
 cncdK6vqXS40HTWsAF6KSuze0m99DHIJDK3GA/xusbA4vXZPy8MXhtcC0vdwqXQwsr+i
 VxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680764016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94zSwfpY2q/6uKNnRXyYp97rr7nbxkDDGisgB8/b8Co=;
 b=bqK9YitM6c6ukjKR5biILfJHzjvpEbh1BlfimqeA9H+tRtlHhntxzNyp8pJ8gPTG+r
 I16DAiVdP9J/vn6UohF0zFbjoA1YleprKcipGOUX4tG7o039mIfpQ3A5UrvXYXDXUf0N
 bpARTRXEbpIht8JA6Zisgb7/QNjkqXNMoJoivxwMVkhTdN95YwXXw4IzZBYvPz++eaIM
 QtPehyg6BMyrEkxe1bNyFPoTF7C1Gq8+TP4LFAqJQ1AmeFhMcYbP62xIKKT961d8m2Wl
 ydpVj9hgW2XFg2jnwfUJyAAtEG0go7iS7p6a3+/KuJx0tJxynq4fsprP/8NjVxJOmvbO
 ECSw==
X-Gm-Message-State: AAQBX9dNiaeOV8dDHUC2cMwMdlXd6sHppvrrrAu5nQ6p+Toz50+G+kER
 LEV0C101F4E+xxRGgjAHQKuClA==
X-Google-Smtp-Source: AKy350Y0hnoKCVB0E4+AIs+0E4vRYJH0zNJ43sP13LGq1g4UJRz3dFgdhAzHwmnBTHpdJfKQVzeWBg==
X-Received: by 2002:adf:dd4e:0:b0:2e5:e8d4:5c04 with SMTP id
 u14-20020adfdd4e000000b002e5e8d45c04mr6092574wrm.6.1680764015916; 
 Wed, 05 Apr 2023 23:53:35 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y8-20020adfe6c8000000b002c559843748sm877632wrm.10.2023.04.05.23.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 23:53:35 -0700 (PDT)
Message-ID: <f4e0ef73-c205-0d50-b78a-81eb2233674b@linaro.org>
Date: Thu, 6 Apr 2023 08:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] Hexagon (target/hexagon) Merge arguments to
 probe_pkt_scalar_hvx_stores
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 quic_mathbern@quicinc.com
References: <20230405164211.30015-1-tsimpson@quicinc.com>
 <20230405164211.30015-2-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405164211.30015-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 18:42, Taylor Simpson wrote:
> Reducing the number of arguments reduces the overhead of the helper
> call
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/helper.h    |  4 ++--
>   target/hexagon/translate.h |  1 +
>   target/hexagon/op_helper.c |  4 ++--
>   target/hexagon/translate.c | 10 +++++-----
>   4 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


