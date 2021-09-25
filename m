Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3ED418112
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:38:19 +0200 (CEST)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU54U-0007qp-3M
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU52a-0006Jb-Lz
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:36:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU52Z-0005En-Ah
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:36:20 -0400
Received: by mail-wr1-x431.google.com with SMTP id d21so35012810wra.12
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gWSMriqZG+PcZk8smQblJHvml3bi+hF8ny2t5hg+yuw=;
 b=PqRufwcRmUN7KwWGCV6EKbTqszV40GKl1MLRxom6PY80xbdPdfnd+Dgl/5YvX1kZJS
 CXl/qumF/zUZYw5rjGymbk3hLOZ52t7ozYyfLAHb8mAki98yVicCyKVlvrQzPVAN4XBe
 qRyukHQQow05tuZ055SQaNdw3oncPC7RFhkN1BL1pcvAaDv2P/6XSVXOEHULXhwdzYEf
 f+nMrYFt/3rR7vqz/+rJ0lZLBWu5ZqpDl3tm47L7SS85jztixlc4pkKMDEeFl+28cUSd
 t6G6JBfAj7xj9KbY2e1/iTu9qnqEoS2eWq67MH58uJOlbp6YwRsqWGiefVXJOk0n0KJK
 f/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gWSMriqZG+PcZk8smQblJHvml3bi+hF8ny2t5hg+yuw=;
 b=Pj1rhwkF++90qrQYRa1+i8VLE2zyDMbaVUTA4Y90Y3F1B1wqAZKSPWMvBlivLMX2Q8
 Os9scgYeYrGpQblU0Wy/buQBQ5EOOzo/Zm39IJD0OvEHDp4o8YjvbXL2TH/RKzR3Lw5V
 Zf1INJr0hi4DVcSTPmhx6MDd+aYI5xEzXXBLTfyxnT4KHEFrAxi4pfmwlWDRcW5t713G
 72hO3g4ekEXU59ANxos2lbSuqNHLliimlmQm1JDLNiIoui1uAVwV84tXPvQGYZaNk0OV
 4buknlslzRz1Xfbvfc7mFwN53T6IidU8Bbs2ApEp3+kK4G3SFIDnFcTXdgsfMIBzkJaD
 wGzQ==
X-Gm-Message-State: AOAM531dKGdoq8z4wb0l5hmiK4TCYdfsIE5ez4InpTo9d52zrM+YzeKz
 OBEHoh2E86w0sdTuK8NTnWI65Ct5slc=
X-Google-Smtp-Source: ABdhPJxhziHAHxLaeiezvOmbMC8+kry71hxJzD+p0HQZNw/iczKbC42g/t7PddDmvl6FdYKokqSWgQ==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr6908799wrt.105.1632566177585; 
 Sat, 25 Sep 2021 03:36:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n15sm10791022wrg.58.2021.09.25.03.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:36:16 -0700 (PDT)
Message-ID: <36e6097e-2ed6-2eaf-1b30-b197cc4eec7a@amsat.org>
Date: Sat, 25 Sep 2021 12:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 07/14] bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP
 and reorder
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-8-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> All architectures have a ELF_HWCAP, so remove the fallback ifdef.
> Place ELF_HWCAP in the same order as on native FreeBSD.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_elf.h | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

