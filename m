Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4541C42A5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 19:25:16 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVeqB-0001K8-TV
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 13:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeon-0008Py-Nv
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:23:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeom-0004op-Vt
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:23:49 -0400
Received: by mail-pg1-x544.google.com with SMTP id t11so81266pgg.2
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wxqc2SAa5+CaPyLhJ554cWTqJmn6G7ojwYg+/JVjCDc=;
 b=DSRbHW8qbs7S0u/p5GieryAJMI6M/tYi5aSsB/U4rQRH91BN1+qGECGvK2X1ED4htQ
 zFYoqihm2x/vOkAOIHC819qdjJH1sxWtsOU8ovK6E7WrPkmuU6yObQ26lwDjwqbTA+L+
 1cYbqyTN1URymkMChFxnMyL6CIlxGyAgr7SVir1MaPf5iLFT+/SHi74jWD5smqowmM3N
 3bGk/+IP+0c6ps3JVbOyzbf3YQrYWYibEgxakPTv5yMFhjlxnekBsrybDkaW78SRvtG6
 +3luFdmZ2fsAxjB/53TWhToOGi8Xw1KlYIw9knwzgu3a+ec00/SOkYcfaZptxF3QXjZ2
 B4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wxqc2SAa5+CaPyLhJ554cWTqJmn6G7ojwYg+/JVjCDc=;
 b=aOt+FKfFx/o03UIqi1HYoGDZWa0BnwoJwqminLGutyy3MlEPumzl27jWQzSGbD2aGc
 zpm3A1wLjuKfL+X7YjllJkKMjiOLpE8mJHR6L0pvP8aXaLw+hnZKiZ+QEOM/0AWjMSBR
 Qjm8Mdb/fWa5xJCZWVqJkwV13Qp/1Nk3LDILvJBK9iQ8FL/R8vpegvGRaBfscYARf4Tf
 ZCDSxPWZm84JM7FcsD8Eo6PmkmgFuR8mpqb+jNzE6I+vNtLyB/rnchZ8KxbSUUa8fUGc
 WnxFLoH6XIX9jb58nvyW9Ua5B5Sqxl6aSzU0ni8paG6Baz/T2PorDvncn8bvDUgAxSfx
 tmnQ==
X-Gm-Message-State: AGi0Pubggbd2LXIp6hYSnn9kudsE3XFgLQ+UQOPHV91MRMmgF0Wy//eK
 2BidtOZan0jD67rho5a++CarRg==
X-Google-Smtp-Source: APiQypLZJJUTTAkcNcttHY8rOt5sc82ZsMBvbo+0qQwbZfpxbAwyqpwOFlhrHZzwlNZKJV5MQbWGhA==
X-Received: by 2002:aa7:864e:: with SMTP id a14mr18728692pfo.67.1588613027731; 
 Mon, 04 May 2020 10:23:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 6sm6414031pgw.47.2020.05.04.10.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:23:47 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/i386/vmport: Remove unused 'hw/input/i8042.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504083342.24273-1-f4bug@amsat.org>
 <20200504083342.24273-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac758adf-33c0-dc70-05af-b1389ec997cc@linaro.org>
Date: Mon, 4 May 2020 10:23:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504083342.24273-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 1:33 AM, Philippe Mathieu-Daudé wrote:
> Remove unused "hw/input/i8042.h" include.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/vmport.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


