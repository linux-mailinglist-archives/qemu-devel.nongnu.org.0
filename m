Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4356A8B56
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqwS-0005lR-5P; Thu, 02 Mar 2023 16:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXqwP-0005l8-45
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:58:21 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXqwN-0000rh-4Q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:58:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id v16so576734wrn.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677794297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
 b=c01Qm5CA9+skyR4wswaewku8HTJNl4WNaS20D2CpfxO8Uapb8pd235XipMTAOE02zw
 Cf4NYqj702NtkNau1gYU37Byl3EPPUAKBRw1uNCD81j5DgdZNqraJA/oFGGWMbclPFiV
 DYrrtY6VGcs2l8S7aa9xhojKYEh1kjIfhFUH9W4QLFbjVFcVenWwr5lmk7WlpqpTMyjp
 iLduF8H0R2/o+Rt2x2YFylbTqEkz2DCf4I0tA28QEeW6HPm1RJhXtrnLdV4rh14FyL4M
 YGDf3Z6clOtE5jjImbqk4OJ77rw93+m0J8x5rH3g3miRBOziwW3AasfpHoscXGq3br7h
 HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677794297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
 b=XSdPj7bS8E9t1zK6bSlu0lWswjfmGulafhu68DBzlWQO0HzRGOJOykYAm4LKWjS0g8
 I3WE96Sfyf/IeXIE3gyZxHs8OhheWoCvyFwcLWKkhznIlLQJnSwYFBKbnHycd26lVr4z
 bvZrJzpf129AUwxvFDZ6FYxzGvPzaD1JBrp03o13gamXLLxed+rD4zhR8oJDr6xb0vGi
 2loRkVv3Cg0wgGmM2jhgWREMtVHQLIRxC4JwsZxb44D/PsqSdWYI47/NdIJe4eiDJWte
 TCnROyWDCmAHVT/OilLqcIqRoOfZHTYILTrff9XURS7WSQnCaTnFXKQSgSs3lttCKUsV
 6JJw==
X-Gm-Message-State: AO0yUKX+Ix+gIx//6RBbA2cKAZsJ22/BZBUbRklba4u3OxoiZe50Gp4b
 mRBm5zGQfU7D1vQ2HemajiksOA==
X-Google-Smtp-Source: AK7set9XlppTHh6P/NYuUA8627xDZx2JgibTevKCtg80T+5uYqzA7ofikej3nH5tro9swhHZf/7amg==
X-Received: by 2002:a5d:6e01:0:b0:2c7:1c36:3c6e with SMTP id
 h1-20020a5d6e01000000b002c71c363c6emr8454808wrz.64.1677794297289; 
 Thu, 02 Mar 2023 13:58:17 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm379710wmp.3.2023.03.02.13.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:58:16 -0800 (PST)
Message-ID: <7d696728-be96-c720-2db9-b93a5a352d1f@linaro.org>
Date: Thu, 2 Mar 2023 22:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-7-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 17:31, Thomas Huth wrote:
> Hardly anybody still uses 32-bit arm environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 14 --------------
>   1 file changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


