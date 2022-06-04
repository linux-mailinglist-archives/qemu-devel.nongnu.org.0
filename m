Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8A53D675
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 12:47:09 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxRJD-0000gF-SH
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 06:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxRGR-0008O2-2x
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 06:44:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxRGP-0004Fb-BP
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 06:44:14 -0400
Received: by mail-pj1-x1034.google.com with SMTP id gd1so9162415pjb.2
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nVEjhsj2IkTXz60o5Ha3uHdBeMjGZz1Gps4ugJXKJQM=;
 b=M4MJKxms0aQfDPz4gru6d+Hc7POvOMDQ/VoshoRlrTRFLwXk3bPu1pYuRrJWGjvXMT
 pPLT5ztc1fDEDkExxOOPE0HcTQ1idYnFzyV0AMg0KM3jf19CBx/XOnhR4H8B6JODfiZc
 UCTg5snZbmHLogPDwG3RfgLz+pCDVDBa1eYoDXvAW5m3AN9eeafyIyGbAGVQ1smVonrD
 HPU+hsKiZUm4CyWT8DMt3o5hbmQnGSA3aMGtsK5gahJq76mqpKFah5nuSeA9YZ29OyVS
 SuRh4weqQMQZMOj9Rz+lNq2VMoFuW0HcItQHsTUY29gqnWK3H2L2N4xpBMIwE3iA++wg
 D6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nVEjhsj2IkTXz60o5Ha3uHdBeMjGZz1Gps4ugJXKJQM=;
 b=XXE3HW770O457Pr7w5IQn/tiMeQKoeIn0AsiuQ41Brpd8dUmzYaeyMQhIwi11KUX7t
 h2m3BzIf2IlzlReaL+ljjIPMHoONZf6cRH/WyVEVTIs2/9IGv8Ac3Dbr8ydcAsWHEI+O
 FmW9ZkZK47Q3El6YkA2XvyMvk1Q30SPx9sxb66Y0cotVkLMP+l97CxuJEJMJg0c3M1G5
 MoECD9jiZQZPKCgxR8hcZrk4nQ2AV+B8IaEUNY+V0VyeGlNdHn6fpLn4ZAH++6xEAojt
 H9vB0/M1kY4EJLBQth39ifr9FGa9XLujSI7/0b9xjJKWfsQfObcTDlSr/ufK1JX+/vu+
 PDKQ==
X-Gm-Message-State: AOAM531K84HVGvB70P8AZ2YcmeSbsYpHaPoqFSXZapuahiCBlEBterWN
 m9xETJrbn4CcxUXhHogPRiw=
X-Google-Smtp-Source: ABdhPJwp1yrq/bfzNdhi3zwyRVdVkudMG4OnvsZ+GgrHbZT8fy5GxJ5LeW+9xKyTBUkSOAAxlAFdvw==
X-Received: by 2002:a17:903:246:b0:153:84fe:a9b0 with SMTP id
 j6-20020a170903024600b0015384fea9b0mr14192396plh.163.1654339447180; 
 Sat, 04 Jun 2022 03:44:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iq18-20020a17090afb5200b001e31f4cc977sm6498447pjb.56.2022.06.04.03.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 03:44:06 -0700 (PDT)
Message-ID: <a8cd0ad2-ea7e-a4fc-8a02-6272831c9aa3@amsat.org>
Date: Sat, 4 Jun 2022 12:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] linux-user/x86_64: Fix ELF_PLATFORM
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220603213801.64738-1-richard.henderson@linaro.org>
In-Reply-To: <20220603213801.64738-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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

On 3/6/22 23:38, Richard Henderson wrote:
> We had been using the i686 platform string for x86_64.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1041
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

