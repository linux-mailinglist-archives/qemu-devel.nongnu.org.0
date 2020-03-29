Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADE196AE9
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 05:57:49 +0200 (CEST)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIP51-0001Yy-Iz
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 23:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jIP4I-00013m-1c
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 23:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jIP4G-0002TY-RV
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 23:57:01 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jIP4G-0002Se-Lk
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 23:57:00 -0400
Received: by mail-pl1-x643.google.com with SMTP id d24so1407177pll.8
 for <qemu-devel@nongnu.org>; Sat, 28 Mar 2020 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YHsKxquyQgTi5vsa/k9/RfFAWWGgIUKBLwSRhGYqLz0=;
 b=b3CnWOArP8obvNxMrrZZhQfvqDOdHX7aeG/ew4N4NNP5FeGcJHlVCCJRBq5xh1oh3i
 TlfUXHnY2fLXiPm90gXIZJSQgj4//NgcSbYom+aHkY8RPwEUh+1BbIc/3ysjYUaLMRY6
 +j1FVXpDtjouM7cgF2sCtvzkrJIgGYc6wU4UqnKrGohtkGM4cwPP3jq5tlXJz07PmtzL
 PGRV4TygBioA5yqABXUtesJHBBdBFcuJYsdXz7sN7NjQzLqBY9yTbO+BataFxDvMHwgh
 C3XqEyysJr6RmWH6qOY40ZhV62Qy25OvsYyqnvjDTxYxeJ9FOOmmw2mu419WRP6gTcJo
 bWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YHsKxquyQgTi5vsa/k9/RfFAWWGgIUKBLwSRhGYqLz0=;
 b=pZpZi0wJunBq4PMC+TylBbus6svWtQ2mZXil7dZnjcUyKXmXTHWnA/vgHFGOYlZSCl
 COLJW9FNYb+KMqIjfvyCNDuHTwk+hR4iO9t3aZjHDZVGiLoDlQE7ePyHbmaX2fwQRPvF
 gphDqhPM7D8nAoDF7DrRLnJzQH1MzRxAdJ66OIWm8A137OToukDpkIkbBmgqEGcYqRfl
 T2DHAo9gV+XTYQhq5Px/5zm4msFPeBGf+ROg71J61Mjka+HJh2IJW2lxRFZNCXmL/ZEG
 z9brORiG/7+1I/svPMV7WDGNh2lM0dneetKbUarCbf9L2PGNSVqSZFK0rRyE8cT/Z5v7
 t7sA==
X-Gm-Message-State: ANhLgQ1/haqzPTCU0X6oI03Dex1lfwdgKh2F5Ci1AzVO04CcG/5ybsM5
 swbqZoauUdV39gRq3WoDhyF1hmiWwbM=
X-Google-Smtp-Source: ADFU+vuq8MSl0KZL4CxrmvDdn1H1wJZKj2i8YuwnRtT/9fz7hvzPb9hhDnPDt08w0WBg9uqKaZoc0g==
X-Received: by 2002:a17:90a:aa88:: with SMTP id
 l8mr8694395pjq.10.1585454219032; 
 Sat, 28 Mar 2020 20:56:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id g14sm7098378pfb.131.2020.03.28.20.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2020 20:56:58 -0700 (PDT)
Subject: Re: [PATCH] target/arm: fix incorrect current EL bug in aarch32
 exception emulation
To: Changbin Du <changbin.du@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200328140232.17278-1-changbin.du@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d466db0-9949-6c0c-969e-1b70a8cc7435@linaro.org>
Date: Sat, 28 Mar 2020 20:56:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328140232.17278-1-changbin.du@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/20 7:02 AM, Changbin Du wrote:
> The arm_current_el() should be invoked after mode switching. Otherwise, we
> get a wrong current EL value, since current EL is also determined by
> current mode.
> 
> Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

