Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE953C1A44
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:01:29 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aD9-0000rW-WC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Zrp-0003Wg-4Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:39:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Zrn-0005L8-L7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:39:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a13so8923574wrf.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=du2Qy4fci8B+Np190Tts8rNaREHT7BdRBnODJgBCuAY=;
 b=EItrcjb4E5Vpjw3fS4Qu2ea7Zg1pgzO0BtLikBU6E6BUkztwTnjNlr0irYSJ+b3Pva
 3cWq2+ywZ30lfOK35maFYt7oELyrj+m7dGoCVyW0c4jyyFmxUlnxVJEIfwNpKKrRYqTQ
 0aJIlFNR/cXFt1bpaQ5tFgmcOSMIOiHzrDka+wqMCSF6TCJFN71cPddqbzrcIPMTz4eL
 OALmfdmwwv0RkNLGMbRCHm2fYCwmRjw/xM8Batp8DOPwOjTniFyVILSssYuTIF7d9w+F
 nrAWo1HbNilyX+AeSAqUZPlF5M6VZDnefkIgpgx83AmQQfnzYYvT0Cjl/KQdXsqF9AUd
 8JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=du2Qy4fci8B+Np190Tts8rNaREHT7BdRBnODJgBCuAY=;
 b=pBrk19X1XyUUZsDwz87jAFqyG268IgxZRSselmka0Yjfn1bB9cx3Aig/vq9cdD+D67
 qy8SKzGbdXf4GH8VAWsW3EsWLsBg/mEw17vmUnJpMBR5C3nfVIXiNuR98O0pwGX8lDlh
 AvS7L7xhqVjAgLZLtcxBs2S53cEYThAcA2K6plV+cHwqt8/tbcZQI1QOyFhIxii0rbVL
 wv9l7NKcnhI9WKd8ql6JW8MTzl1WT1mUyevFKalB6ooG4S6lN1HYmu1i1ltECVzALQvH
 Dn4LybSvNwAv7gR6g7iOKWhzfYeG8RVn23GN4GRQ4RdEe9urg2rYrO55Do0ARsw6z4w8
 5J1w==
X-Gm-Message-State: AOAM530cw7oqrAvJRR5QSJ/CFLcc0cyLlIBaKGUwdtVzmtKl9C7pxISa
 1W5/6pa/0rrNrI/AbYQHJe8=
X-Google-Smtp-Source: ABdhPJwZZJQTl3QZPJ/p4hsBbvNKEnIxVIYQcMpDvYQuKC01LXvC2094hB4qqvLyRaCZPm3X1N0f1Q==
X-Received: by 2002:adf:f70a:: with SMTP id r10mr19108596wrp.401.1625773160797; 
 Thu, 08 Jul 2021 12:39:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r16sm1954610wmg.11.2021.07.08.12.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 12:39:20 -0700 (PDT)
Subject: Re: [PATCH v2 28/39] meson.build: move TCG plugin summary output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-29-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7b3c6828-6c81-2372-ec04-59f4e8c7a71a@amsat.org>
Date: Thu, 8 Jul 2021 21:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 9:09 PM, Alex Bennée wrote:
> Let's put it with the rest of the TCG related output with the
> accelerator.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

