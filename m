Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE96495E47
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:19:08 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArwh-0000p2-3L
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArQp-0005Lx-VV; Fri, 21 Jan 2022 05:46:13 -0500
Received: from [2a00:1450:4864:20::334] (port=42878
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArQn-0000dq-JV; Fri, 21 Jan 2022 05:46:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso18117195wmf.1; 
 Fri, 21 Jan 2022 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hv4KceiQSncJiff8liAGXV6aqgb7c3uXX64afYCSwl0=;
 b=Wxs1O+ReiPezc7HUsFKTNpTaC1XdGlO4eVrJ/gqh7gSNE2z9yGZvkP99XvCgvuz5dc
 FXE7OfZiTHVl6P8cwlBLMw6yQjQkzZy2kzygZypjNuAPlLSIek7/HXptzvOG+fINd4uS
 GNKUGv914gzp7IoO1Q8xNxTL2UzBidkDt5akIHAbUGlZN0v7bbyB0dTmz93nLXr8fQT1
 Q71UXfE7QhVpYxooJ3qoWZwg9AdCPFkpPBDxorOfdc1Egir3lcXZ7wv/OC54E7ESPCyo
 XdKfZEkc9U9reTkWStGcRjaqk8AY0QsUCuLqwlu95yOV5ccw3Nx5KSWI824JewXbEHZS
 jFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hv4KceiQSncJiff8liAGXV6aqgb7c3uXX64afYCSwl0=;
 b=Xk3YtLsMeAYeb1HMdppKv/Uc9IyJuYfDaEbvcGQDBcZdEppv+WJxKWafhoQkNJAYZo
 nW3nrdAoA6aHZbY7QhJ1Bx4hThRVTY1l3dJk2eaBo4L9bxco6FjyGo7E5itqEtyB+JbD
 sj8WBwXF1enY0PAzXAsL6iNa3KFQkvtPn3+tOYoNYkWwyCsgQO/mMmPvN39xUWUwsc6n
 TJ7E2WuoAaayNmACKGAllmgfVoiz8vxFiDMwZ+JyBtuYZtlFHcAJ3PEjbF45u1PemhjZ
 m8OTvGNQ2Evl72HE58WmB1Lq88YbXkj+d9y6Pnci4oXX3lzGAA49nFisEJGTokbMCET4
 k9KA==
X-Gm-Message-State: AOAM5326tOPnVwsovp80o/Y90leL1CQJQBlDbOtmZgpB/yausnLX7Px7
 HH+bG5qK7K29DTQvetPu9i7V7z+pQs8=
X-Google-Smtp-Source: ABdhPJzX5sVtjBxs8t3FsKxv6XGSJdp9JKh8uhO/qHvHxNdHIxdD6nYSBtgmH5nUD5UadaHvDn8tEA==
X-Received: by 2002:a05:600c:34c1:: with SMTP id
 d1mr135597wmq.69.1642761967708; 
 Fri, 21 Jan 2022 02:46:07 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i19sm4473892wml.29.2022.01.21.02.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 02:46:07 -0800 (PST)
Message-ID: <132cef67-648a-9789-8fd6-4fb764bfa0da@amsat.org>
Date: Fri, 21 Jan 2022 11:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/8] gitmodules: Correct libvirt-ci URL
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-3-f4bug@amsat.org>
In-Reply-To: <20220121103623.288054-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 1/21/22 11:36, Philippe Mathieu-Daudé wrote:
> Correct the libvirt-ci repository URL to avoid this warning when
> cloning / refreshing the submodule:
> 
>   warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/
> 
> Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitmodules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitmodules b/.gitmodules
> index 84425d87e28..f4b6a9b4012 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -66,4 +66,4 @@
>  	url = https://gitlab.com/qemu-project/vbootrom.git
>  [submodule "tests/lcitool/libvirt-ci"]
>  	path = tests/lcitool/libvirt-ci
> -	url = http://gitlab.com/libvirt/libvirt-ci
> +	url = https://gitlab.com/libvirt/libvirt-ci.git

(The problem is not HTTPS, but the missing '.git')

