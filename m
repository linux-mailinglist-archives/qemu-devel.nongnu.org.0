Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DD59B7CD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 04:56:13 +0200 (CEST)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPxbn-0000H8-LA
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 22:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oPxZq-00077j-L7
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 22:54:10 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oPxZo-0003zv-Pz
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 22:54:09 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gb36so18584589ejc.10
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 19:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Wy64Nk2ed1qvnaFGi/8/yjKi42pX+H4Dsft2DDhujVU=;
 b=BkNfuAQ0qUerBPWHF5B3nl+7FsoBeK+zq1AvlXx1ZlzwWlLVjO2xhBW4ccQ5ry/vKU
 /YdX/LY96o8cRIay4EcLnme9pja8yon/o79qPU442Q4mz2kM0hfx99sgOausGn6CSxyN
 sXJCB6jq+/ZJO499L61dlCDNO0Fe60qso5VOe3rTTeu9nu71kyrMwg5qKvqBA19Pi0dl
 wZaoziK/kSOaPgP/Q80qPiAsyBbMgSv8PZKX+fTt+b2+1teqNqDHkgGp3M2vxTf6UVS9
 8fGeZ7j/9SoRRPYyK50+erURaF2nQ45cn5v0+FrqGKNQm3JVho7kpMezAd1YkN1wzgtu
 YPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Wy64Nk2ed1qvnaFGi/8/yjKi42pX+H4Dsft2DDhujVU=;
 b=8QN+HdEhzCsn4WBuoHKhj8RWKojq1AAKGd0oihAhIqk+mJOQb371lqM2cFIULRk/8F
 48Y0MxU0/Nxc4mq9c3IYCMAdhv/hkKu6rJtxPjAc+Z+mKZF1iN/akmH+DPZgThdiSR79
 OS6Z+HGDJrEvgpZfruGMNIIqtXhUyNt7LAAPU/NEt0L7BSifn9EOzkMFolQ3oF18YTUC
 r45o/dgosKr7GSXeuk4u1UTWHTm6POwN2/sJSwoTB9klN60gn4LWYpABsfd7tiHZVaVC
 gnfDOJ66/UedYFnopPaXaNOvA/21TpRZQiqu3eX7iWjTP4hM0geNEB1ffwjC87LntDwo
 XVMw==
X-Gm-Message-State: ACgBeo2iyEMSOCxMcoiEtTitRw4DdMxBf/j/XR1eJsjG0Zcl/lWeA1lZ
 qAMZHrnBglNUYL19x23t3gaihbnjyLUwJJmZ43NhLQ==
X-Google-Smtp-Source: AA6agR57NeUKvpHFOB8SKtMUawaEJG1+35tKeNU+xK+R+DMnk7PmIhGcrRyuEjhd1BVzuG/Sw9ciSg5aOsm9sEzyatQ=
X-Received: by 2002:a17:907:9495:b0:73c:b19e:ce06 with SMTP id
 dm21-20020a170907949500b0073cb19ece06mr9019636ejc.559.1661136846458; Sun, 21
 Aug 2022 19:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220819071137.1140627-1-tommy.wu@sifive.com>
In-Reply-To: <20220819071137.1140627-1-tommy.wu@sifive.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Mon, 22 Aug 2022 10:53:55 +0800
Message-ID: <CALw707oBLpouyEADJgk2amDFU_8A84eNxwwCM7S3nZRVYnwVSA@mail.gmail.com>
Subject: Re: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj
 of SiFiveEState.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Jim Shu <jim.shu@sifive.com>


On Fri, Aug 19, 2022 at 3:11 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
> to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  include/hw/riscv/sifive_e.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..24359f9fe5 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.27.0
>
>

