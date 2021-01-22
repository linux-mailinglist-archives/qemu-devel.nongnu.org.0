Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B352C301044
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:46:52 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35Cd-0003wH-R4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l35AC-00029i-Bp
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:44:22 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l35AA-00087x-QB
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:44:20 -0500
Received: by mail-ed1-x532.google.com with SMTP id c2so8074574edr.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QHeobytwxXKdwKmV4A9MZE1Nyo/ShYRijeN1ylyqUo8=;
 b=mlMnvKM+dHV2dokP34u5YsRiSyUHoF80i5vbEgzNcsTLqaN7p5K1vpLYGP7q1KJkjq
 rJQmc1WgSWrMqc0wBcJvIpFszA447pw88WWwr5GVVB7b8XLdylQFgz5prY771OOCW9CT
 zGSGTmOUe19Xu16udt7WNS5scRxhPBcthWZRgoL6owpv1vWFINXs/Cvf9Yi2aarnbCx3
 j3FTwyjeAdPS62cDxIEu2cfvgdSuRTZvdpRTE6XQkxnVelz6avSKlpILF2NI5twD6hfr
 sJ8mXDxIGKSH25IuZqgAKGQ0vdZ11sHIq9UIN4dkCkhsTuXMeb0HdvOTQYwL3dEl3WCG
 A0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QHeobytwxXKdwKmV4A9MZE1Nyo/ShYRijeN1ylyqUo8=;
 b=PzzbOaaKafA6dq0G45VP8XADHcA034q9e/p3Gg97fBwdpVI9rR7A4+k7tMsSsgNtre
 VjlCyf02ilr4cOJ+FRVsJNwJ9xMWR1iTT8wY7MIv83p3Yn8IWUnOqWrsk8Wmgj02fJx5
 V2fWfkvaAuZCL5OnZ+gcSlsQ6qDMLnN1LvIHxiUmGUFfL+6YaEXmqHqtX6lliaiJ2JtQ
 xBgk6KSTzFghDCo8c+JMVXPsnKKG2TNxjAz5zn9uwtWB5TpPwoOpugd9+Q82+/I59uzx
 EVIZmFgSg3RBkqoJwp8hFrOf1PQrDmbCYXDcW63XZqN8YSmY1YMOUC1Ycfk/tbr4+oHU
 doNw==
X-Gm-Message-State: AOAM531BrVwKjAQnAqmVTNPYi+7/zTjFBtNu/2eLjenH3vXs/N4mxOzS
 ONx7AZe1VT4riRu4v85NECU=
X-Google-Smtp-Source: ABdhPJz3HMG8PjVirvB8l1fxuE4+rTt2IT9ReJitf7W1yB1+fUUuoHQNCrYNE4nuSeJc1Cnv+oA7Ow==
X-Received: by 2002:aa7:ca51:: with SMTP id j17mr5015588edt.124.1611355456892; 
 Fri, 22 Jan 2021 14:44:16 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k22sm5292565eji.101.2021.01.22.14.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 14:44:16 -0800 (PST)
Subject: Re: [PATCH v7 34/35] Hexagon build infrastructure
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-35-git-send-email-tsimpson@quicinc.com>
 <0cd4a077-9358-4216-1dd2-d7212f5d082f@amsat.org>
 <a7ae2794-c445-f550-dd42-5f6456aa640b@amsat.org>
Message-ID: <3a7a85e6-fed1-9c8a-06d1-291feb68ab82@amsat.org>
Date: Fri, 22 Jan 2021 23:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a7ae2794-c445-f550-dd42-5f6456aa640b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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

On 1/22/21 11:41 PM, Philippe Mathieu-Daudé wrote:
> On 1/22/21 11:34 PM, Philippe Mathieu-Daudé wrote:
>> On 1/20/21 4:29 AM, Taylor Simpson wrote:
>>> Add file to default-configs
>>> Add hexagon to meson.build
>>> Add hexagon to target/meson.build
>>> Add target/hexagon/meson.build
>>> Change scripts/qemu-binfmt-conf.sh
>>>
>>> We can build a hexagon-linux-user target and run programs on the Hexagon
>>> scalar core.  With hexagon-linux-clang installed, "make check-tcg" will
>>> pass.
>>>
>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>> ---
>>>  default-configs/targets/hexagon-linux-user.mak |   1 +
>>>  meson.build                                    |   1 +
>>>  scripts/qemu-binfmt-conf.sh                    |   6 +-
>>>  target/hexagon/meson.build                     | 187 +++++++++++++++++++++++++
>>>  target/meson.build                             |   1 +
>>>  5 files changed, 195 insertions(+), 1 deletion(-)
>>>  create mode 100644 default-configs/targets/hexagon-linux-user.mak
>>>  create mode 100644 target/hexagon/meson.build
>> ...
> 
> BTW you should test your branch on gitlab-ci, I'm pretty sure
> various jobs fail.

Forgot to paste this link:
https://wiki.qemu.org/Testing/CI/GitLabCI

