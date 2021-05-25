Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73938F916
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:58:17 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llOCu-0000EV-BT
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llO9Z-0002ai-Io
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:54:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llO9X-00055b-Sq
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:54:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j14so28811015wrq.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 20:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+0n2M5JslzNIlXzE65EEVPxjxwjxwtrc2Xs95K2fDOI=;
 b=viBFcobPnCfrcbbLTeYPZAWBqAXdsRBUSfFhSRkSnKL67nudC9QJDE13Q/fMuUIA5K
 toxq7LrZ4Qeombb98M3Mhde15u4HyLAIQcUX0B62ef4sdEOGu0hPdyChbBcqTZRiY0Dm
 esiGDTm/8+8H4CcEEhMqmroCo5LOoWTiSFJOtRodUXv8iLPN/oz0VJzvV3n1SZRAiByw
 93GsZ13qxIMXGk336ugMCT5mDE0lUT6jUlAmTau9Yt3VcvxVanSEDegxvUTA5pe6coUj
 2orf3CKVaDYkvg4IIXTaju5RnTibkFHYJlhmNCvijBFCCUt71w6Zw7eveNLXPGOa4Hkr
 ++SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0n2M5JslzNIlXzE65EEVPxjxwjxwtrc2Xs95K2fDOI=;
 b=YfWWF5CXKs7QWE7D8I/GHu/hckTL0lTJjb+3XaTUH8kxfSU0KsbAI/0bKYcehILdbf
 SLKK4iFJ1Pf0vsqmgcCsD8bzKci6n+yvNrfWfSI1nUw84+8HemXqrYsdHpwygQfuif07
 8ajX5ibzKhQzrPeRO0FsSL+hMlOZW8ObLLfkcMWgg9iZxcTArPgxcAzUfzAiL3wMkawu
 JamYPe5EGncL++URsA+VNm8dvFjPxmpXtWrSQNuhsb3NX36MHRKB1iyY/0nzAcXxnGj+
 4LVFSY+UmlU4lbsH3av4a17UTLu4JZOJ5Dlb857gqvChQB90Kzwerver+tP+98R3eVbs
 CIxQ==
X-Gm-Message-State: AOAM533Pyz6cWKJtRaL/YHn4pQD5cA0P47YF7HVckOyZwOxG686tVrcQ
 +pT7JoOdviq3d0AKVqSUQnLAFN6GYF+40g==
X-Google-Smtp-Source: ABdhPJydNJcINeJgXZQOgmOepN3fUxtvTDJlhqil2TSYzcYlgpp8CR3Z9pubRpltGwRofjhir1YVHw==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr23993709wrq.44.1621914886439; 
 Mon, 24 May 2021 20:54:46 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c15sm14117077wro.21.2021.05.24.20.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:54:45 -0700 (PDT)
Subject: Re: [PATCH v1 3/8] gitlab: add special rule for the hexagon container
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <952f9144-beb6-3999-b54d-bc41970b6aa5@amsat.org>
Date: Tue, 25 May 2021 05:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 7:42 PM, Alex Bennée wrote:
> The hexagon container is always manually built but of course not
> everyone will be building it themselves and pushing to their
> registries. We still need to create a "local" registry copy for the
> actual gitlab tests to run. We don't build it in this case, just pull
> it across from the upstream registry. We disable this rule from
> running on the qemu-project itself so it doesn't accidentally wipe out
> our master copy.
> 
> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> 
> ---
> v2
>   - fix silly typo
> ---
>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>  .gitlab-ci.yml              |  2 ++
>  2 files changed, 29 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

