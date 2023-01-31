Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C233468374E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwxP-00051m-04; Tue, 31 Jan 2023 15:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMwxL-00051N-ND
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:10:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMwxJ-0000yi-Gf
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:10:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1463876wmb.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 12:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=374h9EgviB07TZ//uSp3PBuOnSQUohPKvT41Rszmal0=;
 b=leA9Ml4uGQn0XdlMA1Kp+XZJxMyJ+oJHmcyyFTqPAQiMAYAbSbj8rq9Fxp2n7Lb6jY
 rGgpqRqDJz5Y2Jdhl0ulc46A7gq+jdyXWDl20xhLj1NqdcgiWemfqahcQ8OvTKAbekO7
 z0+/IkCR9moo/qcjZLGzHpOTAikeaY4OxQz0WDZqD9qw9Yvt8YeNcJojZOYT4i3WNk8X
 H1PiTw8NT4S9FeTlkkP5yOp7pIWpegAg95SAz9m3/2CuZfkBd3eWQNV35uByTYhiyiov
 MJnaefCpmUA+Ih41s8+f9uYoXSJZe5Rg58Pv6PATkfP4YSH5ts9QMzMqyCxDBQ3F7iTz
 lsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=374h9EgviB07TZ//uSp3PBuOnSQUohPKvT41Rszmal0=;
 b=adfJ0KlNc3oOIe9Vc6gTqu7UmCMBZ1G/Uyy2LhuZ3bcuTuJ/yHFYKVJFa85VM2qseG
 bkmCsDDHttj0bNbWNmY8R6eTNJ407SMfY6mE8fEj0up12/F6Bq2V0bAPCxD0j2dtg226
 V7iJlpacMUo/emoOqdjqCi3MgsmNKDdS6/Xihd0/UN4boTU6wcPEqEqsDXKFlmP6bhqJ
 qgs3a+8Z6koh+h3HF6vi3Rs41un8JRL2ORDhI93OOgQ+a6zz9psqV1nw3C1ab2R4TFHa
 Hp48eb4XYwMjkOygHM0wS707K3SphuVBvTDjLoM08hsEeYsZgrdgL6jPfskTUg/ak3vL
 16wA==
X-Gm-Message-State: AFqh2kpqI7175g7EdzYyHL2q66bhK2ECSL/zWZICragEp5FK/7l/aT9C
 dyXlDxd9419YG1w/MtQNP9Y9eLO5lPu1TDw+fqvTUg==
X-Google-Smtp-Source: AMrXdXtdrKtspysonVQI8QcHaopj4bQfALxzaTVRER5vnllS6Fz2rc9CwVXfs5/G6CEo3Tdon3kr4g2Oyg6cDlSfeJI=
X-Received: by 2002:a05:600c:358e:b0:3d0:1489:78c4 with SMTP id
 p14-20020a05600c358e00b003d0148978c4mr3400814wmq.167.1675195811270; Tue, 31
 Jan 2023 12:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
 <20230131180158.2471047-9-christoph.muellner@vrull.eu>
 <1cf43062-1e18-b7aa-8c85-f1b0afe27708@linaro.org>
In-Reply-To: <1cf43062-1e18-b7aa-8c85-f1b0afe27708@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 31 Jan 2023 21:09:58 +0100
Message-ID: <CAEg0e7jsz1sEDi6OVuTaZuy0+aFoOWamq7AKE_kSj_RKgC=fiA@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] RISC-V: Adding T-Head MemPair extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 7:23 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/31/23 08:01, Christoph Muellner wrote:
> > +    if ((memop & MO_SIZE) == MO_64) {
> > +        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> > +    } else {
> > +        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> > +    }
>
> Use memop_size(memop) instead.

Will be part of v5 (will be sent in a couple of minutes).
I have also added a "int imm = a->sh2 << shamt;".

>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks for the review!

>
>
> r~

