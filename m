Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C6558BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 01:30:31 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4WHN-0000XI-Lt
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 19:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4WFg-0008Fu-Vi
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 19:28:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4WFe-0006cj-Q8
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 19:28:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id k7so574657plg.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 16:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=P5yx4X3muUe4gCrwEJlKH2DHWIiaQzQHpNpOh0nj4Ms=;
 b=rtM4syaTtXvG3iIOTCP2IZj0/NbjkTnRYgkfnq/FNCnq7v7H2urdNSGUySArv+dZrF
 KitTGGR/r6u5ORcLEvOV+JLxgoeG2YLNxbe6ufeBV1odBLCn3/NfsePAeMllnsYYoCQo
 9KDBoZyYYfxvDUX5bSACPHDiuV0HPJDZPM7CtmGx7iNU2v9DK3+w3nhUj9WhuujW4j6R
 cmkwceVAdVHIHZ27qTllLAewSLSQ5kQmTH7Pw/BH4QuYCQNx5TXQ5KU06l5FRDIjYBzC
 lHX43IRQK5miPh+Q0LzGXW+flrxuK1+nMxp+glY44G20W9VHdvDobjzszZb3GsMNeJMj
 3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P5yx4X3muUe4gCrwEJlKH2DHWIiaQzQHpNpOh0nj4Ms=;
 b=Czrpl9OTbt4j6UxUn7jA8bO8qV5s4bnYC8vcw0w0WJSK2mQpHvUpexKe6u7qq4S9n0
 x6isuHN1DU2AVRlj/nP2YArvGSm1lUh8ZvTmNV2W2FmPkflpu6VXE7XjN0PcFzFwPtAB
 Gv/uewcakimtrjKejyiZW6gT5IOhO+WMrLXMNcH/TMNW2pomt9meUgdryOvV3tc0zxW9
 qNDiGAdhykU9Hh0TgVZraYlGyPvYC7PWl7CUTXhG9PQu/ezdt6cByAZs0zfACVCe4+d2
 YQ8gMZDm9Y7sIgUqA0dIY8BfzV04AIveaAp3ND88FRecQkYkh+YPH8M6sbcKEYNx4VVd
 bqJg==
X-Gm-Message-State: AJIora+lwEiVuxE3FGG+h0U+VA95Pj6oX6RwgUjTFoorRhvho/5NhFrV
 ZvBRFAsPsozeRkoLDysDbQU+uov7MCfKCg==
X-Google-Smtp-Source: AGRyM1u0Hel9caiBj/4GtWzurlPuleaFYRaFh3G0ns84+ML5Is1Pa5KfJMO3b/wBNgdhjjQsnbzyHA==
X-Received: by 2002:a17:903:291:b0:168:c6b3:1976 with SMTP id
 j17-20020a170903029100b00168c6b31976mr41042422plr.9.1656026921212; 
 Thu, 23 Jun 2022 16:28:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:2a1c:c7:9c03:6173?
 ([2602:ae:1543:f001:2a1c:c7:9c03:6173])
 by smtp.gmail.com with ESMTPSA id
 33-20020a630d61000000b0040d1eb90d67sm153424pgn.93.2022.06.23.16.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 16:28:40 -0700 (PDT)
Message-ID: <f963d3d7-c15a-cca3-7b4f-ce3531a3de4c@linaro.org>
Date: Thu, 23 Jun 2022 16:28:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/15] hw/nvme updates
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20220623213442.67789-1-its@irrelevant.dk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/23/22 14:34, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi,
> 
> The following changes since commit 7db86fe2ed220c196061824e652b94e7a2acbabf:
> 
>    Merge tag 'pull-migration-20220623b' of https://gitlab.com/dagrh/qemu into staging (2022-06-23 10:14:20 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> 
> for you to fetch changes up to 98836e8e012a959ec515c041e4fdd7f2ae87ae16:
> 
>    hw/nvme: clear aen mask on reset (2022-06-23 23:24:29 +0200)
> 
> ----------------------------------------------------------------
> hw/nvme updates
> 
> - sriov functionality
> - odd fixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> 
> Klaus Jensen (3):
>    hw/nvme: clean up CC register write logic
>    Revert "hw/block/nvme: add support for sgl bit bucket descriptor"
>    hw/nvme: clear aen mask on reset
> 
> Lukasz Maniak (4):
>    hw/nvme: Add support for SR-IOV
>    hw/nvme: Add support for Primary Controller Capabilities
>    hw/nvme: Add support for Secondary Controller List
>    docs: Add documentation for SR-IOV and Virtualization Enhancements
> 
> Łukasz Gieryk (8):
>    hw/nvme: Implement the Function Level Reset
>    hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>    hw/nvme: Remove reg_size variable and update BAR0 size calculation
>    hw/nvme: Calculate BAR attributes in a function
>    hw/nvme: Initialize capability structures for primary/secondary
>      controllers
>    hw/nvme: Add support for the Virtualization Management command
>    hw/nvme: Update the initalization place for the AER queue
>    hw/acpi: Make the PCI hot-plug aware of SR-IOV
> 
>   docs/system/devices/nvme.rst |  82 ++++
>   hw/acpi/pcihp.c              |   6 +-
>   hw/nvme/ctrl.c               | 743 ++++++++++++++++++++++++++++++-----
>   hw/nvme/ns.c                 |   2 +-
>   hw/nvme/nvme.h               |  55 ++-
>   hw/nvme/subsys.c             |  75 +++-
>   hw/nvme/trace-events         |   6 +
>   include/block/nvme.h         |  65 +++
>   include/hw/pci/pci_ids.h     |   1 +
>   9 files changed, 933 insertions(+), 102 deletions(-)
> 


