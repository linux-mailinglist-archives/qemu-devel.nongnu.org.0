Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7239679802
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILq-0000tr-7h; Tue, 24 Jan 2023 07:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIJV-0003Tw-L7
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:22:13 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIJU-0006zc-15
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:22:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id q8so11282356wmo.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYe9cnDkxny7Yt6JrjBoQmx21JnrnJY6Fj/n7XowdQ8=;
 b=v+eSKZOGBp7YoopifTAkwiF5BBaCWqtmUqnUSIP7sV39NJG/AoeVkYtvDBBV1uFtu6
 CM7IbbD4cKCPe+COU3aI5v3Q4O+M72yoRy/roOwR0QJheOmdVwmnH/fUe/lE29MYXL4W
 hQz4QCguaUZPnedEO26K9F3sPxdryHHM3XuYQxvw28jrbEM+xKn126NSd7ZKmdhn09M7
 bMs5iGTxnkB5RLasuXDsb3VP4e7nvWntxCgEd7oNEOhY4fKEut0CDMqUXst8de8zW9p7
 YdOBeSjJ74g6UMZgAUawwfJJDlkgINhb4klB8ElrsZiG/vFBT/bop586vYcdwfxbEnnS
 JMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYe9cnDkxny7Yt6JrjBoQmx21JnrnJY6Fj/n7XowdQ8=;
 b=F2jnA4OQK7HSXjPRtBjPJaliZQZnx9v67Unk4XG4J37lx2F8l+MMRCsvUQpmK5ZzAI
 Q/FF25ongPxuTtGPP7PvVDYv2w1uVwR8uEgNdCeCurEVf7QcyEUlahY8C8C2qfPe4SRC
 NJuyJpaAe0n10fR4/JIp+FeSsc79OOU2KP5Sfe3kkBhjHA+cvBrq8HUESCONFvtPbEiL
 cpbqsvo2FYLC6PfJHFEBb1uT3PNO8W+AZhWeB6q/HDSTkG1ROWqlqy4zo5aBuO/ANFn4
 qriScyTDkPF1l4RbaX372yKdsdtveti7zF7Mxx/HNeHS+JJCQGv4TYzZ8AIKMqUxhyiB
 MQbg==
X-Gm-Message-State: AFqh2kpzPHGP0oS72C7/c7E9SV+LD+oRvrhiWRvFAaosXYbzOUKjQyns
 iZwGSAL2j+/SDTl5u6WS/y3GXg==
X-Google-Smtp-Source: AMrXdXsT3QMsgRM95qDXmQ6G3jTpBTPjl2DTTU0g+OFCZty82GhzQy6XRSL30GkGF2+25VI8caY6qQ==
X-Received: by 2002:a05:600c:a29f:b0:3d9:f42c:56c5 with SMTP id
 hu31-20020a05600ca29f00b003d9f42c56c5mr27658854wmb.4.1674562926099; 
 Tue, 24 Jan 2023 04:22:06 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c424800b003daf672a616sm1830235wmm.22.2023.01.24.04.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 04:22:05 -0800 (PST)
Message-ID: <c5644956-0508-f6ba-4eb6-fbde1c6a1814@linaro.org>
Date: Tue, 24 Jan 2023 13:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 08/32] trace: Move HMP commands from monitor/ to trace/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, jasowang@redhat.com,
 jiri@resnulli.us, berrange@redhat.com, thuth@redhat.com,
 quintela@redhat.com, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 kvm@vger.kernel.org, qemu-block@nongnu.org
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-9-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124121946.1139465-9-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/1/23 13:19, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS sections "Human
> Monitor (HMP)" and "QMP" to "Tracing".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/monitor/hmp.h  |   3 +
>   monitor/misc.c         | 119 ---------------------------------
>   trace/trace-hmp-cmds.c | 148 +++++++++++++++++++++++++++++++++++++++++
>   trace/meson.build      |   1 +
>   4 files changed, 152 insertions(+), 119 deletions(-)
>   create mode 100644 trace/trace-hmp-cmds.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


