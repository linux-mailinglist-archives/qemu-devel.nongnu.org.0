Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AB623F12
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4DO-0001qu-Fx; Thu, 10 Nov 2022 04:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4DG-0001lu-8L
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:51:16 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4DD-0001g2-Bb
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:51:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 5so783048wmo.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLmYjIaaYY/WnQSGr15pjyedyV5fzY72IBKJBL51+uI=;
 b=KsQZILA6P9R2aJ6nqrjfyMS26VxnikGhNbfSJbJ4bcqlvUE8nJ29MJ1BnLP1Xa7nlM
 qEgk41v8ZK9oC+MV1SA3DhYQPHYb5hlDwWvJV0AQloBxMV2CqqHjoNozUkCKcAyvWcNZ
 tR2A6Vh/X/RWb4ywJ2hOL3t0filnJ/K20g+QKqeEqT9DQ3yCySYmf32GJOPLDHgcdjwD
 qe+/KBByw7zn8ti5LLlf8f375qNEKlP0Bwoxh4Fds4c+8RVCJgLNiWIyk2xbBaZoMRci
 kAJtYpRvSaVjQd1+5it0y3UdnGIJdcVOo4hkm/DdAn7psGi1gpaPlFLFR2CCTwzb9BaT
 yGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLmYjIaaYY/WnQSGr15pjyedyV5fzY72IBKJBL51+uI=;
 b=pw5fELmTa/YjcCCKB2DVqqtszhqXCZ4pPh98AslmG97+ka8Uv/idMIz1OhoNJfNNtP
 vaZ/OL90WrLoNHdq7SwVVbcWrr2Gjp3Vo3FwCfgWE75Hi127Uu/A5dsSlxSiFYQUBzTM
 QshFIoee2QePpGnNG9xrGVhpAzYSRD2Cx0/mCSSqfnygahko8+3lE1qNmvdO8STPYr9+
 EqFP7jjdldL74ZKxHUIHsAbNbkrfmXVZzUXpw7i2rmTEdLP2lqJq6QkU4v5bIv3o6hVv
 YzhIzW17hrAXUcOuFyf6GFX+phb9nyuE0w/2vjRPwXHPGRbizrtIoTz6q8BWy9Om7zuC
 i0Bw==
X-Gm-Message-State: ANoB5pl8FoGCcjo5aWHDLWB3GBlu/IoCa0AG66Vwxbnq3uPSkabnLoIX
 icRuRQZVPiPQqmv48/0DiZnmmg==
X-Google-Smtp-Source: AA0mqf5CEUpON1eBENtxeWzpj+6hgehnsUfGlYOWTYrwLCJh/XyRRYkY38hH4buTuxoLjSVoDfKgqQ==
X-Received: by 2002:a7b:c385:0:b0:3cf:c908:b1a3 with SMTP id
 s5-20020a7bc385000000b003cfc908b1a3mr825037wmj.129.1668073865709; 
 Thu, 10 Nov 2022 01:51:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003b3365b38f9sm5000743wmo.10.2022.11.10.01.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:51:05 -0800 (PST)
Message-ID: <62a21dca-21d3-08a1-e0ad-6bdfefaa9cc0@linaro.org>
Date: Thu, 10 Nov 2022 10:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221110083626.31899-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110083626.31899-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/22 09:36, Thomas Huth wrote:
> If configuring with "--disable-system --disable-user --enable-guest-agent"
> the linking currently fails with:
> 
> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'
> 
> Let's make sure that we also compile and link the required files if
> the system emulators have not been enabled.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Refine the file list in the util/ folder (as suggested by Philippe)
> 
>   qapi/meson.build  |  2 +-
>   stubs/meson.build |  2 +-
>   util/meson.build  | 20 ++++++++++++--------
>   3 files changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


