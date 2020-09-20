Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396672718B2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 01:57:41 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK9DA-0007vJ-B9
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 19:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9CL-0007Tb-Q8
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 19:56:50 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9CJ-00026r-EO
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 19:56:49 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so7343287pgl.10
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pbuEh/ZGZ0nu+k+xH9Rao2SE0AjmjQ6r+ibdMpc2ebc=;
 b=zdGvx60HInaP54yq8EUTdI98p5KCHN3RqBMAabYdS4oFLe8X+cZ0JfhwKKRjwIXHou
 SaVKuy6arKSAA5ZG/7GPTnJb8SvSkK2Q0TpTwe1AspKfYJsJRs9wuV+4AGAePawCFNbu
 OBSw29oRxMcifFyRuB/U6xW07mg9Taeo/dZ8xgL/tR0tUVZSRvVZ0AdfUSRLhWP/F/h1
 YsCZJtVYlJGhIomqekvrX2WKBDnPXGLVoPtLvHlR49JTl5mW8NgVFnh22xeWb/Wai6Y3
 kSOxVjQ5/cHmGjdleJrEi+MSxMigWTTiUKkOHlslHgOAXZu2Lzp8zRIQIuLhwX93Tfss
 mZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbuEh/ZGZ0nu+k+xH9Rao2SE0AjmjQ6r+ibdMpc2ebc=;
 b=Jx3rAnYD8Jg1qwPFCyYe4K8Wa6d0fNZAhyNXMV7V5urOxsZBJEmiDJUEZnd48LMnA1
 qcUNEgepe5UOVcqyJ+v9ovWaY64TpSXtlN4Vr+QmLBOureddZOYdb9UfcmfIcJhjsfc3
 Aak/JAJ3Zag3BjeQI7wzkFy3wEFSVvGdca6BlfezaO4bIPNHemzBLaQmOhF3pYaN+hZi
 QXbMwHZ7TDNZVV5HOz1tQDxLRu2K5FPZFuppGTHvuCWn2EmMVTwzOVpK2Ldr2zS8VmhE
 G8bzCR65cZu6ekEOgqEBBPRoCtqDcWJcZU+LGSDvo/yMY1gKrwEg9FJpm8dQrR6bmQD+
 kNTg==
X-Gm-Message-State: AOAM530A2htzNeAiDy/q6XaMaz7msXnr3QLBotfX0fjrGirxoq3U7daS
 0aDQj5ITe67qt5w3D/ohx4voG8/2kWsWqw==
X-Google-Smtp-Source: ABdhPJxyUpDuzo8bQe3Czs48rTiE/QvRX44s5WcPxGUoOvJfLzPPMsXNVgNEN5Jfjv9Smb1FZIyxVA==
X-Received: by 2002:a65:68c8:: with SMTP id k8mr19569912pgt.0.1600646205355;
 Sun, 20 Sep 2020 16:56:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a27sm10174528pfk.52.2020.09.20.16.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 16:56:44 -0700 (PDT)
Subject: Re: [PATCH 1/9] default-configs: move files to
 default-configs/devices/
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200920130708.1156310-1-pbonzini@redhat.com>
 <20200920130708.1156310-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53548e0e-5af6-683e-ec69-1a50edf056d7@linaro.org>
Date: Sun, 20 Sep 2020 16:56:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920130708.1156310-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/20 6:07 AM, Paolo Bonzini wrote:
> Make room for target files in default-configs/targets/
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


