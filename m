Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDA1C3E78
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 17:28:17 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVd0y-0000bR-Nf
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVcze-0007i8-4C; Mon, 04 May 2020 11:26:54 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVczd-0003Bo-Af; Mon, 04 May 2020 11:26:53 -0400
Received: by mail-lf1-x142.google.com with SMTP id d25so10100605lfi.11;
 Mon, 04 May 2020 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nywX3wWgBD8NHY1NQ4r9Y3eUlCZ/hpO3KcM4oM5MgpQ=;
 b=qMFDyMFVO+vkX+3lBhbSDOKlrDpcZ9mNVlqwmtJAsrLGpPAtfhvMxzqTo1vAO0O12X
 6zwJO6AalbND7tnTp+I52f0SUB8J8n7U5zZanbHeXjYQLu0c5JqKJBxNjvrsy8WW9eDL
 g8ZFe569nGQsdkpacdRy6iQxq55VMVMEvSgAYD+SxeekxTBLAJ926K0AzlZVmVchiazw
 Fret/eZSpv2iEenEirk9g3rsYElARThYKaWE3Cau6IiGFPsbXhMxuMuM3l5ZgNxSAHg2
 NEovF6ZAuHtmxmgk9+SKVAcAy59DotNbte017HjDeePOdil4yFvTRawdZV/1JFjxysWQ
 eEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nywX3wWgBD8NHY1NQ4r9Y3eUlCZ/hpO3KcM4oM5MgpQ=;
 b=f6VOA0dds0Tj7861i2nkwXHAYgrrB9cdxfrIIIMqqeyLLGFFcyO9w6bocRjDjNtlqC
 0zIZV0HFLAPCzpuaxniSLhOMihUkJSd6gLq1v7dewQlkDu55zOMH1PVze9HEGfK9j8q7
 DAGSwmzh0rqV0IcvHJGOa6yL2UpjXxb5m6sZGV2tCNaMyHTFq7uorPeB32VwYYdbrWrv
 M9rTNuzZTTzVoC0kLv4j0EGK/GSwbhOsHH3fbO8n8UGf1evr63nvaNgEYhs7I4YpPmjN
 fhB6cmiu/vu6BnczRQL0e/DNs3vsiAnzVY7tVtHQ31wHBoGO+bkNqI5EA9N/QLU9cWho
 4xhQ==
X-Gm-Message-State: AGi0PuY0p6n2GYO+1ojmYPamE3gOAm+286Yrv7aPPqQuzHFFgiz1emZZ
 2qmclXENSYmCXI4UzHb9oew=
X-Google-Smtp-Source: APiQypIanoFsv5OsZfWzwVeEDZnhXvqd8ZUxAlfs4estsjKUps743cphgifyyAG1komtqhelLO4lwQ==
X-Received: by 2002:a05:6512:44d:: with SMTP id
 y13mr11744076lfk.118.1588606011212; 
 Mon, 04 May 2020 08:26:51 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j22sm10119079lfg.96.2020.05.04.08.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:26:49 -0700 (PDT)
Date: Mon, 4 May 2020 17:26:49 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v2 07/10] net: cadnece_gem: Update irq_read_clear field
 of designcfg_debug1 reg
Message-ID: <20200504152649.GG5519@toto>
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588601168-27576-8-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588601168-27576-8-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Tong Ho <tong.ho@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 04, 2020 at 07:36:05PM +0530, Sai Pavan Boddu wrote:
> Advertise support of clear-on-read for ISR registers.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 848be3f..9eb72a2 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1344,7 +1344,7 @@ static void gem_reset(DeviceState *d)
>      s->regs[GEM_TXPARTIALSF] = 0x000003ff;
>      s->regs[GEM_RXPARTIALSF] = 0x000003ff;
>      s->regs[GEM_MODID] = s->revision;
> -    s->regs[GEM_DESCONF] = 0x02500111;
> +    s->regs[GEM_DESCONF] = 0x02D00111;
>      s->regs[GEM_DESCONF2] = 0x2ab12800;
>      s->regs[GEM_DESCONF5] = 0x002f2045;
>      s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
> -- 
> 2.7.4
> 

