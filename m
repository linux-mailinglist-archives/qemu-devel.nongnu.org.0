Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC84E7A39
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 19:31:15 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXoiQ-0000tR-AE
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 14:31:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXofz-0000Ap-SH
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:28:43 -0400
Received: from [2a00:1450:4864:20::436] (port=33289
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nXofy-0003bT-8t
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:28:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so10862162wrc.0
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 11:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OxIENoSZ/qMSwpei1UrgyHSUM9mjrF/0WibM68qFank=;
 b=A6uF8KcpT6HeSpb8jT0ae8PVp5XhhnGnRCbxyO6ET0c7vC41BEeD2Sg4XCDZtfh8qe
 f7ejYdn/jaIrwkIPQsUX3cN4ny5RFD0NCP0KQcn2GEEKuZQb91hKpcJmsLKdO410lLWc
 rgYFCCJsdu39h+6tuB58TrMqVKXHs3H9WLsB49tiukxzejcpUBa9zLB7ipUG5SoOKJAb
 nFdpV+eSDh05f0TMvOY5ZA9ZEZxkggT/Zau6qihJE1BcaMedrk+TOZokijdqDAXTB36/
 PE4B0qSAy4Jpccx8HJgYlz5l4LO/9hAWVVGcFWKS2DPKgg6uMtOPI2Bn27jU0ENvqqi7
 pdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OxIENoSZ/qMSwpei1UrgyHSUM9mjrF/0WibM68qFank=;
 b=WgZ2tBHTSjbJNkFFE3xVxzVMwkwsYjY3LiIvZSaE7XQWz/HV+rZIMF5sc1TtxlH8gQ
 6vwnSrC/9D5oRgayZZgGfrQXDul1G7mpuCzp9YB1EVgSUc0ki/XaoJkD/JUC52uVXLdx
 r3kEVzzCnWhafMbyMwe62KQcw5/bB24iEYHBOL1Rfj6ZVtj6HyR5DiDMD8oF7cO+8vQ5
 Mg4cVttIBofEeDoPNWNG+ARdh9GVYVlmCEf95PlfyilcwPoSIZR85Br5+Lj7p3RP0Ev9
 vM4wa4MdGq7MUUmngutcXe6EOa0YSz5Lxy6fER0avfwO9/d0jPO2XxzGRkRYOB1LKC95
 BdJQ==
X-Gm-Message-State: AOAM531KtnzAiESW1gxqt2UzSsFsKGLEHCHA0tIbAx/O1oIT6RXLXEb1
 9UuM/gzJ49CF0ImrnrrX3hc=
X-Google-Smtp-Source: ABdhPJzcb+BGslsSbfhakV+xInwBGtQDB2nKurBei89S3MmqaV01HCuF7lHHOMbNkEeJaVGRZO+D0w==
X-Received: by 2002:a5d:414b:0:b0:205:89b7:91bf with SMTP id
 c11-20020a5d414b000000b0020589b791bfmr10203594wrq.217.1648232919320; 
 Fri, 25 Mar 2022 11:28:39 -0700 (PDT)
Received: from [192.168.2.115] (120.net-94.228.4.isbl.embou.net.
 [94.228.4.120]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm7791234wmq.12.2022.03.25.11.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 11:28:38 -0700 (PDT)
Message-ID: <2c0dc3e6-0a3f-edba-888c-040c441ce359@gmail.com>
Date: Fri, 25 Mar 2022 19:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of
 common x86 base machine type
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
 <20220310080630-mutt-send-email-mst@kernel.org>
 <a0c367ee-360e-6907-d4bb-3e1c865cc640@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <a0c367ee-360e-6907-d4bb-3e1c865cc640@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/3/22 04:45, Xiaoyao Li wrote:
> On 3/10/2022 9:07 PM, Michael S. Tsirkin wrote:
>> On Thu, Mar 10, 2022 at 08:28:09PM +0800, Xiaoyao Li wrote:
>>> For PIT, it's straightforward to merge microvm::pit and
>>> pc_machine::pit_enabled into x86ms::pit
>>>
>>> For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
>>> ability to dis-/en-able PIC and it's the preparation for future TDX
>>> support.
>>
>>
>> Looks ok but we are in freeze. I will tag this but pls do ping me
>> after the release to make sure it's not lost. Thanks!
> 
> Michael,
> 
> Do we need to wait until final 7.0.0 release, or rc1 is enough?

We only accept bugfixes until the release, and your series is not fixing
a bug, so yes, until the "final" (non-candidate) release tag.

