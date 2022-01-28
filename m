Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1449EF1F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:08:13 +0100 (CET)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDEoG-0007GR-Gk
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDElu-0005wN-0z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:05:46 -0500
Received: from [2607:f8b0:4864:20::635] (port=46904
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDElq-0006gc-G4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:05:44 -0500
Received: by mail-pl1-x635.google.com with SMTP id u11so4267827plh.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hPYHUEgKXX985Ez+z7tcsMgRQwooAVRzh7vjHHQ56Vg=;
 b=lJVFMehfRDY9bdSdx551+fVnrNEdUETYHGzz+l0ck3bJBIX7+yDZBU7mZYc2MWDmFQ
 DWm5rU3t4/j2IsHaLan04SXtNLNyBck3zxnzbXm4xHP3oIR+AYYck+awfcdAnSY40ORT
 whujYbJM4p103PXG95qLLctmbEF0eOVEXPS6R5UflkBWtXhVc6zO15YEM5+yON1AHio8
 25XIHYbbErR9SryIKgqaajRZvEi5CWY/GoyB+jjNQxylWW5oTt77uXggJe9PVsiStQ/Y
 mosZ8UU6FetEZki1t4pdS/PBsEz/7Oetg9Nc0kRRW+7XM23aoaBqQw952iECxxU32k44
 QlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hPYHUEgKXX985Ez+z7tcsMgRQwooAVRzh7vjHHQ56Vg=;
 b=PtGquG5RLfdvlzg307LqN2aK3TNrzgN9Mv/QhysWfYCQqw9BJaQPkqVTdOKlm/sCpH
 bM/05GagTCvE/aGhHwuC9x7ngZPAxHIZ4DZ32/BYnJCGz7PCq52qrPuNcM+u6CZwrqnM
 Jtbmlt8twOXZplEhx7lPqp6B1aQ2bJ1GNqRftVuY9yrVd0c74H9YVOl3aGavvDkEtVy0
 XPzEk8hYGsphrB0eoJG0enbqHc4MZ4lBDXWwT454y5etvw36Yg1d8jXE18YAuq0yAh6R
 Qhwcx6tWXi6nCPpi/e9YBnhtDQKxInDnx/iOFaRlI7ieb8Je07dFrH1bat1fVkrAxbhQ
 BKXw==
X-Gm-Message-State: AOAM532AA/GGwHv5CVc+ryC72ehEMTYAwaVwvozUEHMGj5qMhPqAHc6O
 xwpRA/3f0Lnc3FjtUALGLTc+Hg==
X-Google-Smtp-Source: ABdhPJwcjoo5gMIrsAxuRvIuJUkfQP2FDg9bL+UB3RkYxKXRX9hWKoqHxxpXvgWGZDx3QbOebT9mKQ==
X-Received: by 2002:a17:90a:b90b:: with SMTP id
 p11mr6797772pjr.189.1643328329965; 
 Thu, 27 Jan 2022 16:05:29 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j8sm4578855pfc.48.2022.01.27.16.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:05:29 -0800 (PST)
Message-ID: <c5360201-754a-6b20-f594-e88cd8604bd4@linaro.org>
Date: Fri, 28 Jan 2022 11:05:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] docs/devel: mention our .editorconfig
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220127150159.1489286-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127150159.1489286-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:01, Alex Bennée wrote:
> Ideally we should keep all our automatic formatting gubins in here.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/style.rst | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

