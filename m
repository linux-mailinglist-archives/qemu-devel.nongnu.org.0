Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6239A5C5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:31:27 +0200 (CEST)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqFi-00076i-JB
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqDd-0004fH-KZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:29:17 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqDb-0000KP-SM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:29:17 -0400
Received: by mail-lj1-x22c.google.com with SMTP id f12so7927215ljp.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jwWa4zVQVC4AqQKYkmqGE683piihGE4ClEiZnFOkIYU=;
 b=EfJja/ZIslhidBwiG40DMH5M38jqx+QneSy66JX8/eYw+u0/7+ywvd4S/HejUfYh9+
 96eIuPFmTde/spQL69amTa/Lv+ehQgOSIrmtJc2eNC6WI+c7c7mjzy20NUONzaH0CHCb
 wcrR98fkxExTp8kW3ZOjb4THXAGagYdos5LnyBXx0N3+aGXmW0/kON1zsRuQIYwGRjV8
 albcBjImANTuH0nU6lT43OCxWP7TP5DUEhpxvTb9eCfs43lJe/ZiEVNKc1Whrx7pybGz
 M4OWsFLlMbPzJdqDHXzmsSGEI7ZTejlVgo3zjYcpRxOorVpw1C8fpLePOd9SIEnGA1hn
 H50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jwWa4zVQVC4AqQKYkmqGE683piihGE4ClEiZnFOkIYU=;
 b=QzPCWA3Jmt5NjxeK5LcNxjevoAlnkzRAwXSYDrIdgxwzbtByOZmWvrUx+qelu96YzZ
 1In6qhC+VsEGdkRd5N8TbhsBRiNnVWP4GkOWhFybT550ZawJ65eMOT2nRKGD7lOUyYIs
 LX6+T4TwCWe6l9s93s9idQTFDY9jxgPOfWt7lGanBfWbfAHfIjwE666rG2vB6nde2jnl
 6QXlESBejf3B/URpQRFw/R6Or4WP5g9PutUm2wIaEIQs1bQDL6yWTJO1pZn7Bxw8QbJY
 vEWY4sUxswTAgqgvrqqTc+XR42JPgcikAgPue486waJlin16GzAeJync98zFQAfbWcya
 RMUg==
X-Gm-Message-State: AOAM533Tp3ZC01FA9YS8RFGkeEr4/F+9a4Q2zzXO9YkRyXsPzknyU8nt
 hKOxLUXxLMRY/cBhwjLdHus=
X-Google-Smtp-Source: ABdhPJzpDiAFe45J9fRJKYW5pYdxlkLGvRVREf4DdnW0MqlHWDDejYPQQu79P8M/iMu4yod7YmdEgQ==
X-Received: by 2002:a05:651c:1252:: with SMTP id
 h18mr141272ljh.455.1622737753299; 
 Thu, 03 Jun 2021 09:29:13 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e20sm409985ljn.91.2021.06.03.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:29:12 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:29:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/6] target/microblaze: Use the IEC binary prefix
 definitions
Message-ID: <20210603162912.GH477672@toto>
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603090310.2749892-2-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 11:03:05AM +0200, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target/microblaze/mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
> index cc40f275eaf..1481e2769f1 100644
> --- a/target/microblaze/mmu.c
> +++ b/target/microblaze/mmu.c
> @@ -19,14 +19,15 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  
>  static unsigned int tlb_decode_size(unsigned int f)
>  {
>      static const unsigned int sizes[] = {
> -        1 * 1024, 4 * 1024, 16 * 1024, 64 * 1024, 256 * 1024,
> -        1 * 1024 * 1024, 4 * 1024 * 1024, 16 * 1024 * 1024
> +        1 * KiB, 4 * KiB, 16 * KiB, 64 * KiB, 256 * KiB,
> +        1 * MiB, 4 * MiB, 16 * MiB
>      };
>      assert(f < ARRAY_SIZE(sizes));
>      return sizes[f];
> -- 
> 2.26.3
> 

