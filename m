Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B54D75AC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 15:02:49 +0100 (CET)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTOo5-0008SC-07
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 10:02:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOmN-0007MC-Bc; Sun, 13 Mar 2022 10:01:05 -0400
Received: from [2a00:1450:4864:20::42a] (port=34447
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOmL-00013c-Rx; Sun, 13 Mar 2022 10:01:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j26so20052834wrb.1;
 Sun, 13 Mar 2022 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xulP7VQQdQFDK5ZUzcrp/Wh9VqkHRF6DWDNDmB/uj0Q=;
 b=JglWiXvzR+us1jJz8cYUSDL9UHZiLKDKwg0hqmbA/N9ataXh4utWeNvSTyGxYOsYQI
 FOc0PvYTgfjKix+sUEVQ+1q1CDWS+nm/sdmvvj+ujdaDWEzXloXycOhAm82JuSUw9VkO
 DMABQnwnaNPOmIvbvcgrJ77dxiNPqy6s2cZLPyzB/EHbI8yYc1ZD18ML42os19+piiec
 xQc4pw+wxLXaPh5oD4TQqnZzBy571BKnP05V/wak0HaeaeKWI29at9WpytPjHE2SHx/B
 asY0ERS+MZ2E518L+Warucp5YPFygkZPLVARmMlO4r+EXEiuemvmnLhwefjXkcWjRwl5
 uOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xulP7VQQdQFDK5ZUzcrp/Wh9VqkHRF6DWDNDmB/uj0Q=;
 b=ufmntPi2FzG4ewDYXFoQXOfkleWvKrPqB3PYfoPAPwMmoAULCU5q/g+0MLdJFrDHQd
 AOADItHhpNrexLwqsME9bLzYk2vks6ntMpBZzSjF7Z5QPtfPV68cTMCIwHQoMnyRlJs1
 cAn68/lqYBCOLjhvrgA9XLHg1obt4wcYAf/j8SEwdCKcefJyd4bK3YAkKA9KeaRh/j2X
 UQ4Fy0S+9uAXmBMVvFcOp9D4jbG+vF+PeczeSwFOZcEFYuMWSb4Zc21NRnG5Q95VVB0i
 3MnY4cj6qYFeSoLHJ81wrmOkqIAAy8XLPUEgorjPGRroNKUy5us0hu1MbVixZK8V6+Ti
 l7Mw==
X-Gm-Message-State: AOAM531dYAfzbJTjHMYEFl0VgcXFpOqC963fFHgFuAx9RkxS7+HPUMPu
 IZgqfNX6oISERAR83tEQt20=
X-Google-Smtp-Source: ABdhPJxTBCDlzpn/prIVp4AI0WUieblb3D2NiBNa/auXCbK4EFm05LYRRU7R1bZlTK8dNFP7d5WgtQ==
X-Received: by 2002:a5d:638b:0:b0:203:86e2:e6ef with SMTP id
 p11-20020a5d638b000000b0020386e2e6efmr12651781wru.427.1647180060210; 
 Sun, 13 Mar 2022 07:01:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm18380603wri.0.2022.03.13.07.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 07:00:59 -0700 (PDT)
Message-ID: <a6411611-c82e-80d5-6f62-a34e7b7fcb4a@gmail.com>
Date: Sun, 13 Mar 2022 15:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] ppc/xive2: Make type Xive2EndSource not user creatable
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220311074352.171536-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311074352.171536-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/22 08:43, Cédric Le Goater wrote:
> Xive2EndSource objects can only be instantiated through a Xive2Router
> (PnvXive2).
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>

Reported-by?

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/intc/xive2.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

