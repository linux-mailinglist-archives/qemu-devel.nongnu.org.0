Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D958633FD3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:06:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUqT-0000OO-2u; Tue, 22 Nov 2022 10:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUqN-0000MW-DB
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:05:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUqJ-0004Qc-N1
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:05:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so1150466wmi.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=520OhGqupNZR20qXPew608iecNLLax9WTeOJwvrzNq8=;
 b=ADhsMwZ1Vl9F8K0T3Te4SY85k6hqTwIDJgt4GfQV9sTGNx9bZawSFxer+77Vy/Pmft
 tfNa/jYEpIZcpfT9xOH7/qoFn3pk43oPACsID95lLXj1QvyNw27ISytXefg8o0VlJ4lW
 FRG3rxRBMLP3z1U92N8X7duGX3YSIK824llKXagdX2oMS9vBOrisO8SUyaYGt2ejXw+X
 veLJEcro30jwVDAJeWq5L7tvbh896UOhVrfwnYNcpmNWDCA9yHRCRhUB890Q+f3Q7fGu
 jnHvK2TLlES2Af5nDxL5kAj1zUMedXbgUoWAQ0UTkC8Iwz+MhiGfOiTSFQx0242vzemR
 PWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=520OhGqupNZR20qXPew608iecNLLax9WTeOJwvrzNq8=;
 b=nG/LN8q88YpYrnBKvC/ALpZhElw5weiV578r6xr+7MM9iGFKd+f3z4yMmYyYs+wKIS
 xihlexE8Ox/Xd6qj76dl8IuHau1CQXQWGZItukCm35L3tfdPp0CVLUBkztovc0wXj1vX
 /wF1fuutHjaTDwszFQtZ4PnCVrO2h1xTtXVS3NY/zyqdpjT1zr6mnBSPfSNPTmU0PiOx
 S4SY8SP/YeQzb+wUpBmC3A+/V5gqqQwkI5mTJVp4zc0Y34UMUNGdEyunbyBRwpxgQtgO
 FL2JPosmqtp7Z9SqR+IHonTMFN56BsFFmIUPefq2Q9T2/H1HADjJ5rat9AQtm898QeJG
 nSKA==
X-Gm-Message-State: ANoB5plafqfw2PwETS2bmqvcOQ8DAEowwQQeQoXtq7qM4HdE/chkpRvs
 tZIL83OOpXltCn479uKp1MAy4A==
X-Google-Smtp-Source: AA0mqf7CF0YfblnJ3lMa0settnjqKlw9dGmz+EZsK0oec+B13to0x24Y3gAqknYscRPZBz2qMa+tsQ==
X-Received: by 2002:a05:600c:19cc:b0:3cf:7bdd:e014 with SMTP id
 u12-20020a05600c19cc00b003cf7bdde014mr10494102wmq.1.1669129546070; 
 Tue, 22 Nov 2022 07:05:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b0024165454262sm14219634wrx.11.2022.11.22.07.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:05:45 -0800 (PST)
Message-ID: <98e366c2-704a-cd21-0ae6-4ded79f21641@linaro.org>
Date: Tue, 22 Nov 2022 16:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] block/vmdk: Simplify vmdk_co_create() to return
 directly
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn,
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, berrange@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com,
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, virtio-fs@redhat.com, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221122134917.1217307-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/11/22 14:49, Markus Armbruster wrote:
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vmdk.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


