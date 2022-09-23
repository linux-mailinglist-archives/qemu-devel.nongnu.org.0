Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0915E7D89
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 16:49:47 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objzu-00033n-Is
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 10:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1objwU-0001Um-0r
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:46:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1objwR-0006jP-Ft
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:46:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id cc5so349451wrb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=5dKyLNAFPtIfqdPRxJaoTYKZE22uPEk/oKvtZ7XZNlw=;
 b=aHUmLESOnd6l5fs1LbJ7b58jWIGTGrZl1zlxag2mItvwsAPmb2fI82iPWXjJssLr5x
 DFeqNib4sBFuDCdHwnwzYPM/ih4K4da1t7mRHYOstLV4GzuLchrsbcx5jaU+lESyWkX8
 GuisRZErGcTLprnN9X1svgif8XRgaVRaek+sOySR7PABgDBVLzxBc/UhGxRjNiqvm7k5
 JyDGSgi0Al6X1EswaPKjGFHbD5qYen4TNBGxHaeiWmV+oATxlKGyI6nppJBK0SEGNq1F
 ZjbgAbef9oEI4ifu3yEemaEo3muQhmFjz4cHUt9EIqo7+jNVbonThkJ0hjwdKNkWG8Sr
 daNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=5dKyLNAFPtIfqdPRxJaoTYKZE22uPEk/oKvtZ7XZNlw=;
 b=ymV+gKxcr/S0t2DPGd/mYWrgSms4GJm7AHv6eauNb0a37kB3X00sEmQtfBi08RJW1F
 ftiqQdnXHBwDm7lShe3tnhh2843b+ooypw37rGMraig85mo8iZ9NIC0hr/P6i2/EsP8d
 VkVAFRZv7X3DRBtIrv04qTGp9j6WJkLD5vmGs500WFoJlz6sPZHheYnsdpnZVcn3viMZ
 lErmTgj/+MM7CovBgQEzDJ/aTPjjzUGtkefprL7fgNLTn89zxHJfij20j8VamVOWOLcB
 fagViu1XvMJohGj8/++5p/QHJ7U/NRWeD6ytG3izOLj3g096x/Pll/MTkEQ6qA5Xp0La
 letQ==
X-Gm-Message-State: ACrzQf14idF8paqv5hmtKinB4dW7/B4yxVbEMwQ/0KqSUUJlcPB8rHdQ
 2QvjovSUmjyqWVyt5ItTPXs=
X-Google-Smtp-Source: AMsMyM644IWpNcCUyKNNjeR1BeZbOK+8PjEujJrEDKRnHF6/c7RyzMJjqy6Btsawj0Q+mEyuBilvoA==
X-Received: by 2002:a5d:5591:0:b0:22a:e401:2052 with SMTP id
 i17-20020a5d5591000000b0022ae4012052mr5586519wrv.435.1663944367742; 
 Fri, 23 Sep 2022 07:46:07 -0700 (PDT)
Received: from [192.168.18.134] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b00228d7078c4esm7802940wrb.4.2022.09.23.07.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:46:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b500092c-a711-9ff3-b752-ce4a0b114727@xen.org>
Date: Fri, 23 Sep 2022 15:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
 <DS7PR12MB60068137A02E32BE77526E439B4F9@DS7PR12MB6006.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <DS7PR12MB60068137A02E32BE77526E439B4F9@DS7PR12MB6006.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/09/2022 02:19, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> Hi Paul and AFAIK:

^^^ you mean Anthony :-)

> 
> Thanks for your help.
> When could we see this patch on the master branch? 😊
> Our project urgently needs this solution.
> 

Anthony? Ping?

   Paul


