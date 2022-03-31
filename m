Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27904EE2E5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:48:34 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1ib-0002YE-RH
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:48:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1hm-0001nu-P3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:47:42 -0400
Received: from [2607:f8b0:4864:20::629] (port=44921
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1hl-0008Ag-CD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:47:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id j8so648535pll.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i74ypiR1Flls0DN4CTK6slz0XHBVfS+S/DWoJU+m5rE=;
 b=F2T5HH+ttwqVWiUAPAPUM94rVskwnRJTUyy6JSQBBoMiPsOfjDrhodue0CNC/mlJRH
 ksiEyqOdo3emrJdJhFzuk4Dk3ypCLJhV6jYJvxtpiHHCaASB2hb0OrCt3KhQ3lLDPAeF
 /xSJ7crpWykIRV0XZrdPkenXOoXY/1W3Cs5KJcXQwHstTySHuIbbYzhdDXNDDaJfc+UM
 IfCBxYRiRWLKUaDEzpp4ZEtEm7Zd/oPpztbxDhGeHRen001wEBZnuRoja/Y8gv/CnXyn
 juIhi8oQliGE09qczUnRU0hZ/fl80S0du0ZKTz9EMWDY/9N4WIadSz+BTrESed/c8Mm0
 78ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i74ypiR1Flls0DN4CTK6slz0XHBVfS+S/DWoJU+m5rE=;
 b=5kP3RREWThIdF5V2yc0YXecI/33EXAXIp59Us9i0KM7M+UgkJMPG0RErYPU5fTUXXY
 cM3PxsR/M4Da+wqBXdSU22enWLGZ/V6NEVpUGYElIJHP2k98Eq8gY9dnOUxe34ODWw/i
 ZacgTc9x5QpkJMJ0kVUwxMrsomF2WY6PJUY0DOjviTtLGsspLGZXNTFsvBGjkv/oLWVA
 ucPrh1hC+af3YiB1tOjDLqSE52eW71ZgScCNcLJY0HwWaox2wXGXpurlCW14bvDr912U
 fdPbilkqe/slhnfSoCgqz+yGKvGSc/pslPGOsAiHGeUyF4fjopsu9c7ynfQFIl6FKaYO
 eYYQ==
X-Gm-Message-State: AOAM532FjNbh6SbLY2p9i0ig25XyHKGRrUVXIquJ8HZXtf7obqHFeZvc
 3jZnL7zBJGGv4wLxh0Vnug0=
X-Google-Smtp-Source: ABdhPJyb7gyeIfbKWfFYT5dXB1Qq8/Zq6ohHA3bohkRkUcsY1RngTkgEViKsuuQvJm5s1jqFXFuiBg==
X-Received: by 2002:a17:902:bd95:b0:14f:40ab:270e with SMTP id
 q21-20020a170902bd9500b0014f40ab270emr6967819pls.101.1648759660078; 
 Thu, 31 Mar 2022 13:47:40 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b001c9c3e2a177sm227629pjk.27.2022.03.31.13.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:47:39 -0700 (PDT)
Message-ID: <63d4c9f4-3e7d-e90d-5007-cf665cb88d4c@gmail.com>
Date: Thu, 31 Mar 2022 22:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] i386: firmware parsing and sev setup for -bios loaded
 firmware
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-4-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331083549.749566-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 10:35, Gerd Hoffmann wrote:
> Don't register firmware as rom, not needed (see comment).
> Add x86_firmware_configure() call for proper sev initialization.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>   hw/i386/x86.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

