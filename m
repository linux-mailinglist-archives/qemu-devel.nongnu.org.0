Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D26531FB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zPP-0006U9-0E; Wed, 21 Dec 2022 08:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7zPL-0006PL-QU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:45:19 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7zPK-0003IY-3s
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:45:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m14so14969277wrh.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0Q03eWBT73B3O7mkKJpqCgrDq3aGKk+K8/tRYRAMmQ=;
 b=ons0rdplCq7uzMh39OuaWaRPeUjOeeSnNZaDS5AfEM6gr6CzFzqOWeSoR2QtfFI7PS
 KTi1XsKrfn3kaWk7TPYLIU1+t4BFc/x/iCaCnFy2WpIzcZQOj8FXv6pcOgFuj6i5UUAl
 Zpxes+n0H41fBEUxkLb4zfSzkU2Y5EA2j9ZQCesmCZGtBrlfpPH8exbfsFwI4g7dCQUz
 yMHBAzpnk8zyL0GL3ecetZ20SY2y6+aPWl1Xu7naeIlwtgA/+OmLaI+BUcHjIwFCW0Rs
 2dMZLMeafesZ4+fboYmragzE82jFwetdIYry2nwsdTkpA8NLX+7PGpoC0eZMBSRrBE7u
 OfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0Q03eWBT73B3O7mkKJpqCgrDq3aGKk+K8/tRYRAMmQ=;
 b=LHbJNXEqwKeFkYFUxU8L0Y7MBLDyu7/ULz6mf6Gx8NjDq7qCQug9ECu79eglVwdWYc
 ITiE/k8mtxkcelUhuaeOBRZPuiykCz3Tl1RTh7lyPrCDQ6jy8UGXMMTqSlZWY8mPw00s
 MSmX7SL19vm86YZEgaIdHeqAmg7UCJW8je4UZ4VV3D2N1r0ynZ+1QfKPfyCc83xaO07t
 DikXZl0SmjZ3LGs4vrQ7Dd0C815wqLkUa/geVA+ZId+AZRKWftCuzjw9/Q0mhIAW/9N6
 yWNGTxilGlgYJpZcpcFXA306aa9kX6XuPm2iL4OoxmButULGTxih/XuPl/od89kX2jeE
 HjRw==
X-Gm-Message-State: AFqh2kqQd5Lub56CiTj5SF+AWFqHxGo8Gg5DPaykHqSEjULaGtg2SLv0
 78P6p5Rk/AscHri76z66FDJWUw==
X-Google-Smtp-Source: AMrXdXuaQe4sJ/K9+5ClQxdnUY1aWbmTlQ/42jkifzhWUfUD08SQXxmmKFAOHK1f7XwTxEck0xjrZw==
X-Received: by 2002:adf:eb89:0:b0:24f:a289:b422 with SMTP id
 t9-20020adfeb89000000b0024fa289b422mr1166785wrn.16.1671630316166; 
 Wed, 21 Dec 2022 05:45:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b0024207478de3sm15116450wrv.93.2022.12.21.05.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 05:45:15 -0800 (PST)
Message-ID: <8e8dd111-7d1d-0330-ec85-9fcadf98314d@linaro.org>
Date: Wed, 21 Dec 2022 14:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/core/loader: Remove declarations of
 option_rom_has_mr/rom_file_has_mr
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <20221221132310.1485715-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221132310.1485715-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 21/12/22 14:23, Cédric Le Goater wrote:
> These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
> option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish cleanup.
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/loader.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



