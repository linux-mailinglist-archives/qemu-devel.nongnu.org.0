Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D49342E2A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:07:58 +0100 (CET)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNe8q-0006KZ-Tb
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe5I-0004qq-IZ
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:04:16 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe5G-0006Mk-R9
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:04:16 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so11543022oto.2
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=z4dArdd5Nw5FEYMyNtfqm9A1y6tmSFz+ppwtftrOUso=;
 b=vy7LrhBZOj2BGQhVYVt+ebp6+UDhUlbaMX+sX13c+PKzT+GtKoSSsGCG0mTGno9Pwd
 1lc00cklyDUsflE6ejXwuDHR5tlDRqdM3qEnvT4GGR3EN9PwBDGs92AdXVpGlcdTA43a
 oa3Oq37klOkQmBs2rlnhiA0MXK5xtUe4t8Li0hSsU4qj4kumqjXdvwU4Fqc5HOQxG4Jr
 aNAoge50UmytUI5QArknrdxfg34bI7klDlvpI39HIZBkmu3EYEVQM09c7ryx1R0FYDtg
 wimxeSPkrr1sEQ5PdHo+boXbnd0ULCbjeAqZh7J9GcMmz7rNUNOqO9fVPcMtF/PgSAdz
 lwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z4dArdd5Nw5FEYMyNtfqm9A1y6tmSFz+ppwtftrOUso=;
 b=iIp33Fo8d5VAuRh+QisSKHHJQRhb4OPp5yRo2O/TT4y/jfxAegzXqBN3Ua1g88bxG8
 rBhIPZZ6/1ACmJADdPyhDkrtxMuy9STyw5J9qz3Hoa0vXyYi+SVr/O7+nv6MhcAclg9B
 OKGImWiEwFdmM0/6IGRs99OTtN7LzMWkfObu154LNO3Zx5qEKCd4z1mxQHcso5crYqfm
 AidFg4mbEo887hGFLEMyZKXgeVAs2xe9Ur9/9GOaxiPi9WwkkUpgkZddMXqEcp/WFzEg
 dT280gryX8DQjiT2i8OpZS3FgMsvy+ZVH6LWBwDF6muYWAh+ZyTtBV+sngCrj22qziR4
 eh1A==
X-Gm-Message-State: AOAM530yO+mq57GhzVWQ+9rYuYsaaKzvrtwcnls/V6zPND46ftiIOwqd
 sOl8mZQAX88bYcEV5213X9srqRgPMSePXoFv
X-Google-Smtp-Source: ABdhPJx9k0EAC/562bTTRAgBH/MOPtUuDjxqsvcz/ERxPRRxdbnubaP9iZm4HZj6rIfEtc1W0+zjSQ==
X-Received: by 2002:a9d:a0f:: with SMTP id 15mr4876394otg.263.1616256253645;
 Sat, 20 Mar 2021 09:04:13 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y143sm1945105oie.50.2021.03.20.09.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 09:04:13 -0700 (PDT)
Subject: Re: [PATCH v1 01/14] scripts/kernel-doc: strip QEMU_ from function
 definitions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea6665d2-1952-7b57-2bb3-f9ac35c67335@linaro.org>
Date: Sat, 20 Mar 2021 10:04:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 7:36 AM, Alex Bennée wrote:
> Some packaged versions of Sphinx (fedora33/alpine so far) have issues
> with the annotated C code that kernel-doc spits out. Without knowing
> about things like QEMU_PLUGIN_EXPORT it chokes trying to understand
> the code. Evidently this is a problem for the kernel as well as the
> long stream of regex substitutions we add to in this patch can attest.
> 
> Fortunately we have a fairly common format for all our compiler
> shenanigans as applied to functions so lets just filter them all out.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

