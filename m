Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5437D39F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:41:46 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtnk-0001X5-2y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtlq-00087L-8b
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:39:46 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtln-00066H-Mi
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:39:45 -0400
Received: by mail-qk1-x731.google.com with SMTP id o27so23200755qkj.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QBJuKCFso1p7XYXCnjM6Ppq3xWOItjZk8yKD51w8Rgk=;
 b=REpacniX9FrZwt36Lc5Vg1DNye5a6q7GGYqUiCkTHWyZx5h5cCywTdWYTmTzb7EyLX
 vuvFl815AqOBF+Eae4QJeDQsgWPfiDad0A9lbfDubFgTAgIq55NXPIK8LH7I3VC3EZR7
 gdyS5Uh4zk0VNlCGJfdvPOMhTXGS5dSbuUjaHWA+D9UHD+FhA2urZ1gS0VAqoP1Rlu/t
 6DzRGYZfLdPvyPs2BUowI8E3+dwsNxSwbJARbBiPtgbLQ2S90lFOgd94WwA0QAwLb9hh
 WcYyABwbUP8FQCcbKfDrfIfzK55ivpBbS60za4bzk8xRMB0yVwX7rhQiVPLYJrbZbuoA
 SpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBJuKCFso1p7XYXCnjM6Ppq3xWOItjZk8yKD51w8Rgk=;
 b=Iz8JZR4vMGDQnzFNP0W/0rzONPxDKS4Sd9PanEUFNL8IYOCIsMx75cNVWA/9rFwdyW
 zbMpTV44BHELUZ+dlnAwgtOL6t0p3EiGveACSKgTv6Oy+SCSa1Wc09BSD90UMXe5JElf
 u/fOnRQLdq8fTc+AYwwEmlcyV+tGozs4//OFcra4iHN1hcM4sCcDZikE3okSUQAWQCg1
 m+go3ZSUIKYY20R/s0gR50x4OoQ2Nfmsl5H/xZxpXsRS3Ef9+MKSbBxVRFwnQDda/D7g
 uNEMyJj7cZD4Mgi7XNQwkfQDHgY6lgLnTPbm6mcYkc4Ywme1IQybbSU0DBb48reRRPVY
 69eQ==
X-Gm-Message-State: AOAM530KMM/qupibYle/ZRqd8Hnz/NE4PlQunOnu6q0ZbOZOQaOYB7D4
 Z+RlX2LzLxzC6i9+J9I6QTdQ0w==
X-Google-Smtp-Source: ABdhPJyiYaqcOFHKVoHiZORWSV+IgdRjislVEcmb7TJvbGT6DDFThAi38woRtm9u3yWXoDuQS0WbRw==
X-Received: by 2002:a05:620a:408f:: with SMTP id
 f15mr13763863qko.398.1620844781958; 
 Wed, 12 May 2021 11:39:41 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 20sm713212qks.64.2021.05.12.11.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:39:41 -0700 (PDT)
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a80cf0c3-705e-e41a-f538-8abf492a5f4c@linaro.org>
Date: Wed, 12 May 2021 13:39:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> +++ b/target/ppc/tcg-stub.c
> @@ -0,0 +1,33 @@
> +
> +#include "qemu/osdep.h"

All files get copyright boilerplate.

> +#include "exec/hwaddr.h"
> +#include "cpu.h"
> +#include "hw/ppc/spapr.h"
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    return 0;
> +}

This is used by gdbstub.

If there's a way for kvm to convert a virtual address to a physical address 
using the hardware, then use that.  I suspect there is not.

Otherwise, you have to keep all of the mmu page table walking stuff for kvm as 
well as tcg.  Which probably means that all of the other stuff that you're 
stubbing out is used or usable as well.


r~

