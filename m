Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F48456C56
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:29:01 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0CZ-0004M2-Qf
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo03Q-0001Sk-Ol
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:19:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo03J-0004Ge-IK
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E266SDXzLHIxl43LIS73TeDZ/d3Fcnvgvqms81b0A3s=;
 b=XrzAD+Abnx5h+/Quz6gL8jsKX8/gXceyqEW6mvC5sKGMjuawRVduTvl1ylyf54eHzhxMwo
 d8xcmw+7aaNAjNY6OZLpXCRShzqWrInK5J6Iq+uLcIwD6OVU9+F4Ebe/e+2Mc5dw3yFBKw
 vyIpBPoqCLhZfCjp068EzDBX3BzEt8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-K5B8TZ5cPzORrThCACdzyw-1; Fri, 19 Nov 2021 04:19:23 -0500
X-MC-Unique: K5B8TZ5cPzORrThCACdzyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso5608814wms.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E266SDXzLHIxl43LIS73TeDZ/d3Fcnvgvqms81b0A3s=;
 b=bNoFE60l2tvIoxxpMmRCNpJmXmnqxj0oRx8oNQh66GwufZTFt401Po0uZX+bEsXRbR
 LNagCcP+lDGacxW2I3Gnpkw3lBwCI6JL/325/KXssEmt+f4QLPSoBwHyCeRWks6JsCO2
 srfxvWc0LPp1pcPeD8Lyk8kEWPy0/JdslOf7ILDJCdy95aCOhxvF918kjdmFU0N+SLZJ
 T3XEI1XZMKFiBMbVs89Cg0NAH5DO4I7YfAf07hiQqnrokoUIdANJu+Eka3WNYZyk424h
 6C2aDk4/Cz+YdhzM5bpjcJOzm92pIALKyf6scgw2Ok9F1qsgqyythwV3Z5zVdvCnE/Rv
 4JrQ==
X-Gm-Message-State: AOAM5325fqnQGFQ1JOztr7Zswd2rt0HlAyT/EUQmQald5qdgEeSRvMSq
 VVOKtZz0anUn8le8hWYO/KDQScBSnEgVXMLidsumakqjkixuTJ1d5ad+j1IzDFyYFGnI7jKA7Rp
 Jm8/hRpcav31iGBQ=
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr4967483wmq.190.1637313562524; 
 Fri, 19 Nov 2021 01:19:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvskJ5YMGzatLiohpJn7UHdjsMomT+A1M1dedr5UQ9uBQx3VoVwV6+wnHcC9M9t8vTf7kiTQ==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr4967462wmq.190.1637313562395; 
 Fri, 19 Nov 2021 01:19:22 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g13sm2177762wmk.37.2021.11.19.01.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:19:21 -0800 (PST)
Message-ID: <56364602-300e-1ff7-da3d-83fdc30ee4cc@redhat.com>
Date: Fri, 19 Nov 2021 10:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2?] docs: Spell QEMU all caps
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211118143401.4101497-1-philmd@redhat.com>
 <3bb56b6f-6547-ec56-accd-93ae7f4f592d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <3bb56b6f-6547-ec56-accd-93ae7f4f592d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 10:17, Paolo Bonzini wrote:
> On 11/18/21 15:34, Philippe Mathieu-Daudé wrote:
>> Replace Qemu -> QEMU.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   docs/devel/modules.rst                |  2 +-
>>   docs/devel/multi-thread-tcg.rst       |  2 +-
>>   docs/devel/style.rst                  |  2 +-
>>   docs/devel/ui.rst                     |  4 ++--
>>   docs/interop/nbd.txt                  |  6 +++---
>>   docs/interop/qcow2.txt                |  8 ++++----
>>   docs/multiseat.txt                    |  2 +-
>>   docs/system/device-url-syntax.rst.inc |  2 +-
>>   docs/system/i386/sgx.rst              | 26 +++++++++++++-------------
>>   docs/u2f.txt                          |  2 +-
>>   10 files changed, 28 insertions(+), 28 deletions(-)

>>  
> 
> Queued, thanks.

Hmm I just sent v2 with improved commit description:
https://lore.kernel.org/kvm/20211119091701.277973-2-philmd@redhat.com/


