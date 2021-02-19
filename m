Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56D31F339
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:06:03 +0100 (CET)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtJ4-0000gP-7N
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtGi-0008Fu-Gi
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:03:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtGh-0002xq-1y
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:03:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id n8so4808124wrm.10
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 16:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5jQr7q1iB40VFhN9DrpZpw3f871rDWANzcig2IgFib0=;
 b=Z5wCIFKPe8tltU2j2XwzPuSP4GQBtZRdCGv6v7joBjy0CvhVSWs4wOUgSTItLv1ckY
 z7aYAO72OVOys1iib+kdRjuCI/JxVw8xLSlujVuaxntIpuAlKY08CSxcAkZfFAN0End1
 2Aum6r7TpfVRG1MIMhWLAbgs86wHrqZ8MBhdmJoYZUiXVkDpwopXjwe2Ux0cg3byKJhY
 O5iuG1PHoPrboSBjbKjPIO6qwdGDGHGeVjYtyevK+1uk0moSdNwgHtT8n0PawfemdjFP
 kqy0siDhLWvrD2S0IXgUT/RDGS6A8NScEmPOmqrMPqs9pkRp/WWqDAD4luXh2rOwKLyq
 JRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5jQr7q1iB40VFhN9DrpZpw3f871rDWANzcig2IgFib0=;
 b=uBO4JoenIi1HCIf2qUr7U2vG2Az6HW67PFRlJMq7sv19flgVz/grVYMJ4JvjoKTFYk
 6s2wVxIYIa2GaVQFmkrizD/1XbdpYij2K9CcDvyqyElUk9VA3w7LmpV2CRY7EdxsP3zp
 RELpbAfYWU1GYnSp97BBDr1Rtk4AP7YkLHRD+q3Nubq7X9qyzhWH8Z1Yzkzl09CyT49U
 Xapk7kXKGIz864YhFy/nZoz0RTTyKmjP+3JoEWquAbOfAse6j6lO5E5JllfOOKvo8b0P
 IZoF6m/AJ8nFSkrZyhFH14rRegXLpwNJNTTnDG6SPxN8FX6QYud9YDgVzSxwT/66bsp4
 8VQg==
X-Gm-Message-State: AOAM531ybBNhrTyEqZnjYKkHiZyJu0JvoclQQA3rrr/Yb5rTi+kbAmrV
 68v2GYIyCrWcgb+Pyp0dgAQ=
X-Google-Smtp-Source: ABdhPJyY2eZYfIQGz42olX2BGbd9rRFEJKUbpxoux4UmeW3TBNpfWTBuFrVDhjPsgrmq3BABJDk9Cg==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr6467787wrc.80.1613693013663; 
 Thu, 18 Feb 2021 16:03:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm13864884wry.90.2021.02.18.16.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 16:03:33 -0800 (PST)
Subject: Re: [PATCH v4 07/71] tcg/tci: Remove tci_read_r16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8535952-375b-b1c5-9954-1f02b7725f89@amsat.org>
Date: Fri, 19 Feb 2021 01:03:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext16u opcodes, and allow truncation
> to happen with the store for st16 opcodes, and with the call
> for bswap16 opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

