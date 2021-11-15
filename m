Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7645074C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:40:46 +0100 (CET)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdA5-0004A8-CU
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmd2c-00077L-PR
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:33:03 -0500
Received: from [2a00:1450:4864:20::42f] (port=33301
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmd2a-0004yI-0a
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:33:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d24so31188426wra.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gv+GRH/zad6/AePJlynoonBXrs+i4qtVc7GnfJ02V0=;
 b=Vq/KC1KNx77TWFwV3IyXIfOZ19iwcD5x14sSQbR2m7WF4P21rcz6PUjzTWieOc6kLM
 AbRV0WemrCUU06M11Byv8QcLW7qa6JaSUKSRAlbV6Y8cvOY2+h1xa+i4Gzp3FmArc0lr
 hAtg1vQVfEgriXIxNbbEE9H29LOnmY6nq/9IMVu9PF+IXcIWU0x/pKnGNrHpVkIRV27A
 ngsWTIycfM/yQaU7gbb3i1uKNH5I5WLQA7pXTozHEw6h9mvMofcRsXWKb+toeHxYZEGw
 XtY1nfwB/pOfsHMF7HLhWnfnOwTHMfBmIe8Y6FBoygZsuHsFMFqNxzKvnyqQnWZwxPg4
 hm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gv+GRH/zad6/AePJlynoonBXrs+i4qtVc7GnfJ02V0=;
 b=28S204WlSJQWu45QdmuNeESf1ujG0FSkX2K029ntHlR/DZrRduYt1jIVosR4G8VnYE
 awOPW8+okdsfLxbaB1BSDT7jR5wzDfphgRUtCm+c8W5segFbwfc3OdKfnHz5+VYxMAHh
 J+A1yyrPg/4cFA3QLRkjpKFglv6K9kKSfUS0wij8gpLwtw9WvpvSKDGSdB2lLO+4WgqT
 FblC95F/e0qq3YttKN2gtBNHRfu87l92Zf1meLKqXxv9C1MB61IXbQbDpRz3QlHJj9ok
 G6aG0aJHYThlGBTiKv0BYQvQVsslWo+3TZviRj4tFUxt9AOUC3Iu+rjjEL849SxykvYK
 tFNg==
X-Gm-Message-State: AOAM532voH7g7WyQt5RrXasUrlc6De6T6NDHN/pLtt+qoYswSi1emhMZ
 iEH5Q+oNo1+VsBeQH/KI4yJz0xJ1xyg=
X-Google-Smtp-Source: ABdhPJymy8L8mgRdsDvX4FlexHvK4RN2FR2gNCYj9izBWGjUgBZtbxX2hn2PHYE+iaS0vDV2DDR/9A==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr48045601wrw.78.1636986772213; 
 Mon, 15 Nov 2021 06:32:52 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t4sm19704020wmi.48.2021.11.15.06.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:32:51 -0800 (PST)
Message-ID: <18996176-039f-5d2d-c0de-dc8748660896@amsat.org>
Date: Mon, 15 Nov 2021 15:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab-ci: Split custom-runners.yml in one file per runner
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211115095608.2436223-1-philmd@redhat.com>
 <871r3hxzuz.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <871r3hxzuz.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 15:22, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> To ease maintenance, add the custom-runners/ directory and
>> split custom-runners.yml in 3 files, all included by the
>> current custom-runners.yml:
>>  - ubuntu-18.04-s390x.yml
>>  - ubuntu-20.04-aarch64.yml
>>  - centos-stream-8-x86_64.yml
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Seems reasonable:

This way I can repost the x86/freebsd and mips64el/linux runners
series to share them with mainstream, Warner and Richard.

> Queued to for-6.2/misc-fixes, thanks.

Thanks.

>> ---
>> Based-on: <20211111160501.862396-1-crosa@redhat.com>
>> https://gitlab.com/stsquad/qemu/-/tree/for-6.2/misc-fixes
>> ---
>>  .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
>>  .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
>>  .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
>>  .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
>>  4 files changed, 268 insertions(+), 264 deletions(-)
>>  create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml

