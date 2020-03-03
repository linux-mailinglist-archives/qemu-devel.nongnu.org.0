Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D981D177E91
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 19:43:17 +0100 (CET)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9CVg-0004r0-Vr
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 13:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CUX-0004BA-Q9
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CUV-0004ku-Tq
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:42:05 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CUU-0004iJ-2d
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:42:03 -0500
Received: by mail-pf1-x444.google.com with SMTP id f5so1901271pfk.9
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ihGb95fli6TTZlBLRskT6NVEplBL96MsAsHOeKH3oNU=;
 b=GPJF7rqS2uXhp9Zp1ihYIyooWwy1HXu/JLDUTZpeWFLj3YNWB2e2EWaMEuSS17xJFm
 t5VqQBqmXIYk9b4TFHlSrUren4v+3AFTNL7BiYSWfHd1Nv2278FyzTNFVimv/FTmvxb0
 4ggvamMihoI3xvlaFitqGWjo5FnCu+Rsn91g7ZmpwRlGefJPr+kxIf4CFigEMMll+K6U
 XuEdpVi7mAezg5iR/6+Yh6fYu1m3JIo4ou6NhPQd2wAh88VS/iBw5q7Udfle7bRwLuRG
 Cvw89cEYepV/S9YYlrOvNpdGE+9vkxz+D/zrRpf4N+pcHKfGC8sZeaiUSeV6u5WXpCrW
 z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ihGb95fli6TTZlBLRskT6NVEplBL96MsAsHOeKH3oNU=;
 b=Q2kwdhrYmrJwuFJnrEvGjF1a92c2jO8tWK3H0B+STgdVRlSehm0P1os1Axp90HWW/O
 eO/8fAlR1+4ctqpivH/0Pt1jAJp+KUrF986tKTzUKrCBMPqrxEvNvfeY4iljwJRNXpKg
 s/Ub9ly/z4XobfPp+7jhoIGHFRkGL55/IQcpXd1a+Naif9CqFPBr2XUHNbV7Y8RU7u6K
 E5/wwTODAl/0y0O0bq8UJFsA5EkQFDV+8hsZrkaoFVyclH5N8oHU6SnbVgxqYREU8xC4
 HYp1zpFf/7FatHXwUFC9boyyE/goeA5lxu47qyBiaKI8Dr1mdpWiiO/uwQpJ1GbiHj9X
 2IBg==
X-Gm-Message-State: ANhLgQ28O3yQf+5ekTO8y5k4muIbjZbNDYKzK9/AqKk9u07+nlVrFZ6a
 7JsT3VB4u32KJqT96hv43x/YWw==
X-Google-Smtp-Source: ADFU+vsfEilGsCcupC5aebBrXellXDMXG5hC9z98bYmUDK/YGBIfkgYiy1VMzfe7nagCQN4XTyqwEg==
X-Received: by 2002:a63:f752:: with SMTP id f18mr5306129pgk.196.1583260919257; 
 Tue, 03 Mar 2020 10:41:59 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d5sm19768937pga.36.2020.03.03.10.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:41:58 -0800 (PST)
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200303100511.5498-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bea66f5-c9d6-c605-22dc-8700f022729a@linaro.org>
Date: Tue, 3 Mar 2020 10:41:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/20 2:05 AM, Peter Maydell wrote:
> The CPUClass has a 'reset' method.  This is a legacy from when
> TYPE_CPU used not to inherit from TYPE_DEVICE.  We don't need it any
> more, as we can simply use the TYPE_DEVICE reset.  The 'cpu_reset()'
> function is kept as the API which most places use to reset a CPU; it
> is now a wrapper which calls device_cold_reset() and then the
> tracepoint function.
> 
> This change should not cause CPU objects to be reset more often
> than they are at the moment, because:
>  * nobody is directly calling device_cold_reset() or
>    qdev_reset_all() on CPU objects
>  * no CPU object is on a qbus, so they will not be reset either
>    by somebody calling qbus_reset_all()/bus_cold_reset(), or
>    by the main "reset sysbus and everything in the qbus tree"
>    reset that most devices are reset by
> 
> Note that this does not change the need for each machine or whatever
> to use qemu_register_reset() to arrange to call cpu_reset() -- that
> is necessary because CPU objects are not on any qbus, so they don't
> get reset when the qbus tree rooted at the sysbus bus is reset, and
> this isn't being changed here.
> 
> All the changes to the files under target/ were made using the
> included Coccinelle script, except:
> 
> (1) the deletion of the now-inaccurate and not terribly useful
> "CPUClass::reset" comments was done with a perl one-liner afterwards:
>   perl -n -i -e '/ CPUClass::reset/ or print' target/*/*.c
> 
> (2) this bit of the s390 change was done by hand, because the
> Coccinelle script is not sophisticated enough to handle the
> parent_reset call being inside another function:
> 
> | @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
> |     S390CPU *cpu = S390_CPU(s);
> |     S390CPUClass *scc = S390_CPU_GET_CLASS(cpu);
> |     CPUS390XState *env = &cpu->env;
> |+    DeviceState *dev = DEVICE(s);
> |
> |-    scc->parent_reset(s);
> |+    scc->parent_reset(dev);
> |     cpu->env.sigp_order = 0;
> |     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Testing was by 'make check' and 'make check-acceptance'.
> 
> I need this patch as a preliminary to some arm stuff I'm
> doing, but I think it makes sense as a cleanup in its own
> right so I'm sending it out early for review. If it's not
> yet in master before I get round to finishing the stuff
> that depends on it I'll resend it as part of that series.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

