Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17504649AF8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eyF-0008Cf-2O; Mon, 12 Dec 2022 04:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ey8-0008B6-0o
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:19:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4ey5-0006Yo-Sw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:19:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so4567996wma.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=uaoxRmYCrB465YH25Qhwozf3ZGBHtWY4NXCayLPef0g=;
 b=V1DW27liOsegRShTOApl1z2Rbo0IgUoopGJUyTdi+Qd9nCIJIEUAlU+JpMrMN++lFW
 FSQddPRkaVZbZ2rRbB2+MPoPa94LGQMPuNZJvpYpHhUCoRqOoA9fWPaXSCtaPFL87ykt
 LMkgltGvWYc9EmV2v9qLLCXNachTVrpLoaV9cZWl5mVC7tYdBOFLWSpgHkICoehnLZy7
 AlFH4DHoQMf4zWxZyBpkwXu3hJDVyWwWKbfWPIj6xcrw8nFVuS2zukCSndIXBhqVY7pG
 sqTvTXsyTLeZIyqtYyJeMkwrtfPOnHl3/5YN/WthFpZw91o2Ab+HW5eoBGCFk/Iee+bv
 5fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uaoxRmYCrB465YH25Qhwozf3ZGBHtWY4NXCayLPef0g=;
 b=NisIAOVJk4Tw7lghrMusfbNo1+yQ99LHrj5fbj4nGpQk2OeKE3jii0Ez1LxXhOO6fY
 RKtumDtbheAVIO2KjoOu4D8zOXtdAqhfws4mKOqmi7juJvUJsXqD6d6qxAdrMTghoO6/
 1swwe3prShaD98dI12ynkDAQNakkYe5bLzDxaXietG8yyIwsxk2ciIyBopjsnSqYcKjH
 DLmqRuZhS+HfePUeFP+JV7hZP02NgfGdL+XJzER6lygpFyC3t3BLLcpd2OCWyCgf/JTS
 uVgFiOqVZS/MAlDEmKHa0tP0YEOtB0Fieclxducz6WhLoaa86bk2kiUMRPIabKPWnOlt
 TfHg==
X-Gm-Message-State: ANoB5pkrLrL8o/5pKHdJQ0mrnW79vdVB+/CG9V0XP1daERTrmsh1VaBF
 jCCxThtq1apZfAO3uQ7cYIs=
X-Google-Smtp-Source: AA0mqf5oPgduIfcdJOYn5Cg/DEG4Y2D0YhzZXtqkLzF5vPOhxwnAAU2yz66kHT6zTUZhgkCaY20AFQ==
X-Received: by 2002:a1c:7504:0:b0:3cf:98e5:f72 with SMTP id
 o4-20020a1c7504000000b003cf98e50f72mr11811052wmc.3.1670836764102; 
 Mon, 12 Dec 2022 01:19:24 -0800 (PST)
Received: from [192.168.2.171] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 p28-20020a1c545c000000b003a84375d0d1sm8551595wmi.44.2022.12.12.01.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:19:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4639a3eb-fd3f-6498-7cdd-fd2c59f097d0@xen.org>
Date: Mon, 12 Dec 2022 09:19:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 02/22] xen: add CONFIG_XENFV_MACHINE and
 CONFIG_XEN_EMU options for Xen emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-3-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The XEN_EMU option will cover core Xen support in target/, which exists
> only for x86 with KVM today but could theoretically also be implemented
> on Arm/Aarch64 and with TCG or other accelerators. It will also cover
> the support for architecture-independent grant table and event channel
> support which will be added in hw/xen/.
> 
> The XENFV_MACHINE option is for the xenfv platform support, which will
> now be used both by XEN_EMU and by real Xen.
> 
> The XEN option remains dependent on the Xen runtime libraries, and covers
> support for real Xen. Some code which currently resides under CONFIG_XEN
> will be moving to CONFIG_XENFV_MACHINE over time.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/Kconfig  | 1 +
>   hw/Kconfig     | 1 +
>   hw/xen/Kconfig | 3 +++
>   meson.build    | 1 +
>   target/Kconfig | 4 ++++
>   5 files changed, 10 insertions(+)
>   create mode 100644 hw/xen/Kconfig
> 

Reviewed-by: Paul Durrant <paul@xen.org>


