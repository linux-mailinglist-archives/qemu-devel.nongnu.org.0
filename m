Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092C562884
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:43:36 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75h1-0005PU-6L
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75dN-0004Iu-CM
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:39:49 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75dJ-0002jU-0I
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:39:49 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-101dc639636so1678612fac.6
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Bi/fxGgRxZQ8o7TPoBecl7i9MIzj8ofhD9wG2+2j/7I=;
 b=Sg5nV8xnuEhxByOjlq4xMZjs2p7EgpSOreRmySMD776ceomh1C82hCwBNXW88hTvXX
 zMzyWPxwmojka2qTw2+PQtQUWCnKUVcvUoDCzh5vcfl5BbBnv830I3Pmji0Yq5lBZwFD
 X/i95R7SZIp1rfdTvOOTc2T43JEK0pwht8lWnjIK0kHQVomocq6Zdi7UGDSi6uZQCBLI
 oyb5ZXX3D49WjG0l8n99h2Dy+SerqQUdZffaRQwZDL3Mq1t4VETou1eUMqMZqr4EVvrf
 RkxoupfhDvnPVOsfYzzQSwztNCCpbYU0nDMYoNAqzM1E7WSzhEC+XR40hDnXCY5fL/ZY
 NrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bi/fxGgRxZQ8o7TPoBecl7i9MIzj8ofhD9wG2+2j/7I=;
 b=XgXqDoPIIv7ZNQaxioAY3e/edj697y1/0uR3AGBGYgX6/wTxHcKQuofl98KVlkRLHX
 rMUB7RSHgokxlVf0Z+dJVcyMiIpLlrcNVPaFwg4WilIKqkxUUVisQIXYrTY/PhqCrpvx
 ALmjf6wiGkj72TaZCqayEmbIgoSihOxR35wtdAnoKr3UKYD8DrDDYtMthgN3Bv6EdpMP
 tUo+j6CYDVgUqh+pMpCUcgPXDiJsu5MlUZWq/A94P6YbxSj384CdW2QRbG0cjNAe8uwB
 W4vBun8bhWjg0gwu5RlTTonU8Ssdv2HqBFPiQnCVRKkAqckCU7Eik7rroLnTAyPYvYZa
 2WqQ==
X-Gm-Message-State: AJIora+0BifUj9ickCUiu58QaNFUmMmjXZphsNQG2vdz/Ui6qWYUiXWF
 R2BGn2hatlky1A6de4Qh83LmDg==
X-Google-Smtp-Source: AGRyM1szqftABAYAH/8p854tkEi8ON0frAN2ECiTkgCDPuE2OaGhY0NZNbsIzseb75uYanKmtsP00A==
X-Received: by 2002:a05:6870:2f15:b0:108:c28d:3304 with SMTP id
 qj21-20020a0568702f1500b00108c28d3304mr7570871oab.92.1656639583600; 
 Thu, 30 Jun 2022 18:39:43 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a4aa80a000000b0042857cd4cb3sm133247oom.17.2022.06.30.18.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:39:42 -0700 (PDT)
Message-ID: <41942f28-08bf-54f6-0e6b-69af92d976c0@linaro.org>
Date: Fri, 1 Jul 2022 07:09:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] scripts: check if .git exists before checking submodule
 status
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220629160857.425400-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629160857.425400-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/29/22 21:38, Daniel P. Berrangé wrote:
> Currently we check status of each submodule, before actually checking
> if we're in a git repo. These status commands will all fail, but we
> are hiding their output so we don't see it currently.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   scripts/git-submodule.sh | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

