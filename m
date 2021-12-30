Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435E5482076
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 23:02:22 +0100 (CET)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n33V6-0004SH-OA
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 17:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33TP-00031U-93
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:00:35 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43550
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33TN-00010M-Mr
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:00:34 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so24199528pjw.2
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 14:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nVSawZZQ2MtyNxPEtx7CWjfe1S+UL3POH/D4eY1bQSY=;
 b=REx3uRNbhIWfdCjBry6r/knMqfR0yZEB8Ebet/kSVSmSuBfh20GT+Xy9Vo7zeBAzjH
 ouBe1Xq0+i2i2o/cKG9NaK8xS+8gKz7IY6EogQF/90c8cnecD0iOGCJ+dpdkZbmX6lNX
 FG3NN7nprvGlPAXYcLPvXyg8yo2huRmDii0rVd0MQAidnL2vGj6qb4x/3mVwOn2mzALH
 BeAyjWnIm2RurxI4PXSzB7wJTKmR6uwBzQ/WOpc7f4mforjDKns+Oc/scNlr7sVbc+MA
 e7aE2bMaNIosdypIcTKQ4U4mtKyLMRcmKSpYaZg7SnChtmdHmCpFKurEbmumcb1FCjif
 qPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nVSawZZQ2MtyNxPEtx7CWjfe1S+UL3POH/D4eY1bQSY=;
 b=77NVu+6WI/lBUZ7MUelzmDo11O4YfDfT502zFODkaKDxCw7MGAuEd8voBxOAQgiEzO
 WFOgu2/Sy9wJEsQ3F/pzrLWYHdkqdSUOx2ylk0hpfmdpgKmUiJCD8kD9ZccvDDnnJmYD
 nA5iq42bq6MIPzUEPTLMhqpeYT5MR7hB2aYkJcYwxmm1cFQAiDkM15j48lVDkL5htsIq
 jEBFTwJEr2qRgg01CgVqgMPooNde9me1RZgVU2JFojfFouSpsW5Jj6oCwxqrGoxj51IT
 /StCNK7vaofKd+/bXiWn3xwMuEt82XEpfHRdI3HpcXthY3IiIxR3tvt1NBdq7qe2azsH
 j8lA==
X-Gm-Message-State: AOAM53167To8LB0TdQSFO/naJ3ToCR2dU51zdh4DbOwUA9r+vVAdq79a
 Z/JZmyBQ4IoOvn1WFpVvrxr4Og==
X-Google-Smtp-Source: ABdhPJz+V3kqOZzSRMjXwI/zfSZU3hUMR359901OL0qtL5emw+W6BtiU9OuT45JvmjyerfdnWK9ysA==
X-Received: by 2002:a17:902:da8c:b0:149:4934:2f8c with SMTP id
 j12-20020a170902da8c00b0014949342f8cmr33049615plx.95.1640901632142; 
 Thu, 30 Dec 2021 14:00:32 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:23dc:65c4:ecfd:93ff?
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id c9sm28022540pfb.126.2021.12.30.14.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 14:00:31 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Change philmd's email address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211230145822.441358-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a626e131-fc12-c787-e21f-84fbe6be0898@linaro.org>
Date: Thu, 30 Dec 2021 14:00:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230145822.441358-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 6:58 AM, Philippe Mathieu-Daudé wrote:
> +Philippe Mathieu-Daudé<philmd@redhat.com>  <f4bug@amsat.org>

Actually, it looks like the mailmap is backward.


r~

