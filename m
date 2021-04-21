Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115E367055
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 18:40:54 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZFuD-00021Z-Nk
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 12:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZFq2-0000d7-8x
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZFps-0007cl-Tr
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619022980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kR/wVgy3qB+jbY/fSOS7s+vQrxlmR33yB0c0IRrz16k=;
 b=BZgWsqYaHIVAxhd2BHapdXYTDTE/c7qPBguOsMvpvqjpXx1T44Fw05GlYUeaNq4koF6Hoz
 KGTUWHkIPwxfbSAfUqDfqBM9mYX3VtdEiH6/3uW8n/K6xNTG6j51Mc8Jdtv5ndZZYHZdaF
 1ZpBsEevOX1LbVBXTjcdiCv705kt2Rg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-X29kYNsnPDuan5Vyc9w3lA-1; Wed, 21 Apr 2021 12:36:18 -0400
X-MC-Unique: X29kYNsnPDuan5Vyc9w3lA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f1-20020a0564021941b02903850806bb32so9397851edz.9
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 09:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kR/wVgy3qB+jbY/fSOS7s+vQrxlmR33yB0c0IRrz16k=;
 b=SGYKfHg3MdeAiGxmZMXkq2B9pj2pc+Snob1taxXwcPgysSKk7vAZ6XJB/+u7Grbec+
 e/8+0uRcxd1jvDC618WW1y9QIqks7FZzhCHsr5T3CctWdoqrhhjUMFR2muPHuNsCtYFH
 j25CUe0KRs0DevNJG8jsroKqizs7E7mji62LEUlGe+tBQFcVr7lv2r0lj+yAgLURgvON
 L0Ky3m1KSJm692IJ7EXeFGujgORfDlu3IbxvMWt6g76Dr1Mhvwg0UHwIyFb0G9YSEJSo
 4g0p9hmngpBEFfJ9hzscYNiajNWTR1gtyAVtewEjZTmj2yKC9m9JE0dPvY3KLKbEd5f/
 mrHQ==
X-Gm-Message-State: AOAM530fMp/HF6QEl1MAxvSfr1RA76ZdT8zcObssn5xnDSRi5vDGtHM2
 S0ndOaxgED2fZz8H5KLwt/0IYRuxEgHdyQWhgBdULSaQqQNihSiznbotLODE45Utl2YQvQq6HpN
 B/CV7T50UvQHO7Ec=
X-Received: by 2002:a05:6402:254c:: with SMTP id
 l12mr20853763edb.278.1619022977212; 
 Wed, 21 Apr 2021 09:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm4CSS9Bzzc48uCA2J7s7lmCWheXrXfDuGU4xWfgURPwlcI1mj793v0gyOBVyHZCPrmJKiHA==
X-Received: by 2002:a05:6402:254c:: with SMTP id
 l12mr20853750edb.278.1619022977052; 
 Wed, 21 Apr 2021 09:36:17 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm3991581edt.92.2021.04.21.09.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 09:36:16 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe1f97bc-5ff9-002b-debc-5bc2c449c8b8@redhat.com>
Date: Wed, 21 Apr 2021 18:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Bin.

On 4/21/21 5:22 PM, Cole Robinson wrote:
> Attempting to hotplug a tap nic with libvirt will crash qemu:
> 
> $ sudo virsh attach-interface f32 network default
> error: Failed to attach interface
> error: Unable to read from monitor: Connection reset by peer
> 
> 0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
> 206	        if (!s->nc.peer->do_not_pad) {
> gdb$ bt
> 
> s->nc.peer may not be set at this point. This seems to be an
> expected case, as qemu_send_packet_* explicitly checks for NULL
> s->nc.peer later.
> 
> Fix it by checking for s->nc.peer here too. Padding is applied if
> s->nc.peer is not set.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1949786
> Fixes: 969e50b61a2
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
> * Or should we skip padding if nc.peer is unset? I didn't dig into it
> * tap-win3.c and slirp.c may need a similar fix, but the slirp case
>   didn't crash in a simple test.
> 
>  net/tap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/tap.c b/net/tap.c
> index dd42ac6134..937559dbb8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
>              size -= s->host_vnet_hdr_len;
>          }
>  
> -        if (!s->nc.peer->do_not_pad) {
> +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
>              if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
>                  buf = min_pkt;
>                  size = min_pktsz;
> 


