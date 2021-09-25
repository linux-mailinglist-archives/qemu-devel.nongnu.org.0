Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BF41811F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:50:03 +0200 (CEST)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5Fq-0007sl-SS
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5Cy-0005Qw-62
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:47:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5Cw-0004ch-Py
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:47:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id d6so35031380wrc.11
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E5taq9f+8skwv6btFFK3f47UgjTahdOqnBWaWDb7xIM=;
 b=FzOk/3w0+Ae9jyT9elcwx4KfobhvGU8WgIOGQ93Kdt9sxVLlrMQmyrFa7TSNjn6pwF
 +YbEoC2oVUmA6YBpIIB/AyyVPeppEvy64KyNVz9AfUbL3zyLLobUptig0zNNH98U2olB
 QEYOG4e6DmqlSGdwbySIvU3rZPotgo6CIihUelO8GyZo/jeMhS/L+MJhRxYEca4wQEgr
 NTjiewWJxGsypoxsAuSyMxtA0vgTpGg5jpF8a05sPQL4d3l88miXzRk4xgaaQjUfLf5a
 MMNrTBVEr2U2RsMNSVUJOhxe4T2PSkQ/7HS/jRIB/jEvwO/XKanyNrFMQWS0Dh15ILzl
 tb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E5taq9f+8skwv6btFFK3f47UgjTahdOqnBWaWDb7xIM=;
 b=s8yt5L8Kyb4OYQY8VccQYuQBS9AuDDt162R/a7AqMX6V/ihygGOVuuO4Sp/rJAkv/r
 k/IWOBf+Y+gKqPfYwYdZEDLa8zDyVV9KTmDGbSJw8oZcm0DkHEDFcVICqLGxUOTlwFl8
 kfF1P/riqA9xM785fJfyZ8zjzNZOUqZjZ/AcB+I8spiClQ0jeac3C6AtBct1PM1CuVBa
 os2kvBsxHb7COlmrpZASEpaQImvwxEI+OLIk55zfJ2KPGSvexHF3TGtiC8WVe48IvGus
 /adPLl1c8cB7PboR875t0A7Vpq4egResjtF9SqtbK/LibXVCWmylvcK2WVZJL/a6FMXY
 vFXA==
X-Gm-Message-State: AOAM533nOlF/VGkYyec1Oh7UTlMXrfjeGAJ0REtu9FqYFa2+Tl0pnftm
 XDQwL8KxWhCr3wGyeYASphI=
X-Google-Smtp-Source: ABdhPJxXL879DpMAtXVWcgRNwd4P8z2r1z/4741ok+c9bp4ogtiGl3wwaRThKTE1IKZ6rv2jIoBE+g==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr6602420wml.93.1632566821607;
 Sat, 25 Sep 2021 03:47:01 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c4sm10909156wrt.23.2021.09.25.03.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:47:00 -0700 (PDT)
Message-ID: <0e5165bb-c714-27d5-716c-7bac301c96f8@amsat.org>
Date: Sat, 25 Sep 2021 12:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 13/14] bsd-user: Rename sigqueue to qemu_sigqueue
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-14-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
> To avoid a name clash with FreeBSD's sigqueue data structure in
> signalvar.h, rename sigqueue to qemu_sigqueue. This sturcture
> is currently defined, but unused.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

