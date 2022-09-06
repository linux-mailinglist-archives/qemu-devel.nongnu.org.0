Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971B5AEE1F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:54:52 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZyT-00075X-By
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZuW-0000Gx-UT
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:50:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZuV-0007S7-Aw
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:50:44 -0400
Received: by mail-pg1-x534.google.com with SMTP id t70so5039449pgc.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=VkpSoV644pb9LzlRjYGZP+b+0mxNFpCZajWPvu70d0Y=;
 b=nMO/U/g/7coKyI1uaAQ7BH1jmTQE8pblRUouiczlESIySlZ+2Yy1SITbWjgJSZLba5
 zXRcNEaBP3WjXnnz5rdgav8OIEF2anCD8L9mFC/8VXk8rTheKRwFrl6WSiDx3EQDzFt0
 S3pXqzXorqZjUNYwQjSFGtYJ/UIrhikzSS8FdRTbHsqfqjSfSHwN9ImZYeNQDqyZAZKK
 ZIvm8aD1Ic+u6IfTbE1f+/uxGYnwOAPBuimcno+sfns/9Tm/ipGKR1Aap+8ANdq6uLF6
 4KIDkro/OECsOGC1SDN0jk0UJgAlIkk/zR9B6hwZp0y1gN+ID5z1tjvp8mYcZWVo3NsX
 rMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=VkpSoV644pb9LzlRjYGZP+b+0mxNFpCZajWPvu70d0Y=;
 b=pB2Qe6UQa8R9Sdh7bORAiAEEcPJIyfztAfDyrQE5dMvD2sqShY1db/YkTqmlyOdlvz
 dIn+ZE9fo95hGbBDkdT/5rVzprH7VCoBEZywN3qCRdVcm0h05Q+QfQU3kaFTtOuBA3bP
 dg8sdMs5zo66/4FN/cnf6JZy1978Wg3XCDu3m3lRcWWbmy3jMb7iwin4k0NzAIVYpnRQ
 m+bWsib5BGx3wu0SHEOZd0cTb59143LPFLXlkCfCx3zNBi02ONHAvONRhX1M3glun6tf
 MY16KkhpjxBMOqFSlI5MgIYn7vBshaIffh+hBxVqphjJsHJYWELRecPiI5lgQWqbhpdm
 p4fA==
X-Gm-Message-State: ACgBeo24TejRmUOU0HzuFa069EHOizuK/AuSjBGLIhP81kPqmuMJsVls
 v/0G1RDTilpP7SA29vQMa5s=
X-Google-Smtp-Source: AA6agR5Fh+Mkpds6dD67wU4hrx7vJrRqQJ3ScaX6LkNMOjqxUvAQaaNUi+dv/OUhggxgV5Q0DXTxZA==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr55251285pff.44.1662475840136; 
 Tue, 06 Sep 2022 07:50:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902f68b00b00176c17e2c7fsm3318177plg.122.2022.09.06.07.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:50:39 -0700 (PDT)
Message-ID: <8315ebae-fb96-a190-92be-dc3eaea34a2b@amsat.org>
Date: Tue, 6 Sep 2022 16:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 22/23] target/i386: Create gen_eip_cur
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-23-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:09, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


