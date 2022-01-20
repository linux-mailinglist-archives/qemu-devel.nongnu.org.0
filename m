Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F09494FF6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:17:59 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYGE-0000ir-8A
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVPQ-0004IY-TX; Thu, 20 Jan 2022 06:15:18 -0500
Received: from [2a00:1450:4864:20::334] (port=51949
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVPO-0003dz-0D; Thu, 20 Jan 2022 06:15:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id c2so11336881wml.1;
 Thu, 20 Jan 2022 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6m5nAgBV2xF6JLtlguil1om9ST5mwpD9R/+c9I3TmxA=;
 b=lz4/fotbYEHLMQRh+g3KBKzZVKPZqSpfodjC60S5rriMYT07DbyNOa4HGFyFm5E459
 j/w9IDtAdJQilBxfcCv4MzwQmpsFCk3w1lBLkePwmEd0uaONXiBpCIWiyL/PtPQNl2bX
 oQw7Zje2DJ+z4QHblx5Q+eenJbjG4Bb+DWljvD4bXL3sFAPesnZMT4DUZdOse/qg6Twp
 VqVesb2TmlLXkuEJ1xW7yekz2syeLMcaR0r05LeP177G4cOjeDR2zzpxTpjPHgaqySel
 Uw5G+VF1MT8L+h1SytUzaqZhI71xAFm0UDV6OJ0xLMSsJ3/ebdIbW0SB/sGC11ptDuAy
 eQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6m5nAgBV2xF6JLtlguil1om9ST5mwpD9R/+c9I3TmxA=;
 b=dH2Uz74O/Abd8GOpZeJzdrok4xt5r0J18hhBwvJKUpgKKr9nwTbw0dlizN6uvacAlI
 1bwkrmeJ/uaQRYQOZbYCi4q93S1WL5FuyEKrCiesQ5VRhxcyqJVKEP+orY1dyRNjmDqn
 x9FZH1tDjkjCdTv6he1oOnT2R+5EFrKQvunFBWi1t+i0gpBAVk8sEzre1eMmDC4jml2z
 q6Ld3sDHYHtTgNnNwwUbHxukZb3nQr3ZGiC7fCoC6MEX/vIXkpQFdKiosAIpllXapo0r
 fq3Teu8jNkEhssWYTB70RWWVCdCNDc08m485DyHRPOrCYgdnpxTkistREpNu8Z00u7Mq
 psvw==
X-Gm-Message-State: AOAM532pw7FkSx4D6sXZfkZTy+i0BPvai+PZxJssq9+wlqVJEy8qypOx
 AfFjmEzxBhCsf1oiJ1fOlQ4pz++q/WU=
X-Google-Smtp-Source: ABdhPJydwMKN64h3SEW1cQbUUuSqf63quZlLikoWIVI72ibSs8Rl+mExfDF5GkUt65yu4Lru2kzu2A==
X-Received: by 2002:a1c:2b07:: with SMTP id r7mr7705513wmr.27.1642677311947;
 Thu, 20 Jan 2022 03:15:11 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m19sm2247856wmq.6.2022.01.20.03.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 03:15:11 -0800 (PST)
Message-ID: <b4748f94-a63d-f916-3a32-bb905fe9350d@amsat.org>
Date: Thu, 20 Jan 2022 12:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] tests/lcitool: Remove libxml2
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-6-f4bug@amsat.org>
In-Reply-To: <20220120110545.263404-6-f4bug@amsat.org>
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

On 1/20/22 12:05, Philippe Mathieu-Daudé wrote:
> The previous commit removed all uses of libxml2.

Here I will amend:

  Update lcitool's qemu.yml and refresh the generated files by running:

    $ make lcitool-refresh

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/docker/dockerfiles/alpine.docker        | 1 -
>  tests/docker/dockerfiles/centos8.docker       | 1 -
>  tests/docker/dockerfiles/fedora.docker        | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
>  tests/lcitool/projects/qemu.yml               | 1 -
>  7 files changed, 7 deletions(-)

