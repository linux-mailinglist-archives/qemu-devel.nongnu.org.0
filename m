Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298AE681E4B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcsm-0001bm-IW; Mon, 30 Jan 2023 17:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMcsi-0001bZ-1u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:44:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMcsf-00089j-Cx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:44:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11178270wma.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cOBms8CGtkjEY28QNH2swJ7tnrc6zVx/8eSb9JwU2X4=;
 b=OMgeLmiWeZwztT3OHJZtf0o3Q7ZGb91dqbN8jjEWdzzMAQX036W3vFzbTC22SydHIs
 a1iKzbuWBbPl/MkFiy0hL1Kx5jZCHGJrwxZlz4cDA3FEvEevbbV56wNiUonBEQYBFgKV
 B3om3mdreyohacZ5Ro75DMmAZAeObj8AUvor7Tx0fAOkBaCFYhop/kzjzi8Zz0LP5/10
 NbjmGT6du8SrUloF+vs67f/lxPB2zEXTM/wcvtgbqIFA39uwvx+PEbINBnB0Cw5Qze5s
 cAiqhVQZxagNTzmyQsXZiy45MVzEZEjmEHcfieahszef2Oyx4d64t34ahl3AzHva1ZC1
 93wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cOBms8CGtkjEY28QNH2swJ7tnrc6zVx/8eSb9JwU2X4=;
 b=nzUmpm1O8a20SYIukHtBSpupc9enCpexvCWpRbHNDZ0z+7+x5KIubYPFwfTAvQ31Fe
 9z8QCCEwvXGO7Q8Gsy+68PKejt+qX43tpn6ELk2+uF+Q2/azkEDVtod2T5FfBCbssdm+
 OjncLJ5RbJJZaTtw1FBGeW5GJ5XxY96lG/rn7ZrRuJ+06zcDIprBNrEfglInIYsBrEFs
 xhHHrugMuRIyQIFnmSqL/noOBuP2k2Rk87Hp6UFpTolKSE6qmhLVRSshzYaOnp7O9KMA
 OOK6SBZr+Ex6Thv07ylzKdPhyMxbrx2XkNBIjPgnUY8z8UFCfwnRAuVX3huNjbfKfIAr
 Jmeg==
X-Gm-Message-State: AO0yUKU4LJDbO7Gb+UXKwWrgu2x1ENjx0m7w+i2WAzFPKzvdAs3qF8rH
 IVPULXVy6/EgMtemJVfKZdGfFg==
X-Google-Smtp-Source: AK7set9W0drP9ZMk0kquE/YWKSbCh0H0yiC9Ql6TbVoq+sHIBGsiPcfSfUx+s3kTfMAEfghw79/ITA==
X-Received: by 2002:a05:600c:4fc1:b0:3dc:4fd7:31f7 with SMTP id
 o1-20020a05600c4fc100b003dc4fd731f7mr8618108wmq.41.1675118641507; 
 Mon, 30 Jan 2023 14:44:01 -0800 (PST)
Received: from [192.168.0.115] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 bg6-20020a05600c3c8600b003db06493ee7sm19904283wmb.47.2023.01.30.14.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 14:44:00 -0800 (PST)
Message-ID: <1b67834e-b83e-10ba-bd1e-a6c52761b4f0@linaro.org>
Date: Mon, 30 Jan 2023 23:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] gitlab-ci.d/buildtest: Merge the --without-default-*
 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130104446.1286773-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 11:44, Thomas Huth wrote:
> Let's safe some CI minutes by merging these two jobs. We can now
> also drop "--disable-capstone" since the capstone submodule has
> been removed a while ago. We should rather tes --disable-fdt now

"test"

> to test a compilation without the "dtc" submodule (for this we
> have to drop i386-softmmu from the target list unfortunately).
> Additionally, the qtests with s390x and sh4 are not read for

"ready"

> "--without-default-devices" yet, so we can only test mips64 and
> avr here now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


