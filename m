Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA23ADF91
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 19:14:00 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv11D-0004D9-Gr
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 13:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lv10Q-0003XC-Rl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 13:13:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lv10O-0001eF-2D
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 13:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624209186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gx9qhNtRmYbQR8wArgqOF6QnaRAMmsl7jLt/TM1xhQk=;
 b=K4uC18RaWX6u9rM/uu8f+XAXLTr3FZDMSmSXTLEQ0biSdPS0IpIApyEv64qEfx6mUeYTTx
 GrO2gd6a9jXRULvJstTpuVYCltvzbrrip3rWoxIns5oM8pZ8LOTj7iNc85ib5yQ7GJ+dyz
 RvKV+KIKQVRmcOJY9P0isJzaEGF/Ezw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-OMck_nHVP7CAp3GBa2Hncw-1; Sun, 20 Jun 2021 13:12:53 -0400
X-MC-Unique: OMck_nHVP7CAp3GBa2Hncw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so7419079wri.20
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 10:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gx9qhNtRmYbQR8wArgqOF6QnaRAMmsl7jLt/TM1xhQk=;
 b=ZReYlF3/XsHhw5aOVX9nhLGwgyK5jccf+VRNkoLO2hfCwahSvyOUegYcDWgRyzLWzO
 JZodgw57XoPDKZkN+jF1YjjpopgoPPMMMxYSWDcAvns5RQCQY9gBHuxXSISEzM1bTxG1
 K/Ckv9pM/d4WV4bvHNyQfXE0T3UI+Rj73U3IgCg6OCls9p9D71zuoSgJPM/PXzzIpvUO
 AixgOvEeYPGdf4sMr5mEZPXKwmLqQScadJ7IdzepYbBZFyzH8z6urOad9IpG06bvzdGi
 LIUp1mOr3yGv3+M6MI+nqOynXUWTJSKmRur07giGeqBA3tf7Lgrhbmuj1dmc85L+EpBA
 a4cA==
X-Gm-Message-State: AOAM533tnzD6DjWgBaD0XpSRLvH6aftOpBq5tOFtjS33fswVQxpVdaKl
 /dGUaA0zl4Abl469GnD5QlGW8pRoaDhrpkMZq9k0UYbUcYUHKktSojgeU0ZDqzXj1yZlGdpF9yG
 j57iVG8kVzs9Aztc=
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr6495980wrx.122.1624209172022; 
 Sun, 20 Jun 2021 10:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO7bBDpjV672tIWHlIY5RyQnOD1UPySnYr7ycPdaYAqK+xdL2ZB7Q9pdxWyCzhj5Ka0quNtg==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr6495967wrx.122.1624209171798; 
 Sun, 20 Jun 2021 10:12:51 -0700 (PDT)
Received: from thuth.remote.csb (pd957575f.dip0.t-ipconnect.de. [217.87.87.95])
 by smtp.gmail.com with ESMTPSA id v18sm5993950wrv.24.2021.06.20.10.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jun 2021 10:12:49 -0700 (PDT)
Subject: Re: [PATCH] Update documentation to refer to new location for issues
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210619154253.553446-1-sw@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f2f377c2-08ee-7a48-85dc-14968b7b624a@redhat.com>
Date: Sun, 20 Jun 2021 19:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619154253.553446-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 19/06/2021 17.42, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Another update is needed for scripts/show-fixed-bugs.sh.

Don't worry about that script, I'll remove it after the next release (v6.1) 
has been done. The script is then hopefully not necessary anymore thanks to 
the possibility to close bugs automatically on commit in GitLab.

> diff --git a/.github/lockdown.yml b/.github/lockdown.yml
> index 07fc2f31ee..d3546bd2bc 100644
> --- a/.github/lockdown.yml
> +++ b/.github/lockdown.yml
> @@ -14,11 +14,11 @@ issues:
>       at https://gitlab.com/qemu-project/qemu.git.
>       The project does not process issues filed on GitHub.
>   
> -    The project issues are tracked on Launchpad:
> -    https://bugs.launchpad.net/qemu
> +    The project issues are tracked on GitLab:
> +    https://gitlab.com/qemu-project/qemu/-/issues
>   
>       QEMU welcomes bug report contributions. You can file new ones on:
> -    https://bugs.launchpad.net/qemu/+filebug
> +    https://gitlab.com/qemu-project/qemu/-/issues/new
>   
>   pulls:
>     comment: |
> diff --git a/README.rst b/README.rst
> index a92c7394b7..79b19f1481 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -131,16 +131,16 @@ will be tagged as my-feature-v2.
>   Bug reporting
>   =============
>   
> -The QEMU project uses Launchpad as its primary upstream bug tracker. Bugs
> +The QEMU project uses GitLab issues to track bugs. Bugs
>   found when running code built from QEMU git or upstream released sources
>   should be reported via:
>   
> -* `<https://bugs.launchpad.net/qemu/>`_
> +* `<https://gitlab.com/qemu-project/qemu/-/issues>`_
>   
>   If using QEMU via an operating system vendor pre-built binary package, it
>   is preferable to report bugs to the vendor's own bug tracker first. If
>   the bug is also known to affect latest upstream code, it can also be
> -reported via launchpad.
> +reported via GitLab.

Reviewed-by: Thomas Huth <thuth@redhat.com>


