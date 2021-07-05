Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D193BBBEB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:04:09 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MOW-0004kO-7L
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0MNA-0003Ji-NI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0MN8-00041y-E4
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625482961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKuLIGw6Md0y8yvKdfjMa8/x22GSYO7eEG5jmXrn6Zo=;
 b=jOq/VuyCAdjgFQMqTBbntJO0nxFHCrnbqZ6yc534NvGFP/0IOd/CpArw2ZWaW67+PUDGpv
 /DBHGLyJmGwPqWYdWJF/f1PikLkVbV9lldo/eXffTt32twttb1FViPXQSzvvugRYV8hYdW
 MQGNTnBcEeZ9natRFzvN6RIEeCn+DtA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-1p4ocHEQMxeIdAG6EEwtRw-1; Mon, 05 Jul 2021 07:02:40 -0400
X-MC-Unique: 1p4ocHEQMxeIdAG6EEwtRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 t12-20020a7bc3cc0000b02901f290c9c44eso5708942wmj.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKuLIGw6Md0y8yvKdfjMa8/x22GSYO7eEG5jmXrn6Zo=;
 b=Hi/z6FEaIIfUvgoB96udKWCB6CU6WKOqpW2n8KGuGvnryNpAzD+PyNa1D7ht2Ou3D1
 Bs8RX89Gt7lAcV13UlXyqQe6o9SgoXcbeFtCMPFnc2UP5g7jLmXiT7zZrtpZvSdOA7ud
 9wovI9YiwYvvxP5ge22RUA+elij5C0VnQtihsxgC9gcHsK1sze2vo6mYmmSb/oOc3cYs
 p3ek0zcfWO8CJoBtQcdwu2mcauN01LOppr1vVQKwHPyrRLyKtvevpxduXEavjecar0aC
 oNxYvfsLDm1zFW5Qj6DY+p5y+AXaALHf2YdUrjcLqpx2bcU5c93jMSj3/0W1Gux1XdJv
 cffQ==
X-Gm-Message-State: AOAM533U+MwEN3veUAbhu9Sya2kMt3QDGohFj1CeNTpvE4K5o8/OQZvz
 ytm5p8kLGX/SOXoQKaUswziwWYNJjR98a8Q6pSO5in5itX6umpD1T5gczeL4QzSwW+RKYic5Grm
 Vno9CUTLjuCo0JoM=
X-Received: by 2002:a5d:648d:: with SMTP id o13mr15414011wri.118.1625482959309; 
 Mon, 05 Jul 2021 04:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwer3xB6k3IitgW+iJpvw0vKMApaufjLRMahHLxpbs3YSnyOpyvYKNudXXICgY8cQkLGzzG9w==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr15413981wri.118.1625482959065; 
 Mon, 05 Jul 2021 04:02:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f9sm13075995wrm.48.2021.07.05.04.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 04:02:38 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display: fail early when multiple virgl devices are
 requested
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210705104218.1161101-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd6a8650-0507-49eb-4a13-2c0356b7f3d1@redhat.com>
Date: Mon, 5 Jul 2021 13:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705104218.1161101-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 12:42 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This avoids failing to initialize virgl and crashing later on, and clear
> the user expectations.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/display/virtio-gpu-gl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index aea9700d5c..bc55c4767e 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -113,6 +113,11 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
>      return;
>  #endif
>  
> +    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {

Isn't the condition inverted?

> +        error_setg(errp, "at most one %s device is permitted", TYPE_VIRTIO_GPU_GL);
> +        return;
> +    }
> +
>      if (!display_opengl) {
>          error_setg(errp, "opengl is not available");
>          return;
> 


