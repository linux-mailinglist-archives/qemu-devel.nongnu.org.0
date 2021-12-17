Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87064795BB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:46:53 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myK7w-0002PI-Uj
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myK5y-0001gF-Ii
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:44:50 -0500
Received: from [2607:f8b0:4864:20::529] (port=42573
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myK5x-00067Z-0L
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:44:50 -0500
Received: by mail-pg1-x529.google.com with SMTP id g2so655994pgo.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 12:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SFgKxpkg+Fo7RJ98m26R3E7ZPOYKqlUmEI4L9OHhxbc=;
 b=EBd/PJo6k/7CaMKZtwz71ZcWstQCWjyYrNElNr/lOdmEXYtNzdWPqog9zvKJdycAL/
 vcKeqcHyPrCxCiMG5THq+Cj78EZSgGUQrolphvTIr82fTgzfShnAdvuNYZ8D0kJwsuw+
 Dz/kDuo/0M2egd6hEV65bJNIPtQATL0xBVMi2FIYgz/ej9gOtjnTiCT6SE+FjkASmZJ9
 FqgbDhuJbv3NXo9fWeVPwNxGF68zuxlXB61J7wNWNgAu3H62YwQc63Uh1t/rBB2/H3Vj
 hO67RcT8P7WhLh0XPIZoqKae+0TzIKs/eaFXe2d++2IMMDz1ZXcqx7YXZzGfwE/D1jAp
 sXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SFgKxpkg+Fo7RJ98m26R3E7ZPOYKqlUmEI4L9OHhxbc=;
 b=BNJjp0QWUQXku1yZpfT2OjmjBUT/7dWSOATPesZ+B/Kz9lx8aTatztVY/rBZPXxSOZ
 7aT4NxDI3gxgBtCQhfBzZAo86vK1X5ISSMEPyVs9JMzSVPRmrzfcPmKcdr+I3d+YnYqB
 A+cbN0WcLs11aOiCq14xAsSBzfoRKkMK8TB7WdMW3rgPq7wETFvYC5eVFPOC3+WT0Ock
 HUNrRQowhHBuA/ma32ikC9fJMIEXdyxXa97K/tm3dIAoUpNH+7yVMINoDbEiAzzVmQXj
 6DDz1G1bGk6zrOm9gmYh0f9orR4CksbIMkEUjf2sLSRom4T66QFhWuNHSKeNsoCduVMV
 DJrw==
X-Gm-Message-State: AOAM530ly8rJVdf3vwx4XMItvNUw9KGArV4SocOWdoZ/NDXkFKQVL0Kn
 7Am6BFRE6SNxLiUL18w1LxS25CYbvu8V4Q==
X-Google-Smtp-Source: ABdhPJyOikhzmWbRtXiWshDEYGlr5F+rJ4OmslD87Mjr2U7c+Nn4BZYzkW3CmqX6In5eEOqjJFy41A==
X-Received: by 2002:a63:85c8:: with SMTP id u191mr2677034pgd.146.1639773884559; 
 Fri, 17 Dec 2021 12:44:44 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i1sm9257107pgs.50.2021.12.17.12.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 12:44:44 -0800 (PST)
Subject: Re: [PATCH 02/10] configure: make $targetos lowercase, use windows
 instead of MINGW32
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b3f2cc1-73e1-77c2-5a2b-fc0f8115b7a2@linaro.org>
Date: Fri, 17 Dec 2021 12:44:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> targetos is already mostly the same as Meson host_machine.system(),
> just in CamelCase.  Adjust Windows, which is different, and switch to
> lowercase to match Meson.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 58 ++++++++++++++++++++++++-------------------------------
>   1 file changed, 25 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

