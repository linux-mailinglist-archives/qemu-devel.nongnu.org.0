Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68034C5F4B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:02:54 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORcx-0000JA-Kf
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:02:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORbW-0007pe-Qn
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:01:22 -0500
Received: from [2607:f8b0:4864:20::529] (port=46011
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORbV-0007ZR-8q
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:01:22 -0500
Received: by mail-pg1-x529.google.com with SMTP id z4so9800324pgh.12
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yWNrC9EusREKR5KkhRtazQFPNaNkTpWdQg1sJ5qrgTc=;
 b=AVjEk1jpaVoEfGEsM0B8/IJ+mMLT0UdwRBsZ4CGe7Qj+5DqSJAx3bhPxB5q9b5Rd9W
 D5n9THB3uWiFagUE9PscTuK9Sw+XLz+e3X+Nd2byv4hld5ZX8ScyS/G4E27rf5gpkx5m
 tdXDOLAyJzBY/FykCapmig1XcwM2JTqydba2x7XDTdZr4FW0b+lMz1dT9qr01OzNvKAh
 t8bvLCQqRPJjoVzc9Tq/uUgD/99euD3je8KdceXpoXjf1KuW0rWx8YhBwEpoxANz+BXg
 ZnOmcG2geuQhDPVhh/ao3Q6/Xe1m1DIHUQjZLov8OiCKndJR4zieXnXNSTeWCnLEAogY
 7bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yWNrC9EusREKR5KkhRtazQFPNaNkTpWdQg1sJ5qrgTc=;
 b=6kXCh3u7PBXpKpKQYmanfecdgmGIyqDQ1L0qGItw7JTFnfm4NgvpmJ+5v8M3t/64F1
 O9ekGsPJ12FJOUmsMi/pconvx31qTbjyeNMlKQpl80nG6SsgD9ndie6h4BnQkPY4RzV/
 mI+59D6no6JoEhw979g102NCbq+r2qf09WLRr5psxfTVrSLS+E3VULxTFZ00z1UwAIoe
 UVjTqRyghkDgaK0p+vvx/Dks7MziNT0YhMjeCN+6MgPCkm/qiBbhUBY0nxPvRAyR9Irt
 3wu+lwD4ief6M1UjTQnsMw5ivez/4Ibxou3OBGvuXxT4//wDUbDdgBlQQf5mOZOZYQ5e
 US2A==
X-Gm-Message-State: AOAM5320zfvZOVUl0fkuthhmccOXvlV83eqCvWFnMAbRDXwQbBsJxZ0N
 NZOoefVQWEMusGCdO/x08BE=
X-Google-Smtp-Source: ABdhPJwbMsaJcBlCrE8OBjd7Mpd3xmehIfD6CjDvwmCz8UjiXPoe30tmvo00jxi+vXN3clU1dM8i3w==
X-Received: by 2002:a05:6a00:130e:b0:4f3:9654:266d with SMTP id
 j14-20020a056a00130e00b004f39654266dmr18216018pfu.59.1645999278449; 
 Sun, 27 Feb 2022 14:01:18 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 h21-20020a056a00231500b004e13188af99sm10597724pfh.38.2022.02.27.14.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:01:18 -0800 (PST)
Message-ID: <376c824b-ba63-9153-25ca-4b9475a18c03@gmail.com>
Date: Sun, 27 Feb 2022 23:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/7] target/nios2: Replace MMU_LOG with tracepoints
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227182125.21809-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 19:21, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build               |  1 +
>   target/nios2/mmu.c        | 96 ++++++++++++---------------------------
>   target/nios2/trace-events | 10 ++++
>   3 files changed, 39 insertions(+), 68 deletions(-)
>   create mode 100644 target/nios2/trace-events

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

