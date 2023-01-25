Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5767B15A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 12:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKe0Z-00015c-2o; Wed, 25 Jan 2023 06:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKe0X-00015G-Jx
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:32:01 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKe0V-00084q-Ok
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:32:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id z5so16719241wrt.6
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWzIeQYx7+uRvsu0aoBUBUuKpHuCt29sqw2DF3nu6Qc=;
 b=LMGw5NSxskvNz7x9scCCLkWx3CsJ0hLxPu03VB4Yh9hbvGvyK6PeZMK3PRmB0bEj9T
 HlKvWJehAuokwWdHS9lT03ndZXAoJSBCKwOiVuQucVAArQ8Bp9zGc2bUUzlzqZq5h/da
 Gc8olF8exgudT7+bVTnvBezSq4w9er1wp1Pc2INIZOjP5xjcpHRMxbYSU5Gnviz89plx
 Au5u5EMZ5VjK/Nj4DxTc2kUrcLar7iAbJfCto652onIGr78SHROlAB7gR/VGAF2Yly/Y
 fuFcVgu8GZjBuOColZZYhpwhkFEcjhTPDzZMK3dR/4PrY9cF931Ypm/UjsIEYrE7fEME
 aUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWzIeQYx7+uRvsu0aoBUBUuKpHuCt29sqw2DF3nu6Qc=;
 b=EIYz3Qq4WoO14S7HjIfsXBHDE+zLWl4c3zSN1Vd0XYnWowl69MLrfhIKEDcDimeIFy
 fcQpM3Bcty5DSV5JP7aXuAr85O6p7LGP4KFHVl3rzxQJZh021EXlXn1Y0/1HUIm9DBgR
 lco5qcw5bGDxVpbVTpofBXxi2vT5fFjIe9b0l5ws3x72oIyg699GbZ7jgSezbjEnvlej
 5J1MWB/x+YawTPjvMb0bxqU8HJughqHinyNh4GI+tq79Os76MmgZ/aNXth/TVzy43S3w
 tPZL28C2ceZDWgVHd3G0w4TtBnvodIcq01XFxezjM73c/YXnjLmGgjUMnjLCUfiDgcaT
 w/Yg==
X-Gm-Message-State: AFqh2kr9GqljPgHCApNzTxysfA6B1W6Iy2SvweEFbDIbmaOllYaU9YQL
 E6KCYRRWH7m66toqcDNn9kROqg==
X-Google-Smtp-Source: AMrXdXt75mHo4XI2ZxLF9uUXy3Kv3j8DOiGD6JRymoBxwsUwWL+5A12Q6gNuYlYjJShOhdPtfAqQpA==
X-Received: by 2002:a05:6000:1049:b0:242:15d6:1a75 with SMTP id
 c9-20020a056000104900b0024215d61a75mr25031725wrx.66.1674646317849; 
 Wed, 25 Jan 2023 03:31:57 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a5d53d1000000b0024274a5db0asm4277248wrw.2.2023.01.25.03.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 03:31:57 -0800 (PST)
Message-ID: <4c15f40f-1c70-d867-99e1-c8552e0b6f04@linaro.org>
Date: Wed, 25 Jan 2023 12:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] docs/about/deprecated: Mark HAXM as deprecated
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, wenchao.wang@intel.com
References: <20230125102053.902098-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125102053.902098-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 25/1/23 11:20, Thomas Huth wrote:
> The HAXM project has been retired (see https://github.com/intel/haxm#status),
> so we should mark the code in QEMU as deprecated (and finally remove it
> unless somebody else picks the project up again - which is quite unlikely
> since there are now whpx and hvf on these operating systems, too).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



