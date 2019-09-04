Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174BA86FC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 19:28:59 +0200 (CEST)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5Z5V-0007Ks-O3
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 13:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5Yvn-0006AW-An
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5Yvm-0001am-89
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:18:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5Yvl-0001aT-Vq
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:18:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id r12so1494900pfh.1
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HZKykcNZxXcY3cKLw/MppXmJdweuYpGmfcth7o7jcFE=;
 b=Re0RZQrR6zoxR1qI+8kAh8RKYAxLFdvXZJ7a5YQuQmp2eWuJosY27Hw7zUjK2h7asy
 Fu4P9/lpwpgD9FQsfDIiQvrmx1drl++/WUOdLGyzug3k4Kms3sk1uzaluAHqlelp3pXs
 RXv7CuSv2bonUOrDiRNvyunFtcMy5imRLGtXi+5sJko1jRFhI8gtLlHvkLl+ZC29DnGs
 u1cSzEzphXEQwFHb5kTvCwgr6ObiogU+y+kLQPdmJzHfdNIVBsHPKVUa6ckt9NhaljHD
 TYdl8SIVFYeUVH9hrAcElA2hq2B0u42pQqAv+/fv95WM43YfGkgsB6pKXjDu20Dia3Ip
 2H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZKykcNZxXcY3cKLw/MppXmJdweuYpGmfcth7o7jcFE=;
 b=Tfqiddbm8hIo2a4a/R2NeL79gc3vmjlhf8bQwO3TA4q+X1gikLG4X2J/2i3JCXZcKs
 XGHyykBjtUSJvxIa2jf37wjzj6pwJZW6i4jQ9D+LaDtusU39Nai7jafJQ5AIgXdgFRMr
 RouvcWDnfNXCLVTj1dCKd9ks2FaIdDgMclmNqj681MS3JTzkGVYzlKhH5B7Y5iDJ8MeB
 6TOO4DrxXNvshPSe9g65MBcV7bqDG6z3JKKU1aZjL71Lg/U6RSVcDFzkD4OVH6oS5tfO
 FV7r5n2++W//L9FV8WNrmintJ/ev5weIe1atGA5Vc+QLdd7L9Sv5fG/hEJw1Hrz7cSGw
 r2Yw==
X-Gm-Message-State: APjAAAUYtw434Mp7i4TqqBd5oA1gx+Ydwe8kfOiwmI/SF6Otaf8Uu2/V
 M/DCj9XxAM1qcKfP5vwAOp5gqA==
X-Google-Smtp-Source: APXvYqxIeKOZbkxswBYBSyjqd+mecnqQEsV+L7Odq50C6WUm9Nxyg7EboiMzBCN/Z2RwcYCiLcyCBQ==
X-Received: by 2002:a63:5550:: with SMTP id f16mr37481886pgm.426.1567617532681; 
 Wed, 04 Sep 2019 10:18:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q21sm10276337pfh.18.2019.09.04.10.18.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 10:18:51 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190810013112.28732-1-richard.henderson@linaro.org>
 <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <727fa9aa-762a-432f-a183-7cade2266f70@linaro.org>
Date: Wed, 4 Sep 2019 10:18:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH] HACK: Centralize sve property checks
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/19 1:32 AM, Andrew Jones wrote:
> Should we already introduce a function that will collect all
> finalizers together now, rather than sprinkling around 
> arm_cpu_sve_finalize() calls? Something like
> 
> void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> {
>   arm_cpu_sve_finalize(cpu, errp);
> }
> 
> Of course we can introduce it when/if we add other finalizers
> later, but I guess the vfp-neon finalizer should be coming
> soon anyway.

That sounds reasonable.


r~

