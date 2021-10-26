Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB243BB8A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:27:45 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfT2u-0005LA-Cq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT0R-0003II-Sb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:25:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT0O-0005is-5d
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:25:10 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so1940143pjd.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mD+KWLbim/G9ptBjy3aTb4vD+3Fy5Uwatddtg4vn4Q4=;
 b=au3ZUmcQcy4O6AhsSfN77qwL6KZbOixNYldLEFmh14ix23O9NGy1X8kdyzkvngvu3K
 Ep9JY3uSOtb+OH3ztlvHQrsgsIM+SYh5x1mnbxKGdJOtz72TL51Dlg13L53xTXbOfIVx
 2jR6ea6qm7j9NZBpO9l2ffelR3J+5KqBnnEZuCos/lCf5a0z5yiDHEnQkgCC3TlLZi84
 iMZxR1dRkDSrykT96OBxcURXaRaJC8QeysbnF4uthJkW03q7TY+k4hdZhsMffdQVnkYi
 1slymsQHFPNnnpxHdVWWg3EHrdZdE+Xnreeo01c4PAXizwW2uw/lJ2vGGPiI7tSRm5mO
 8g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mD+KWLbim/G9ptBjy3aTb4vD+3Fy5Uwatddtg4vn4Q4=;
 b=yYHP0Sgp3ljPwkF0vWkPv4KWE//w26KHME/PtYnlH8G5ra4r7FaLe8+FWtJ+Uek2/R
 ihxMCyB6F0tjGPHXMTQ1OUxrTewuCWQ9qlyJ+6SnUrXtRhZ6ddsVuEiChO5pop9VuThc
 YZr9OPrN9mYwOFf9SzI5Mr1UpfDI5TlMI3ZCnI/jtLtr8OEZ1mZk8q4O9j4DObjZP0EJ
 UsFRPvgkx7KjIAYQ47jDcISYr3QsyqgJeN7eWloyLUe5i/49VHmyVadTzqCFNI83k8Zz
 RETrGRRbnMMxyNsaqCAoJh76hs/XMIkEvpTv/a11N+sN6Wmz1D3rQnKIkvp9ITDmE96U
 6QUg==
X-Gm-Message-State: AOAM533l9Lfsi3rn79HsPCDY21xElKfmx5rmZbN0pZLM5TFnXwHToeKs
 IBeWRIldSwYTv4C5SC99H7wz3g==
X-Google-Smtp-Source: ABdhPJylpcVjlH042+7mE79xJW+ujBCgWx+rOrnRNIJFd0MH5PfQ5O6I/CTwDYyqhgw/vgGyp4J2Vg==
X-Received: by 2002:a17:903:183:b0:140:47c1:1f2e with SMTP id
 z3-20020a170903018300b0014047c11f2emr16361364plg.69.1635279906827; 
 Tue, 26 Oct 2021 13:25:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p16sm20233450pgd.78.2021.10.26.13.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:25:06 -0700 (PDT)
Subject: Re: [PATCH v1 25/28] plugins: add helper functions for coverage
 plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e26b5d8b-fe12-c0f5-0cd3-6a2e7421c0c0@linaro.org>
Date: Tue, 26 Oct 2021 13:25:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, crosa@redhat.com,
 f4bug@amsat.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, Ivanov Arkady <arkadiy.ivanov@ispras.ru>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> +#else
> +#include "qemu.h"
> +#include "loader.h"

There is no bsd-user/loader.h.


r~

