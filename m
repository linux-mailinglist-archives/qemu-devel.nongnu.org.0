Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133766B9E5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLVE-00042Y-UT; Mon, 16 Jan 2023 04:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLVC-00042D-5l
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:10:02 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLVA-0001M9-Kl
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:10:01 -0500
Received: by mail-wr1-x42e.google.com with SMTP id b5so5612579wrn.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/H1roGXpzfm2rjkQmL6/Zuakkqdj1Nw1KnSEEvfR5Uo=;
 b=hWqqq9DlNHQFaJLmON93w/Hx0Cl670TLHPRCTHv8UMyZR8m++jN3TndsvwMYzCslS/
 svNDIOQJ2fPWP8TMHpd0vA6RWkgYtR3ZrI27xobCAjyww7INxcU5AqcleJCjGOEfgF7M
 /NlABuhv/yaRN4XJWBhe/+NOP2MyWYtKjFCATUjI8/kfdDeXjgAvWWOD5hy9u1dtvrQC
 87liyuDtVc42SHM0SlRTzc9cfhzXaBjZdxmDPCuVTo+/Ew3qLXQAnu1+H3jVM3iCjXDv
 jeA5126zMBPC50xb55RjfHNoB3yhnDU4x9HZW8CdzY0XZxZJU/wXQh+JRKsF9/+mWGcq
 rXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/H1roGXpzfm2rjkQmL6/Zuakkqdj1Nw1KnSEEvfR5Uo=;
 b=11P6WlMIZokxs/zgB5CQxipMR6epFhVmZ7TeRJ3AE6s/QORtrV2yaslCSt6ECPQPwz
 +M4oKA2aa0C7whwcCq0DO937UlDFGVymvA4LjYLbjCJo36/8pgtWA6rQw7VlQ2Fc5Mqi
 LgRM1LsnQEf1qT54FQJQm9JIyZCYBSAWJtvzw5dQR9DssqaO/4/dxlP83YHFmsM6PtM7
 NJVSOJpy/DnIU95YZriypvd6twSWq39JjewV6s45y8Lirc0MhQHs7e72ouuV0hZB57O6
 SNGsdehCrN6dqS8pSIWe2xPbQJbYp6Cf1wzBJDiE8g/vRPOevEwXEpcB0YNSa15L6m8v
 3jyQ==
X-Gm-Message-State: AFqh2kqz03Lzvr3iBvMXGVgjcgk/c4rDwa+zF1tZmAcjFi4Bp1Ebdb96
 wqr+bbLFz40xMdX48LkbwCzx/w==
X-Google-Smtp-Source: AMrXdXuqr2QwZxn5brffDDWjff8VGl3k2KnN8hKjV+Z1eU8P/0GKYv/ieTqKviJgYoOYa9xM45aNqw==
X-Received: by 2002:a5d:4531:0:b0:2bc:858a:3df0 with SMTP id
 j17-20020a5d4531000000b002bc858a3df0mr17005733wra.48.1673860198754; 
 Mon, 16 Jan 2023 01:09:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y15-20020adffa4f000000b002bbec19c8acsm20629482wrr.64.2023.01.16.01.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:09:58 -0800 (PST)
Message-ID: <bea68942-c5f4-be45-d179-92907d7f4306@linaro.org>
Date: Mon, 16 Jan 2023 10:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/7] hw/i386/acpi-build: Remove unused attributes
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114222738.282478-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/1/23 23:27, Bernhard Beschow wrote:
> Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



