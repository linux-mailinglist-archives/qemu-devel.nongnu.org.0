Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69254E588C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:39:58 +0100 (CET)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5tm-0001WR-18
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:39:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5qx-0007d7-P6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:37:09 -0400
Received: from [2607:f8b0:4864:20::62d] (port=33608
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5qv-0005dw-1s
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:37:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c23so2397750plo.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z2K1eDDa1BlxmR9YKoe7H+FxIhkpfxP6Qfv0QnPrZ40=;
 b=qE2f+Re1WEru5ouuY8gCdZMDUQWKExiLnv2K78ZNZ5ajLEAX9utayhldvkAbLzSdib
 A0l71HbLzwrXRAX/ecAgcE+tJETY0K8q0C3R4CMl4gn3CVlG2HSLIdkndXbciPo8OkbB
 DHqdrdksKgk7Z6gO4sn7I4j7jGFWOZAEcgC/SsmHLf8y5R9kAbbaj8Ojfx6VrZWG9951
 GyjYdwEIu6G+c7GUS+TR2ke5oW00wk/7eOo0T4pIfUL1J5ArzSbf8HgHQKfYcemfRHha
 UnMvrADbmfQ2rT63Ol2hCQJi2pBCox170KvBaBlE0oDU/QcjC1NSL6DQF4MLIRurouJ1
 ETtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z2K1eDDa1BlxmR9YKoe7H+FxIhkpfxP6Qfv0QnPrZ40=;
 b=PcJslwY0QAmy2pMzWYwozU4Kk13ArPAXOHM04jBgczJzYDqNzf79WuqFqzgGInng/0
 iz44tbVXfDblXQ6vtxyoiDaxMZPoD69ZWvwo8npCMmbASvCGxwleHrJOTTX7YWuxFtRL
 g8C7DT8Jx7C/a451RJzukRGTnlsGAaveWCz0S8YMYV5TAc3OAR3W8ZlX2LPK45fm043a
 c6yavildiqqTNWpGfdzhGDL+Yy2qxDupG+un6M3bAbUfzEtVVZJoR3d1cP5crE6qCAFc
 6nr7YIkUA61SMjNgIttvqxISCESR5EM5+DEu5iE82Gnnk/3uxuyxmNShcOguLw1YYCvy
 rbPA==
X-Gm-Message-State: AOAM533BR4MwD5GOrozDI94Jnqb38K9G/EZiBLuOR29lDWcer/jcB/I+
 8/ZSm3uKMC2rGfVSXS0ITY3Gsw==
X-Google-Smtp-Source: ABdhPJy5PFhr4Q0il556Cj8vEyvrHQuEt2quv1rh9NQPDLtDChS9BuqSJ8l57ISw+TaEEZoWN+e46Q==
X-Received: by 2002:a17:902:f64c:b0:153:2c4b:4ef0 with SMTP id
 m12-20020a170902f64c00b001532c4b4ef0mr1349982plg.94.1648060617123; 
 Wed, 23 Mar 2022 11:36:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm7417269pjb.57.2022.03.23.11.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:36:56 -0700 (PDT)
Message-ID: <f592f034-90da-68f5-8aa0-63b2d8842c24@linaro.org>
Date: Wed, 23 Mar 2022 11:36:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 30/32] qga: remove explicit environ argument from
 exec/spawn
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-31-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-31-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Environment is implicitly inherited from the current process "environ"
> variable for execl() or g_spawn_sync(), no need to be explicit about it.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   meson.build          |  2 --
>   qga/commands-posix.c | 24 +++++++-----------------
>   2 files changed, 7 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

