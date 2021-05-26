Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC639136D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:10:50 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpYv-0000G7-Vv
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llpXn-0007vq-UN
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:09:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llpXm-0006vZ-5y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:09:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id h3so277817wmq.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ne6HS8RnmscpdQwDMqoIzs2dTuXb4BWwdtpIWdiacms=;
 b=eAFGtsqFUcPnNkfHu1JWIvHAeT26Ju7vIjaV2g+sWP7ciSBesqaidBVQ6hEI2ACUa3
 3Nh7Kzu4pK9eJyb/e71LVkVRI9ikWhk2QgxuCVIS5khGWga8YfCqjGuxoIcx+D6aJhjP
 GKttsmhuNClGivJZdiMSJhX/Gaa2OXkdN+nivpLEmlabDeCUJGT1Weuzy4riDmZbn7AX
 ObKWluCl95fZ1l7ZO/qJ3IzXQs54CmhPTYKq+C4rgySyLCkwuYKd44FHI81p84of0ejs
 0ZRDnAq3QmmxvqY+VcvGAkhoQSP4B68tTnoax5K4utMzBDzO/PZpDwzHWRuKT53SJ0c1
 gw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ne6HS8RnmscpdQwDMqoIzs2dTuXb4BWwdtpIWdiacms=;
 b=VrpaJtteZrK3KAUlz72o061zPexdjBcz4oHeiu6IXtdSbutIsl2sn+T8W0aJci27ea
 dySyOQ/Z9Y/xyQGwaUW7lQaNTO0MpCq22NCNZ0KoqHStKZatCWmBa4f+z1Cv8OP4wigo
 CxBYJ5uV3KSHTT2wORctn1TpO1r1X/HatSgaqgrqCq0PUA5wHzYdeRGsMr0K2ZpeNIMm
 VDnywkAguS3CzYz406tBJS9Wn3arIOkb6IMxGZVq51dxu2aLGIUv9E/pG2n8Rq+JjSCm
 +qRSi9nYWwxVoMWTSiRkhn49cCuzGhvWqPX6VripZ05D48Nz4MvJqzFywBRBtiq90ioa
 6VpQ==
X-Gm-Message-State: AOAM533X5sbSvcyrs7kcs3DRW7uCMv8kxDAo371t0L5vlP2YdN64tZJE
 NhqrZXGwKi/atFE/LOvYulE=
X-Google-Smtp-Source: ABdhPJzgS3C/Wb4Nz+qtKMnimcs/zt9IYSD1dc+JXQFBPKmdGE8tCNb5K0TSjLZvylANFrEDR6INxg==
X-Received: by 2002:a7b:c943:: with SMTP id i3mr27220914wml.182.1622020176800; 
 Wed, 26 May 2021 02:09:36 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 60sm1934401wrq.14.2021.05.26.02.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 02:09:36 -0700 (PDT)
Subject: Re: [PULL 0/3] Net patches
To: peter.maydell@linaro.org
References: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f0ae234-aded-6141-97fe-7affa52ce854@amsat.org>
Date: Wed, 26 May 2021 11:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 10:24 AM, Jason Wang wrote:
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
> 
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
> 
> are available in the git repository at:
> 
>   https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 7ec0d72cd519e569b6d1ef11be770beb67dd0824:
> 
>   tap-bsd: Remove special casing for older OpenBSD releases (2021-05-26 16:20:27 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Brad Smith (1):
>       tap-bsd: Remove special casing for older OpenBSD releases
> 
> Guenter Roeck (1):
>       hw/net/imx_fec: return 0xffff when accessing non-existing PHY
> 
> Laurent Vivier (1):
>       virtio-net: failover: add missing remove_migration_state_change_notifier()
> 
>  hw/net/imx_fec.c    | 8 +++-----
>  hw/net/trace-events | 2 ++
>  hw/net/virtio-net.c | 1 +
>  net/tap-bsd.c       | 8 --------
>  4 files changed, 6 insertions(+), 13 deletions(-)

UTF-8 mojibake in patch 1.

