Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9D33E1F6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:16:39 +0100 (CET)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIvW-0007wR-Dq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMItm-0007Td-3D
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:14:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIti-000847-AN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:14:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id w11so11314789wrr.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D4pnPGCPldXL56bUPFmLZ5dUIRjlKxgnpn8ZGiXZA2w=;
 b=Za+JzpNZh1CqaQHSgFML6UChpMlBGA0YJ2ljzuVZogepOO/3A+kBZXO6BfThFaQMdK
 2ZKHljS+I+Vv0LcovXkLCztJutXKoA67uNta1EydkTcF8zBOGXMLDhQicmFRlviptYM5
 XaLHZy69l3q+KOb1eAIszqgSqH8mqjDG1REgjxgLjyX3+5UEQTvy/GcveESByLrXFC0f
 5hl2mrnQ7/9rt0hVVYT4aHSABX6z1kk1V9JZtG1Y1ZjOeLNqUsUL5Rq+AcN4loxtsuYT
 3EerM6OpJPs6X4RGkZAloiROmd2Xa/Si0GDU6Un6db4T8IvzH0yqroWsaf1XUhSPiZm2
 IM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D4pnPGCPldXL56bUPFmLZ5dUIRjlKxgnpn8ZGiXZA2w=;
 b=SA2Hnd9nTDMmizyy8EfH5yXVQ9zPITPU+KeSWcdOyAOZzrOU3aGnuY5lXuy9xopWYi
 huUIiXvYxL/3ls9bmcVHYGyvwQxY99AJ39htj9SURCHhacrdh33/nRCHlhuTTIlIGNCC
 3qLCd9B1JuR0pBlRl9v9V8Bu0dMYL3xyXMX+1+y46w2idg28jkGmvAI2whOc3oWuahuW
 owuXl4f6BvyU9EQzRIzWuuquavJp09O4VhHHDF93InLIVYTC8hCNpflUd8Il3NVlQRdG
 5GI5EH5AGnv6oggtctcxmO16T/HUJV4Wvn8zB0v7C2ddncCzmcmjcp6L2vWoFIPIX4ks
 rLdg==
X-Gm-Message-State: AOAM533T5XHBlqi6dkat/nYwVfJz0jN54DsIcwUUeNJ/c8e5SJINvxAT
 V3FXLJzqXh/LVII6KJHx1qA=
X-Google-Smtp-Source: ABdhPJxNGXR/qEihCmEtcdYt27tJnV9EIWPd3PGDvPnJOGz4wAA5Kn+4wfj6DMn06sZLxX8EWkBVgA==
X-Received: by 2002:adf:8562:: with SMTP id 89mr1288011wrh.101.1615936485014; 
 Tue, 16 Mar 2021 16:14:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j14sm23659921wrw.69.2021.03.16.16.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:14:44 -0700 (PDT)
Subject: Re: [PATCH v5 18/57] tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9a5beb2-980d-6fa9-7f34-471b335d024f@amsat.org>
Date: Wed, 17 Mar 2021 00:14:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 147 ++++++++++++++++++++++++++++++------------------------
>  1 file changed, 81 insertions(+), 66 deletions(-)

Chapeau.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

