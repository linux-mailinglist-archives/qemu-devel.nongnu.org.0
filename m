Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65B510E4F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:57:41 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWw1-0000dX-3i
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1njWtX-0008FN-ID
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:55:07 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1njWtS-0000tg-Qh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:55:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so540583pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zP6WTVhHkojPu+7JIZu37SkS4/2L7iTNIZFyXiXJYMc=;
 b=0NllmxqtkIghwhMzaQ/9YK1fDIiUMXM2ZNG+fUAK/F7lWrPesYhqf2esDG0CPNlx3M
 BOKVSt+ynwy99jPJRkuoqGYvXJqiDFCRGphdUNN6Ezxoa5kLe9icJNtnidej0Zr29wGo
 QJzlo7TTwRJCF6SadLPiBIv+uMNDUIBmPTg2+xmW/Bt7eVP6YH4J095AjRj76XklFXBF
 ctEjBKAaI7o9LpJgwkaIj0ip6faKoxauakQDGQIgiBbmz/EhHVfKdUWF+QQP0AGpshD0
 nmKCrQT5QMfzAqu5pAyaphAxHq+dnOlXMDjtDndbK+BAyqwLQmSf8YUyhOSzusuFHgz2
 Vo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zP6WTVhHkojPu+7JIZu37SkS4/2L7iTNIZFyXiXJYMc=;
 b=A5Q+wHDmU3nSh5LrBYVpQ59F8CnB72zydoBWa35bGcbVP6AX7ZZpzpRtgnHq6xhGei
 jtGu8NhAdR3ubtr2TH9cApkDaS8gFsSotihrY8FLpFExmgEhGzBHSyMuTnjoFlzmDeri
 jyvcTaLk1Z3LoYc5APQd0DrS0hyiRRUWERDyrCi7auZAAHPa0Rzn7juJ1rjTUWuInbwq
 Er7Jyusj+REjQ3xnESIH/RH+WtvRXErG4zmH+Ny2iC3rxgsHIw1B+y1NGXKJJXUaY/nx
 zmZMs8A0Hs3e3ZxOMOYmnac1P3nwQdBCuqsb0LQHFNl9ge7xpfI6a/FVd4za0txheSyL
 3oXg==
X-Gm-Message-State: AOAM53179tbfq+x6x8GvHaY61LqX8i/FVDwzYN2JyO5k6HfAVbOQKlsi
 c3NNuZXq/+RT+ar3m2tCe6kfyA==
X-Google-Smtp-Source: ABdhPJzNA0/V6fiscaOj8/ioXhd7wIuU6DvyfH+aAVYMWI6BRuuygL+MthaBtl/VSmzy/l9BoeBPGg==
X-Received: by 2002:a17:90a:5d08:b0:1ca:8aab:20c8 with SMTP id
 s8-20020a17090a5d0800b001ca8aab20c8mr30049992pji.172.1651024500083; 
 Tue, 26 Apr 2022 18:55:00 -0700 (PDT)
Received: from [10.255.73.91] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 p64-20020a622943000000b004fdd5c07d0bsm16204648pfp.63.2022.04.26.18.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:54:59 -0700 (PDT)
Message-ID: <41ce6580-384e-a726-abcf-c2a338d105b3@bytedance.com>
Date: Wed, 27 Apr 2022 09:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: PING: [PATCH v2 0/2] qga: Support NVMe disk type and SMART
Content-Language: en-US
To: michael.roth@amd.com, armbru@redhat.com
References: <20220420022610.418052-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220420022610.418052-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Markus & Michael

Could you please give any hint about this patch?

On 4/20/22 10:26, zhenwei pi wrote:
> v1 -> v2:
>   - Update version from 7.0 to 7.1.
> 
> v1:
>   - Introduce NVMe type for command 'guest-get-disks'.
>   - Introduce SMART, and implement NVMe SMART for command 'guest-get-disks'.
> 
> Zhenwei Pi (2):
>    qga: Introduce NVMe disk bus type
>    qga: Introduce disk smart
> 
>   qga/commands-posix.c | 78 +++++++++++++++++++++++++++++++++++++++++++-
>   qga/qapi-schema.json | 56 +++++++++++++++++++++++++++++--
>   2 files changed, 131 insertions(+), 3 deletions(-)
> 

-- 
zhenwei pi

