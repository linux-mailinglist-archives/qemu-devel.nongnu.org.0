Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEB2D6472
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 19:07:23 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQLa-0005PZ-Gs
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 13:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQGL-00029o-1m
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQGI-0000aj-QK
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWttC2uuGy6pAkAdJ365glwabpX5tSC9BTJgNV7N6+I=;
 b=fXczCO8f5jrALudjb1h6gEKhpIHjgSMO/P3E9AxKYalBAwUqdNxTOxAoNhnQBpq2pPuFzP
 ZhPnrxo9PoBYHi/X44xDJSz6KCitdxT3KcKZ8JZlz9oGlTrV4aBzy37tekrF9lXRQT74Bi
 9kJGUR+VeSEJWtnkzJljrVhNGvZxjb8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-7mFH6kQqNpWN0OZFEn5SnQ-1; Thu, 10 Dec 2020 13:01:51 -0500
X-MC-Unique: 7mFH6kQqNpWN0OZFEn5SnQ-1
Received: by mail-wr1-f71.google.com with SMTP id o4so2196569wrw.19
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 10:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CWttC2uuGy6pAkAdJ365glwabpX5tSC9BTJgNV7N6+I=;
 b=fB3O8lE//mo3bjPx98tCEG6eCGz1FLWw4bPMBPckZmRNKQappYHGV5AyHK5vwA5H+I
 cAEqjptWru/KOEc/54e/3jEYk2jh+JzoSGRmSsWP05B7S396vXKbrDn9ZeKLPCOVKFpu
 EmfTqYHkxZDMhpGd9rsKzGtaUL0dgoD2qXGRGolMJRg0zi4ulj4JSzb1OgegGR//pSTs
 Tv4MNJjLfJoKG79ra2mDL4nPzF3CRpCBxfDhMsmLol0ijtzKUq6T8vnUkUkCpGhyTLsd
 D6Jm19SDgIQdV8dwFGzfohbgQGdbniQuQ/Pc2A3U3WKUtf/adbkKJeYv+SqRdM15+uqt
 Lo0Q==
X-Gm-Message-State: AOAM532R5p46+ygeqx91OBFnknjvTVIRgz7CCVpOtZeQmwKoklwEPE+U
 ZjefIAnTE5e2m5Ktb05pyBVP/lWTNtpKt0hmkdyqOJmEEw0Afhf0WnHr4D0rUlbcmSHT3/4ryeC
 21Lfh6mwsJu6Fmj8=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr9484712wrn.322.1607623310366; 
 Thu, 10 Dec 2020 10:01:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsj01iMHPfYGoMPzHJRRVs0XVtRnB5Ow/7h17+ve87aHUcpC4Zl6UGO/nObBTh90vXlQXkdQ==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr9484693wrn.322.1607623310196; 
 Thu, 10 Dec 2020 10:01:50 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u6sm12433497wrm.90.2020.12.10.10.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 10:01:49 -0800 (PST)
Subject: Re: [RFC PATCH] virtio: Only display errors if GUEST_ERROR is enabled
To: qemu-devel@nongnu.org
References: <20201210175916.187273-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7cd7dae-821c-8cfc-78bb-58261917de47@redhat.com>
Date: Thu, 10 Dec 2020 19:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210175916.187273-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 6:59 PM, Philippe Mathieu-Daudé wrote:
> Do not display virtio guest errors until the user request it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eff35fab7ce..bde0d31c5d9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3622,9 +3622,11 @@ void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
>  {
>      va_list ap;
>  
> -    va_start(ap, fmt);
> -    error_vreport(fmt, ap);
> -    va_end(ap);
> +    if (qemu_loglevel_mask(LOG_GUEST_ERROR)) {

Hmm could move the 'va_list ap;' declaration here.

> +        va_start(ap, fmt);
> +        error_vreport(fmt, ap);
> +        va_end(ap);
> +    }
>  
>      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>          vdev->status = vdev->status | VIRTIO_CONFIG_S_NEEDS_RESET;
> 


