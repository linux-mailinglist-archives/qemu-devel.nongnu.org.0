Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C526513E6C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 00:16:12 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkCQk-0005YM-OI
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 18:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCPC-0004EL-2E; Thu, 28 Apr 2022 18:14:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCPA-0006PQ-C0; Thu, 28 Apr 2022 18:14:33 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k23so12202492ejd.3;
 Thu, 28 Apr 2022 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ISN5yAVgyAmfJCr2n21oMV65KYdAngwr/AyL1fsJvVw=;
 b=Y/8w7oRkJOssrrQs7nGOXHpciKNa88J3sMs+OzOvlMuXfRFSuAQDZRMwbPeba5JEu6
 BTPI3PFkGavJQ+QUtUaE1j2E6qFSeNq+qb09Q0iSxl87uyKnqseTc5VdRo09l108XQOB
 1pRHq8Vu2rEYRmV9H2w57gHbHKmw+Sx5SmKQ7TBJsUyEl8xgF5re2NW8SMsg5KmNXmKJ
 hATtM7vp7RTTU4TopQdxeWxEyXX7kdqsTi71i5zxncIbsRL+SbZTgjj5DYW9ApW0ZccX
 cmM4n7HffqfceZSwZqMtFaXaOvWSiogsrel8qSCBbmrCF60+vcFliy9DirDX+vNvQMgq
 1d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ISN5yAVgyAmfJCr2n21oMV65KYdAngwr/AyL1fsJvVw=;
 b=pvtsNBK18/qkgpr00Kma2ehPQyza2blQ8bgpIURo8ctvRdn+2zpy+9Oy3kzFN3/EXA
 eKXYq/B201Rzck3wY+AYXf0Y7ZmPF0hfT9QTT3hq7Kfmn8IJQiG6sMBJyBNAUsMEshUT
 kko0bran/ej67okKYjJfV0JPJGkRl5WeBGCsEc01OIGnYDxeddA4kx5o25kTInl15KuY
 ZmYyquWcMKzmYRaE6pVdDjGe6NjykL4CsT8Hz0V+m5ZlNsA3peeopkpv9EkEwuxV/Rex
 QQjI2Z4W4TB2FgnmT5pJ5fg39tmSRwDPTO2cHghC4bzO2D/cqQJwFhvRXkwfdlWWhVSk
 RmYA==
X-Gm-Message-State: AOAM5335Jigu0Qj+1KFoSKSkst5C4bvpkMxUh0sVikp56WF1wH/bZvaN
 dnCkK406auHJQCnyHNgM+Iw=
X-Google-Smtp-Source: ABdhPJwv7Cw9MNcS5YU3UDLCvULwmH4QxZl6bHWKpVXcib8kTOWN0Ix4D38AKpUu8kw1dJpggMftMg==
X-Received: by 2002:a17:907:97cd:b0:6f3:aeb8:6002 with SMTP id
 js13-20020a17090797cd00b006f3aeb86002mr15356383ejc.530.1651184070335; 
 Thu, 28 Apr 2022 15:14:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 og47-20020a1709071def00b006f3ef214e79sm68480ejc.223.2022.04.28.15.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 15:14:29 -0700 (PDT)
Message-ID: <299ad2eb-e0a1-d3e3-8214-c54e299de99c@redhat.com>
Date: Fri, 29 Apr 2022 00:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 2/8] coroutine-lock: release lock when restarting
 all coroutines
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-3-eesposit@redhat.com>
 <Ymp4vs+oMc7pipe7@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ymp4vs+oMc7pipe7@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 13:21, Stefan Hajnoczi wrote:
> It's unclear whether this patch fixes a bug or introduces a new API that
> will be used in later patches.
> 
> The commit message is a bit misleading: existing functions are not
> changed to release the lock when restarting all coroutines.
> 
> I think what this commit is actually doing is adding a new API that will
> be used in later patches?

I think this patch overlaps and can be replaced by these 
(https://lore.kernel.org/qemu-devel/20220427130830.150180-1-pbonzini@redhat.com/T/#t). 
  I wrote them after a discussion with Emanuele, and it looks like the 
same discussion begot this patch on his side.

Paolo

