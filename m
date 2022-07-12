Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10C571335
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:39:51 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAUj-0005tE-CB
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA8z-00073b-UW
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA8y-0006Vd-Fj
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//BJRgCsd0n/dR5do1z+2B7NTCp4sw0sHEuyUyL1cuo=;
 b=DHRl3gQguMVYz3iboOSMpaLEDPfzbAVZ04CHXbO3MkKT9cv1yPVgeI2AXRSW5hVD7hmsiZ
 uEH7mT3xQYp7V7FQeQNv8/HtXVVtQvGOJnW7qKuThrl8y2tZYz9jDb8cEigTetOnakZkF1
 Q6Gj1mkdmPfiYzP01GJEA7NiLtE+V2Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-wSbvH07SM3KcFva0CJ3VBQ-1; Tue, 12 Jul 2022 03:17:08 -0400
X-MC-Unique: wSbvH07SM3KcFva0CJ3VBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a05600c15d200b003a2d4809386so6326712wmf.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=//BJRgCsd0n/dR5do1z+2B7NTCp4sw0sHEuyUyL1cuo=;
 b=xApBHi5A0+aGc8KSmSJqad2hHEANSWos7kVf/UiT35J1YA5ZRNojXiLQHbNB47JnXD
 VfhWgh8IDqpHHb9Q1TkUeGfQHeP5E0Ocqam9T+xjtWu5Z64wogrpEOS/+ZpO6YQJYw4p
 XJtvld3teb4xVbEjSPfPyAIJWIuLCU4LHs6iiZQP6rFpJZLbT6BOIY8teE4wPPbS5WHH
 qFExz675CP3jC03IbPTX/0GSE+daIagb3wF6kzwNQTw/adi1ENIOKrvjSMPguV/jV0o8
 ZZP4iwrnMYi6psvjuJc3t+jV4TX+Dh+RLepFQaz7L8bKftG8irq0z53Cj8YIgQAqiJdV
 8Eyg==
X-Gm-Message-State: AJIora8FjSO46ndz+RwlsfleW5U6hA47jyx4vV/rDGWwdSkCStVIxbKu
 ktCE4LZlPcqJSSiGfar6XY5ZQuS9t3psYsMpfNoT6LAf15b9daKOQ1epxRsNjlasQ82JJ+21MeD
 mnpq3G4lEdwhI8ak=
X-Received: by 2002:a05:600c:3ac6:b0:3a1:95b6:3fc3 with SMTP id
 d6-20020a05600c3ac600b003a195b63fc3mr2292369wms.57.1657610227479; 
 Tue, 12 Jul 2022 00:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4nKmQtswIAf3XwHluZ5sOGoQ+UinMhGps5tHYpAOUf8akiwkh+LSkGIyyTlxwYwe5dxr+CQ==
X-Received: by 2002:a05:600c:3ac6:b0:3a1:95b6:3fc3 with SMTP id
 d6-20020a05600c3ac600b003a195b63fc3mr2292341wms.57.1657610227245; 
 Tue, 12 Jul 2022 00:17:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d900:a75d:cddc:d29f:bdb3?
 (p200300cbc703d900a75dcddcd29fbdb3.dip0.t-ipconnect.de.
 [2003:cb:c703:d900:a75d:cddc:d29f:bdb3])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a1ccc0f000000b0039c54bb28f2sm9048721wmb.36.2022.07.12.00.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:17:06 -0700 (PDT)
Message-ID: <4e8f1c87-5198-98b1-b3ae-05345c75da38@redhat.com>
Date: Tue, 12 Jul 2022 09:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/s390x: fix NaN propagation rules
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220712015717.3602602-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.07.22 03:57, Ilya Leoshkevich wrote:
> s390x has the same NaN propagation rules as ARM, and not as x86.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  fpu/softfloat-specialize.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 943e3301d2..a43ff5e02e 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -390,7 +390,8 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
>  static int pickNaN(FloatClass a_cls, FloatClass b_cls,
>                     bool aIsLargerSignificand, float_status *status)
>  {
> -#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA)
> +#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
> +    defined(TARGET_S390X)
>      /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
>       * the first of:
>       *  1. A if it is signaling

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


