Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F02F9BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:14:30 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QcH-0003wv-BS
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QYj-0001ym-2q
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:10:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QYh-0008NF-9S
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:10:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id u14so8897402wmq.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TdWwdNDpUWoaUe/w0t4Iu5/W5MqOg16omDDpCiMaZa8=;
 b=HJxs222g1IDgUvwdjuzogOHTvE27o1i8WicRqq8lR9sLaePBc1QehR2TMuHbOUwnRQ
 +6DDuB51QKDlRg7E7iJan/kkzzJVAP1BicBeHQGqJ4c1u9gmpPmO3DCSLqhEW6gNNuNM
 86f6XVoxmCxWa/tVO3Nic+lteNQMX0ddqfLcj8U9B+rmc3M4G+DMHkcAsEk4FdJTk0Fo
 Az2X6uiAxljOBIXwVWpOlDryn+UYM7uNOt5H129sBNpEwfDknV4RFJWoQoZxVEFMbtPb
 ok9Qv8CPpR8FbZX0kYx5sCNQnve84h3qtfucBWDscmigYIAXACDFFiu2yVCTLa/qZvwC
 0f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TdWwdNDpUWoaUe/w0t4Iu5/W5MqOg16omDDpCiMaZa8=;
 b=OBJSOXnlVQGzIc9i6EIaHKNev7fe7IKLwT+rD67IuN7i/JixMHDhw4YGk2SnNHzVmv
 xIe97rgosMN9UxaM57jxbGjvqA8Qoq9xfLBInedCl6iPthffUvEW1IiEPGi7G/zNcNA2
 baLEONo2kvjTSz9BSMGGzOG5P9sKimOA64dCKwgY7gkS6rYyouZgu9IHEkt553KMa5pp
 brVPJaRltT4GVWvt/eGHi7m9EJKEPA/sT4i7B4w8NsHeNItAdieWC8hiC8uuZaP7niOK
 SULwuDRuO3LHfObEz0LfSP/zhCBDt58WGlz2+Q451lpGz3PZYaBM4U5+Ig7wOc7ZqJeh
 IhvQ==
X-Gm-Message-State: AOAM532FAL01j0N9DqiqPQVk9bxDiObbtrV7B71FsEYDEzLArNnLWsA9
 JdUGrjUiW8tPceZdGtSV/80=
X-Google-Smtp-Source: ABdhPJxl2wXkMVAgdyPy52rNf5+zHgKAdnbm0t7ZfNT4fCDkgvW3CuXYI6tnAmW0wcJxPfPEi1i1+A==
X-Received: by 2002:a1c:984a:: with SMTP id a71mr13114566wme.175.1610961044626; 
 Mon, 18 Jan 2021 01:10:44 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m17sm30593698wrn.0.2021.01.18.01.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:10:43 -0800 (PST)
Subject: Re: [PATCH v3 2/2] hw/mips/loongson3_virt: Add TCG SMP support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
 <20210118011706.22639-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c1f6a50e-d276-c487-141c-31ff65fd8b41@amsat.org>
Date: Mon, 18 Jan 2021 10:10:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118011706.22639-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 2:17 AM, Jiaxun Yang wrote:
> loongson3_virt has KVM SMP support in kenrel.
> This patch adds TCG SMP support by enable IPI controller
> for machine.
> 
> Also add definition about IRQs to enhance readability.
> 
> Note that TCG SMP can only support up to 4 CPUs as we
> didn't implement multi-node support.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/loongson3_bootp.h |  1 +
>  hw/mips/loongson3_virt.c  | 41 ++++++++++++++++++++++++++++++++-------
>  hw/mips/Kconfig           |  1 +
>  3 files changed, 36 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

