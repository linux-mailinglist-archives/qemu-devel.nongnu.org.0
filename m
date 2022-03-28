Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AEE4E9D97
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:32:42 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtEP-0001M1-K9
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:32:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtCc-0008L8-Je
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:30:51 -0400
Received: from [2a00:1450:4864:20::630] (port=45589
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtCa-0004FL-He
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:30:50 -0400
Received: by mail-ej1-x630.google.com with SMTP id qa43so30131096ejc.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PxGhX7VGClD9w4ndTfk8fIbmqT8zD/885rOLKVbdsjc=;
 b=XUZLRfdeHeH7zZa060FMfvf79qzoK1+Il9I0PhT2sY6LwY33Ony1agmrnexYdPjwFd
 AdWBoFIUT0AaQZgQI8Q0LaBP5YzdnRDGKmkJnaS3NQEmqJ1FFhd9wI82Dn8WVgSrlJJj
 6uswRRmwrhXH4deZLpaiyl1RMLxDy4l8ei3+BW2/VtVUcwiu04ekb1lCLFtUBCaFZSPc
 TlMFyswQYcu0YL1UgLKNQS7r8DTosDSFIGI0N+UzQKpV7CDZxvG7+tFc2zKcTe1k0QUQ
 JO3frCjhrpV+m0zh9Cmg/WDmQu+YO90eAQxnOAKTTlVNGNnM/gkO2dhQ2QCvenkKvV1f
 hN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PxGhX7VGClD9w4ndTfk8fIbmqT8zD/885rOLKVbdsjc=;
 b=H7cudkFv2UID1xjbV9KxND5tLRNZ4pWluzL8USWPAPqoon8zeJ25igN+8Iak88tjtd
 wjDZ5Y+x2FceTsyrDP50fkFLLpD78TEvc7w2S+qZjX6Y+iAu1o21P+MOxZzTAcD6s9gv
 sGIAjx4gm18pBOKZ8q+Xb1W5C0pdGZW1W2ftBJC7cFIDrRXYz+s44CVRDnwzTYOtefAn
 dbETNNyvil/2VbcaxZXPMdo2/HLl7Z8N2jNECSv5dB2R7xyXsMbMwD9DBG/WWViNrom2
 YsxtDvlJVDOe/+8i4vvedpANVTeSvSaCK7RSz50m8QVMItFwZyLiWGalbPs3iejS2x4w
 FUoQ==
X-Gm-Message-State: AOAM531gTWDOGVJLKdOg7Gtn05qqui49roG+HPJtuIMpxvJ8vIPNb/ao
 f2a5g9/fO4d5ZjMVKts5hd8=
X-Google-Smtp-Source: ABdhPJzj3Vv6aXvI6fI1FaHm+iPJaLR9LAxH7cgR053tP86mxtuf22qpOCU/SoeSav3viutpETAy6g==
X-Received: by 2002:a17:907:3f10:b0:6da:818d:4525 with SMTP id
 hq16-20020a1709073f1000b006da818d4525mr28530988ejc.47.1648488646256; 
 Mon, 28 Mar 2022 10:30:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 mp33-20020a1709071b2100b006db6dea7f9dsm6229750ejc.168.2022.03.28.10.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:30:45 -0700 (PDT)
Message-ID: <315a50ac-0316-cf06-8499-4d35d607e31b@redhat.com>
Date: Mon, 28 Mar 2022 19:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/15] tests/docker and tests/tcg cleanup and diet
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <0f1e3a7a-291b-cb82-5385-28c5ab195406@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0f1e3a7a-291b-cb82-5385-28c5ab195406@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 17:53, Richard Henderson wrote:
> 
>> This is also a first step towards moving the cross-compilation
>> infrastructure from tests/tcg to all of QEMU, so that it can be
>> used to build firmware binaries.
> 
> Yay!
> 
> However, the tricore special cases broke:
Silly pasto:

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index f195d2d873..c0022b47a6 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -334,7 +334,7 @@ for target in $target_list; do
                echo "BUILD_STATIC=y" >> $config_target_mak
                echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --" >> $config_target_mak
                if test -n "$container_cross_as"; then
-                  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --" >> $config_target_mak
+                  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --" >> $config_target_mak
                fi
                if test -n "$container_cross_ld"; then
                    echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --" >> $config_target_mak

Paolo

