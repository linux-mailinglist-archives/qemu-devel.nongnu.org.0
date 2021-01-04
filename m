Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130682E9776
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:41:56 +0100 (CET)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwR3T-0005J1-68
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwR2G-0004X7-N0
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwR2E-0003f9-CO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609771236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DxMeXU+4BVgjX4T/7Hg82ySVjrwMZpgdBB+pUaB40s=;
 b=Y8Q8EUxq9Jwtu9ClZgJKzV1u+Hm5cyx57RbDAYQJxNO6ZF3DbtMQiS7aEX1g1tqqCk0DBp
 H2duLYABhxQ7qck+lpGnRpvjzfKaP7QPgFi++aUc2U8ZaTMGd50rzoZs/RZ8isPVXe/RTK
 taDKBmcf1dQ/6yZJHnGJcvCtHXixFCA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-rHipKEGMPSeHU57krK3Dhw-1; Mon, 04 Jan 2021 09:40:35 -0500
X-MC-Unique: rHipKEGMPSeHU57krK3Dhw-1
Received: by mail-wr1-f70.google.com with SMTP id r8so13298295wro.22
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 06:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9DxMeXU+4BVgjX4T/7Hg82ySVjrwMZpgdBB+pUaB40s=;
 b=JZU3ZIGqvFa9EPoaMRIC4Uz06VySN1lZNgRGpXl7BwRc8Z/nV+nulxHnTuWI8vR1Xt
 8ZHyh7gaVRLxDD1ERv0GtK6lKapN4ZsrksLimwGuFo+8a3q18+Mmyb0ZkTS1iz1GJda8
 RebFXRspLsIhKIQzGUEGGnpnKz7mh69cyBqza4abiiGK01RD5ybKBnGNj5fxtY++uVh6
 xTuQnUPQD5iE2Xkrqjw9gIrOVtbJ6Mw9wSpMjjWHp9ambM3dM1LqwsvVJX5k+FwjX2kS
 Xc2Djf8KNesOhNDLfGmBdaQKh14zBlUMXz5AbCXmiC/f4dOFWqMcuaMscYARqnoUSdlo
 I9pg==
X-Gm-Message-State: AOAM530l3/qh9QbtbCOcUYkIdMQCGJ8tQA0ixRQbaaTRF0k2bURLjdH+
 I5LEw59pGomo6rWAOCgCuIqyQxx1ElWAWW3LV+MRMrl4GBFZ6SALUydPhWA2aGvtnwhZYrqYENm
 UzRzeJQP8nPUdIqw=
X-Received: by 2002:adf:c14d:: with SMTP id w13mr78870679wre.383.1609771234175; 
 Mon, 04 Jan 2021 06:40:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBNzWdYoOR1uUS3TnFRDRXnNaN3RRZXTkv1V9TaFrStZjrLU9Gxfj8jIcz/hbHoM7oypUlzg==
X-Received: by 2002:adf:c14d:: with SMTP id w13mr78870652wre.383.1609771233924; 
 Mon, 04 Jan 2021 06:40:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m2sm33864818wml.34.2021.01.04.06.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 06:40:33 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
 <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7493bddf-d915-8faa-5612-f14a3067a574@redhat.com>
Date: Mon, 4 Jan 2021 15:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/21 14:21, Peter Maydell wrote:
>> The rest of QEMU should only ever be using QEMU's TLS abstractions
>> and not directly be tied to GNUTLS. So ideally the gnutls flags
>> should only ever be added in the crypto/meson.build, and anything
>> which depends on that should then get the flags indirectly.
> Unfortunately include/crypto/tlscreds.h leaks this implementation
> detail

That is not a problem.  As Daniel said, anything depending on crypto can 
still get the gnutls flags _indirectly_.

In my proposed solution to the bug you'd get that via

     io_ss.add(crypto, qom)
     libio = static_library(..., dependencies: io_ss.dependencies())

for example.

Paolo


