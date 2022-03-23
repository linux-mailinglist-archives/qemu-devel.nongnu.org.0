Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BF4E50B8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:54:52 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWydf-0002GL-47
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:54:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyc4-0001XR-8z
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:53:12 -0400
Received: from [2a00:1450:4864:20::432] (port=44926
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyc2-00019Y-T5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:53:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id b19so1496062wrh.11
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HRWHRz9qLKN4dI20DsaD2QwZ/seYLTnt4Z5R/kgcG24=;
 b=phpx8Qk4N3fwTmVIl41zrPWsr5FlLb8nGG0rTcJKW8HumQ6ZMvE9aEyi4h7xmTiz11
 Is6RLNRNge5CcmN/UBYIxroyxqKv0KDM7zqRXaLrvNkYAL2to9RH2PZypbLwrCWEqH0c
 SXTNd9ci4pTxWRB3C0HRn1vdK0Dw5Yfc9tmRScV3GmKe+S2lusNAGIGOHbjqjvVAJ/zi
 6nRXAcH74BEyHiSZpl46lRDqDJB37l/7/eSqxHrkHyVX+vQ9SS+GzPduWpXVs4uHRXmJ
 VtuFg0twnpIFuBW7R3WUM3+sb5uxfUhdntBjFW7GHWeszaMk/OLfwIiAHRKA2JnbJs/f
 0/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HRWHRz9qLKN4dI20DsaD2QwZ/seYLTnt4Z5R/kgcG24=;
 b=oMFEAp6JTALBryn4tQAsy15gVZIOtuetLrHnbPEKZdKHOhWG1AN+KqUHJLTwEkmcCG
 5YUHyXCssjcw5BNT37K0cAvMFRXyRDxIxRmblyjRDFc3FiA97QT0UFTHjme23Hz75JGz
 TlBsxv+z8fAnrXCsOZ1deatiembkgOjhtrj3ALcpeuuPujhRCH0iqPEi4KxQbbEU1mN0
 yiF5tiYKDsIfSgpZa9yydR6lOPckK5c593XzZWl6TitDRfsZvstv9sTSjJgfI34eeOMT
 oNOKpMbQx17VsUm/xZjTS9xjXuTy7fqeG/mJhi4wpPWQXcx497X4GMATyPx1eEdl3xhQ
 Xjhg==
X-Gm-Message-State: AOAM531CXt9NejyhmxHA8k0D7w6/jEUdKb2AYRVDjGOVj28QdFwDNxce
 WXXmib3B6hHmTFfwt4PYIBc=
X-Google-Smtp-Source: ABdhPJytFvscrEN4APpyDBen2luTTBFvU3dWycq/7YErj3QBYWThaLmNhgv313uyu/PHxTMc4xrAtg==
X-Received: by 2002:adf:f2c6:0:b0:203:f0ba:424c with SMTP id
 d6-20020adff2c6000000b00203f0ba424cmr23429625wrp.663.1648032788806; 
 Wed, 23 Mar 2022 03:53:08 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 c4-20020a056000184400b0020584c40778sm1468069wri.103.2022.03.23.03.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:53:08 -0700 (PDT)
Message-ID: <d1a01b0c-732d-9808-1a96-80a97fa27e30@gmail.com>
Date: Wed, 23 Mar 2022 11:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RESEND 1/2] qga: Introduce NVMe disk bus type
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, armbru@redhat.com,
 michael.roth@amd.com
References: <20220323101958.300848-1-pizhenwei@bytedance.com>
 <20220323101958.300848-2-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323101958.300848-2-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 11:19, zhenwei pi wrote:
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
> index 94e4aacdcc..4ea2a50228 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -827,13 +827,14 @@
>   # @mmc: Win multimedia card (MMC) bus type
>   # @virtual: Win virtual bus type
>   # @file-backed-virtual: Win file-backed bus type
> +# @nvme: NVMe disks (since 7.0)

If this patch isn't merged soon, this will need to be updated.

BTW I think I already review this patch, anyhow:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

