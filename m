Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B304F38764D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:18:51 +0200 (CEST)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwoM-00014i-KK
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwQa-0001eb-Vt
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:54:17 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwQY-0007Vu-1u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:54:16 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id d13so4625397vso.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RpYoykx6Iy5I3V1VWuXQcFRwRKWLhfoKN7YtPNenqQ4=;
 b=ue3+ZPCvJ2IAjRAyGloeS/iCV+GmWaIFpZTall/q6eWRwSpkmOZSUUS/+wA11aDS0h
 TeTxcJNFAWoxh3C4SGT9dWTjQVxK2nA5dh3td94+kBUFCBtOqSbGG1Y2qIbJl1VkPzC+
 C9WwGcOvdvqZv28Hvl9cTZ+Z9RmNgP8rKXq4uvr6rtecLT0DjFn0d04PpxIo/kjAEd9K
 hMZGGQsZjBWo2+kp/HqcHfj8LWfJ3WgFOHxxCdu4S8GEoHZIz76Hu8Mvm4gWuqzvLfW5
 r8foa4CHjTqU2WfKNP/nVBp2/9G4Bu8Lond2xXPEuJoZrk7gO0w3IxTlka7Wpa5t+zLT
 MQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RpYoykx6Iy5I3V1VWuXQcFRwRKWLhfoKN7YtPNenqQ4=;
 b=n3i+rE/pvCzhAvKggefLfY5i71GNDC69ug0wNQGAHli6QJ8TZxJgzHi/mgEQqwCoZw
 Scc7hnogi4mv5K/mOrhtE2bilGN+75JTkKd8JzFQEWhZKAEa30LaAJyn3oPmmySc6Jio
 pE09kCb5qD6krP3En0k4YdMreHZXfS76wi1GE4Z830zvuhW52jgXIICsshQMFgqf0hci
 8nK2fpdzb21bUaOsEG0egZQO+y82nS/Ihd/eeVytwzw5abOZdhSfk8O+9N9CLjSEXN63
 5ZzWzG3akl1d/E6sGi2Kr/ive9XhBXj4A8YV0Ga1s3BE91zj6zErSpyeDy4xTk33m+xM
 ExQA==
X-Gm-Message-State: AOAM532WzuMbY4YB1uyVlbpsTdgDN9CBaDIpW9/pqL/sI5DP0HFCKeFc
 KXKLo6RnbFPpkl4v9HkSwvakwg==
X-Google-Smtp-Source: ABdhPJyjaVWskrgiX8OBByIxS2zWxVjozWIoOd15OW0qxAomdzDQ6dupXGntKp7sBSfnUANIR15/QA==
X-Received: by 2002:a67:ce0d:: with SMTP id s13mr4935706vsl.59.1621331652881; 
 Tue, 18 May 2021 02:54:12 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x1sm2809829vse.0.2021.05.18.02.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:54:12 -0700 (PDT)
Subject: Re: [PATCH v5 21/23] target/ppc: Implement vcfuged instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-22-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf96c949-10d5-a8cc-2a5c-de9b74372f19@linaro.org>
Date: Tue, 18 May 2021 04:54:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517205025.3777947-22-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
> +    // centrifuge lower double word

No c++ style comments.

r~

