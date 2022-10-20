Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32C606B04
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:09:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldjA-0006kG-SS
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:09:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldhz-0006ee-7Q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldhr-0006e5-6O
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:08:03 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldhp-0002Ae-Ey
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:08:02 -0400
Received: by mail-pj1-x1030.google.com with SMTP id pb15so679731pjb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZ0hHX5Q3BEMfc/3KQWDynWERAG0Tten37YOPzWKXpM=;
 b=YHuF0ujUviCNvqQgPSy5/4HgrcM/BaQodIgOguVpmVtCwOXHOg1s2pYWAvatExcPyI
 hmjaOiYuKd6h9Cz7IE8lagJzKEnRZ4mP3CySf5kFLU35F0YFtxjPSMyPgz4eiwdY6ndO
 R6fVaA+JCNyEgpXTSn1mH0ryoKOj6f99wKjH5fuTA96mCW4L9T5+IVRI60vCBjw65oew
 URP+3c5GC17iVnsJNZce4LzG8vbpdB1gZ9G7YQTprRvoPgLqhryuLUPP94S+718m9Tuy
 e4Qw0ooRx1Iw8MbzuW7GV/phyfLfZfScG6M8S5NdMBUMDKiT2HJBQ1UJ7cIp+YwPimgx
 MUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZ0hHX5Q3BEMfc/3KQWDynWERAG0Tten37YOPzWKXpM=;
 b=7TA73Y2IwQ7HCfneI44PUoOZFTOrA+VZVsI+i4G2YqzEchMAZg1pLaZorAHrPM4TFU
 E8X8qLlyV4bxAJoSWjVtY6P7lQw9ufPCwVpRCsnPLN0WQBNHNvISfCQSoBtay2hRyhFx
 kpdwflQGZg+nlGqUAjNOTf6DuU42s7fhNGUx4p9iVGuZyV7sat4gxg4KIJ9fyr+74GML
 vTZV/tPxTze7lcs0gLECls9KTEWSxr0DjmSIR5loBFbs0M+s6FH7+xzoolPTNVrwuWTx
 dFMmqJfG62Wk6lEfwk6xOcw/JuscSEJ7xuZD/v1HC5s6YTTg9hSiU6FdV1/o7PjcGQIz
 uZIg==
X-Gm-Message-State: ACrzQf3jL7jTp9w8TrRr5uNB3+Flf3aGZIvP7stJ7gd+tfVI7duiY122
 hGvuky7YF3h+xnfese5J2uyuWA==
X-Google-Smtp-Source: AMsMyM7qQPr2NlBnikNM5Kp9rfDMjT9sXIpUd9yHXt+6PIVnMYGhempWuyK/LbOiqVOgQP4ywb5w7w==
X-Received: by 2002:a17:902:6542:b0:172:95d8:a777 with SMTP id
 d2-20020a170902654200b0017295d8a777mr16195473pln.61.1666303679467; 
 Thu, 20 Oct 2022 15:07:59 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a632f06000000b0046497308480sm12211457pgv.77.2022.10.20.15.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:07:58 -0700 (PDT)
Message-ID: <1b8c3f7f-4c37-1f20-1cdd-9bce48227711@linaro.org>
Date: Fri, 21 Oct 2022 08:07:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 01/26] tests/docker: update fedora-win[32|64]-cross
 with lcitool
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> Convert another two dockerfiles to lcitool and update. I renamed the
> helper because it is not Debian specific. We need an updated lcitool
> for this to deal with the weirdness of a 32bit nsis tool for both 32
> and 64 bit builds. As a result there are some minor whitespace and
> re-order changes in a bunch of the docker files.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220929114231.583801-10-alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker        |   2 +-
>   tests/docker/dockerfiles/centos8.docker       |   2 +-
>   .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
>   tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
>   .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
>   .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
>   .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
>   .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
>   .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
>   .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
>   .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
>   tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
>   tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
>   tests/lcitool/libvirt-ci                      |   2 +-
>   tests/lcitool/refresh                         |  48 ++--
>   18 files changed, 1499 insertions(+), 1372 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

