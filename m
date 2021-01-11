Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86B2F1A2E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:53:52 +0100 (CET)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzVv-0003jL-QY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzSn-0001Dx-EF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:50:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzSl-0008HY-BI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610380234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJqNQp7lq2KMNmuqwHUi6hTQ7ofp2/rLH9+mrflJe+s=;
 b=P/AKQf5rTr2VPrjvOpdh6v/s1RvK81CjelTHcZWfYbOttIZFB5QT/VinOm8Es2/MBKqyLJ
 rjlTvooElqH9jG2Eb7wfVMbPXpM7U/pVvAhN83nghTjfrNAjvStzVJO8kk/FAD1NhGwtjd
 DAUfqFljgeHGEqiuR+OBwrZKqpxAyac=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-g6pRiJRnPjaLZnDL3vS2KQ-1; Mon, 11 Jan 2021 10:50:32 -0500
X-MC-Unique: g6pRiJRnPjaLZnDL3vS2KQ-1
Received: by mail-ej1-f70.google.com with SMTP id u15so62359ejg.17
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HJqNQp7lq2KMNmuqwHUi6hTQ7ofp2/rLH9+mrflJe+s=;
 b=r8bZUfv4dOPnGe47xZHVAV09wW5STn3LwfWL46WRhuzDOlRX3wWl7UlrRebcEEu3Mx
 5IDvhaCq7KvpGJWqJv4LXbaK5ZhBdsVUKd6PesYGNjJATqxMp8Q/f7hDDpJtfqy8DxF4
 577SuHtnhSUJHKSHLaz4ELlsqG4WHmRYhS9FQMdAKwwVpG1DTBaNPD/YiGvkDkihFaCl
 FmJqaE71JyckJYu8ft9VE9l02IJegyY8LR12if4SuoC31+f1CTxJb8NkTarh4eaCqodz
 1+CcdaLKCvRmMreHL5CVtCRbBaOTj9H+TW2ZOtyNeiZ8piYCuiMH3Eq7/YcIKqz5mDmK
 RbyQ==
X-Gm-Message-State: AOAM530qSlSFraDX6m0/nFhI2mToQnaTga/sOpil04STc2ke75zfNSpr
 6sR4Xja76UuKANDmnK0kVO1StgayP7E+wpxNLaMsKkVBz8/cr2a7uSPb4jZjedDU6o0m4WqGpPE
 xdiIUNaxJxslNLFU=
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr98899ejb.38.1610380230124; 
 Mon, 11 Jan 2021 07:50:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK8BZZU9Q6nVVSMO7UR7u+NcNhiDRrpaqHj5N7YHm198WBhIaEUWAUNyo1EuvQZgMXFEWKmQ==
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr98888ejb.38.1610380229926; 
 Mon, 11 Jan 2021 07:50:29 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z12sm4861ejr.17.2021.01.11.07.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:50:29 -0800 (PST)
Subject: Re: [PATCH] vnc: fix unfinalized tlscreds for VncDisplay
To: Zihao Chang <changzihao1@huawei.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210111131911.805-1-changzihao1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71ec992c-0a08-2a15-4d75-20479785cf0b@redhat.com>
Date: Mon, 11 Jan 2021 16:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111131911.805-1-changzihao1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: oscar.zhangbo@huawei.com, armbru@redhat.com, xiexiangyou@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Daniel

On 1/11/21 2:19 PM, Zihao Chang wrote:
> In vnc_display_open(), if tls-creds is enabled, do object_ref(object
> ref 1->2) for tls-creds. While in vnc_display_close(), object_unparent
> sets object ref to 1(2->1) and  unparent the object for root.
> Problem:
> 1. the object can not be found from the objects_root, while the object
> is not finalized.
> 2. the qemu_opts of tls-creds(id: creds0) is not deleted, so new tls
> object with the same id(creds0) can not be delete & add.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  ui/vnc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7452ac7df2..69e92b1ef3 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3234,7 +3234,7 @@ static void vnc_display_close(VncDisplay *vd)
>      vd->auth = VNC_AUTH_INVALID;
>      vd->subauth = VNC_AUTH_INVALID;
>      if (vd->tlscreds) {
> -        object_unparent(OBJECT(vd->tlscreds));
> +        object_unref(OBJECT(vd->tlscreds));
>          vd->tlscreds = NULL;
>      }
>      if (vd->tlsauthz) {
> 


