Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18342307F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:03:52 +0200 (CEST)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpjD-0001Pa-Qt
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpgK-0006z3-EV
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:00:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpgI-0007An-D5
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9q589kjHGGSIerj9rUi23JYPN2qZk44Tok/zirYo+8=;
 b=FkxfIdfDZWe8tn0u810WQiX90MZuj8IVME/R4OG5V+9PZ1936gGJ1/h+p0mtLv/ub/5HOL
 Thtk8891vx5AlBOHtp8sYOz5ls4VVeCcrbp0/yULs2aXmdjZ35tRtFpMr7+k0AOTxYBn8o
 Brk2PxS5GGMajjTHc/GngxmVOmSxtTY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-22xMdvmLNsW5Tq45ME9eWQ-1; Tue, 05 Oct 2021 15:00:44 -0400
X-MC-Unique: 22xMdvmLNsW5Tq45ME9eWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so78298wrv.12
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z9q589kjHGGSIerj9rUi23JYPN2qZk44Tok/zirYo+8=;
 b=F5RbcFLE1REpRX6uFbPmPT8c8XgcM9sJoT0qWDuxmPci0ilqw1IaYE2suOtlLUPotu
 SJHfI5DBaOnKmGz3dyX15QoCTuXLpFYovB7sYx0kjih2SIPkA8Ekq+FXxisob6MZnqVh
 CqCNq/mwFaCZ96c2pcYxbt+/42WTNMBgzFayjh6GGEhwEcXDpBv+waoq+/8qy00emr1Y
 OhcjRoSL757C0msZMOoNeYUlJhiTRIsy/gi05b853fcT4kT5hVWUFq7q+JYRlejffs1f
 7T+eL7xYG6ndh3e2zNnxMBqALRuTXMBtRJ6M6sKm+ZFGDTs7DJv0hNApsw5LStgNImAt
 wYBA==
X-Gm-Message-State: AOAM532X9hP+BtKrsu3y7GmjmO2m6bU7YMVWUrM6sQQfv8uRCiLTx7Zj
 W31gkWH63SaawZhiDzzsb4u9RyY+icEqMOeAb1IZVg48ISaGggoe3skQKJpDncjnMkokbNCbpQS
 ZPFIETJBoRLEZMdU=
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr39541wri.351.1633460443540;
 Tue, 05 Oct 2021 12:00:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRYGZ2M3HZ/hOnvIM7sJQbZWUfsBM9u7MSs5yrro8tCxN3MtYKJgYFzMvgowfNTUTprqLiWg==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr39523wri.351.1633460443368;
 Tue, 05 Oct 2021 12:00:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l21sm3369820wmg.18.2021.10.05.12.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:00:42 -0700 (PDT)
Message-ID: <2f0c158c-9f1e-0ab6-168d-24ec033931fd@redhat.com>
Date: Tue, 5 Oct 2021 21:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211005182443.2954499-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/5/21 20:24, Alex Bennée wrote:
> This library is only needed for the softmmu targets and as such
> break static *-user builds where libbpf is detected and it tries to
> link it into the user binaries.
> 
> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 60f4f45165..d8bcf13b21 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>  subdir('linux-user')
>  subdir('ebpf')
>  
> -common_ss.add(libbpf)
> +softmmu_ss.add(libbpf)
>  
>  bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> 

Patch already pending on the list:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg834876.html


