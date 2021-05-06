Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE51374F6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:36:38 +0200 (CEST)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXcj-0001vN-9I
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXUU-0005LP-77
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXUQ-00039c-5C
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620282479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NC2kSHQLPEbs12cC0qOt7Gi5j+7px3YicgeYUuC+R8c=;
 b=VuoWNV7S8hgOJf0i2mGySNuxtR8bIB0lVevUWfPPeQ09WDZusPCDO+EGBt+GZn3tdxbwnK
 KW8tBJGuYbzZ+VRrITQyll53To8hZK2ACYsi3OeCjDJKyHUuB+g2gVdlShL+nYWy7A/c49
 08RPzsDn1oLleuPmRz86ALFSeSnMUKM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-__BPrKEvP3yy-ScmYYdy4g-1; Thu, 06 May 2021 02:27:57 -0400
X-MC-Unique: __BPrKEvP3yy-ScmYYdy4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fcab029014ae7fdec90so963853wmq.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NC2kSHQLPEbs12cC0qOt7Gi5j+7px3YicgeYUuC+R8c=;
 b=EY5zrorUS89aR+FEunZUk68QJcTRR/4jTpB2te62Vyz76axRO7RfqBhaddQ7AYGAJv
 EMCLAmgB1CMPLM2EOAQOzZbTpRHqNWcnxidQJNl8HGwNa3mVY6wgxct1ktX1aWnV60pW
 N0oTM0s8+Ich5iZB8obDuJtvIb5Qai+2H1WfulvL/+UCqnxUOC71kH5rc6m7Sg6iYvSl
 6wEIg/hYwEaD2R8b5Tmn5PQtPlPlzXggqAHzi6d4bFPh8e7k9shzkW1RcA4LHgYRUj6n
 rj0o395MhCVYu4693wNKK8N1X4jJ1e6YWReEA/8lIhxPP37Rx183wwUJAotto1Ce6u9m
 cbXQ==
X-Gm-Message-State: AOAM533vANlcWmJkfABF9mKPZrW6+wAwTtQB5/CvPRpub4tS/04b22DX
 EI73HBr6spt9rpsTNIaj4U5uq7FlkjJWrXL1bCnomm4N8FKo6EJNdrHH+tc5z/scHBJseka0ZXw
 FdDOjefS3MIsBj2oRt4iPfRibNIJjCm/H4eDLJ7buEU/YNstPR6sfD5sMF+ltXjQp
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr2061892wmq.111.1620282476265; 
 Wed, 05 May 2021 23:27:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTxEJwRVZEGLKy5BTWaOQrFOZ3hRPYrmWGzhRKo1ZgayeZtC6rl777h9LDGwkBkED2hPSPxg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr2061874wmq.111.1620282476050; 
 Wed, 05 May 2021 23:27:56 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id b7sm2533291wri.83.2021.05.05.23.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 23:27:55 -0700 (PDT)
Subject: Re: [PATCH 09/10] pckbd: correctly disable PS/2 communication
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
 <20210505192133.7480-9-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5bb37b0e-6625-c356-e542-54fc29d4dfb5@redhat.com>
Date: Thu, 6 May 2021 08:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505192133.7480-9-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Volker,

On 5/5/21 9:21 PM, Volker Rümelin wrote:
> Currently the PS/2 controller command KBD_CCMD_MOUSE_DISABLE
> doesn't disable the PS/2 mouse communication at all, and the
> PS/2 controller commands KBD_CCMD_KBD_DISABLE and
> KBD_CCMD_KBD_ENABLE disable and enable the keyboard interrupt,
> which is very different from what a real PS/2 controller does.
> A guest may notice the difference.
> 
> Mask out pending data on disabled queues to correctly disable
> the PS/2 controller communication.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  hw/input/pckbd.c | 48 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 13 deletions(-)

> +static uint8_t kbd_pending(KBDState *s)
> +{
> +    return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
> +}

Please introduce kbd_pending() in a preliminary patch.

>  /* update irq and KBD_STAT_[MOUSE_]OBF */
>  static void kbd_update_irq(KBDState *s)
>  {
> +    uint8_t pending = kbd_pending(s);
> +
>      s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
>      s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
> -    if (s->pending) {
> +    if (pending) {
>          s->status |= KBD_STAT_OBF;
>          s->outport |= KBD_OUT_OBF;
> -        if (s->pending & KBD_PENDING_CTRL_KBD) {
> +        if (pending & KBD_PENDING_CTRL_KBD) {
>              s->obsrc = KBD_OBSRC_CTRL;


