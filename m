Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E59300A22
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:49:49 +0100 (CET)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30ZA-0003Kg-Ix
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30XY-00025Y-As
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:48:08 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30XW-0004No-VJ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:48:08 -0500
Received: by mail-ej1-x630.google.com with SMTP id kg20so8376818ejc.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 09:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=twgFh2fe7vXNN7M7L0AoVFhCOClXqkSMZ/6vdGVwuok=;
 b=swjw/YsMVoygLLnfysm7QNSUnh0XC4npys7E8C35oXMM3zA19idnWV60ByjoIAgkRf
 ZIpnHHy2cJJrSpjZvUEoojYvhfYIvuzgcbXkYvjgt2m3puQ2yBl3PVo9uMt5F8FgrVma
 X53/6TN2ifoyBb6S7A1dC7Ky0JKKDVI9pQxQCNoAenjEZo8luebP2W3HBcx96guV2cYe
 5KBxi3+JKwE9oGjPX9N72XuEG0g/RTjzyXkxYyMTcElUO8lV2ezCqek29kL9GR9b0KX+
 JjU9NP5N6YTHVJ2AbT38LJ5Uqz3FzuGc/l5tVC/uMUam85sRFUPKdbIrJyLoNvvREtRj
 Y7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twgFh2fe7vXNN7M7L0AoVFhCOClXqkSMZ/6vdGVwuok=;
 b=irodVrGpsbYoH4Hvarumb9TBTn/HaCQt51MsnSqftgaVMeTSuNhVSACBlqgg3M/5bl
 3T/B5CP0NIKPUvqBJ+D1jQ7IgQ0Ju10Forj8qhw2vFA7/muZWZhqmsE7Tfz1G0LNnq44
 bk2WIKeU0Ukg/rkhCtV715pYlW9Suzsc3tbwnCn5Y56X7QoM0d+R6fDHgLqKmDoIn/wD
 HPhFAbUP9g/h1YVchTedNf0ccRXt/iNzrn1ixA4oIdVp6e94yduGtT9c6TnqTtnqC5kL
 gHIjNNOpzguruYOFmcw8ek/oGwJ3uTrxwS9j+xkYrj+4yFP8451c2Ht1OH2vxH+l9HEA
 gE2g==
X-Gm-Message-State: AOAM533kgg7HFQzKsrvqMFesC6G9vlG1SoBEh11SxIlneByFoyYy3QCB
 lmdicXHdrrS38XjUXQE3byM=
X-Google-Smtp-Source: ABdhPJzheyJmyofsWxTRurDLFDhZPeaXFvIm84phthuXk71f60yPhDFo4L3oY8UaQK3MM3XQGLofbw==
X-Received: by 2002:a17:906:ae81:: with SMTP id
 md1mr3597023ejb.222.1611337685637; 
 Fri, 22 Jan 2021 09:48:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h15sm4902182ejj.43.2021.01.22.09.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:48:04 -0800 (PST)
Subject: Re: [PATCH v7 08/35] Hexagon (target/hexagon) GDB Stub
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-9-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <25846d35-c2db-a916-b303-f317f5391deb@amsat.org>
Date: Fri, 22 Jan 2021 18:48:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-9-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> GDB register read and write routines
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org

Eh missing trailing '>' in email... No need to respin of course!

