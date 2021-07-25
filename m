Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99E3D4F65
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:13:09 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7icd-0001Sh-HC
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ibc-0000LJ-Fm
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:12:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ibV-00084g-Pj
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:12:02 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so16453029pjm.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JUucEqCQ5dKhtg3iDHWWhY2UtnGnq6nWQCuiBa52EPA=;
 b=j3pm6P8FDRh4wFTzOxg7jPXkXEq1EvwVfXCLgiWLi46+rbPwmLErGEI23xRqhoEb2A
 AYjDXblFEM4+s64bVxL3Fqwr2GjpCXkVISFgDUbGnlTbzYE/dknvlYAj+BccIbSWbzPH
 2vrt2dKy/RwK+s97YgiluEBXF2QZNotZGBQ2qBptcWrA4xuAqxGPTWtNwtPNb1AnkxW0
 Ngzfk1jBGeam99V0FJha5gibgUnJ/seFDrooMoS6l719V6s7fc/OLcFL8CelaB7V9t1Y
 wSoUUct8Wuf8Xjej07SxHO00w/KGwtxPONtGonyKz44rVp+AT/CyWMZ9ReYSSu2VJMnq
 tcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JUucEqCQ5dKhtg3iDHWWhY2UtnGnq6nWQCuiBa52EPA=;
 b=MEAmp1zw1ra1FLGX6/IkrIpjva4kzf5H2zFCzRwoBAOeBDlLpvE3u2PGaRfM9UjgJ0
 0zfe5K+sEBj51kdLi9qDxXRv83ecpNshBrFEOZgABzkFklzgCADpdu2p4zp9huqxNqu3
 bJ2vCCinWM3G/FeY3KdCuTUQFVtKK9aCnPo9Uzn0oGzn3q2pg055uhX5QXRRyANcZJRJ
 S/mylPog+SIQS0xPlwwDBLHHmW8g67pic+bS/T0Y45BQP0PHBfw403erPZBitF7UL40R
 8pul4s27WM/5bUt0FdQ7mSVNYdIEL5e80nPVX0SK3DaQpiW0kWAdigI04SUG54W+L1gZ
 gEPA==
X-Gm-Message-State: AOAM530SX/CjZKjxgQ2vnuXoYL/JxrfQwXiIuSyql4oj9B7mV3G+kfkP
 +9ecnZha02CrYoSu4p3pdWohaEJqk0LSLg==
X-Google-Smtp-Source: ABdhPJyWvC9BQ2PFsC3pkBJ+omMXhf1dGua8aiLIMsItA0PlkRUIjBcV5HHS6W/D3ahRKOIvQPTIzQ==
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr22817248pjb.137.1627236716136; 
 Sun, 25 Jul 2021 11:11:56 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id w145sm29989363pfc.39.2021.07.25.11.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:11:55 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/2] accel/tcg: Fix hang when running in icount
 mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210725174405.24568-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <980b72d1-288a-ee4c-e44c-66a434c219a9@linaro.org>
Date: Sun, 25 Jul 2021 08:11:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725174405.24568-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/25/21 7:44 AM, Peter Maydell wrote:
> This patchset fixes the intermittent hang seen when running a guest in
> icount mode, as reported in
>    https://gitlab.com/qemu-project/qemu/-/issues/499 .
> 
> The underlying cause of the hang is that code in cpu_loop_exec_tb()
> was using CF_COUNT_MASK as the maximum possible number of instructions
> it would try to execute from a TB when it set the icount_decr.u16.low
> field. This is wrong, because (a) that field can validly be set to any
> unsigned 16-bit integer and (b) now that CF_COUNT_MASK has been
> reduced to 511 in commit 78ff82bb1b67c0d7, it might be less than the
> number of insns in the TB.
> 
> Patch one fixes cpu_loop_exec_tb() to use the actual maximum valid
> value for icount_decr.u16.low, which is 0xffff.  Patch two adjusts the
> "should we ask for a TB with exactly this many insns in it?" condition
> so that instead of testing "cpu->icount_extra == 0", which should be
> always true if (insns_left > 0 && insns_left < tb->icount), we assert
> it instead.  This assertion would have caught the bug fixed in patch
> one.
> 
> Tested using the same iterating loop test described in the bug report;
> without the fix QEMU hangs within a handful of iterations. With the
> fix it managed 175 successful iterations before I got bored and hit ^C.
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    accel/tcg: Don't use CF_COUNT_MASK as the max value of
>      icount_decr.u16.low
>    accel/tcg: Remove unnecessary check on icount_extra in
>      cpu_loop_exec_tb()

Nice one.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

