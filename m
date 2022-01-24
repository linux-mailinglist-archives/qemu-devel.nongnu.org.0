Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1134497A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:22:45 +0100 (CET)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuce-00057D-Az
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuV2-0002pS-Lc
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:14:53 -0500
Received: from [2607:f8b0:4864:20::42c] (port=43730
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuUv-0004Ae-O2
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:14:52 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u10so10670579pfg.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 00:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGOLPUjWXL582ox5OdmcrTLkXshDHUoXK2SnAwqHmIk=;
 b=mTjVgVejNUnT1rFAI/li5UYQnssr72ZojgidHdak/yvY0v0/3zEseKaSZ5LyXF0y2Q
 KD6r+R3h99RawrM7TVfB/+fcmdL4SoF8v6SpfQmV4XCiPjyDH5iHb3AFi/OfGVYNcKu3
 wLVc1uAdrSOF1ySD95GL3YpKAsPN+6Q0YjRfP7DZG/Ku2gKp2yDKG3KAMvasgOt/rRER
 M7uErW1ZSEfAwLhtuVbzPgYiRy8+ppdq3gBX8Dc7OGSna+htUGUzixEulZERa3tvU+YY
 oGxFumyYlXyjxKvFkRoTZadzv3Yls3dC7aYfO5f76+W3kUfn0sT9d6xlGODttCuB//P2
 I6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGOLPUjWXL582ox5OdmcrTLkXshDHUoXK2SnAwqHmIk=;
 b=VHU+oMO+Oy48lN9pbvXsWUsDrEWT/BnvXgJRvQPL/0emqjj+fYhYiscH9Zby7GecAy
 MXEODlzjbjf1zrRVCSacg93J+rubMAWm2cZd1gk1inLXiZ3R6N/gur4VW0p2rcWcscGz
 eTnqjpr/Av2XexErQuhswvzBkk/5GBEbJSfD1Q/moFCGtY/mOioRcUnIeMwS9EYm5b6j
 Fmx7QZSK1kFjO8bmlyTFbuc82zcAXVcwmeVTXDZSNa4zw0er17tt0wFdW3raBo5l4Fx6
 0ZvJT8dQPP1IqHb/G2ayHtutdPJeKqUQM87WxI9nr5si8mABTRIPpYCYchC1a4ioJp+V
 dDcA==
X-Gm-Message-State: AOAM532qAynLemIkPdvoRPcdoX12Q2v4zNkNNzydbrd0BeUwYpNnBXQ2
 bGAJznpVH2G4sXVEC5gmpCyGaw==
X-Google-Smtp-Source: ABdhPJzXCiois9Tp/pBMIg8BOhllHADEMqvOGElnGzs7KFn6B4luXfFjeZfSdtiehP42WIJ7J1EeXw==
X-Received: by 2002:a63:b544:: with SMTP id u4mr11063924pgo.160.1643012073536; 
 Mon, 24 Jan 2022 00:14:33 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id v16sm12260816pje.8.2022.01.24.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:14:33 -0800 (PST)
Subject: Re: [PATCH] target/avr: Correct AVRCPUClass docstring
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220122001036.83267-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74427e5b-8acd-1945-8cc8-0c857a92134c@linaro.org>
Date: Mon, 24 Jan 2022 19:14:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122001036.83267-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/22 11:10 AM, Philippe Mathieu-Daudé via wrote:
> There is no 'vr' field in AVRCPUClass.
> 
> Likely a copy/paste typo from CRISCPUClass ;)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu-qom.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

