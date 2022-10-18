Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA2602BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:33:53 +0200 (CEST)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okln5-0002k7-Tz
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklIi-0002ZJ-9R
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:02:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklIS-0004hr-RT
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:02:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so851954wms.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Gv4uBXi8eSgtTJQ4OjHCilJZ2V8kI9LtSUcizaQybc=;
 b=ci6Qm9lTdh8QKdGyp8OfH0UvrzqCeGbW4b5wHzuRCjsVnc7uNPXMVm37l4B1McZ215
 aTx0oCZGyi3Oi2vfsQZoeHUR77j1U9zBJByxpdA9QCpujPh3u0wwBgIk3aZWmbl++Ds7
 Zri4VCIwbRNz9Ux5jTMYtQxKkRezGyo4G3xJUIvnThomNy4KR8Vlr+f6rsaeaY4mLcmw
 Kf3KpI6pm2QIGrxG0PAK4QHnemmD1iGQSwEIhWZeKHFP2ILRXAuRo89RAQe41l75Gaxz
 0QH46uxYp/GTwlnpEks3euoakItoumcL3z3sF0O+QUzJlnXHWak2XySoG7a6E83VhDte
 uYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Gv4uBXi8eSgtTJQ4OjHCilJZ2V8kI9LtSUcizaQybc=;
 b=L39XYFzonPtuP36iWdWz9L2vag5OiRGH2/1I+aB2Q5bbVuI6BRTR0Qq93MNGOhFhQ+
 HMIJpplas+o1iRAykSEuzPJS8gP/4JEdZ4VRrBxjsHTvLZncI1+1FA8o1Nj0SHCaPA/y
 jf+AOHbggTvhhDNNjgpTxtnYjN/Fa6/kDGRAxcXBf5ae980A6/d4RMoA+xmLo9zbseMt
 wGTC2sJmOx0OkGhvQCMDv/7TU8uPpw0qBp5yaYMphFHeHTwEaIpKyd7H+LU9KFU3oxLW
 CFlenqBGKE65VboBAeoblRJnjRHmdqfiRfxJ+bPb5IXee/F/Wd7iIJVT6mIbtvaolQuP
 eJyA==
X-Gm-Message-State: ACrzQf0SVsDiAnxt0sXP9ifekCexE/cggSnE/8pY3SlfY4fAawCTp9YX
 b5qzxW5NnW3Thq4DTNq+e3al9w==
X-Google-Smtp-Source: AMsMyM5wOwsz/saAD8bLFcLrG7cPPCgFwOlVe5H21o+CQUYvd48Z7FF4Uyta+D2GvxmM6ouQttTlXw==
X-Received: by 2002:a1c:ac81:0:b0:3c6:e566:cc21 with SMTP id
 v123-20020a1cac81000000b003c6e566cc21mr1797583wme.0.1666094529365; 
 Tue, 18 Oct 2022 05:02:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm11053103wrs.53.2022.10.18.05.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:02:08 -0700 (PDT)
Message-ID: <b15e33e6-eec4-37e7-b768-66b14a70035e@linaro.org>
Date: Tue, 18 Oct 2022 14:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 22/28] qapi stats: Elide redundant has_FOO in generated
 C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-23-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-23-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/stats.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Mark Kanda <mark.kanda@oracle.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   monitor/qmp-cmds.c     | 5 +----
>   scripts/qapi/schema.py | 1 -
>   2 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

