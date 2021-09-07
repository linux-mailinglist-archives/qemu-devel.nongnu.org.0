Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB0402D77
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:08:39 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNeaL-0001E9-TM
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNeYx-0000GH-Ig
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNeYu-0003ao-Q3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631034427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTHYZ2q8ejfzd2y8eKxNryeA6QikvCpHk8foCAcYLDo=;
 b=Rc0oQUWNVvkepoikXgNTHBA5IIP/rN3WnjnKcAY5yFRNBb/BV1B1HUEEQZRqHuJKzCFJQ0
 iHF18R9R3L7zUroi0v6Uf7PeX2dVuoii2FjYCkGRbnYwiSd7Ld57vpEBZQATt9duJDS2be
 8JalN/VhnnGmgdmGO0StFN9OXTexP7k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-3ag6HMA2N-uOQCay8nb5kA-1; Tue, 07 Sep 2021 13:07:05 -0400
X-MC-Unique: 3ag6HMA2N-uOQCay8nb5kA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso5493574edq.20
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 10:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kTHYZ2q8ejfzd2y8eKxNryeA6QikvCpHk8foCAcYLDo=;
 b=EC0T1x4U6UFXm21a/dzUxmoEiQPyHb4+YDfL+zTRrMfdrcZbvQGImmbbic47a/k8xt
 GuJcXLCuJNMVnyV/ZO1KNb/pIBxsW7U/ixi2NnWeN9LXAB3xFZw5XAwnvwN1EKWLcdLf
 E9l4bk+Hb+L9X4KbV1+TJq8Qi5ScBg4lbngqwIqzxg3JGJqxCq7BV5peXOmHzhiMrJ8k
 L/RzeGcQvWUHDcsJrf/Q6a5ot1AlNN3eqx+O4budA461hD/cImwZQHldCuKMlQgbO8Ev
 DW+5MXTDR15xYoMUjzAhnu3d2rpwDD/gISR1U7rGf7D80dOomTauNQIO9H9jwHGnJgM7
 +9fg==
X-Gm-Message-State: AOAM532u/6sVqB/CSrY6lVVuOZoVyYBesAkHT5TAeUHRo4CZnZbCO7kQ
 9UjiFK5uYlulRPaPe947jy3wsC+OP9FMRVbJ2y/oHX02eN5jArxzBV7nUqJeDfFdn3IvnoxL2fL
 zcUG+OynfVp3Zjezet0O6d3tVxYCpirXTut0golqLMPK0huwfwjwQIYT6UNoHTVi4IZg=
X-Received: by 2002:a17:907:2151:: with SMTP id
 rk17mr19185346ejb.41.1631034423941; 
 Tue, 07 Sep 2021 10:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2dAceNqEQgqJHNpfgc7Qbfwkip6mf9zmTPAEWuqWorZVhFkXEXAnj744wHTlx7Lld1zuOSg==
X-Received: by 2002:a17:907:2151:: with SMTP id
 rk17mr19185316ejb.41.1631034423681; 
 Tue, 07 Sep 2021 10:07:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w3sm6865716edc.42.2021.09.07.10.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 10:07:02 -0700 (PDT)
Subject: Re: [PULL v3 00/36] (Mostly) x86 changes for 2021-09-06
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210907071349.116329-1-pbonzini@redhat.com>
 <CAFEAcA8f5s_vukFj=BZiGTtUp2kN00kXgVXOdce6aL3X=C459g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5c385199-bada-3c3a-5629-9d8847515a58@redhat.com>
Date: Tue, 7 Sep 2021 19:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8f5s_vukFj=BZiGTtUp2kN00kXgVXOdce6aL3X=C459g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 18:00, Peter Maydell wrote:
> New warnings during 'make check':
> 
> qemu-system-i386: warning: Unknown firmware file in legacy mode:
> etc/msr_feature_control
> qemu-system-x86_64: warning: Unknown firmware file in legacy mode:
> etc/msr_feature_control
> 
> (not sure which qtest produced these).

Hmm, the bug is preexisting but now it's exposed on machines that have SGX.

> ppc produced a new meson warning:

This isn't me, but rather the same system update that caused that .so 
issue.  I was planning to update QEMU to a newer version of meson, so 
that will go away soon.

> (PS: why does meson report "Program /usr/bin/python3 found: YES
> (/usr/bin/python3)" and
> "Program cp found: YES (/bin/cp)" so many times ??)

It seems to report it once per custom_target.  I'll take a look tomorrow.

Paolo


