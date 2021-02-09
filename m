Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D8314DF3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:12:13 +0100 (CET)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QwG-0002G2-R6
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9QuQ-0001SW-CF
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 06:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9QuM-0003P7-SH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 06:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612869012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uilp+WE9Vf9txUkRA+Uxl8WLLR/P/HXJ+Kio1Pzbs4M=;
 b=i9Q8vXLE6VrhPR+7CMj0i6Xn/4jy5Gpk44Zn2wJMI/WbdQGOcbmmUpaFdBPnosUMtIG8fX
 fvlI9MyczPBR9WOoMD+rYz0717F0BxYfE3c6GNVN5Kll3tZAYylb22kCQ3NIe1Z0n87Sj1
 vuM2fpKI9QTLb6vOzpTuQdqu3hrou/k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-LKguvrdfMACP5bYkxaAqtg-1; Tue, 09 Feb 2021 06:10:09 -0500
X-MC-Unique: LKguvrdfMACP5bYkxaAqtg-1
Received: by mail-ej1-f69.google.com with SMTP id ia14so14767454ejc.8
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 03:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uilp+WE9Vf9txUkRA+Uxl8WLLR/P/HXJ+Kio1Pzbs4M=;
 b=PG9jlI90qLGpANNo2nq0XEyOxU+sCQAx4eNfernBglVjO9HVZlTQ1aATS10ItrhhxB
 zATWSAW20PAZnVKca03sBnl2uQnmK6JRfi9RbyJCa/UPG5ucS0RaDG50J2FOkgy76yMD
 lkXVpVADV3nVISyuNf6JE42Xn2thaLCqfv+UaLIoFQc4EucQeAzdRtOm4A/u1c87hd+6
 YAK2vnNsNI8e+s9duemlm5Wo3ms9yMJmAjwIAcwn5UzDBQaC5pGbsw0cRkTc/P0n9Kx/
 i+uFkSpaJ8sFrRzN7rw+VQyFkJ8Nx33Ue5l6GCZnWYgP0eB+m3qr5o8N+Q7ya7yXuwtI
 3ktA==
X-Gm-Message-State: AOAM531ujYVAG8138Gtf2WA0Uz852Vbga2mgFSLQUqST5t7u7jV+XYCp
 wXCwK8KZg0xNbdTlQ7H+O5G/0mxeVElSFog+mj2+vLtuVi/6CD4tgJNN3QHgJliQYxjscSUCxYs
 Elr0GJ+PzhdqqWp0=
X-Received: by 2002:a17:906:c00c:: with SMTP id
 e12mr21334841ejz.103.1612869007896; 
 Tue, 09 Feb 2021 03:10:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzseCWBrbr6RnKtInWHNLGdE/43vYcu+/1bmbitBtQZJBZAYJxgIdjv4XMAX564GpV626ciZw==
X-Received: by 2002:a17:906:c00c:: with SMTP id
 e12mr21334817ejz.103.1612869007664; 
 Tue, 09 Feb 2021 03:10:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w3sm10487242eja.52.2021.02.09.03.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 03:10:07 -0800 (PST)
Subject: Re: [PATCH v2] hw/block/nvme: use locally assigned QEMU IEEE OUI
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20210209104520.579084-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55a9c72c-f79c-5cb5-6c69-ad7008fd8e6f@redhat.com>
Date: Tue, 9 Feb 2021 12:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209104520.579084-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 11:45 AM, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
> the controller to use a Red Hat assigned PCI Device and Vendor ID, but
> did not change the IEEE OUI away from the Intel IEEE OUI.
> 
> Fix that and use the locally assigned QEMU IEEE OUI instead if the
> `use-intel-id` parameter is not explicitly set. Also reverse the Intel
> IEEE OUI bytes.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> 
> v2: drop telemetry and add a check on the use_intel_id parameter.
> 
>  hw/block/nvme.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index c2f0c88fbf39..870e9d8e1c17 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4685,9 +4685,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>      id->cntlid = cpu_to_le16(n->cntlid);
>  
>      id->rab = 6;
> -    id->ieee[0] = 0x00;
> -    id->ieee[1] = 0x02;
> -    id->ieee[2] = 0xb3;
> +
> +    if (n->params.use_intel_id) {
> +        id->ieee[0] = 0xb3;
> +        id->ieee[1] = 0x02;
> +        id->ieee[2] = 0x00;
> +    } else {
> +        id->ieee[0] = 0x00;
> +        id->ieee[1] = 0x54;
> +        id->ieee[2] = 0x52;
> +    }

Correct.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Ideally we should have definitions and use them here and in
qemu_macaddr_default_if_unset() instead of this magic values.

> +
>      id->mdts = n->params.mdts;
>      id->ver = cpu_to_le32(NVME_SPEC_VER);
>      id->oacs = cpu_to_le16(0);
> 


