Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2394EC7BA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:04:53 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZsS-0005fH-0Y
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:04:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZZrO-0004vl-En; Wed, 30 Mar 2022 11:03:46 -0400
Received: from [2a00:1450:4864:20::62d] (port=46939
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZZrM-0004yL-Qs; Wed, 30 Mar 2022 11:03:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id c10so23706696ejs.13;
 Wed, 30 Mar 2022 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=35KXp0SLlynsaLeljregrZKFz/RxNBR2Dfi7fdshI1k=;
 b=Gdh23vP18H/eKgI2JJxi+2tCgnZ/tWfWb9eWcZSkg48Q/90N2cfjwh7US6Eqds32kw
 7vtFbYYarLgFh3zMI5LBGlnoT08Bv6IwNZvsuBHv6bz/+SmJqOac9Zwk8mwP1InwW87c
 4iOZpzVlQ4o+1Qb7HzCb9LdjjRIQuqUr6Ujy8Lrxbg0+ZhLmJxx3pEgkNRK4rEBoDTc5
 SXifHIgXV1lGi+OKCKkn646jnUwTjQp5hhoJnWdgSoOwv5KAQBkf0A5hkbwvNSQ/thhR
 Hjv+oUIVFudFNozxIUwEK83e/lmh0zG+6SISzzzsJmLrX1j/8MFhbyqFvn9ZOou2jSOX
 9vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=35KXp0SLlynsaLeljregrZKFz/RxNBR2Dfi7fdshI1k=;
 b=2UG1wcuLgFqoiWvMtD436rw3fQjCQEPhyiO8KDEo9x0CHsNlivRARaMaKWvZJFrFrt
 hj/97er6X0OUdh/zMlywhEZBmO8Ace+IQsMTJqcPQ1zkNNFc3aXQiJSPmtSkrmUHDPpo
 Do4FSFl+JI8nE+45MSvdbCsOPB2n36EH+hq+BMaOO1GYGeY1eecx7c79p0Qqu34PZKjn
 tDGCwjFIq1NBpLkMf2VPtd3NNQw03jCs7k9XnnCKyqMSXqOOuv0Mu99HEvBYjVhM5SWW
 l9L55vuK+BJGTXNNzeK3t9eOplWZzQGnsrNFdb2XA4JI4MqLf0fnoe5bszkmjjWxpRA5
 Kx+w==
X-Gm-Message-State: AOAM5333UxyvlX8w+3yg5eIcbt8njpV/gDXL7ky9MQm042pGNrLEdssP
 yGjQvgduFlE4sPsXUOMkaiM=
X-Google-Smtp-Source: ABdhPJzXN+hE9eBKLMDwOSDV69DJ1wr2nkGoSsdz7wJjsfxGf5oQ8qswg1UdlkKk8OddAiZeIyu1+Q==
X-Received: by 2002:a17:906:9f25:b0:6e1:205a:c47 with SMTP id
 fy37-20020a1709069f2500b006e1205a0c47mr15217587ejc.281.1648652617331; 
 Wed, 30 Mar 2022 08:03:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 u26-20020a05640207da00b00419a14928e5sm7881273edy.28.2022.03.30.08.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 08:03:36 -0700 (PDT)
Message-ID: <b82541f6-46f2-07d3-0e8b-dcd47ad90bb5@redhat.com>
Date: Wed, 30 Mar 2022 17:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] meson.build: Fix dependency of page-vary-common.c
 to config-poison.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220330114808.942933-1-thuth@redhat.com>
 <e4de3f54-e812-9393-0b13-504fb78063e2@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e4de3f54-e812-9393-0b13-504fb78063e2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 14:05, Philippe Mathieu-Daudé wrote:
> Shouldn't add genh to all common_ss[]?
> 
> Maybe the problem is how common_all[] is created?

Generated headers have to be added to all sourcesets, or to all targets.

common_ss is only used to build the object files in libcommon.fa.p, but 
libcommon.fa also includes many other .fa build targets (via 
"dependencies:").  All those build targets also need to have genh in 
their build target as well, otherwise their object files might be built 
before the generated headers.

(The other question then is why we have libauthz, libcrypto, 
libmigration, etc. instead of just using the sourcesets.  The answer for 
that is that in Meson the static_library is the tool for object file 
reuse.  If you include the same source file in many different executable 
it is recompiled.  Therefore, if you used sourcesets, you would build 
the object files once for each testsuite program that uses them).

Paolo

