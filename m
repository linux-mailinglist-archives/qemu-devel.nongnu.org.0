Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C830F65C76D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 20:26:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCmuC-0004CM-PB; Tue, 03 Jan 2023 14:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCmuA-0004C5-Eo
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:24:58 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCmu8-0000Bm-Fk
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:24:57 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u9so76602968ejo.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 11:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FgNQDzaIs9nYW9dkQAtkDhkpC4+/ZkgEVKGE/4YsMog=;
 b=AWN7OQ3s2KoYIyYCVLuEEE/l/a3FeSnZBlxgw6zhQoqrXQAOgxNoncE7WdhKbnEaEi
 W5bSdZiKEfgkOqx0ljgG4N0w/NidQ9iLUbUCW/e13OAINeTx6xNBnWgi7qpIzGsCatyp
 rihlZYrd2pDG+JW52BfUare/h1inYTDQJqGECfHhfARgoqqBQvGjkX2d4J3aaw5GfG2e
 d/h8mlaxiYngcs2izNdrt7HFP0DWgwMyYq33uNFtso70sBjSr08ruDI169/EyR7CM84Y
 uVK9tReR93W7n1u0k6KqYoYcETPDS9f6MIveAWEMwizPFCe6d3FenUCMs5tS1xdTybUQ
 6khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FgNQDzaIs9nYW9dkQAtkDhkpC4+/ZkgEVKGE/4YsMog=;
 b=5dZeb+d85GTxFpO16DPU3W942tXIn0x4Z7ysiixjbk8UDqAze8sxuCgFAnX6/FtzdT
 zVA+6tYuZilCVES4TQKY+dOuIpOQ3GBrewLoo7gcBGgmaMqb8z6NXirHB9YusSnPOn7D
 ttKVt2dDBL/r/+8G/JNV7WZZZkbpL0wdg9kwW7xhzvW0lImxCqbzOF9RPCtHVMyJoYgj
 nVZYe0wCBov6w9if2NTUphH2njqBCGaSA7ytpW261+rc8LFDUGkhdJ83yeSF1KFZZvj2
 HJfv8Uca8B7gq2RnhdZ5oBJS8XU5JdUcc2dj0Wg2BhQsYjWhpXtXzTGuNC0D9pbxHwQZ
 UuZA==
X-Gm-Message-State: AFqh2kpzo0UnK1xtKDlwS8GSOAknXNIBeG9dDE1jlAJ1ZJkps+QfXu9Z
 uYoNRvpkKrQliMSg4Ibyi0ksEw==
X-Google-Smtp-Source: AMrXdXvtWdf4FYjX6KIy3sTGcVNLSeYZguZwp4GhKTZUkWft8VQz73IKtmZNlwY6wcSL/9jBVvxAYw==
X-Received: by 2002:a17:907:a809:b0:7c1:27a:d239 with SMTP id
 vo9-20020a170907a80900b007c1027ad239mr37267371ejc.34.1672773894030; 
 Tue, 03 Jan 2023 11:24:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mc4-20020a170906eb4400b0079800b81709sm14428233ejb.219.2023.01.03.11.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 11:24:53 -0800 (PST)
Message-ID: <3035abd2-7ecf-22c2-a5d1-db8090e797da@linaro.org>
Date: Tue, 3 Jan 2023 20:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 26/40] target/arm: Rename 'cpu' to 'acc' in class init
 functions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 19:16, Richard Henderson wrote:
> These were previously left 'misnamed' to minimize the size
> of the patch.  Rename them all in bulk with no other change.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu64.c   |  858 ++++++++++++++--------------
>   target/arm/cpu_tcg.c | 1260 +++++++++++++++++++++---------------------
>   2 files changed, 1059 insertions(+), 1059 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


