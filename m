Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BD17DDD4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 11:44:22 +0100 (CET)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBFtV-0000YF-Qg
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 06:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changbin.du@gmail.com>) id 1jBFse-00008p-Fw
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <changbin.du@gmail.com>) id 1jBFsd-0006sp-G2
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:43:28 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <changbin.du@gmail.com>)
 id 1jBFsd-0006sF-AF
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:43:27 -0400
Received: by mail-pg1-x544.google.com with SMTP id u12so4523080pgb.10
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=NiiIlvZEViI54s3c/Vr0vMUjNjcfQX4XedOFLZ1LmPE=;
 b=KZd/QgM/5c4fkK+0h3Ww+dHt02d3pgaTxevaW/lEOQHlzymUyVcnfl9kVJcwjotKrw
 xuOuV4aMLp06PrTDVxt9qTAW9q+YNYk0tLgl7TG5MLy2ZlowTf26MiuOH+kIByiavjwV
 j38NZrVijjKtVXywQWO65dKcrZXpJGybhmlj5C8BhaMiswuUAeTM07KyvOnwOD+XCc9n
 Aw8W6WnvQeEec+uAsOMcKO9vxNP1ru6mS3vWyO0ZyYuKB2euiDgXDHrPk0jkk/IUhnua
 hrEo9EPG6g7o2trPd795y+MdbsKBEnwr6209bQkZgChNvibQ7GFxKiZQchVi898B+yDt
 TmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NiiIlvZEViI54s3c/Vr0vMUjNjcfQX4XedOFLZ1LmPE=;
 b=LtI6Dt1IdfcvVZEGOuJ+MJoJMpXEngZxAYFbaUaQINtgVAvVPnoG9vPSoHogXh7yqN
 5FB+dWkCZVMbFI2wleDmFmGvqQ3jl4kldrBfOktflYIWoYVuSFB2kaB8Sm0zSkvtG6yv
 LpzvEJI33m69MK+xaLXL3LV3v08tEqV7aNBUNUoXTSVnGXQE+0EYAEPAH2w4ME/l1QJj
 HFSn+NCqjicd4aiRNwK8z/Iumui0oCm58i2tBdh/AxBF0PvLaKjItUdZ5F5zXYHHcynu
 qYlkblXYVJBrJfsguC7uS186NCz9zQHlfmgXahVbOoVYHZyfsvU0c57x5oRM4oIir2m2
 /weA==
X-Gm-Message-State: ANhLgQ2GaVfcavFiQ7ivIzNYXU95yh3dPlq0AI3unikfh08P6ytk4y9q
 mmlqmQcR/yRW6KW620utVMw=
X-Google-Smtp-Source: ADFU+vvBlGcEzy8JIy92ga9xUZfZK+fIrT02y4f4ychmlxe3h8BoqYOGE3LGYIQ9qL9n1ZvHAuhDrQ==
X-Received: by 2002:a65:53cc:: with SMTP id z12mr15125524pgr.399.1583750605834; 
 Mon, 09 Mar 2020 03:43:25 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
 by smtp.gmail.com with ESMTPSA id w2sm44193891pfw.43.2020.03.09.03.43.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 03:43:25 -0700 (PDT)
Date: Mon, 9 Mar 2020 10:43:23 +0000
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v2] gdbstub: Fix single-step issue by confirming
 'vContSupported+' feature to gdb
Message-ID: <20200309104322.u6ktpdl5yjdfcvqa@mail.google.com>
References: <20200221002559.6768-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221002559.6768-1-changbin.du@gmail.com>
User-Agent: NeoMutt/20180716-508-7c9a6d
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hello, is this patch ready to merge now? Thanks!

On Fri, Feb 21, 2020 at 08:25:59AM +0800, Changbin Du wrote:
> Recently when debugging an arm32 system on qemu, I found sometimes the
> single-step command (stepi) is not working. This can be reproduced by
> below steps:
>  1) start qemu-system-arm -s -S .. and wait for gdb connection.
>  2) start gdb and connect to qemu. In my case, gdb gets a wrong value
>     (0x60) for PC, which is an another bug.
>  3) After connected, type 'stepi' and expect it will stop at next ins.
> 
> But, it has never stopped. This because:
>  1) We doesn't report ‘vContSupported’ feature to gdb explicitly and gdb
>     think we do not support it. In this case, gdb use a software breakpoint
>     to emulate single-step.
>  2) Since gdb gets a wrong initial value of PC, then gdb inserts a
>     breakpoint to wrong place (PC+4).
> 
> Not only for the arm target, Philippe has also encountered this on MIPS.
> Probably gdb has different assumption for different architectures.
> 
> Since we do support ‘vContSupported’ query command, so let's tell gdb that
> we support it.
> 
> Before this change, gdb send below 'Z0' packet to implement single-step:
> gdb_handle_packet: Z0,4,4
> 
> After this change, gdb send "vCont;s.." which is expected:
> gdb_handle_packet: vCont?
> put_packet: vCont;c;C;s;S
> gdb_handle_packet: vCont;s:p1.1;c:p1.-1
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> ---
> v2: polish commit message.
> ---
>  gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index ce304ff482..adccd938e2 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2111,7 +2111,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
>          gdb_ctx->s->multiprocess = true;
>      }
>  
> -    pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";multiprocess+");
> +    pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";vContSupported+;multiprocess+");
>      put_packet(gdb_ctx->s, gdb_ctx->str_buf);
>  }
>  
> -- 
> 2.25.0
> 

-- 
Cheers,
Changbin Du

