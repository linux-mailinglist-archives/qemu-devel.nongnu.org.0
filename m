Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A554E3285
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:04:19 +0100 (CET)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQ8Q-0005wm-5X
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:04:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ4P-0002KP-H1
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:00:11 -0400
Received: from [2a00:1450:4864:20::42b] (port=34416
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ4N-0005qf-9j
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:00:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m30so12688679wrb.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ncpKBZPP598khdBrir1e7E7oubTpWBBl0S/QkMCdQm8=;
 b=O/Yh59SSHEYWFebVqXAGO3XruGVSxv2SIsqLFxLvvTUMJCGd9sW6TRmN6Jr7+m65Tf
 l45VmE41CEhxh+Uyd8l5kd669reXxElORTBIaTn4oQc/Xah3HqUpCqJOTVy0dikypWfE
 1wBEt70sRNXPkMtaSFOh/MeQ7N1O4uZKX7o51U0oZj2nAILBCzBFY71iAkdLLMzR8M6I
 HYRSzT1p4gv+NtYTQ53UtndlRAGJWLBYLEHm4IsSSYPNqr56SB/mRDaN7o7b2vWIPWY0
 XhkhNbSnYIvx2elfePzzzaRbLynXtDI6iTSGJV8viYlQ+OlRiUZ0MiBJIgD67bpZZUbD
 qcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ncpKBZPP598khdBrir1e7E7oubTpWBBl0S/QkMCdQm8=;
 b=gXhxdHPLFuUJaImvW/wFKEE3lS7LtlLUwRPjWSW575WOEiThcohS8q9ylDz1/Bp3Ek
 2tMLC/6cek6XgBav9/BKg7LAVyUV7C3Iccubf0AJa7/pnbNxAcBh6N5iRhftJs3E6tzk
 sbK0zSj/W/ZTivHi4mWiJCBYyiZ27BcVcwR3Ka/vH5z3cK40qYx+afrpgUihdCDzmJF/
 HzAaTGNDCtgz7ygauXRpQbkTO3QB+IfyxhGFNHTc/ZzsP8RJQZLv3Fl2FM4msiS0ly/J
 +7zl0yn/dT7PWJwKIRijcNxY5nLIpMLtSdSMNVeSQzjWWNjtD20AucB0KK9uqKrlSl87
 xvBQ==
X-Gm-Message-State: AOAM5315VGfh1l9cn1IZZ5Z8rY/GH3+WEMJYcyaet1ABvzzZIeo13akL
 x0kNNlG6hRn+ZkUw70csndA=
X-Google-Smtp-Source: ABdhPJx7jG091C9FzxaiXH2UT160UhnY+qEiFzDJOFGIFz3vvmPA1MnTrtFHoSDixCoRKvmZ+2pRYw==
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr12512410wrw.12.1647900004887; 
 Mon, 21 Mar 2022 15:00:04 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm580175wmp.44.2022.03.21.15.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:00:04 -0700 (PDT)
Message-ID: <35fee27e-186f-ad15-e3c7-526cbe66dd1e@gmail.com>
Date: Mon, 21 Mar 2022 23:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] ui/cocoa: Create menus in iothread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220321041043.24112-1-akihiko.odaki@gmail.com>
 <20220321041043.24112-3-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321041043.24112-3-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 05:10, Akihiko Odaki wrote:
> Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
> assertion that blk_all_next is called in the main thread. The function
> is called in the following chain:
> - blk_all_next
> - qmp_query_block
> - addRemovableDevicesMenuItems
> - main
> 
> This change moves the menu creation to the iothread. This also changes
> the menu creation procedure to construct the entire menu tree before
> setting to NSApp, which is necessary because a menu set once cannot be
> modified if NSApp is already running.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 59 +++++++++++++++++++++---------------------------------
>   1 file changed, 23 insertions(+), 36 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

