Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9543C3F82
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:24:28 +0200 (CEST)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gw7-0006ma-Aj
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gdX-0005s1-Lx; Sun, 11 Jul 2021 17:05:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gdW-0003Ne-9h; Sun, 11 Jul 2021 17:05:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id p8so22103120wrr.1;
 Sun, 11 Jul 2021 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3VeLPF64Gtf0A8p0waM15kMcV9uEKxx/9D+6L9eQx1E=;
 b=Yd2ibyrecjfGsJ8YxmJKhXvSdtyc/RQFjzyxvU1gVUdk2zTin9MvfzGi/8/z/56/QP
 xx6ZPXmvpXknedQuCBE8yNis+EAgJIyf+K0SjpKigZw3dIpSRH82b4wvzMxDZxLodo/i
 ZdnxMivMgfj7AYn4sDrH+Dz+Jk2h5RwayYZ5rAyvY1jwYuOfboJcAyH8q+KSW6s4LwxN
 z+j5RpunuToHvdhm0XDxDT6DsdGjzIrVKnA1dWtdui0Tb1XbTCcYtnMmTK6qjKEaYIEK
 JjzV2QK8d7atEUPpNVw0Nq+5M+SPosd4nzrH5BPIE7KpHwql5YBBo+W54Iv+saZ87VdS
 9tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3VeLPF64Gtf0A8p0waM15kMcV9uEKxx/9D+6L9eQx1E=;
 b=Ye1ykXqLqh5AdSHgJgP85SB5HjqVjx/H93r84pUQ4wzvbr56XGdJjpdDo3lTPyFcjx
 Jb7AfAgFYvpZQfhYIIrgZjeyNC2AI+nE8kJddn3+cSQgMs08wfr2lGVjNrTSlgHDIPgO
 bKdZ4Y+Q40mvp04CgNlQGNehwDi+1ebMzltIkAij7jZgsCFzn+YAsNEAgxUy4sjzdKRG
 DpMrpYewPW/MkPkEnHN+GwUEAgcToO8ZCV9Vhu+klht/bMxp42JoV1mA5DoZMIuD3lNN
 qR+wNTGtkmCsZX/staZndnYs4a7zRNi/fxlT2PN+R3g2lKKVS9ZwmrGJAxIhMKAPfDKh
 1fmw==
X-Gm-Message-State: AOAM531qobMtK8smwP3Hb43MLPqF6AkghwYwQPhdEsOkHBwgqBsJN0n4
 yKR+1AK8++YdFCTyJYcEb/k=
X-Google-Smtp-Source: ABdhPJwZk7KnJjzoxeUC0SLT0awiaO6JzK4P0sH5Zi1AFEg49yyOoA4kCqBEvvbG6nXL+64A5Svg3g==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr53462676wro.176.1626037511993; 
 Sun, 11 Jul 2021 14:05:11 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id o7sm14203881wrv.72.2021.07.11.14.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 14:05:11 -0700 (PDT)
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
 <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
 <CAAdtpL6+M2e=SvGFMgJBxanQJgTz0kg1th-9BxHy1TaWEfafog@mail.gmail.com>
 <CAPan3WqaXEGchtJNN0UfcXxu+wJQttCjyFW5CrtS=+5eqa7wow@mail.gmail.com>
 <10114d64-aa8c-997d-dc0a-09d541f61962@amsat.org>
Message-ID: <76558fbe-93b5-b6a3-7372-0c38173a87ad@amsat.org>
Date: Sun, 11 Jul 2021 23:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <10114d64-aa8c-997d-dc0a-09d541f61962@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.631,
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
Cc: Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 10:55 AM, Philippe Mathieu-Daudé wrote:
> Hi Niek,
> 
> On 7/4/21 2:35 PM, Niek Linnenbank wrote:
>> for test_arm_orangepi_uboot_netbsd9:
>>
>> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com
>> <mailto:nieklinnenbank@gmail.com>>
> 
> Thanks for the review. Does your R-b tag applies for this single
> patch or all patches related to test_arm_orangepi_uboot_netbsd9
> in this series (3-5)?

Soft-freeze is in 2 days and no review from the NetBSD team,
so postponing these patches to v6.2.

