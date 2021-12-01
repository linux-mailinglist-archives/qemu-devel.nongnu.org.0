Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC424464E94
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:12:48 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPPj-0003ZD-AE
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:12:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPJ4-0000tX-OX; Wed, 01 Dec 2021 08:05:54 -0500
Received: from [2a00:1450:4864:20::435] (port=47039
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPIy-00052Z-Sq; Wed, 01 Dec 2021 08:05:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id u1so52082776wru.13;
 Wed, 01 Dec 2021 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRyV/aS2bzgNlOIF5jVjVHvTzuy/PEW1Qo0P+6yL/M0=;
 b=mj1YGcdRhMdodCtD82uwGuXN+g3kcL+W7+flzxT9Ib0gtumiXHMiybshilkoOWZgj/
 W/NQGNLMXKLYwzWcfUM3RKxvLyPXomHNT2PiwdFzbmJ7NYz7omzj2lVytoc2PMbRdOaA
 vxgLzpepJWFdgm8XmnljjJm6SO3bL2D7cnb5bLoSUN9BhH46EwQd2wisQ6YNopo5lxCP
 ZAxnIvjkN0t41UCl2h0abVHwUSpRNGnHZBBQg/rLpfhqBh0TCNAkIhU4rSKWVDC1MNRz
 PQm/w60fCLwRY7GQqEcpAcvxn2f5lGrAKWOhD6FjGaChO0cK23n0TfMlkciQnLqCANs4
 B5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRyV/aS2bzgNlOIF5jVjVHvTzuy/PEW1Qo0P+6yL/M0=;
 b=oLrKimFCaFYzZRBUfbxamr9s2A6Bgj+tUSRqSKv+9T9qh1Z3cYaNbSTO+esEZBirPH
 uCwZIbUgYOfKHbFzu53bgB2Q/DFrLnGcnWmj9x85/2y763+oUaokctxK0GnID5biHKJR
 EfRqQ0Y/s69YcA6YK30/xnLzVHcm9LgTG3hqd8Jc9o0WM85MF3pLXZozLM+PQkirVsg0
 x//9po1vUF02YdGqLEKb4cDq3fVp/fU4BeVXTd43jHOOx7x1ZNGKzMA7d2z4Da5F5ApH
 1BQUkxXF66QSjDWRwSGVulm11svO7UMKCZoe27AY1jLI67BdFL/GVWxAsZtsR00SnJlr
 gzIA==
X-Gm-Message-State: AOAM533oXpO/ZcaSgik9JqjiD502LEAypsbymgW7dQxWDYiSQDkSa4R4
 I0dfYU3kcwr73Dkz0fn2FeE=
X-Google-Smtp-Source: ABdhPJzlylQJ813wZpqbdkXAsoeHGCIbchvhaxrgECz+bhmtIAgh7sf2/lPgqzIND5o8pDIWXdksOg==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr6544787wre.561.1638363946716; 
 Wed, 01 Dec 2021 05:05:46 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id z6sm1389080wmp.9.2021.12.01.05.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:05:45 -0800 (PST)
Message-ID: <e5fb6785-0210-5056-014d-c1e062fc806c@amsat.org>
Date: Wed, 1 Dec 2021 14:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Sergio Lopez <slp@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 21:05, Peter Maydell wrote:

> Peter Maydell (4):
>   include/hw/i386: Don't include qemu-common.h in .h files
>   target/hexagon/cpu.h: don't include qemu-common.h
>   target/rx/cpu.h: Don't include qemu-common.h
>   hw/arm: Don't include qemu-common.h unnecessarily

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

