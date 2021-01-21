Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E72FF57B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:09:45 +0100 (CET)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gH2-0005Qh-VE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gF3-0003nv-7I
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:07:41 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gF1-0006bf-ME
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:07:40 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m5so2365205pjv.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yWqhGMLD7ZE0QdYUaJUBX2xVOFSN9bo50gUXTCOl9gc=;
 b=wlDax69EzNt6+D+QPdQd9mwCa0eXmreDqMQ7vOIjfRsMizx/y5ugbYFW4ubq1lCypq
 zbB0OY5ihACANCYkr1IG8Czn3wdT0ysgXQYhy9CHgSWBDuRNKj+sv7sen+oFc7q8qSpB
 OxHxLPSboA6J/jBKuUCVD9IJpqNtyGSoA8XG0DqTEwsxi0kZAo3txjXs/FFZQ7n1/uOt
 0EgN3mlT7lYsPuP0pOMzWy9VXqG0d+DL9rSvzq9wmFJQb1wNL4Ap9bzuNngb11PuqmiD
 bwfbH2X+G1L1rcR8l2gY+t0TSW57rOqmiT8AcIOovVznXVuvg8knxerLD9WCQodO3qOE
 llZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yWqhGMLD7ZE0QdYUaJUBX2xVOFSN9bo50gUXTCOl9gc=;
 b=C9s0SezQPGNNlR9XzpiRSoNTzZKmKFv6MwyoEzhYn6FoTr7f5Wt5mAednOWuyQr8d5
 xw0GdCVOu7CdLeyjbwYluLNOy7HtQOOIShRWnoXjbgzQV0KwKlURwQl5zGjCHhvhCqqB
 TARcqMgaPIylNjvaeBsi9Icz8pXLwSYzEZtsKakxaBhLj1l8nJJmECU7t1k5jToNciQl
 3Ye97f8y91F5EyysIX96HEf6VD9hI4qEZBFzDZprKLn73IrIcgEYud9N6Bs3w8uOCPMh
 DmaEcshxcYxUPOpbHllilBO7Z3/4ePML0qjRcEzuBcyKSwOQPgfwusYSDk6cisrjCbIG
 N4Fw==
X-Gm-Message-State: AOAM532TGECJ9KyJmQF1AlHYY6Dbh2bgsd5aEojY3G+nIwN4P+ZWRuXe
 C2UwyPIKYzw5R25jOibaUC7KGw==
X-Google-Smtp-Source: ABdhPJwVrVL1BWIqsY54vKbL8irfaP1DAXR1X+F2+uoHzPLxpwHDmZYfMeqZU0aktoNVipJsy6tnlA==
X-Received: by 2002:a17:902:e812:b029:de:57c4:f6f2 with SMTP id
 u18-20020a170902e812b02900de57c4f6f2mr1349309plg.37.1611259658112; 
 Thu, 21 Jan 2021 12:07:38 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id p8sm6952014pjo.21.2021.01.21.12.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:07:37 -0800 (PST)
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0385d70-81d7-fe70-b5c3-6607c1212ce9@linaro.org>
Date: Thu, 21 Jan 2021 10:07:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
>           "decodetree: Allow 'dot' in opcode names"

I'm still unconvinced about this.  I've reviewed the code without regard to the
spelling in the decodetree files.


r~

