Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0F5179B3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:04:31 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle9e-0004ce-Aa
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3c-0005ad-Jd
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:16 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3a-0005Pw-2N
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id p6so13784274pjm.1
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W50w/kJdfrR+ok9EqJQALSXuf+EgMWQVK0PYemCkVQ4=;
 b=nvRC01S86lxQ5ueHYlD/2cUg6GZ35S9PIhE8UWMtyQH550oshRn9tMrl9DTfRGrlKN
 YapM6ZEa1QGTuS9yogCR3gLKqwie3jB2w35RB5Nig9fewUCy7ZToG2ZkicIsWn11emRe
 fq4JTELSXeMR3AEndQpHTENzAAI/nHOjRhMFSRndg2djAF18fD+k+N/cWiH8an0Q5vRi
 ujda0bEDoXUBACwzsYHsMYPY7E/hN7NZU7JQ5xvW3s1G5dwycr/wHZ9ICSNisApGZcSu
 QiPsu3rQIOxabL4lNgZpm6ZjrKHCetnTMhSkfzqQnXVzuQW0k60PhFm1bnnMvkrtyvlZ
 ivRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W50w/kJdfrR+ok9EqJQALSXuf+EgMWQVK0PYemCkVQ4=;
 b=XAp7elRi165NOUqoN2K19NlVTDi5kTXAvSxURb50uog1vbPVlFktTejnvCk+J/f1LA
 oZYKrzZcdHVqxpxvXHXutCGNPOzteY8IcRtcG0GnWQ+RxJrzw2d0iWU51Hn/4cG0Ti75
 Tt+RkcleJfwR1DGCq6t+WtAScn6H8UJOU8fZ6SM+Y0BWPRgwNfozUc2GN4Lh6e72d5kZ
 rQJDMVEtdPyMR+Ofk90U6DlvMk5NeUR18+vs8JAuGVjv+FgytLnsyTbOHKMqqIhLs3a+
 l6i31/+MRsEbSCnTlaNQ1iuSdZIi4EagRTGrOknrzKbVYixsphISvon5N37bGn5DsD9w
 Yvvw==
X-Gm-Message-State: AOAM533uXUWPSk9Z/kGKBFZATVv0z6Mj6Ww8Bp24wb7cgJpPziM4Itvp
 1f+oEODt5SQXDKAoW44iMOjBFg==
X-Google-Smtp-Source: ABdhPJzRtD1BbVqCc1noNhQMg0wKLuxcYYEn6OWXgDoFBjkfFW+VXpcyheaYa5u2Y7bOmHRwKq8KUQ==
X-Received: by 2002:a17:902:f681:b0:15e:ade1:b703 with SMTP id
 l1-20020a170902f68100b0015eade1b703mr3903061plg.112.1651528692773; 
 Mon, 02 May 2022 14:58:12 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170903228300b0015e8d4eb1d2sm5224651plh.28.2022.05.02.14.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:12 -0700 (PDT)
Message-ID: <5c962596-51f9-9de8-6979-34b8337c67de@linaro.org>
Date: Mon, 2 May 2022 14:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/21] target/ppc: Remove msr_ee macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-8-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-8-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_ee macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

