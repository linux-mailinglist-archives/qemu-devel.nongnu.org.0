Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BDE325C91
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:31:19 +0100 (CET)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUmc-0004R9-2c
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUBX-000250-GT
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:52:59 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUBV-0008N9-Rg
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:52:59 -0500
Received: by mail-pj1-x1034.google.com with SMTP id c19so5216851pjq.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QD+kIaeaUSL3mbrRWYuBh+Ihq1g6Rwq2i96Ajt71LxI=;
 b=ns3621riE2MpFO6uwF9Wne3/wR6a5LaPyrJYYwNvGU4MqCgZkjUWHmDYUotvb+Qdy/
 SZ9KE7G4v3L2ndzWmLv159rao5hoHsUxDCJeH/MlDNijAOJoBR/8BI1u/fx9faSY8H/V
 XW+1UGWm3zZcyLFPZtW+guOQSw3ANjR8IIoKC926OwmELu4bOlRt+JXQXZ9mWyGnZ7cT
 cZhxl/zj+WiR9G1RH4g6cDfFBH+8Rvx6UWHy4khRnnEDJD7aOg2rxu4kv2g76+6S6RdQ
 iQ9yzwf2r8DtmMl7HbNsUE26J4GytteabCljL6offTrdWpCaXPYIzAXxIr9xR/hn0jp/
 Z20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QD+kIaeaUSL3mbrRWYuBh+Ihq1g6Rwq2i96Ajt71LxI=;
 b=nuJroe9+5krQZ0mnSwXJRcfVuvJRkfaL5Fh7qhW5GFEpjtHK6faOT+5q1LC4M8p8yl
 dOP1zbJmJywxTeDLGb+Lcgy7I6LZ5sY2onEeWfNX+PY3GDy2OPbd1DnkDgeezY6q12uW
 mwxNysBBggtpT3JdZEeWq4PLfaOGVcCX+2C8FVIbcwYH4HdqA2sbNtSOUlsA9oEl/5gK
 H+z6ir2e1seuoisLPu/rG7snfEoeZ66p8bpG6gopRapmeBEfxSTu4KhnaUXcRACHT0gU
 TOAC0XyrqO5k0rMIW2geRJGwURcxKHbcinF8GDtqmpKJYZLKJt0B/5VdLQkaqHrQ9A0d
 HW+A==
X-Gm-Message-State: AOAM531t6qDEhSKPv2N39a5oJh4NZBxeMJTOBa+GeuOh61+Y/u0WMI0A
 dVs/k2AguiAzHz409aqNtPpxlg==
X-Google-Smtp-Source: ABdhPJxT1apcjvTIlyv9VROorIRIin0gQfOfRXVnrva9YIUbbRQ3bsypY7WYK5oe3qiYW83+4AJs7w==
X-Received: by 2002:a17:90a:b38b:: with SMTP id
 e11mr1265886pjr.205.1614311575173; 
 Thu, 25 Feb 2021 19:52:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b34sm7722204pgl.63.2021.02.25.19.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 19:52:54 -0800 (PST)
Subject: Re: [PATCH v2 10/10] target/hexagon: import additional tests
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-11-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a88523b8-ccb0-bfe4-1cfb-37ba9aba382f@linaro.org>
Date: Thu, 25 Feb 2021 19:52:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-11-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> +++ b/tests/tcg/hexagon/first.S
> @@ -21,24 +21,24 @@
>  
>  #define FD_STDOUT                1
>  
> -	.type	str,@object
> -	.section	.rodata
> +    .type	str,@object
> +    .section	.rodata
>  str:
> -	.string	"Hello!\n"
> -	.size	str, 8
> +    .string	"Hello!\n"
> +    .size	str, 8
>  
>  .text
>  .global _start
>  _start:
> -	r6 = #SYS_write
> -	r0 = #FD_STDOUT
> -	r1 = ##str
> -	r2 = #7
> -	trap0(#1)
> +    r6 = #SYS_write
> +    r0 = #FD_STDOUT
> +    r1 = ##str
> +    r2 = #7
> +    trap0(#1)
>  

Don't re-indent stuff.  Otherwise, it all looks fairly straightforward.

r~

