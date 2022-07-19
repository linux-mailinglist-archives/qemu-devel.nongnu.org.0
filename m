Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5279457946F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:44:42 +0200 (CEST)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhuL-0004uU-DJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDht8-0003a5-F0
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:43:27 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhsw-0000Lt-IB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:43:26 -0400
Received: by mail-il1-x12f.google.com with SMTP id c17so6242841ilq.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rUJT0VdbFTfvn34Zi2WL44g+mPOqwLDQSd5jYGk36hg=;
 b=c0avvCOwW7vAEfr3ouB9OqgPakfu0fW03BEsbKbv8tl+uKVGrHJBVCBmB7yg+SyAD4
 hkgaOvqYr2J/qhzh2XoUM8wGWnn/VUoyNwWDsR9g3EIsGcaDjfyTool6JLZBrkzWlgSD
 50BBPjD4/BlVVDU+AoXnuo1cqfa0rwF+VvZCtB/FIDjOsQoGrdqnuT02XpFuBwcvGdkd
 EysC9JS/loYU2+OXPCzl44AM0wcw6oPl2kO0mmWUkiX1rfESItj0pWOeS/tzWnzQXyM4
 hfLR94KUtQC4ARkk7RHYcI2pFbNGp/NXoXttHx7JXRAcB288W7hsBeF+lfxeGlE83zfq
 DBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rUJT0VdbFTfvn34Zi2WL44g+mPOqwLDQSd5jYGk36hg=;
 b=6pWeoHzc+dIyFNNKeYnWvcuqwPnrR1xCiKULkw4PuepmiqtV0Qt3j/5IURNJUNU9Ub
 ax4UEPcpPzJP16vy3egnz2rmgEBPTtBBOC2eUrmhoitFzBc/7hsqkm4iqBWQpdvZp+/f
 o/hbgeuzkIW+UQeE7I3GZa+bEQycQUfC6LzATnb6VdA0izjZ/0QzHwKIEV/cc2dqPYwR
 Qga8YmpvKU/FkL1Vj33ErpawgeO+G03Tx8dwbxVcB+0KcMIkQkWPhzkWkLsuA1YVsSYU
 ayufUalqiq6W0DOf1VswAR7MgSSaypX7OWemGZ0gOUp6OZ/kCM6f4ovALaAg9SyE/iOF
 EhAQ==
X-Gm-Message-State: AJIora909fGaYC3m1BMHpXx5hFv0xiQFDWBrGRDL+teSf/h1DRz45/iZ
 mkvUkGuYG3Km6LicQPvyft7Sog==
X-Google-Smtp-Source: AGRyM1uX0PDlXZxAA/8K7W9xR7O1NlnS0jEL8r4iDL+0miEfAjRzEx6PEPL1nQYxMoBISho4y1KFhg==
X-Received: by 2002:a05:6e02:1c8b:b0:2dc:9d8d:b03c with SMTP id
 w11-20020a056e021c8b00b002dc9d8db03cmr15317140ill.176.1658216592771; 
 Tue, 19 Jul 2022 00:43:12 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a920b11000000b002dcfa2a31aasm892024ilf.47.2022.07.19.00.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:43:12 -0700 (PDT)
Message-ID: <d418bb11-b63e-6539-4e1f-0babcc15066e@linaro.org>
Date: Tue, 19 Jul 2022 13:12:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] hw/loongarch: Add fw_cfg table support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 14:02, Xiaojuan Yang wrote:
> Add fw_cfg table for loongarch virt machine, including memmap table.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/fw_cfg.c       | 33 ++++++++++++++++++++++++++
>   hw/loongarch/fw_cfg.h       | 15 ++++++++++++
>   hw/loongarch/loongson3.c    | 47 ++++++++++++++++++++++++++++++++++++-
>   hw/loongarch/meson.build    |  3 +++
>   include/hw/loongarch/virt.h |  3 +++
>   5 files changed, 100 insertions(+), 1 deletion(-)
>   create mode 100644 hw/loongarch/fw_cfg.c
>   create mode 100644 hw/loongarch/fw_cfg.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

