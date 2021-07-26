Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59E3D69F5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 01:08:58 +0200 (CEST)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m89iT-00073z-5B
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 19:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89hf-0006A7-V7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 19:08:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89he-0008Rh-F6
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 19:08:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso2242863pjs.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nKLt9oVPkhnkAy+li3bSTD2+q+ewmab3w+995OCpQ28=;
 b=DWcNnENrbFtYOyckuxkcn0/CZ4nmfbJSSo4GeSVmS9qU5cjU9vBejpDejo45FoAlYm
 jeJWcm4Qry78Oj0mpDyHu6bHThB1nEuKjfALGcvstzbohclnS+cq8xme59EkQSAmtD8k
 mXXplY6VImuWql7FzR/XPjoW0IJhvM7LOXI3gpzSreEkeI3GCim4yA15bC+SA4d2tgug
 G//MLsPNP+QWA46yFkHdXv/aS/Ye6zT0IRmRNqA5ZEKkxFpOkpj1+EjiXYCzCEzwrncA
 DgtfHR1kzrAZTVNOzjDqtDna7uvrqHxqWcJ7d/r0RSvFoKYGNifJs1LZULHVmQz9mydQ
 1m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKLt9oVPkhnkAy+li3bSTD2+q+ewmab3w+995OCpQ28=;
 b=XuZxA1XWFqPgLUCTqMaWCXXCkEDGL7Q3wLLXLhzII4iArhOZNPXiPAH+zztuC6GkfG
 d/Ok9rxHTtp8zOffFzCH2hwVQB8Ks2AyC1igJ5HpgF3CaMPw74Mj5HQBMXWpTzEiR6DR
 C5maVLiA4AHX7JcsNVl5jH0WJmG98lL3W1OD15yKhkLnhIObLaD8yZLGzN0Y5/OA46+T
 lIjA+EY90AfP+UN3agq/4y9pnBi7sWWHgPFEomdRC8v+RuQ0f/W3x8CijU7vNf8OkUkY
 kuY/LcrzwnEkk+ySNgpy5JU7aFYP2U4wNyafe1HvJMA5CWN1eNEpyu9SVZ+1S7GFXGB8
 NDoQ==
X-Gm-Message-State: AOAM533vX41GoDyPWOqB3diuk3xYC+sikk4KzHL/Q3+6kxT44eV2NSEn
 HxaveUEWAWKBtAvGIKYuNQCDsg==
X-Google-Smtp-Source: ABdhPJyV03jtoI/3ZyDbq92/sFaX283k/8tA1O754WJWehzaxlw5/tHnQolB3bC9baRkORGniqRtNA==
X-Received: by 2002:a17:902:74c9:b029:12b:60fa:bde0 with SMTP id
 f9-20020a17090274c9b029012b60fabde0mr16353031plt.8.1627340884794; 
 Mon, 26 Jul 2021 16:08:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id l6sm1112851pff.74.2021.07.26.16.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 16:08:04 -0700 (PDT)
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210726163351.32086-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d166f7d-5bd9-54ce-21f6-91f39117ba98@linaro.org>
Date: Mon, 26 Jul 2021 13:08:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726163351.32086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 6:33 AM, Peter Maydell wrote:
> If the user provides both a BIOS/firmware image and also a guest
> kernel filename, arm_setup_firmware_boot() will pass the
> kernel image to the firmware via the fw_cfg device. However we
> weren't checking whether there really was a fw_cfg device present,
> and if there wasn't we would crash.
> 
> This crash can be provoked with a command line such as
>   qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> 
> It is currently only possible on the raspi3 machine, because unless
> the machine sets info->firmware_loaded we won't call
> arm_setup_firmware_boot(), and the only machines which set that are:
>   * virt (has a fw-cfg device)
>   * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
>   * raspi3 (crashes)
> 
> But this is an unfortunate beartrap to leave for future machine
> model implementors, so we should handle this situation in boot.c.
> 
> Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> before trying to load files into it, and if it doesn't exist then
> exit with a hopefully helpful error message.
> 
> Because we now handle this check in a machine-agnostic way, we
> can remove the check from sbsa-ref.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/503
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

