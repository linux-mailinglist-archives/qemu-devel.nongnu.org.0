Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176143D9576
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:45:42 +0200 (CEST)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oYn-0004eK-4i
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oXc-0003DM-W8
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oXb-0006ec-Eg
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwpey7SFX+2jBhRg+YnBlCQkCfHlfZwpopGvd74UMt0=;
 b=Qu4613Dd78aVid+UnY/BmrMlNh60cwZR2XSnKtw7y5IZRgI/KyVACbt2F7grVDYcXU/Pnm
 uIYEVjyX9HwpH0hi4XIgQYOjUUImYajubvm7ukq7AmihRV2r2EITam8bNZ0W0VIY8PfNOk
 iHGP8wYstfAvNINL7HhZp/uH9794f0c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-EWAuhW9hNAOUXrRDTVp_Bw-1; Wed, 28 Jul 2021 14:44:24 -0400
X-MC-Unique: EWAuhW9hNAOUXrRDTVp_Bw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so1265429wrg.23
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwpey7SFX+2jBhRg+YnBlCQkCfHlfZwpopGvd74UMt0=;
 b=DTL47HiQ7s5Lo4GQR50WIss9PWcvDzNgG2DFOx2G7mUqsCfIyhhzlRQ/KmPyI5fSnf
 Q7AATnB4tqBH4FATGB4SRz1h+2fxIc0ZcWdUNzL7yAQ18Go2OVOt0yHLii0387t5XtXY
 XQtQfIH11EZzWR18KyN0oHXymBFg3la51xsesTLhIDE4nzR1MzxjwFiEcnx659isEedG
 KNFIV0IWcRJ0dW+jlNNOv1C935oD6eW+heHnjczWPY7mlrrde2QiMxBX6OSC6i942TZr
 OPNGRJ/UFA+iPtWbkhnI7owH435BsD/S7utGQ1xuKKsXYp2ZohTYi+UgzJnLIarRWs3h
 dafA==
X-Gm-Message-State: AOAM530tOzi0nXMivfWI1lEGGux52HFLvDdZ+7vbkoPReYzzDajmpH6J
 JY6n4C2u3pSfNMdzEcBpN+zyLyslW2CPB0R8lVIXOkxxmRN3Oi0W2Fku2Jrdq+3OFAXdm8CBeEg
 OPNdH746eC1mMIpk=
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr733869wrs.365.1627497863017;
 Wed, 28 Jul 2021 11:44:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4qDSKmcSqhh7GZ5389wsVhB5c1CYd1VC+stsVNVzTFzd5gxOVDmySTPoobkamor7tPyCIuQ==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr733851wrs.365.1627497862767;
 Wed, 28 Jul 2021 11:44:22 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id q20sm684214wmj.27.2021.07.28.11.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:44:22 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] virtio-gpu: Initialize Venus
To: Antonio Caggiano <antonio.caggiano@collabora.com>, qemu-devel@nongnu.org
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-8-antonio.caggiano@collabora.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0953ffe2-0dc8-b6fc-77f5-60fdc28e72ac@redhat.com>
Date: Wed, 28 Jul 2021 20:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-8-antonio.caggiano@collabora.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 3:46 PM, Antonio Caggiano wrote:
> Enable VirGL unstable APIs and request Venus when initializing VirGL.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 2 +-
>  meson.build                   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

> diff --git a/meson.build b/meson.build
> index f2e148eaf9..31b65050b7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -483,6 +483,7 @@ if not get_option('virglrenderer').auto() or have_system
>                       method: 'pkg-config',
>                       required: get_option('virglrenderer'),
>                       kwargs: static_kwargs)
> +  add_project_arguments('-DVIRGL_RENDERER_UNSTABLE_APIS', language : 'c')

Unstable in mainstream repository doesn't sound right.
What is the plan for the project to stabilize it?


