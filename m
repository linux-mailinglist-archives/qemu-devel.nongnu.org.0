Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFA494E64
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 13:54:59 +0100 (CET)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAWxt-0006Iv-9d
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 07:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVV5-0000Wp-Sd; Thu, 20 Jan 2022 06:21:08 -0500
Received: from [2a00:1450:4864:20::336] (port=36759
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVV4-0004qz-Ai; Thu, 20 Jan 2022 06:21:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso19665560wma.1; 
 Thu, 20 Jan 2022 03:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=T8P3wib2rSu6fLfxNTDaxBXakB1SCPtzZu5KEAFcdoE=;
 b=fBhm1LErcmJf6l3fZFJMLJF1RMVci/ITjjCphUYiclQjdg5c9P7RlE0AP4h2WRj+8h
 Pyl48FnoYkDKYDrjDw0pF1RkvxgaJs6tezmlMvvuR9+S4AmDGjgLiwA7vt/Iguv+iyO2
 5k0BHj+fRN866sqEF8G0AIX3eRcrYyXYVek06WIhxIhMoT4/DE18vaS2Y4nLeeCYzPgE
 CBZ3wRAZAUu7dBMCkyj3y0lzQP7f1k1lnA1neWsP5eBnnP6zY94FACLtuyPIxYHYUcxw
 m9AW7tZo7PMcQjvPp78o8EjbG7UjPVIcpyGD8M9yk79te+YuRYLCcQx5R1JLqAZ+gg7T
 MncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=T8P3wib2rSu6fLfxNTDaxBXakB1SCPtzZu5KEAFcdoE=;
 b=4NsSEdXP4zUQOA78AHuSMM3MQfhRs2lZ1BuihsqpNIHCdEH+aShGFdzL8Jjm/5HKG/
 HwF25Vpia5f0Dd4Wtoa8HkFX4+tP/eLkYpgk4p4aTpB2SHLHlFF6LFgcihHK4TDxOLw/
 CteRKKCaisHEixoIziUxTp9zxh21Qdz8E7gnyHc3VdwJ7nsEAWotqtLJTvFBOKt3ouLD
 Qc6kRPWtC/YAh/+2VJLpTtxHXcTEew8pe1Nu0tGbS10R/xIYvi+NT4VLGYbxzI8MvprR
 tLDT04hbyKX2etcLkhtcaUQ4YD3MlHrnmfZU23ORlwrqDWTmdSqT+UDuEF9cBo4rtG3/
 nzaA==
X-Gm-Message-State: AOAM532pZwZamQl18FMpml047gqXOhIr/KDTeQbfTNC1seZulL78AD3Z
 UokrJIr5CQx9Jo83Ypezi24=
X-Google-Smtp-Source: ABdhPJwmvlFYUuBBV2PRzS8w4+nGQh+HUrI2Q4Z68ChSUMFId/963kBZU+H7bDPNAuwgXEfWyQG3wA==
X-Received: by 2002:a5d:4b07:: with SMTP id v7mr9124199wrq.48.1642677663820;
 Thu, 20 Jan 2022 03:21:03 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i94sm2511286wri.21.2022.01.20.03.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 03:21:02 -0800 (PST)
Message-ID: <67f7c8de-ea0a-0728-b3a4-38c7db0b9ae4@amsat.org>
Date: Thu, 20 Jan 2022 12:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] tests/lcitool: Remove libxml2
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Andrea Bolognani <abologna@redhat.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-6-f4bug@amsat.org> <YelELTScffI7Ln7R@redhat.com>
 <c38f570a-3fde-e5ae-a427-895e9841b52b@amsat.org>
In-Reply-To: <c38f570a-3fde-e5ae-a427-895e9841b52b@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

(+Andrea)

On 1/20/22 12:18, Philippe Mathieu-Daudé wrote:
> On 1/20/22 12:14, Daniel P. Berrangé wrote:
>> On Thu, Jan 20, 2022 at 12:05:44PM +0100, Philippe Mathieu-Daudé wrote:
>>> The previous commit removed all uses of libxml2.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  tests/docker/dockerfiles/alpine.docker        | 1 -
>>>  tests/docker/dockerfiles/centos8.docker       | 1 -
>>>  tests/docker/dockerfiles/fedora.docker        | 1 -
>>>  tests/docker/dockerfiles/opensuse-leap.docker | 1 -
>>>  tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
>>>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
>>>  tests/lcitool/projects/qemu.yml               | 1 -

BTW what is the difference between QEMU's qemu.yml and libvirt-ci's one?

