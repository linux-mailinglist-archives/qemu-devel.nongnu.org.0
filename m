Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18145698E35
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZBk-0001w9-Hk; Thu, 16 Feb 2023 03:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZBP-0001vA-Ip
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:59:59 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZBN-0002L3-Nt
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:59:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so930089wrg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NvzWKphJvpuM/nykaF2AIlrn50YsCP0YklV3cJ38WGQ=;
 b=e3cTqjSfhaAeMoec7riP8Uer7TtN6AgE81mpw7Xe6/+sG8Hp/ji3a16XvcyGL7kVbk
 pGWCYZCNZF9T4k8n0YbRGzEH99ol+UiAG7qkOwSUw9uMQdZxfEXbD+ZvhT34Jmdfs9MV
 oWb/kHYtY599+P/KN9yOSr6iRlRjkY6Kwh/ZjBDS0+IIuaYolh0prjRFqx2w+zPDWxfe
 3IL/o7lfq2NJHBMAM23Wa3AcR62EjGmmzX1mVyicwBCYiLidOmP6zXoV2NZbzqtSB79m
 tPVa3+KuFiEBvPQooq/uxtKi2gPL4b5QQpS5QqTXzX3f2NgdDq766Dy8xTUmhwJ/bAz0
 2rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NvzWKphJvpuM/nykaF2AIlrn50YsCP0YklV3cJ38WGQ=;
 b=jrXvNnc12nl+5XE0p60U1grN/eiSs9L2RebxXIJwVutP3XlDU2HLwwkf2P8CcwzuNJ
 0K+FgS/dP82Yeq9sYuzqBAqFUUxzgHVN0L7o6jhS75MGp/G/lepXz1eQZMwIdgqcGpGz
 n7y6tJbQdnvb27Y/4QzsgdkPQIkpdcHjm87SwP2wlAqyVEM9I2eVadU/MOVKQXoiCmlD
 gpnCdmBGGeAuIDO20t5skSSPvvjWSHB8C5IMRoUwGfTULfnMyaPWfsf/leUvb6lA04i/
 /FsjDTfKdLGploeD8b9a44ofTcD43Xq1p6Q86VuxGz8u8A2jqbjfUrj0lS1We0Cbmy9+
 ihKg==
X-Gm-Message-State: AO0yUKVgpm2ofj+AMo+PiCz8idJxcq2DkK18s89Zzgqc7IXA5+ghYw4K
 y+IQaxp2bYLoBGrLIqKNly3C7Q==
X-Google-Smtp-Source: AK7set/UVJfNL+VJMa3pSUFS8Z/qFKFbLx1XwQMOqOxsj16dUNSTzJP86qaSE4mZ1cHV9tQcS+rwKg==
X-Received: by 2002:a5d:6586:0:b0:2c5:4d9b:ba18 with SMTP id
 q6-20020a5d6586000000b002c54d9bba18mr3507826wru.25.1676534395949; 
 Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b002c55ec7f661sm820879wru.5.2023.02.15.23.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:59:55 -0800 (PST)
Message-ID: <d2571e12-661b-60f0-1afd-d3624477ea5c@linaro.org>
Date: Thu, 16 Feb 2023 08:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PULL V2 00/10] Net patches
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
References: <20230216052424.50926-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216052424.50926-1-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Jason,

On 16/2/23 06:24, Jason Wang wrote:
> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:
> 
>    Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 5e53a346d8bd2bd22522e1e7abd8f122673e4adf:
> 
>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-16 13:17:57 +0800)
> 
> ----------------------------------------------------------------
> 
> Changes since V1:
> - Fix the wrong guest error detection in xlnx-zynqmp-can
> 
> ----------------------------------------------------------------
> Christian Svensson (1):
>        net: Increase L2TPv3 buffer to fit jumboframes
> 
> Eugenio Pérez (1):
>        vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
> 
> Fiona Ebner (1):
>        hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
> 
> Joelle van Dyne (1):
>        vmnet: stop recieving events when VM is stopped
> 
> Laurent Vivier (1):
>        net: stream: add a new option to automatically reconnect
> 
> Qiang Liu (2):
>        hw/net/lan9118: log [read|write]b when mode_16bit is enabled rather than abort
>        hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()

Can you have a look at this comment from v1?
https://lore.kernel.org/qemu-devel/572fcb76-b2f7-20ca-0701-e22dd4e4cb59@linaro.org/

