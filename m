Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B8387541
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:36:20 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw9D-0006sF-H9
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw23-0003r0-9c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw21-0000HD-J6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aVwxax7OhoRGnMnLe0TAZiNPmTevuzVtdvPvHlZPqg=;
 b=KdxiJj+oGE8t7XNGlhQp5MNpRSGzekdSbdgWVQfgeBE1PVaeAC4E+fiLL2LziN6mNQOJpM
 w6oXlEGn7c6Yd9JXrNQZPQMHPKzYdi7oWSZsgE1GZPSvMA9N3R+FMzGIhC282MCEcGvvas
 nUTdfJhUewENDJZLTWtWipRjVJn90lM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-KAhnupvYObOHdJrZUuvLvQ-1; Tue, 18 May 2021 05:28:51 -0400
X-MC-Unique: KAhnupvYObOHdJrZUuvLvQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y15-20020aa7d50f0000b02903885ee98723so5387567edq.16
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/aVwxax7OhoRGnMnLe0TAZiNPmTevuzVtdvPvHlZPqg=;
 b=MeTJ9x37t/7DxDmsX+BbZtPDIM7r3r/n/MNeKl28MpqN8Gi7kPxLsevMyMUECBEFqG
 E9O31HWvmfFsAJeAbP5FZUmOuc0uBDIuvEQqpOnWD9RDThdYHRAdEVjZw3jZiE5kJ7j3
 +uzvEhPa3TTzg8c31t5Dkx6lH20uMv2+Ip9hhc61B3pAgzFFDk+GXs9YqUM0Q70JLjbr
 3wUDBxx+hxRz8QaU3cYyiC/uVfUtDs2k2TfPphQBVkh8kC94zhq6Gl78Et6O/iX99wxb
 KwsC39F2cButLCfwQAaodWhPV5tSJsyn4of+MYiYRAYWr9Fpu67r+T0G6kRfqbNODxM1
 uALw==
X-Gm-Message-State: AOAM5314tCUHvq0R34C/hL9h3o5filQ12o7LlaoJehDhsdFim7pa3plI
 jDnr43oZZHYex+1SjziZpNy+ydBU8WBO3gaPz6/yvNdaDuAqbCmjL2MATzqpBl7i7YVFP7lzIh3
 +hH8pH1dZvY3VxOY=
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr5924918edc.38.1621330128860; 
 Tue, 18 May 2021 02:28:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNato0sXRZ1xorqCP3Rh+AhOW8YoPBMsb+IYnZKhGvyNPl4Rc8qUbk0DnCeDcSv3yY07xHaA==
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr5924910edc.38.1621330128729; 
 Tue, 18 May 2021 02:28:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id uz29sm3918175ejb.8.2021.05.18.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:28:48 -0700 (PDT)
Subject: Re: [PATCH v2 17/50] target/i386: Move rex_r into DisasContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-18-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7403ad8-4426-bfc8-421e-53260fa3164d@redhat.com>
Date: Tue, 18 May 2021 11:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-18-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Treat this flag exactly like we treat rex_b and rex_x.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 84 ++++++++++++++++++++-----------------
>   1 file changed, 45 insertions(+), 39 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


