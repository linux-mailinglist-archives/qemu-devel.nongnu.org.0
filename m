Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98A4CBEE4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 14:30:44 +0100 (CET)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPlXW-0001a6-7c
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 08:30:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPlUa-0000u7-87
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:27:40 -0500
Received: from [2a00:1450:4864:20::42d] (port=36383
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPlUU-00081Q-PW
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:27:35 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r10so7860100wrp.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 05:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ii/zIvcXBWFhZUde8V5dntqMbrXJxsXCdXj30NizzhI=;
 b=hNmRqWIttkNrB3QarGq8fFp8ImzUTXeblWSh4Oc7ibtKyoDEmlZo7Ph9uCpwSuqRk3
 F0nB4HGCEmQvJyRmLWKKxOyIja6c20b+zWH6u59ANbBKAP0uXgD91UquR1ovTV08gSgg
 466fwTCGA/3vbXDxK16+ogo+4M/T6TtG920rge7SM5YuVZhnpw4PzeJkxWxKSIgIMSlj
 RfRLMe4TWs7BsoEF3l8k4Jp9NTQUl0nxntXBva6Ve7Z2blgr6ab7FTNtyYZlEqjNdWrd
 hK1S+BRFcmqHP4B/Xltanh1p1TN3dF2BhEYSCIvblMLwChr6LjhCdAPRh0mqCChBRYZY
 Gzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ii/zIvcXBWFhZUde8V5dntqMbrXJxsXCdXj30NizzhI=;
 b=FPiXqPX7onFcRmF/8T+GqQgiMQL5+1vePLE4QC5sVLtakSiKaHDR/Ad3yDeXA+YJZW
 wlUu0IGodD3hvAAFEpRiO9XiTyp4pNbLTif9SH0tXzLi8r5uN76TQWRLrJZm566zYukY
 fmmX1c1bHFHJzNyB4avFP8kWfwVVqSo4kjn2HimVp1vWM9vBAfSGKSj86rWctKAMD9gq
 ht5OLdgVvJkJWup45913ao1Rqay6bVtAtUx7ZqZ0tNlkmFomC1g40AvloyEzJIKHV3RW
 Ywl4AaaQ101ak+4hWQvBuRktoN83yFdRexP8eKdPDAK206cVg8CPaveScom6hVDvXJV5
 Ta9w==
X-Gm-Message-State: AOAM531EPhgL+MdcWswjUpYsgwI9No+x3U9iPu7AaHILKBt6wcTzF0VH
 V7bg8nKsnwj83Pf+rl+L45M=
X-Google-Smtp-Source: ABdhPJy8QtILkAx7G0ItfAFNp0WL5trqpd5fmn2ntjFO2dN8tdYeReqnAmNUilc+C7VNhbWNv9Yktw==
X-Received: by 2002:adf:a455:0:b0:1f0:247f:e42b with SMTP id
 e21-20020adfa455000000b001f0247fe42bmr7027559wra.696.1646314052841; 
 Thu, 03 Mar 2022 05:27:32 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 x18-20020a1c7c12000000b0037c94766961sm2156985wmc.20.2022.03.03.05.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 05:27:32 -0800 (PST)
Message-ID: <1e71e423-f197-a3e0-68a9-3a70e2f346a3@gmail.com>
Date: Thu, 3 Mar 2022 14:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] qga: Introduce NVMe disk bus type
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, armbru@redhat.com
References: <20220303095840.1318239-1-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220303095840.1318239-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: michael.roth@amd.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:58, zhenwei pi wrote:
> Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
> a NVMe disk get exposed in guest side. Support NVMe disk bus type and
> implement posix version.
> 
> Test PCI passthrough case:
> ~#virsh qemu-agent-command buster '{"execute":"guest-get-disks"}' | jq
>    ...
>      {
>        "name": "/dev/nvme0n1",
>        "dependencies": [],
>        "partition": false,
>        "address": {
>          "serial": "SAMSUNG MZQL23T8HCLS-00A07_S64HNE0N500076",
>          "bus-type": "nvme",
>          "bus": 0,
>          "unit": 0,
>          "pci-controller": {
>            "bus": 0,
>            "slot": 22,
>            "domain": 0,
>            "function": 0
>          },
>          "dev": "/dev/nvme0n1",
>          "target": 0
>        }
>    ...
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   qga/commands-posix.c | 5 ++++-
>   qga/qapi-schema.json | 3 ++-
>   2 files changed, 6 insertions(+), 2 deletions(-)

> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 94e4aacdcc..8f73770210 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -827,13 +827,14 @@
>   # @mmc: Win multimedia card (MMC) bus type
>   # @virtual: Win virtual bus type
>   # @file-backed-virtual: Win file-backed bus type
> +# @nvme: NVMe disks (since 6.3)

Next release will be 7.0, not 6.3.

With that fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


