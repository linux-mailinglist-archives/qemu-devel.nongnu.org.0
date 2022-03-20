Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2174E1E1A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:03:27 +0100 (CET)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3e2-0003xT-AW
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:03:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3ar-0008Lv-VN
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:00:10 -0400
Received: from [2a00:1450:4864:20::431] (port=42619
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3aq-00042K-85
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:00:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id r13so3424377wrr.9
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 15:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l002E5n0bg2jfvBYR07fN++7O1S0uszpGz+NkOhwmUY=;
 b=N9MA+9907RpUe+P5HpJjZbY9Dh5TEFaBO1vflzKDwGAP4ZG8WqKee5TYIcvU44oujc
 vG31mMGz2x8Va6DXD23YOgnOK9nX2hDCnl20n0xwaXdC/ZYpIkQfGzC4Xt4VULMwfHNV
 XIrETO96phwq5/WI6SG3D3L6KL8/8FjPkqaJHEu6Zg2WpLEf4AC/jhtJYssfkvRHeN7A
 DsgWeH3aRWxZu/eLm4F6yNDnfzU3ffSfZ5dSnuvq8OTo1T6yGqGbNRp5iLHAUi/LB8TD
 V4HeHRSaFeXikgqLH7frBj1TX7ZDma3pN1qPE9d+LjzvlBiAMjNu2pei3w1LLg+X2rqJ
 O9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l002E5n0bg2jfvBYR07fN++7O1S0uszpGz+NkOhwmUY=;
 b=kdN9nFBOx4uSH8NbnFyGMTMCyEAIbUwe/1lnHXniJgprRTE/DL3NQ4Yc5qB7sW3AQO
 yufrFdbtQRm2v1kgl/TurJS1f2VAQHplmZVGd5ezvIAWZUZuMxqfz5Nf5UsZQOOu+eQ+
 tGxjHFNOPPARFrhviFJIeyo7ehdr/g1AeP79B+D5ofJJaJvbkUeEzyI0aeAD01bDMtx3
 x9P608eHpmJivvrj3F1lXrUMSA3as29f4Od13fikFwCll3PSLdN6hb7GyV5AWE2jMCla
 oOAFZH0+RCzhifSLYan22tz2iIw2nax4qDUE43idvxvphKzPfz8YyX65nCD2ySoK+TaF
 oZpQ==
X-Gm-Message-State: AOAM531OBzTv8Y213GTutWqdnN8vfjLRosujGAZuL6U3SIhjLA1A8/xm
 gnY4cfVWSVb6qa7vwYNeVN1mEkpEmcNTjg==
X-Google-Smtp-Source: ABdhPJwlom/WmuRX7O05ti4UWlku6OC4wmcQoXQNhGyl0rR0YLTfR2aOCwt9ro96uhWTl9glR+pmFg==
X-Received: by 2002:adf:fd02:0:b0:203:f2aa:37f2 with SMTP id
 e2-20020adffd02000000b00203f2aa37f2mr715311wrr.396.1647813606921; 
 Sun, 20 Mar 2022 15:00:06 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d5981000000b00203d8ea8c94sm13134749wri.84.2022.03.20.15.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 15:00:06 -0700 (PDT)
Message-ID: <75c493c5-3b72-cd3d-adb5-a2e254eb21b6@gmail.com>
Date: Sun, 20 Mar 2022 23:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 30/36] util/log: Rename qemu_logfile to global_file
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/3/22 18:11, Richard Henderson wrote:
> Rename to emphasize this is the file-scope global variable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/log.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

