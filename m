Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CA242C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 17:42:05 +0200 (CEST)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5stA-000186-RM
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 11:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5ssL-0000JZ-Kp; Wed, 12 Aug 2020 11:41:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5ssK-0004dx-37; Wed, 12 Aug 2020 11:41:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id a5so2467133wrm.6;
 Wed, 12 Aug 2020 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3FPIuuvMyEfQZBUTpAoMERbxb13SLKxf6e7J/aX9J9k=;
 b=alHmLJpm3HU3bu4f6A1OrjZlF1qQiKHIM7EWhbfVLp/za0vC408zk9kbz3Zkl8ErJt
 PW5Zz/geV56T+Mgntwl91+nqEdrY9pm7RbBO7koF5zi9VRcTBTOQ1MtlhLFHD3jL8U3m
 ZCWs3gunjAe7Nmz9Dpc0DpNmQ1teWoylXRsXOTCT3oO5yIyuZFh92TsUjtugrlmvJQkO
 +PM2G2bT39WYU+qmb7MHO90gxt2TTFUUdG2u8a7y1G5rS/oJiK88dofXRWHiwZvdb5K0
 MPporA6FDh73qFMdZSgOsvflX9ymyd9zU1uB7Rv+9fC6wyjh5yo2zzJ3n8bpOUrrLv0E
 0prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3FPIuuvMyEfQZBUTpAoMERbxb13SLKxf6e7J/aX9J9k=;
 b=sEmhoPL7qmbV18oBSOeODN3CYWwTO+ljEbdf6mT9JEpBBuKC8xTkiGesu8I0virmHZ
 yRTqTI+iaZYqSV/Pr2aEbPs3PTdbj4rHhUsydIUoDCLzq+32NzOMgiofK19kQCmXSVrB
 gOlbPiP6qI3eUoqRoRqQr3tkcb9DVdS0A2qqgKytR9ELv+Nc+2PMaKTeglQcYRuoTf3E
 KT720K4ryk6lKnR8R9SseGnvyPmZgzm2bFWuV1G81wtlshZZHjugiKlIyBgH3PRo6bsV
 96Pvtin8qzYHM9lDb0hluTTWFXEyWZFuXy0PKePbt6b2DjPbqoDyJe9ImJLGHCNNDduB
 GEbw==
X-Gm-Message-State: AOAM533MwiYD9lbosolGVFInG35tuF0QolPlx04h6bf2sQ7plaQH6Gio
 WJI7Q2fdoATJayYWGGnALjCHrw5W
X-Google-Smtp-Source: ABdhPJwqjeYu+DDfTL0LIhtzi98s5EuOMEga26NVQb1hbHfo55NhjkvLfDNEvwnvhqui43/+CRd1Xg==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr178464wrr.323.1597246870158; 
 Wed, 12 Aug 2020 08:41:10 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z15sm4849920wrn.89.2020.08.12.08.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 08:41:09 -0700 (PDT)
Subject: Re: [PATCH] mailmap: Add entry for Greg Kurz
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <159724665142.75339.817685642171828648.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee12af77-bf99-b585-f540-532c8e322467@amsat.org>
Date: Wed, 12 Aug 2020 17:41:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <159724665142.75339.817685642171828648.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/20 5:37 PM, Greg Kurz wrote:
> I had stopped using gkurz@linux.vnet.ibm.com a while back already but
> this email address was shutdown last June when I quit IBM. It's about
> time to map it to groug@kaod.org.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  .mailmap |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index 81c2ce09370c..896e2d195d86 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -48,6 +48,7 @@ Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
>  Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>  Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
> +Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>  Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
>  Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


