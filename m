Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F389D57130F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:25:49 +0200 (CEST)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAHF-0003tA-2i
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBA7k-00063U-LH
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:16:04 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBA7X-0006H4-Qp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:15:56 -0400
Received: by mail-pf1-x42a.google.com with SMTP id o12so6748701pfp.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dcS6eDyshdyYxcZ1IS78oXCqaoR9mF+9Yi3QowTW6QE=;
 b=V4blpXu6hPCDr19mfSb+KwlSJRJSFGg4O+L4qXLhQq6xessveGfYW7Smx+eGtB9v8Z
 Xmik1u1pc8LXbElBgEoZfOJw846L0XmQ0eiIh957nmVTk5y58WUpKdBjYFtOFS28v4xP
 bda/ERhpDLdKa6fSQyDrXTG+OspNDmsDYWG4bZqcR3xzQZijjz4b/JtwcAhl3OxeyeV9
 oMm+N9dbudC98NDSWZnPU/DwMpxN4zPrJMCGBQe76r99S01maKT7C0iafIFVwicjcjer
 Wmh78+RjIhpfVBCalmk4IRWOT2iAq/k5SbADDkC4rlGdqCfvE2Y95IZyL+E3D9r8hAMZ
 WkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dcS6eDyshdyYxcZ1IS78oXCqaoR9mF+9Yi3QowTW6QE=;
 b=4ffaJdwlqxBgslnHApCVNcv7DkW7J3gtGnrUCuD9hJw8K68xy2tzNVoyBpvRTsmoNZ
 CFmdEKCE/tNyx/AYVyA8+AVpR7NnG3kAuHd+3mYZlHFMYeDM2h3t3/B2iiqFAJ7Xlr7p
 +G7hIzDdlaEogMxFmxe+FdXqWCS2i+rn+Osg7/0P7yC3rMgQN+mTtxLh7/C/zQPobKSY
 ssT9wU+3DTJ974udtlgbiHQNHFa2g1sQ6qgn5H1gi++B3VEaJYBMHyIyCV/Ca6TEeYCB
 8DLYr21w5UKXoTSye34F/ZBEbBNVhhlw54qsRa9zfBITbwhYseoV4hMmlE+1OYfn9DGa
 lHwg==
X-Gm-Message-State: AJIora/icBE6h3Oo1WZvGRAFwI0JY2TjJCgjd2qeBsRolML51z66pCqK
 qO0xWMKHFooYXi/vnEbfd+BeeA==
X-Google-Smtp-Source: AGRyM1uw37GuQT3DyExRvGftG4N/LayLydLKJj2W8CHL90f45vF8H2ojScYGPQWwcQu2sNRRYnypHw==
X-Received: by 2002:a63:f84b:0:b0:416:360f:230d with SMTP id
 v11-20020a63f84b000000b00416360f230dmr4259989pgj.376.1657610145794; 
 Tue, 12 Jul 2022 00:15:45 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b0016bf24611e7sm6012099plj.5.2022.07.12.00.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:15:45 -0700 (PDT)
Message-ID: <f6d1aa8c-1790-9c04-7341-fcd23304c2d1@linaro.org>
Date: Tue, 12 Jul 2022 12:45:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 thuth@redhat.com, jsnow@redhat.com
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705153708.186418-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 21:07, Vladimir Sementsov-Ogievskiy wrote:
> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
> FreeBSD. Let's support the latter too.
> 
> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
> 
> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
> Here is a fix. Would be great if someone can test it.
> 
> I tried to push it by
> 
>    git push --force  -o ci.variable="QEMU_CI=1"
> 
> to my block branch, I get a blocked pipeline
>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
> but it doesn't have neither freebsd nor macos jobs.. How to get them?
> 
>   tests/qemu-iotests/tests/copy-before-write | 5 +++++
>   1 file changed, 5 insertions(+)

I am going to apply this as a hot fix, trying to re-green the CI.


r~

