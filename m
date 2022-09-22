Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CA5E61B2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:48:16 +0200 (CEST)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKgg-0007rW-KQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqK-0004Mo-PN; Thu, 22 Sep 2022 06:54:08 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqI-00055z-GU; Thu, 22 Sep 2022 06:54:07 -0400
Received: by mail-pf1-x432.google.com with SMTP id v186so986894pfv.11;
 Thu, 22 Sep 2022 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=tyKFwsWpgRu5AG5U/noiod2ew/AgWpc7KZUbCbAwZ4I=;
 b=ohsWQ2WrfM2mQMrTDZB77oiPIMB1vTGHL/7x+5lGdVm7GgN9LMmCDup6oBwwuikSQd
 gf36QR6YS6sUTYGlEHL19MkxFmBrzxPNYkBYrg4vVYpBmDqR3dhrlWdO64bt64tTFOdZ
 mZMM9VLa0Mh1RE586oh6yIv+N3UMldgjRYJCMidIuEo/goEIH7DXN8Is3HjpUggEvytl
 ouExGRxHppkhDDOZjg5IPMP9i2HZWtPIhTxT8tplaMLng7dYgSnPqyN/3XwUrKhQHGDF
 zz0qtJq5k+bBdiqeDCYY+/VvHlPMyydT8CFoc2rVK+V0FlcccK0z6nRIWmYXOREJby/9
 8JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=tyKFwsWpgRu5AG5U/noiod2ew/AgWpc7KZUbCbAwZ4I=;
 b=NJ9PHhb/fwAy3V/rSleIMg+RExGVyMJmZSMwa96Dz3lzV4OY6DWUGkmCC8ZNNSeaAF
 c4/dmU43xA2w3WRmXpCOV6YiF67KYjOILdK3n6WaXhOfNYgpA7MwmOA3H+hnTWBTQQtq
 FScEEV+2uc7ED2y6Rg/uRAXV5t2oUiGy7apQiUUIR/rUF8Q65ddmkCmTe01uDbigRXo3
 7cPn/P8z3G3OarptHLP+nEUAiPlpJfxVdB8w0/LB1NMvOLJ/otAhPi/AKu1c5rEkliKh
 u0JTH760eEw0tT5vmbMazlpcoefRNzWxF0n8cRJTz7QTw94j858mR+tKey5stRmg+jeQ
 Hrng==
X-Gm-Message-State: ACrzQf3sWmodKG/5FqdyVLEsNP95d07M0rNwU/YPj4n0nK9e5bj8dHSs
 XsHQwahk+f/e2JcYNCTZOT4=
X-Google-Smtp-Source: AMsMyM7bh3L3Qlb3TEVjQRT5SBKRJzuHrKTIeu7pVI5O+trep2mu4+Q4NMw6RyzlwIVv/wunhIbeOA==
X-Received: by 2002:a05:6a00:1889:b0:540:acee:29e4 with SMTP id
 x9-20020a056a00188900b00540acee29e4mr3050527pfh.49.1663844044657; 
 Thu, 22 Sep 2022 03:54:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f71200b00176b0dec886sm3717762plo.58.2022.09.22.03.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:54:03 -0700 (PDT)
Message-ID: <bbcf3335-6d4b-36ef-7e1e-9e3ba68d2173@amsat.org>
Date: Thu, 22 Sep 2022 12:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 07/14] hw/ppc: set machine->fdt in
 xilinx_load_device_tree()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-8-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-8-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the
> virtex_ml507 machine.
> 
> Setting machine->fdt requires a MachineState pointer to be used inside
> xilinx_load_device_tree(). Let's change the function to receive this
> pointer from the caller. kernel_cmdline' can be retrieved directly from
> the 'machine' pointer. 'ramsize' wasn't being used so can be removed.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/virtex_ml507.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

