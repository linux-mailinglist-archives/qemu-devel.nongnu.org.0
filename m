Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BC400679
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:21:14 +0200 (CEST)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFgX-0002Ud-To
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcs-00086Y-DR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:17:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcr-0006LW-1Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:17:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id u9so306683wrg.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
 b=dwmv1KqM52aR7rH3nFosWXsm4FD08tdhGNndv5xGMzStvCDMhzyZVE8JBIwPUqwq2F
 bCLRGHMXtpcQxrFHLNsfcJ75PuxEZqI9fgeJ+R64/zxYVNYGjwzAkdzQcnV1G0aiGJeW
 LTJZC1LjtZnsolxgQDMU0UUFNoUHXBPLt2RyL3DgdCqDzCR5fV8RIduiPWvrI4huqI2x
 14xoPIKRj+tYSoQLnz+qpU2iP9/qF7o+j2jiFMjWkvX25zBXsZzxhgUCz6Znrep8fiq8
 IBBZaGnjNh2PebWfRMYGVTv6N4GT+lZ2aNLKT+f0rlGZl04V61ntDZBBZCMp6HS8v9vZ
 WEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
 b=Gw9AS7JmCcF8HshBEz0B+p4UeoXo7y1CKUnMsMXS5keCf3sWzrGy8bTwOPCm9h6ZEx
 RDchLfbY8+bek7qFqvQBiG/hYnO0Z7VFoW6w5vPKwrXe2rhkjnSldei6ShkoSpU8sr6G
 ryEN0niz5B5bj4BYG99nmFkaLtPlDTrQvTRDNV7wYQDS8n38frcHeebcAdAG7O/7S4Pk
 0itOEn/CeMrfgJVgkQBTFjMEKQ2oO93RJY7Mm1QmYAmfMDlrNrTzQ+958hIiTkFqCMbc
 P4VvNcB/wXRHj8g+YNYuFwHPZl2guk33rQYorK5obZlcMlYlH8xotrBquxn1r/tak+QR
 SZag==
X-Gm-Message-State: AOAM531e2PBl8C8nFyHWAS0kasKtJD0hY21LgFqjEbhBaHt9AESzHRPq
 Kggy6QuRoCId29WxzWByhFqNPA==
X-Google-Smtp-Source: ABdhPJymtYq5kcbCfG6OUgkQoqRmbaJKl89J4TFcqlkWTH+OL3rMdlakO2CQQpDxn27LYKv0Y23GMQ==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr784175wrw.209.1630700243751;
 Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id n4sm212131wri.78.2021.09.03.13.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
Subject: Re: [PATCH v3 07/30] accel/tcg: Implement AccelOpsClass::has_work()
 as stub
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <618da04b-c9e4-bd22-d527-412c3fd31386@linaro.org>
Date: Fri, 3 Sep 2021 22:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Add TCG target-specific has_work() handler in TCGCPUOps,
> and add tcg_cpu_has_work() as AccelOpsClass has_work()
> implementation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  4 ++++
>   accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

