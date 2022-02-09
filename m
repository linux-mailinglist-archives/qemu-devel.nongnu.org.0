Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B464AF077
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:59:31 +0100 (CET)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHldC-0006C1-6Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHlZk-0005Na-K8
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:55:56 -0500
Received: from [2a00:1450:4864:20::436] (port=45715
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHlZi-0007d2-8U
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:55:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so3534718wrg.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f/jFJqSoedTHHQuyXf5Ue2ED8I8LLc8lktyHr5U0/0I=;
 b=c2Vk99F9+xNkcn+pJtXmEK5i0V1UR9RJkLnpbSKSxTHQ5bFyPywo4kjIP3Sd0UMpuW
 jBMcrv/oM+0YKOVTssd1ky7RPMhxYoxxtXGPrzUE043kXroQ7Vzy/AgKoMH1k3KrQ4fE
 AGmOOZywKljT9JwWCTCgygbg+9EdcNfklbXk6dmYm5NnR81it5cNZ3nWsI9tR77Yekp0
 qe43NGY895MUzh4ITfll+bN82LQYGeaTCySVkKlCQL2zxAB5XIlTmQcy5sE8DnmpqIt1
 5nw/RN3H/zRmhix6ygIcR2gxwVhw2CSoH49n/V+cAWHlwee7E82R+DA8CN3zjSUV5qHX
 1xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f/jFJqSoedTHHQuyXf5Ue2ED8I8LLc8lktyHr5U0/0I=;
 b=5/pERSraJGzo1imY1oGnCPqUSKNqHFGuZvBL9ug+AE9GtP5DnlpDaBqo4nAE3vskrX
 ZX4wrYsyTEW3jKZw9c+moDUho59D7n74BgGhPx54F7LPp1NbbAQz5ZlAttuoV25vsxk5
 aBpp+RHumg6vSqTnSr3dZLCqH1m9/oiQsojgwr0QDabMw3oPZVCcYkrZE/R0k9HKK/3o
 sPcjoD4+qM3lhU1dB4vSjYxkh4GTT+C5zaq0oDORLnH4hDirj2oCluSe+6762WarWXkh
 SMiRpJq/vzzHh8DMlKdTARKQcFTZ5/63L9N+SJirwic7gqXeOyj51A5sjEUkDC68Y4jL
 IwGg==
X-Gm-Message-State: AOAM532UUPC+x2kGb6q2hE+FvFvmwWj0xpL8zLriEkl7TJSwwU08bls9
 8mdNHLgUDtpz5eWgK1jL4DYEpYj3nXw=
X-Google-Smtp-Source: ABdhPJxGPDgnJEYr60KATaVTr2uB/I9Cr1SBpOaj3tJVwZP9KN64CLFwR1PF/8Ou1TPCbFGOglmySg==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr1768660wry.254.1644407751353; 
 Wed, 09 Feb 2022 03:55:51 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r2sm18392098wrz.76.2022.02.09.03.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 03:55:51 -0800 (PST)
Message-ID: <67489570-dc7a-7b58-054e-d4def41ce23c@amsat.org>
Date: Wed, 9 Feb 2022 12:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH] tcg/optimize: only read val after const check
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20220209112142.3367525-1-alex.bennee@linaro.org>
In-Reply-To: <20220209112142.3367525-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/2/22 12:21, Alex Bennée wrote:
> valgrind pointed out that arg_info()->val can be undefined which will
> be the case if the arguments are not constant. The ordering of the
> checks will have ensured we never relied on an undefined value but for
> the sake of completeness re-order the code to be clear.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tcg/optimize.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


