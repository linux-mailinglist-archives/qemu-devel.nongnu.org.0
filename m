Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C814B51DD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:40:41 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbap-0005iT-LT
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:40:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJan0-0000LY-L2
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:49:10 -0500
Received: from [2a00:1450:4864:20::332] (port=54062
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJamx-0006E1-93
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:49:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id n8so4724016wms.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oie6z+uZx7QvToW8Z5/UTO8GFZuDasPueZW1V1Mc96Y=;
 b=HBRbgvmpRzMX6PIhueWJuZeGDV6tQsLDlLi9r27yCcNHWGJmY2/YxE6eI5YjkGP4ot
 2x47fsrDnDAUM1tCgl9fXKAnDgH7Warb2+bUCIHUkBCMd8t0PMs8m6A+zxLCOIpboN8O
 5b/IkB3IyabVbQHg6m7kABUcim/0Rtjo3u3LkK1Hn3jmyJ51lmazWf+GBArqEisjQgOs
 oKqkQV/hrjRthK+xOls0GC84NaNDHcJo4U3a6Zfrsm3Gm2qOFK4nUId0hXXg7Iz7rolt
 bZsXPc5fy1qpcl2pqIqGe9yVjvlYvlhjilVYbEArylnl1AkWPAc0BKgm/7vyBSzL8tCZ
 zK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oie6z+uZx7QvToW8Z5/UTO8GFZuDasPueZW1V1Mc96Y=;
 b=jq6gZCaRNpmB+PzjpjLb/YoygaqZ8E86cy2JwKNtvKwJ1PLH4AxmtFKRCmOq4EY8xJ
 VXNOyQp+a4eD11m8Twmk3TauGs989/1XrbzgiC02BQOv/x7gRYfBrm1ZtQcetA5g4vj9
 7f8qDHC1Y5Ms0NbVB3xlbNFSAu+MWGVci6xeQPg0Izv2DMLMzooFURsmTw6WjQKr5yCG
 oSNACOkRvj9WSe4K8uyTKEZihIahUuejJuyWV1FzpoPYhtqce1Bl1cjZvPCE2aOUE8QI
 Lv2G94dGi3rJE2haKr+ll7p/Kxv48bxBTxFsRrDIRLrWHySHVuhWmtuqWSFmBIxlOYKa
 /WzQ==
X-Gm-Message-State: AOAM531ta29kaZHRMyfKaMepB8GHCtsBtD6K9S/7xiznlQGZZAqjR9ko
 abtzxRb2kcEBKsUtgF2232Q=
X-Google-Smtp-Source: ABdhPJxJGMkCwNedm9GLeVPUYZ9b4U6FOBIICLVpmeMgFOOUqjhYE+hF7cTfhKVkTwf66gRNL1X+oA==
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr10434093wmq.107.1644842945160; 
 Mon, 14 Feb 2022 04:49:05 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 7sm10393633wrb.43.2022.02.14.04.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:49:04 -0800 (PST)
Message-ID: <5af1437c-37a9-d2bf-6864-010f2ac52d3f@amsat.org>
Date: Mon, 14 Feb 2022 13:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 05/13] hvf: Fix OOB write in RDTSCP instruction decode
Content-Language: en-US
To: Cameron Esfahani <dirty@apple.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Will Cohen <wwcohen@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-6-f4bug@amsat.org>
In-Reply-To: <20220211163434.58423-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Cameron,

On 11/2/22 17:34, Philippe Mathieu-Daudé wrote:
> From: Cameron Esfahani <dirty@apple.com>
> 
> A guest could craft a specific stream of instructions that will have QEMU
> write 0xF9 to inappropriate locations in memory.  Add additional asserts
> to check for this.  Generate a #UD if there are more than 14 prefix bytes.
> 
> Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/i386/hvf/x86_decode.c | 11 +++++++++--
>   target/i386/hvf/x86hvf.c     |  8 ++++++++
>   target/i386/hvf/x86hvf.h     |  1 +
>   3 files changed, 18 insertions(+), 2 deletions(-)

> @@ -1847,7 +1849,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
>   
>   static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
>   {
> -    while (1) {
> +    /* At most 14 prefix bytes. */
> +    for (int i = 0; i < 14; i++) {

Could we have a definition instead of this magic '14' number?

>           /*
>            * REX prefix must come after legacy prefixes.
>            * REX before legacy is ignored.
> @@ -1892,6 +1895,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
>               return;
>           }
>       }
> +    /* Too many prefixes!  Generate #UD. */
> +    hvf_inject_ud(env);
>   }

