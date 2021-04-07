Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3D357355
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:40:14 +0200 (CEST)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCA1-0001OT-Tw
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC2v-0003A6-Dc; Wed, 07 Apr 2021 13:32:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC2t-0004cW-38; Wed, 07 Apr 2021 13:32:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id w23so10607241edx.7;
 Wed, 07 Apr 2021 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xv9Ro4ygY+tuYEqxruStLz1EJjOtv0k8UpWInlUBG20=;
 b=MP+tx2XSbTkouzEqUo19rYS9N93DDP0k+0OMiYbJOakjUK4sCUkBJ6/gqRBGEco1bh
 0XeX15x3/PPqLEt4mnu3NcWsBalEBaf58FmYZJWaZvwgibQF+IvszLJvO4cPJVgrm/hb
 sqRLh3CIteITOUFdMd4q62DkDb7ca4d6ruiVWSxYHb1MfUe+yd/gcDcE/RsWAx8Me5CX
 p9euvvmzfxc970vm9PMe0t0y9Y2rVLxo/VOw5uOPHrTrXwDGm1NPUZqXE8h8/PqrNvSx
 SGEh+stefG8pmSy2QSamfhE1O0G2pt78ZYkjgamDGwit2VKW6pcLv+PGDH+Ap7JV9/fx
 Ra5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xv9Ro4ygY+tuYEqxruStLz1EJjOtv0k8UpWInlUBG20=;
 b=A2tTbLhYubq0mcI4z9eE1boEnReRkJxVeXYIcfJFNSe/XHieWImTpp56+ahJtbGhAK
 TLMDgkArSQ4GFMTbXSs9C+yBfiN1ZpPVFSwsaEICBJfe6vezmyBcF7zs/CLIBBCsZA84
 86GtrCJeAYmwsUkqSeNVOkbmqNt6/tAuGr7QbwG15DA2Em6HMnooZ/NImNZaQDkdBcqa
 WkNroe/zr7zTA4cnapRkZ+QhedmZFRDLyFEb+hGqKVWZX1FZtDDmYAcAMUWMKx2b3JHW
 NzcBWx2PDADz39Tgr1Vbg9dIEL8GvRQMXQlZe/qKvsrbA4VIZiu9l7VPjniL/HF+kZ6Q
 CjQw==
X-Gm-Message-State: AOAM530NXdDzeJUzxVr8t/ceq0YyZVAygvT6TSeyjlVvNjMhjAw64dy4
 ZeITiyQglh6SHowvrwuJfrM=
X-Google-Smtp-Source: ABdhPJxHTTN23jXnQ4wBlqRc2QRzvlAENjlAJGND47+4RFXtj8GNvjK7BRfXNqeNEzQvbXTmXD9Bkg==
X-Received: by 2002:aa7:d60f:: with SMTP id c15mr5810989edr.88.1617816769444; 
 Wed, 07 Apr 2021 10:32:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x18sm9247092ejb.45.2021.04.07.10.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:32:48 -0700 (PDT)
Subject: Re: [PATCH 02/24] aspeed/smc: Remove unused "sdram-base" property
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <567cc487-e27c-895e-dbf5-e0466ccf6b9a@amsat.org>
Date: Wed, 7 Apr 2021 19:32:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 7:16 PM, Cédric Le Goater wrote:
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 3 ---
>  hw/arm/aspeed_ast2600.c     | 4 ----
>  hw/arm/aspeed_soc.c         | 4 ----
>  hw/ssi/aspeed_smc.c         | 1 -
>  4 files changed, 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

