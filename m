Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C73B80DF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:34:27 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXY1-0008Ev-TF
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyXXC-0007Vh-46
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:33:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyXXA-0001qv-B2
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:33:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m9-20020a05600c3b09b02901f246b43bbeso1174988wms.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YpQroA/gKf5BXuL7udI3DQdjL1uFkkcPPP0ti6im2NQ=;
 b=RlAuGwcpVOPqflyti4FrQlC7MQqTnFmLFgue3Ti1UM+46BXgswSK5xSmbwzMT+RDKs
 edFQdriX5Sri3YANJGFMbi4UQWcHoQLXvMWBaYmOnT8g2Mt5+a0+sIcUTjWBYBcF/Hhf
 nEMD9K/pqI1iPvJ+eZnuWus+uCG3IF36/VpBIVi2aANDZFP1dCYNz3MZZYZd8olfmFPB
 WYW3UIJKU29DhBRUsSj+rzbzDXQ92zZ0WlWwgy93nR/YN85kxZATaDlMQfNUc+lcQ3AA
 DgNfebc1vz4Lm5zqsjbMoznXykgRaCuDeGsHEuxzGq7MgVGfFiKNZ41Gro0m27rNf15+
 sKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YpQroA/gKf5BXuL7udI3DQdjL1uFkkcPPP0ti6im2NQ=;
 b=Smv2hgBGqfnPrIgXPdG6bS8PhHkBqpbLMciYamM+kvMJ1Cnlehyrq2AzFGsGZnGV6+
 ViMc6c5Zz8OykClcSe7OeNEo5eB22cm1y2+sZo/gD5QZZ2PpfNbzTXkWDR+vTK0rxnZf
 Y0LE1JBHY5QUNCKpHThRnX9IhgnOA1jLW9utw9UzwKWaJSd0rsy8RkwCeWarF2vxPGP4
 Dv05LqHiC7Q6ISGw8HPKscNFgqU819w/R6gjOecOjZqKzCCM/nMon4vewDZ2zhlBerBR
 XDh+pxDzAj/p1PZPAetzgfmSFKsziPf0ZjiOLQKdtTSDtAN5pnzO7yKTC2YuHXyXScRj
 ryqw==
X-Gm-Message-State: AOAM533+D00G+81ruzHgLs0Htmr/9FvoX5m+zXgqP0QHW290JQ81gDcb
 YpwXO2duhKbrzqKvZmy0MUA=
X-Google-Smtp-Source: ABdhPJwpIJnA/+lUdg3okL4tzH6pY2Lap2PAyGAsmeIMsWQyUfODqAL8D2iKgjubVrN3UfTeQpka1A==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr3736990wmq.67.1625049210401; 
 Wed, 30 Jun 2021 03:33:30 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-55.mobile.abo.orange.fr.
 [92.184.110.55])
 by smtp.gmail.com with ESMTPSA id y20sm5740512wmi.31.2021.06.30.03.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 03:33:29 -0700 (PDT)
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb7e9e07-939e-82cd-c561-7765337d5da6@amsat.org>
Date: Wed, 30 Jun 2021 12:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Brad,

You forgot to Cc the maintainers:

$ ./scripts/get_maintainer.pl -f tests/vm/netbsd
"Alex Bennée" <alex.bennee@linaro.org> (maintainer:Build and test au...)
"Philippe Mathieu-Daudé" <f4bug@amsat.org> (maintainer:Build and test au...)
Thomas Huth <thuth@redhat.com> (maintainer:Build and test au...)
Wainer dos Santos Moschetta <wainersm@redhat.com> (reviewer:Build and
test au...)
Willian Rampazzo <willianr@redhat.com> (reviewer:Build and test au...)
qemu-devel@nongnu.org (open list:All patches CC here)

On 6/2/21 7:21 PM, Brad Smith wrote:
> tests/vm: update NetBSD to 9.2
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/vm/netbsd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index b9efc269d2..4cc58df130 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>      name = "netbsd"
>      arch = "x86_64"
>  
> -    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
> -    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
> +    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
> +    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
>      size = "20G"
>      pkgs = [
>          # tools
> 


