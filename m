Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B837B32B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:47:42 +0200 (CEST)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgd2K-0004Dv-18
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcyw-00017a-Ij
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:44:11 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcyp-0003p0-Nr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:44:10 -0400
Received: by mail-oi1-x235.google.com with SMTP id i81so20778241oif.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1aKRkC/BqiDo+vUkxmlsbg4uXALv2Ven67Wp1mT86I0=;
 b=t5CyvDzCj6iupC8SgucMwqT+p7dRSu29+TJ2Sdy1zL7z6RIXyFApuvIwS3PbOe4+Ah
 +2kIbBaRAoThvnnOclnVG2UJugACkav378UaWWhzAOZuDcAaf7JU7NX4WBdykrF895SG
 cjewlqdYbBJehh+K85S36ZNjZ+iTdssMxrPpirkXCGEUoV4lya9ngKUnv3Pg2GUllmws
 LiLfGpzmLBxW8E7vzmyVuyaC4lZebnhi5SaB+QUhONwKDGo6wsYs/450M9VoArzgAfoZ
 fmk80qBbxX/Zmb9P+H99tfJd2XLPYxu/JvwUHsfz9VYZ/U8Z3ZQlOH4TlErh9sQvx9yk
 pR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1aKRkC/BqiDo+vUkxmlsbg4uXALv2Ven67Wp1mT86I0=;
 b=BrGv0Q42mjzOWeJC1qcNjMGEGpHgFqPSOGE13u533gtFNSUBzvzWEj+xZWfhwRACh0
 EO1j1CkmGlUQP7qxkwYbmwaVA16LzGQIgjnFPQ19ykaN8xPt/xCccDBZg5VmSlQINSo7
 VQ6EUn6ILL3h6STCzAcP5iuk71+gdQx5Q0oG7mP5WJdg+W5YZynN/g2Vt/pFCENvhQVc
 KEsjZsOUfRMji2GwSuNMODdWCA3J9XnXqEi8i4E1FX39JkulTUZWL8O+WVSagCng0Ml3
 p5GqhGPc5TD8GBLjYj3ZlRdw8ns7gRhnPvOsYBt4TWrjgN2cG3ArKSXyDsynoA91sGil
 SI+g==
X-Gm-Message-State: AOAM532hc6Cai7g9STJY93pefyLuJUA4snaagVmZJu38LbXtTcnNTMdk
 ROxH4jk7Z8zXRxld+EVh2QKXrw==
X-Google-Smtp-Source: ABdhPJzWhoq5IxlXoewqViPsQr+j3OsNv8CGL1nfG8pRboKmc2mfW4qBGX623OVPEX6PKZr3jnNgVA==
X-Received: by 2002:aca:2402:: with SMTP id n2mr5834214oic.113.1620780242530; 
 Tue, 11 May 2021 17:44:02 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id y191sm2653091oia.50.2021.05.11.17.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:44:02 -0700 (PDT)
Subject: Re: [PATCH 11/12] configure: bump min required GCC to 6.3.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-12-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4224b3ac-ffae-af51-94ac-e2323c63ebdf@linaro.org>
Date: Tue, 11 May 2021 19:43:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-12-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required GCC version.
> 
> Per repology, currently shipping versions are:
> 
>               RHEL-8: 8.3.1
>       Debian Stretch: 6.3.0
>        Debian Buster: 8.3.0
>   openSUSE Leap 15.2: 7.5.0
>     Ubuntu LTS 18.04: 7.5.0
>     Ubuntu LTS 20.04: 9.3.0
>              FreeBSD: 10.3.0
>            Fedora 33: 9.2.0
>            Fedora 34: 11.0.1
>              OpenBSD: 8.4.0
>       macOS HomeBrew: 11.1.0
> 
> With this list Debian Stretch is the constraint at 6.3.0
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Yay!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

