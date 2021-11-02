Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028774434E4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:52:53 +0100 (CET)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxxs-00035n-4X
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhxwl-0001rg-MH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhxwj-0005X0-94
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ehC67Es+ci6JwGoKaIHjS2cuH89CaMCXQ0p4lUDQro=;
 b=iwsB+i9ZjgI5oQPCU/m2sKsmBTHnJ6OJvZEQHByXGjGTSDU1U8YmpcduNGHfGT7XAbNq8k
 sKWDe0ArTsLcbrHqu2cQh4XL0aI/HYCfTdUx226syefWJ9Gl44RinTskvmjUbr/cEGX4dA
 ZVlDnkhBHDWcveAsBR9hM9bTIE7QMFI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-X2QtX9cWP7q967bwwWlhAw-1; Tue, 02 Nov 2021 13:51:38 -0400
X-MC-Unique: X2QtX9cWP7q967bwwWlhAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so5639895wma.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ehC67Es+ci6JwGoKaIHjS2cuH89CaMCXQ0p4lUDQro=;
 b=Sa2I8ObBiUIRMcokjMdvTc2ww68oN3gqgyO5b2BYp2j0mBcn+10/o78AWErK6sOKDB
 Y4xGNMJeyoz/VEffgrzZindAF48sb6mIwKOkizFUaK8k8kQREztkxEjRdH/BWXmk05Q/
 FaH0RTFZka0BlV98Oba3+4InXOAuryOX8noPPH7oa6mGDOxGxub82Bc5vqSdagC7l1Z3
 MxkXA39MhdpsE8Aqk+Wpsm8GOGauiXWRBGN1CZhe4jKX0rZvAp7BRXPkh+tl5A+25lgQ
 Jn8MSNc/9IeRDG6UspsHdyj0r3x4XgzY/+HaGaGaXHyBnZa+b/KcMpNRFlwlvNSjUkWS
 Y2qA==
X-Gm-Message-State: AOAM533+m+T8EDhtw92Tqeb/SRU/JdqGD0LmFgCcd8tXD/qRA4Q7lUPx
 RmXoEqKOVd+P4qFJ0VhkPQNEXrU8Za9XxWYQ5SkIIbitmYpBUdNavrrMzW13zt4tZdG5JV9ufsn
 cTJjHdxcGawbxOl8=
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr15250333wry.110.1635875497664; 
 Tue, 02 Nov 2021 10:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY3dc+vCNOV9Q2EHByRVy7W71saG17OVb3DP949dZSA8ZTxosxvP3NuF7n4fdcNYFNVo4U+g==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr15250295wry.110.1635875497441; 
 Tue, 02 Nov 2021 10:51:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i15sm3098757wmb.20.2021.11.02.10.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:51:37 -0700 (PDT)
Message-ID: <587337e1-61ce-d90f-8d1e-8650bfb3d72b@redhat.com>
Date: Tue, 2 Nov 2021 18:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211102163905.33798-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211102163905.33798-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 17:39, Stefan Hajnoczi wrote:
> Reported by Coverity (CID 1465228).
> 
> Fixes: 402378407dbdce79ce745a13f5c84815f929cfdd ("vhost-vdpa: multiqueue support")
> Cc: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 49ab322511..373b706b90 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>  static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
>  {
>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
> -    struct vhost_vdpa_config *config;
> +    g_autofree struct vhost_vdpa_config *config = NULL;
>      __virtio16 *max_queue_pairs;
>      uint64_t features;
>      int ret;
> 

Stefano sent the same fix few minutes before you ;)
https://lore.kernel.org/qemu-devel/20211102155157.241034-1-sgarzare@redhat.com/


