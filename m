Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC82638B30
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYn7-0004jk-6o; Fri, 25 Nov 2022 08:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYn4-0004jO-PW
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:30:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYn3-0003zE-B7
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:30:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id z4so6801689wrr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vzm2pUEATFAs6Vw6OW8+YLMC8EhweAAPxvJCmOgA4v0=;
 b=SfmWUJFBOA3RqpQ/00aa2INPIZGm1i17Ore6U5qIenuY0PGOxePoVQvec8P3TioZeT
 uhwSlTV4vQFxDMCnLUKkKTmu79KHuWStpiUSMTXTsTLByDQoJhRW3rhos1+OW7XHB82Q
 76Ji0wVYzGwyr9HRdj4kvieb8y7t5wI7vbBaMVxgMGksBZwRU8J2WCf1/PYCbsZy5+uR
 GTmgIp1X9H8SGQ08MP2sRjU8UTVxjvqJuBYL570xYrni1MHPqgMyF0DLUDgdY9ACYdKl
 dqdC1sUhUaPz/l5hpQsw7xrM3f2BW6oGPYFbxrUrwQgr8sW89h1UA9ymejAgSDsmwsYV
 lk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vzm2pUEATFAs6Vw6OW8+YLMC8EhweAAPxvJCmOgA4v0=;
 b=kmOBt35bcEcyz+mMnv0I3cZbPymSWLVNlG2bpK9qwKb7euHQNTkUfUNaCMBUkB6V6R
 iYcCYChtMrPOTQQM+YUf4AbHV39qbJ0uxrZhFHzjLESo2Pz+NaQrydc1M3El+4DE99sW
 kAwpHvmJ6R1h0OPTHoAwA+Mz8t+iMegtfhkDMZne536nkjW9LP8XoNO8KilrmcqLPgK5
 URLxXlZ4jqwz/zDnjnl4q2nxRvgOdzqmgNZkyAyM2QGnfO3Gm2XUjwbwayvhlMIRLHum
 j5LzGCTLNAicwKvXpitEpCsU7W7UqjYL1Xfo2YCLgGZpd4Ji/i9sMk+MFroMvLoydH+M
 J/+w==
X-Gm-Message-State: ANoB5pnFiTJ3P1Zvl/5pecJOgJBU/+EO4Tw0qXJTbxmxylcHHucxqZEe
 paPUXgytNcBmmGCWvRGTbeq0Ww==
X-Google-Smtp-Source: AA0mqf5v4KBHhH9GPilt/nxnFgZOjxnxX04+lze4boeXf3el16HTVp1egXbzo3BRyjSQFm24dBygaA==
X-Received: by 2002:adf:e712:0:b0:241:d309:8e0c with SMTP id
 c18-20020adfe712000000b00241d3098e0cmr15854383wrm.547.1669383047549; 
 Fri, 25 Nov 2022 05:30:47 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d4a89000000b00241fde8fe04sm3810671wrq.7.2022.11.25.05.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:30:47 -0800 (PST)
Message-ID: <122e676d-a02c-a163-9eb6-06dbe4e8a213@linaro.org>
Date: Fri, 25 Nov 2022 14:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 1/7] hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 25/11/22 12:52, Peter Maydell wrote:
> Convert the TYPE_VIRTIO_PCI class to 3-phase reset.  This is
> necessary so that we can convert the subclass TYPE_VIRTIO_VGA_BASE
> also to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/virtio/virtio-pci.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


