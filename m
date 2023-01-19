Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF2674114
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZlp-0000nq-Rd; Thu, 19 Jan 2023 13:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIZln-0000nE-9n
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:36:15 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIZll-00079y-0z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:36:14 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v10so3978286edi.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQJWpYnxymmoL5mpQFmsEt43A223L+vIXpyynclvgqk=;
 b=Mhiz3zv+AEtTT1lFLgku9DnXHjHE0uPvqPozolNAmJUnafpho2p86CLMW6YoEUCPqy
 ONHeB24KUqaH85Z+V7w8V6XBL+l22a+vZlVWLZYIkzBh646DGXPxOid7yYBwGKHWvEuE
 TcBdaWEWPIEvTqaDPykpmg7u3WazLMii3/X4KUjv1le2JurfGJmqBZOxiWf4VRedA5/0
 kn24teGzIGgkBR/IcYxjG3boeSXMjuNP1mI/JnJratEM/xasCidcxSuG2po+NfaT53RI
 kwGfwA/xODsUhWzGPa4sSGt5WIL0OY1yS4Kf3uxGZAk1eo6xMZtKbefKcwU2wcyzCPak
 yLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQJWpYnxymmoL5mpQFmsEt43A223L+vIXpyynclvgqk=;
 b=6bLv8qZ7tooYI0EiZGruGDrRpxzT9bmM1sF8Kc5RaIRcTMZOkcvE869hc7nQiRxPs8
 SYOwSe2fSHxcUCwduI2B/zhQmZ3uXNgTMWnoM8+OKAR4SjRqIHzrGTGXfMyDZGgYyqT2
 pOcrAcOX0uv84/jhDrWB6i+XhCEymIaTkQsRqLsLHnpcgQEzQgmtOScGWpp1oCf0L8Hy
 /v1tfcbYYPpo3jBiD8fpz7Rt/knLsmIt9FbVmEPUZRwtxTj0CThCBBvJpuy/09iY0box
 bQ6xjBCqIgoTIdYl0ogSM8HAok4x1e1L+9GDlfmfwicrTVoJkJ8sr36Nrckhz5PYGPrh
 LDFg==
X-Gm-Message-State: AFqh2ko1GIbH7ZQyA8PSumpa0J+3szb8dY2ZpOFj9pUr+HvDmiia0jXV
 XPbcH7LYAW6RSTrPZ3Tmd+OkkA==
X-Google-Smtp-Source: AMrXdXv5RnUB99AW405tbHOBQLHrosb7YVe4TpMSlQlMopD1zLOmQ/QuQEQU/WYaRckf/HZu1eoqlw==
X-Received: by 2002:a05:6402:2207:b0:49d:f444:ed04 with SMTP id
 cq7-20020a056402220700b0049df444ed04mr11074692edb.17.1674153370994; 
 Thu, 19 Jan 2023 10:36:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cs3-20020a0564020c4300b0046dd0c2a08esm16035023edb.36.2023.01.19.10.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:36:10 -0800 (PST)
Message-ID: <a736c4c4-7531-6afd-9995-0de3c53eedf8@linaro.org>
Date: Thu, 19 Jan 2023 19:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 03/18] gitlab: just use plain --cc=clang for custom runner
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119180419.30304-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 19:04, Alex Bennée wrote:
> I think this was because older Ubuntu's didn't alias clang to whatever
> the latest version was. They do now so lets use that and not break.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


