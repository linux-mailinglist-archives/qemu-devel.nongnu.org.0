Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885D478704
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:25:49 +0100 (CET)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9Uq-0008NF-1C
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:25:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9S4-0006j5-S8
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:22:56 -0500
Received: from [2a00:1450:4864:20::436] (port=40717
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9S2-0004KU-SJ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:22:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id q16so2797763wrg.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZP1Ic0fT27CJVY7zqhHFD7SZSfH3jGxxCPxSlaSD2k=;
 b=MGQnsBwjiwJo/VhCJh+32ytXa4BnN+axM/+sr4zy+EwlbV0XQ5j2kEQRF7lZzvrmei
 C8WgwSJQmpxYYBu6OlHQwla7U6RBo+TY7PZrTq6EK2qcxy79AJtab52DJfhwY5iupZqy
 135aCRYhv+jDH1dCQDaJlQ5sHOvONDyaGPglKH9r1ba9CUi/KVNjNqsn4tbGg+UFuSJC
 ZkA3B/IWgRDe9G8NPhpJRskzDm/AHMw/GMygp18R5t+4rbUW2JYqcilt3rsdKiSTmkvF
 84m9AjM8V82k7WDyEQuC9gDre6oChyzb2OTJ5xY2Cz0409LofFh/ZvDaUSIBP3vzRa7L
 hXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZP1Ic0fT27CJVY7zqhHFD7SZSfH3jGxxCPxSlaSD2k=;
 b=rEzrzi7pMMh1FShJ1GEXS2IjhQLxzgC8aftKzX5J7A5RuzKZDz3A9Np9N/+ae6LM1F
 97PSYK5XOGdeBhPBGuf8j1P9BfI2nVHASeFBaGJri/lDz4EtONovFxDZU/kk9snxWNRe
 /pMEz5ep2u8zPAeLXgcUTfAYN5Hvqk31L73OTOL7pedHuhY9n4nUOfFjGOcEFjdYdsXk
 mb1c3qVUx+0jCe8IkAQLHPSq3ahmATxv2edDH8MoLNHDVSbUq+hjz09SFYmsKLpG6q2j
 kLiNHkpjTQ7+wV+LbqhvbsdK8s/moh9z2wQ4WDB1EWNHygrqh2OqzhrIFgtU+Sfm91D5
 8LCw==
X-Gm-Message-State: AOAM533MtA1vfOnBEjt7KDn3Dl0Lir6DirarumE/qxozlKon7CF7o8Qi
 794I0HI52a+ty/62jryCxFk=
X-Google-Smtp-Source: ABdhPJzNNjkqZJw3he5azBzVvzrfv7bVS8U3n4fy2pLH2dSznQ4jjz/dDe7kyPipuFb+YUrq2LKkUA==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr551289wrw.430.1639732973461; 
 Fri, 17 Dec 2021 01:22:53 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id j3sm870046wrt.14.2021.12.17.01.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:22:53 -0800 (PST)
Message-ID: <97dad0a8-4c99-fcfb-41a8-34cf36d96432@redhat.com>
Date: Fri, 17 Dec 2021 10:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/i386/vmmouse: Require 'i8042' property to be set
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211201223253.36080-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211201223253.36080-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Calvin Buckley <calvin@cmpct.info>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 23:32, Philippe Mathieu-Daudé wrote:
> If the 'i8042' property is not set, mouse events handled by
> vmmouse_mouse_event() end calling i8042_isa_mouse_fake_event()
> with a NULL argument, resulting in ps2_mouse_fake_event() being
> called with invalid PS2MouseState pointer. Fix by requiring
> the 'i8042' property to be always set:
> 
>    $ qemu-system-x86_64 -device vmmouse
>    qemu-system-x86_64: -device vmmouse: 'i8042' link is not set
> 
> Fixes: 91c9e09147b ("vmmouse: convert to qdev")
> Reported-by: Calvin Buckley <calvin@cmpct.info>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/752
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Amusingly 'qemu-system-x86_64 -device vmmouse,i8042=i8042' now works.
> ---
>   hw/i386/vmmouse.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index 3d663682863..a56c185f159 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -286,6 +286,10 @@ static void vmmouse_realizefn(DeviceState *dev, Error **errp)
>   
>       DPRINTF("vmmouse_init\n");
>   
> +    if (!s->i8042) {
> +        error_setg(errp, "'i8042' link is not set");
> +        return;
> +    }
>       if (!object_resolve_path_type("", TYPE_VMPORT, NULL)) {
>           error_setg(errp, "vmmouse needs a machine with vmport");
>           return;
> 

Queued, thanks.

Paolo

