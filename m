Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCAA3042E5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:47:52 +0100 (CET)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QZL-00017a-Ka
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4QYK-0000g1-Ri
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4QYG-0001nb-Io
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611675999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBVMDkAPWw/FwsyyfIRLbjUilWy8cEizShiLvZdGqW0=;
 b=Wpo9Vhs2zFvKH+pUULCoK0kjXKZVkciaTko92Rn2SW5Az+MheOkCAI2KkqtqQBxxYWoLtJ
 Cw8ZQzTi3MX3eiBj+VDcPeu6LPslcp7CUdtoWWLwqghVemtrB3d9h9EyxTV7Zt9AjugS5p
 BpOqsztzCfwHRnv+sUJfgdixX7zAzLs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-gsn5uoCWNJWvVs25p2dkug-1; Tue, 26 Jan 2021 10:46:37 -0500
X-MC-Unique: gsn5uoCWNJWvVs25p2dkug-1
Received: by mail-ej1-f69.google.com with SMTP id jg11so5107605ejc.23
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sBVMDkAPWw/FwsyyfIRLbjUilWy8cEizShiLvZdGqW0=;
 b=hRhJ3nXb5qFvJCa9JoZEOW4KicA3LqH9MYX8M88G5HPvq2hCyGnKoqoZKG9bS8kMjJ
 TwUowHkMFSjy+Dt5xQ8C3P5OZNvNsGRzefWCCDYIRWXstw8UBV8HbTZj6+fq+JPjWKFI
 hPqxkAj4nHPngyHS62GPlD2ckv0xZk6dh+cLNPOrepdi9QYMLzgTf5N2wYvaFucnThVP
 s0svPPhUVE7IHWcZzJhW7n1/p/i+QnGKan8F9qp34x6kMS55XSzIfXb70cheC13Rr26e
 VCc5KfZKMjkqJ/tJrxb8VQW6Y0zz503S96LTuFeenp0gdTWsHTZUyyieD84TEBjqhc/H
 xWxg==
X-Gm-Message-State: AOAM532jAZQNx4vYDkVcHsfPlFdYhjjiHzUlO6CtPXeOOEunTix68ET/
 DKeRqNiXG/Nsrso89qWkY3R9ChsPH8GcHBJBL+xzDyp0wOa3zGrYZel2AxK6UtP0vh/bojD9E6D
 XVeNHvho1x2aTI7s=
X-Received: by 2002:a05:6402:2694:: with SMTP id
 w20mr5159784edd.200.1611675995927; 
 Tue, 26 Jan 2021 07:46:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTKMLEMrFneczF/EXFzHVXf6C3RGQ5ZQ9JyU5DlhZ7d1SGx0UqKWLhUyXCKln9UQpbwsBWhw==
X-Received: by 2002:a05:6402:2694:: with SMTP id
 w20mr5159767edd.200.1611675995779; 
 Tue, 26 Jan 2021 07:46:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k21sm12644538edq.60.2021.01.26.07.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 07:46:34 -0800 (PST)
Subject: Re: [PATCH v2 09/12] qapi/meson: Restrict qdev code to system-mode
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-10-philmd@redhat.com>
 <fcb116d8-8701-90cc-fabd-85983740f74b@redhat.com>
 <02ef2d7f-ac16-af21-a002-bc2165646dfc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d23b2cae-9e97-85fe-27e7-584297327654@redhat.com>
Date: Tue, 26 Jan 2021 16:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <02ef2d7f-ac16-af21-a002-bc2165646dfc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/21 01:32, Philippe Mathieu-Daudé wrote:
> 
> The alternative is ugly:
> 
> -- >8 --
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..d09f32e38d6 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -950,7 +950,9 @@ static void device_finalize(Object *obj)
>      if (dev->pending_deleted_event) {
>          g_assert(dev->canonical_path);
> 
> +#ifdef CONFIG_USER_ONLY
>          qapi_event_send_device_deleted(!!dev->id, dev->id,
> dev->canonical_path);
> +#endif
>          g_free(dev->canonical_path);
>          dev->canonical_path = NULL;
>      }
> ---

Well, the alternative is also to not do anything.  There's already a 
stub for qapi_event_emit, does it really hurt to have the 
not-stubbed-out code for qapi_event_send_device_deleted?

Paolo


