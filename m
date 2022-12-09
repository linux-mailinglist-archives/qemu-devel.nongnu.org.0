Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC864839A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eBp-00086Q-MU; Fri, 09 Dec 2022 09:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eBn-00082r-9n
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:17:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eBl-00022F-0D
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:17:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id h12so5316352wrv.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlBH39uho/s6lige9gbj+m8/guN/6qW4QGNMonGWlpo=;
 b=PXp7MP8aTwu73fbEe7sJt1Q22NcBeLoE/oNo2Z/X1EqSANH83+nrANhd4Oqcb6s7mz
 rdhz4wVFOud+ykcBjEne+bKgVGqSz2fCMrK1A3Ll3a/U0rlmUCTuDTyEYWymYURQ1nRS
 QSxIiZiOrnI7K9kqGwVj67AZdPNDvALtGhi7LBnlJ4xzrPPVe1cYpiNLc1mlcjynkiXd
 Cr6UyT/3Ikq+tQpmArroYr4RJkV/nK/A+V10G2xLTs27vtYfWsVvzxkS9WGEsnW8L9/o
 tSZUtNMBdJ79AMxUUDn3p4rkEYmxveWIw/X2gVwiVzJIXiDeg/RvEdeg3baftphn0TR1
 qMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VlBH39uho/s6lige9gbj+m8/guN/6qW4QGNMonGWlpo=;
 b=CGXzJetqeLjvIVHXdfAsh6EzJdgcFgyG9o7NeQ5CK2NcVQWn3x8dzu8b7z/qNIgNo2
 yMLGcuhMnBtxVs2U0vtU40apnKJb1qOjAx1KV+YWTGp4ls73hvgq0/Fiz1Ni+UgKKG21
 FmhAgTfo2+RgDjJEpQZ4uqjoB8xDjzyfGkLEJEhk345JJO87GrIUV7Huuy+0o2pRwUZW
 AeUPWII3ZxQlDMl2bjtE+o2a+5vsuJMZ3wC/4+p9djTqTWbkaSHk5S8xZL3UOM+QsSNK
 5JZP88uwESxHbInIk8XDPzb9rEmFB0WN6mDV7hZRYG73BDlru+E3QE0bU5Kj0CLXJJMR
 /YwA==
X-Gm-Message-State: ANoB5plVxqYIJ45t+Jju6Ggg/CS2N11yAiQBrhz1d/k4muSJ2PaiaMyl
 +WjbkVDjLi8E0p//nTGH50Y+Sg==
X-Google-Smtp-Source: AA0mqf6sfMEfXkAnA/Ur7+rkWODgM4mV/i8Z0V+GGkrHiPNm5WHwXA4blp49juRvnVuQVVucjTWuBQ==
X-Received: by 2002:a05:6000:910:b0:22e:6227:56fc with SMTP id
 bz16-20020a056000091000b0022e622756fcmr4677522wrb.0.1670595439573; 
 Fri, 09 Dec 2022 06:17:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ba17-20020a0560001c1100b0024245e543absm1555408wrb.88.2022.12.09.06.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:17:19 -0800 (PST)
Message-ID: <6a48aed4-3387-2bcc-6c3c-c1e82463873b@linaro.org>
Date: Fri, 9 Dec 2022 15:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 5/5] include/hw/pci: Include hw/pci/pci.h where needed
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209134802.3642942-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 14:48, Markus Armbruster wrote:
> hw/pci/pcie_sriov.h needs PCI_NUM_REGIONS.  Without the previous
> commit, this would close an inclusion loop: hw/pci/pci.h used to
> include hw/pci/pcie.h for PCIExpressDevice, which includes
> pcie_sriov.h for PCIESriovPF, which now includes hw/pci/pci.h for
> PCI_NUM_REGIONS.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/pci/pcie_sriov.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


