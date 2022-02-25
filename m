Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47E4C4FA8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:28:22 +0100 (CET)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhCO-00068S-Ux
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhAD-00050G-PA
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:26:05 -0500
Received: from [2607:f8b0:4864:20::102c] (port=41708
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhAB-0002qe-PC
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:26:05 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so5877949pjb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k98AsEPV/ivVoIvbylNpjeLEa0XyMim+clW4kmDPBqI=;
 b=d+nYpLE84VtNyn3TzhJ56hS8ZJjJjiZqTAtkiU5RFxrjKLnP4PKqRoJbG8+s4IBzr3
 4iYSk9tsUe5dtVjY3ottfWZcXrIGkjJtCAdCm1w9cgVN6jDQJlBEkiGLFf3aocI+/x7O
 SMGNNnePFdngmEhvyCH2pgtVvIMMusyMJFesB9jHne7aLR5nX3VOXsS2+QaoFGwDfnpG
 cyP7dC+oh58wyekS4ddzMsS16scQkdygnHxA9XHX/VUWsAQddbRcdjLV1/blffJUK40f
 juP9MxdXP/ydEs9s3wMW6FXwjFf+jeuB6i//opRRfmMIe19FBx9v/v6qqkq45vXa0Gjl
 0nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k98AsEPV/ivVoIvbylNpjeLEa0XyMim+clW4kmDPBqI=;
 b=5VPTqbfrWeYYlEk6YUyosxp0yh59bms7QCi5/7zhTzVcgvxbdkyRLbUkm7JhuaFV3A
 QdjANqbcBVKSFtGXow30u+fl4UoGUTAO8ZVoMazl4M2rPS2VT7RyiN4vml6xxFLfLD45
 m59qIAWAB5/Edne5OGFbCENFvb9EjsrQT4Gdx49EGmcl8WWu7ZhTBRef1FFORRKIKBZ4
 YJ7ojvM6HojPVLeMCThJ1xSennCe6VW1DBJZAJ8OgooEZTSY0pJXRYmrM7EGFP5+AXYo
 mwF8ZbaOoOszVdvqQJ7arHD1lKS5r+9aUEzYjgHFtUlFqwZwvQ9cpyWlXaxZeu99EF4H
 /4xQ==
X-Gm-Message-State: AOAM530VfpJR565vivEgO2VLKSkkQx+0VxeeW7EmQpPjgj4bh8G37MrY
 YiDtABM7SErxT3vqhZoaEwsciQ==
X-Google-Smtp-Source: ABdhPJyTda4iGtdnimeKspMsF8tOEajfqPdMBgRkKI4JARI6h8c7fzrJx9hx0LVJng1SCshg+cZVfQ==
X-Received: by 2002:a17:902:aa8a:b0:14f:460d:bf2e with SMTP id
 d10-20020a170902aa8a00b0014f460dbf2emr9129105plr.144.1645820762290; 
 Fri, 25 Feb 2022 12:26:02 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm4431536pfg.183.2022.02.25.12.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:26:01 -0800 (PST)
Message-ID: <69321870-5536-f5cb-b2e3-27ae82e376ed@linaro.org>
Date: Fri, 25 Feb 2022 10:25:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/18] gitlab: add a new aarch32 custom runner
 definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 07:20, Alex Bennée wrote:
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
> @@ -0,0 +1,23 @@
> +# All ubuntu-20.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +
> +ubuntu-20.04-aarch32-all:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch32
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> +   allow_failure: true

Why only manually run?

We do this for some, but not all, of the aarch64 jobs, to cut down on the runner load. 
However this is the only job defined for aarch32.


r~

