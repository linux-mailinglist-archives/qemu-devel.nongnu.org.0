Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A574D694F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 21:14:56 +0100 (CET)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlf4-0004qf-NZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 15:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSldk-00049r-9h
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:13:32 -0500
Received: from [2607:f8b0:4864:20::62b] (port=39686
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSldi-0000JS-QB
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:13:31 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 9so8550324pll.6
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UOF89AIppZhu6Wirk2rMLPCYUO5r49fdWPsQTW8QxNU=;
 b=mJFaNaTU99eolq4YN5+2hWoAoFtwZ+pm9xkMJlaQ/3M44fN1KGTof3eu9123FmFHcM
 Za17CPgb0GeIRGbg0qlDMFS5nyUaiRRsuEVxWfIC6YzY8jbIpN2y0esgOvfKnLllk+PY
 6bVff349yTj47Ud6k18e8xnN7GqdshQ4lw7UrXO8rztrvd8XMl+Sms/iZOJPWbbJBeeB
 ul0eOPcMY1W5LBlA6hG0WnpM1gD5UuCLQjtrODXUsTPpb+M/uUMZLf7KzQWp8aofdssN
 rfS1eeWQclp0FzMynGsmAI9sPrYUkDQZd8CLokzVKN7MMuZobntKJh8HYB6zq0QrN2QJ
 hfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UOF89AIppZhu6Wirk2rMLPCYUO5r49fdWPsQTW8QxNU=;
 b=HjUsvq78kVW3i+8v4k5yW+iKiZoMTeTKfG+yjEn9wLe2e95cMye65i/BbeywskC4zK
 7cALmBF74CWQjIlZ882WcljdXAxvagpExJ/PvZHi4z2IO+uWqkgIPJSHd4S4Ug9Z1MAO
 zL8vAwvCYdvNjixlpm242A2YKbvLb2n6XGm2VyR2im2Rlh6wMv9lCDq4GqNi0wVfbfAw
 8bUzOL57Fou8AmC7qSrNtv4xLS3xZW8N0FBdN1EDCvKiFlvoUX9sSZXqUJ0wqTQDn2VM
 geQp/xae0CmjzGchSfPM8FyPWPpNzIys5n1ddRJLFbKoEaiJPXT1NvxTRM9HDs0G2upx
 YvGA==
X-Gm-Message-State: AOAM533F+sYbNqYTb1FHKhl8yxPrPXLJ4pvckF/3Ek5BcK9qvQb9xrkq
 ZjFqdyVOcxabtcvdwtRIC/vPXA==
X-Google-Smtp-Source: ABdhPJy06j52dEp9hmqL7TbQWcJipkBMUPk2sLdP+np092WQSA+pPghDOmQgJ4CZvssyBabwXS3ZPw==
X-Received: by 2002:a17:90b:1e01:b0:1bf:5f6e:cbef with SMTP id
 pg1-20020a17090b1e0100b001bf5f6ecbefmr12515467pjb.130.1647029609190; 
 Fri, 11 Mar 2022 12:13:29 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090a1d4700b001bf94f2e538sm10175516pju.54.2022.03.11.12.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 12:13:28 -0800 (PST)
Message-ID: <03b876f4-0429-b5f6-e17c-bfd3a867f304@linaro.org>
Date: Fri, 11 Mar 2022 12:13:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] dump: Reorder struct DumpState
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310111608.3362-1-frankja@linux.ibm.com>
 <20220310111608.3362-4-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310111608.3362-4-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:16, Janosch Frank wrote:
> Let's move ELF related members into one block and guest memory related
> ones into another to improve readability.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   include/sysemu/dump.h | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

