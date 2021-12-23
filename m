Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11247E0B9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:10:59 +0100 (CET)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0K7l-0004P5-V7
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:10:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0K2f-0007t6-HT; Thu, 23 Dec 2021 04:05:44 -0500
Received: from [2a00:1450:4864:20::42b] (port=44980
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0K2b-00067x-R9; Thu, 23 Dec 2021 04:05:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t18so10068207wrg.11;
 Thu, 23 Dec 2021 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zadkxGQ+wjcAxb5kAIl/05p7fuN6dEKapyI4+NBCsrA=;
 b=U+pKywCHZKK2E7piyFDxDF8ex7sw3LsToCpvW8u4RX/4TcCGFIcwoekoK3tq85RGj+
 jSn/o8DLc5hIMOQaUu4VlIuPbeeTCc/euMUkDrttG5unY/UqlmREggevT55p7MgfTe2t
 Rz1Mwap8nFkDpv0i1x4rWou68cc16NwGkuTVdkrrH8eEd93zcfBvMXvUu+GK0ssgS3Rk
 o6G0QrgX6XZfXjVMCxK6YutYCYtzchuXFlK4pKqqhXhXxegeeLeFvZzzbxi0hzVb2KgP
 yMHQhCOlwpTXBNWIQs5Qr1pgArq9zlo5rNqoDvJwthw9hztQOvatu0b8pcCAgBiErjJp
 PZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zadkxGQ+wjcAxb5kAIl/05p7fuN6dEKapyI4+NBCsrA=;
 b=GFYWEEtCJvpg51UfTuYFNzvUyGuPIHoTPm8w5vH1WVCR72TjNNcE+5kq4sIp62fnZn
 jruBAtnEqhx32K5qqKT4+RiWlgLikGb9zEXiJ4ng+vz5FijsIwRd2LZOdyAYNQrc3cKS
 buAKUM+jdD7/7FLp1QW+EEW1iQy3f4mGP6hIs4leqztT3wfVnyigr/U+Pjl+T0CYyUdQ
 K+X7PS4ep1Lx4wJxYGCJMwy843ZPHAEQwUJ/v2kSpJqDCCoQIM2CokpBdX+7xV5vU6gQ
 qSsGQDKN6CDR3lIbG97/wKRlvq4cYxkQTXx0m0dGHoD6Mfio7KhdYLr64PnS3n2fGzrd
 UUSA==
X-Gm-Message-State: AOAM53138X5Ixpem/ZaC+Tt225ZgK9PPdhrgK600JyCB0yCt5ZWQ76cV
 6yhTj+ZEh6i2p/HTw096Bwg=
X-Google-Smtp-Source: ABdhPJwJo9pTxIaU2/SV+nRd/IPJ3081oxnQyZfvA4p+rEpe/4MI9CBI7KCDlHetlFkmmj4IpQ3yAQ==
X-Received: by 2002:adf:dc84:: with SMTP id r4mr1089351wrj.307.1640250334736; 
 Thu, 23 Dec 2021 01:05:34 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id a3sm4881085wri.98.2021.12.23.01.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:05:33 -0800 (PST)
Message-ID: <09f9304c-0ea1-3782-5cc5-574244bfcfe2@amsat.org>
Date: Thu, 23 Dec 2021 07:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/15] ppc: Mark the 'taihu' machine as deprecated
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:36, Cédric Le Goater wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
> except for some external periphery. However, the periphery of the 'taihu'
> machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> been implemented), so there is not much value added by this board. The users
> can use the 'ref405ep' machine to test their PPC405 code instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Message-Id: <20211203164904.290954-2-thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  docs/about/deprecated.rst | 9 +++++++++
>  hw/ppc/ppc405_boards.c    | 1 +
>  2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

