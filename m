Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A501B6061B4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:34:30 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVgj-0006nr-AT
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:34:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUyd-0003SH-EB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTS3-0000tS-58
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:11:14 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:33788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTS1-0006Aq-FM
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:11:02 -0400
Received: by mail-oi1-x231.google.com with SMTP id w74so22491087oie.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLFv0qWWnpCPwRMmjADII83X6xAoGAS4Mcd5/omzzW8=;
 b=aMAVn/4jqxrHn1SNkELNmfYq3wZMC7XOo9dYevyoFt7E45TUsxd5yR0tiUfBXwfah9
 U8KJgw9lZKcJ5TbEgRGHrZOuhHTLk8OqzuHDGWfLKPtRAfZv+Va499GlFr/I7uuO7GP7
 5vb/NygZejpclfepHz01oaZIRw/2xLMXsfpwAWyRaSpm/1B2kz9JEuZpslshfY6AZTKp
 Z6TWB6zvpxqyRSC6kdugczL16By1wyDFia2MfW/bgbmxahRJzVednNIC56MF8ICxHAIi
 zFcfDwh0BKyIOuY81FZDn6HOiuo6W4KXVm4k96XCIK72tBBVXfaFDKU3aFl56W+Xsmv0
 +THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLFv0qWWnpCPwRMmjADII83X6xAoGAS4Mcd5/omzzW8=;
 b=Op5rA56Tl1rkOWPFFPGBzqRu3sbuM4wOYn5UBMFs2q9yIL6Uc0d6RQzeMsIsf6Tnql
 LX6cfTuwic7xW+8CUhLla5z2n7i8tUQR5Wlu0kG3xNlbWVqE6ym9pFRWN0otPm3q1zHD
 MR7t2QZfm8kk3lxia5X5pBQQ079qUcLrAges8d0gBtkuZ/psbNuUvdiqPPjxH6Pg6S8b
 GzIjkqJnFFVZwRW7AsWdzlg13ob/7IXU5w037ilHiDnj5RZyzbU12vSyq6XW+BbYYLOF
 4MhEZfiaSHeWRQ1nCIt3W+FYn19T7O4DeCsjIlCd0Bl+zBM+58badi8kYrqk0ZuOORoy
 qQOw==
X-Gm-Message-State: ACrzQf2UliDcR+f769ck2dsScT19wR2mLi1pmsqrzzyoVzwpcs73Jir+
 L/Lhm6QdPde2kS3dUGpZFkMxCEQl7BFbVSD6
X-Google-Smtp-Source: AMsMyM6T8QMc5V2qleeyCujZ7nuq1SyUEdbltXmdAuwwddjKORTiEqCgAuXTJgVZm8MndtUgE2Z6mQ==
X-Received: by 2002:a17:90b:4ac5:b0:20d:ae54:f08b with SMTP id
 mh5-20020a17090b4ac500b0020dae54f08bmr40856726pjb.174.1666264249287; 
 Thu, 20 Oct 2022 04:10:49 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b00561cf757749sm13281429pfg.183.2022.10.20.04.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:10:48 -0700 (PDT)
Message-ID: <279bb0fe-c68c-364b-17df-f6cfebf5d059@linaro.org>
Date: Thu, 20 Oct 2022 21:10:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 20:20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

