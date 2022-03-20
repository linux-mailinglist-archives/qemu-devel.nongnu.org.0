Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A64E1E05
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:48:01 +0100 (CET)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3P6-0005fC-FI
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3OA-00050h-Pc
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:47:02 -0400
Received: from [2a00:1450:4864:20::429] (port=41767
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3O9-0004u4-Bm
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:47:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id h23so17825046wrb.8
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mSRDRvFjXeReoLmiwWNqELnPokSYSzPm2A4VJMYv5MI=;
 b=i7tV2wmV+JbLL1S6qle0iB1ZPT6e/PeM3qQKjbkrgaVtPW4i7jS8mpZ+twDs0TSOHW
 tFtegreYNQHQGwzF4a0f0O1VVuByREn/V89ci+ueptS4ZUx3o34DRtx2dfvumox/8onh
 bRGgqQircAKd7Cez52MQHaQatj8GeilB9HdCGaLvkjzaDgej7uxFnVChRmKYlFZ4bdgN
 OPcpaSPe4paRW+lW0VUg6m0eIYUlpEdX5MXUAejYwdNJRDWTwkfKJHVcZZqabuMlJJo8
 rL9THVAPbhsDan9PXpHoImYVF1Y3GlxfxjoHynJAATIe37/Kq325lVsO6iMu/RrLhaZ3
 lZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSRDRvFjXeReoLmiwWNqELnPokSYSzPm2A4VJMYv5MI=;
 b=u8gHP8gLVmaENgH8gA5FHdQE7lsyDTbDJCUVhjbG6UHvnVTKodxVfhLW0vRx8pUixb
 YdRpd3nNXtt7pR3+3UNH6Wvr8yCq/kbZxwtlfhN9+tidJQcTiUx7wLTpRjQljaf+rWa4
 AT8Df5s52ok6PRvhdWqFkf9JfGVD/hPPXOPAgRrdxyUFk93QvXLU4zUvUSFWFMK+fJC6
 cklUG/TLfdIIA4CRcXSHKXtcK1xKqTERxRGCilXvrqbK86yXJTx3aFkl/DmJHXd6HH0N
 6jalr+wjzJL21+/OaoXrgFOV4J9db5WaNPfNOzYTZkcSPXAjYpNN7kGxYk1BopkjYJuI
 9v9w==
X-Gm-Message-State: AOAM531sz9igdhB/QdeH2r8Wp+u7m+3wrldkkU7pArRpzX5VRpC5DvSg
 ZlBVYhKdmxA48P6fpazCFIE=
X-Google-Smtp-Source: ABdhPJw4HuBVko16NV3cNOAKKmCfhzuwcO21mMxd2h8aMLeYCKwJUMxo9Vmn4Uu7Xf/ajSI0+X2E6g==
X-Received: by 2002:adf:f28c:0:b0:1f1:e5e5:28c0 with SMTP id
 k12-20020adff28c000000b001f1e5e528c0mr16179568wro.417.1647812819678; 
 Sun, 20 Mar 2022 14:46:59 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm18845337wmp.13.2022.03.20.14.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:46:59 -0700 (PDT)
Message-ID: <316ad12b-1cd6-b4d0-ad69-fd4759ea67d8@gmail.com>
Date: Sun, 20 Mar 2022 22:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] Create menus in iothread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220307134946.61407-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307134946.61407-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 14:49, Akihiko Odaki wrote:
> ui/cocoa: Create menus in iothread
> 
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
> v2: Separate a change moving create_initial_menus (Peter Maydell)
> 
> Akihiko Odaki (2):
>    ui/cocoa: Move create_initial_menus
>    ui/cocoa: Create menus in iothread

Patch #2 doesn't apply anymore, can you respin?

