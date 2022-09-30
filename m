Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A35F0758
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:14:50 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeC6b-0001ug-T0
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3a-0005rh-Jm
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:42 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3Z-0003u0-4g
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:42 -0400
Received: by mail-qv1-xf29.google.com with SMTP id l14so2438279qvq.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1qyDTXyCKhoLFv6uDs+pwQXcX+MxFqHIVgwCDIh3he8=;
 b=SyN42nFmJFMUxcPUxzgSKj+hhiSHQNtN85oksgnUl6CTWzizgf+AAD3NfsqXUJm+x7
 w3NxjJ9Jtw+DdMzUVj5jVVrS0P9CIQgTJbiA9ikB47BnKTk+/fGD7ZrkNTpN+a7R2j6h
 CJ2PI7SwgXdLzPWwq94XWbnS/2yQIZAr4ElwNUOVsOg+5Gb4O5xBAzd6A8BjCdV5YmKF
 iGj59E5zAU9sppEsGl/7r54bzLwLf3FVvWMkGghUmguY7M7h0OPpAfXXS7sOgLkN3SKP
 AEbIz7Eiv24RcAecXrNqRJomYvAFGOIsZozIylBRhE9yO+TrMjpiOVTsitzs+2NwyaOv
 gT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1qyDTXyCKhoLFv6uDs+pwQXcX+MxFqHIVgwCDIh3he8=;
 b=FW5O7lCFAfF0D+mHT2onJtViCDqlNIaiCfA7xZJhwbDYckjiqe9OZNSp0VxQ8G/AHV
 agUZivuHqfdQwTD59qNCNi33QbHvTEsM4dJKeCrCkf5KXlpI4Us33zy3CBf1w+mvSnWy
 egphG6ONYEs5Y2mFg+vWFUBtNmORU9wo2BA8M6Fev0eXRvqx49gR9tkHkey2U6GXK+AZ
 mbwU30Aq7DpN/c3GSEAQ5lic0jpNonkjbHk+4iPVpWqNwJfiMoyHG9ehpHohVLiTtfyh
 G+X/KQS7Xlmm0Cm57ALUkNui6efcnkeVRf6CRLXcSiZ6cT4sz1QnSnnce/TXcMVgp0QD
 ChqQ==
X-Gm-Message-State: ACrzQf0/tac/jWh7N1jRo1TTzW5FgYZr5OIrv1rRApO6P5JRn7HBR1BH
 cY+kQw/58nXK9zx+RRMcmsXlurYkRbDpUtqX5Hw=
X-Google-Smtp-Source: AMsMyM7WjQjbBzRjAS7tO189TQ7oJYQuUAN3o4EIpEjayNLcj2NpTQWY4cODZS+4zsWEeS2JeNl+wFg1iQslX4AUTxk=
X-Received: by 2002:a0c:cd08:0:b0:4af:9429:37cc with SMTP id
 b8-20020a0ccd08000000b004af942937ccmr5768760qvm.51.1664529100269; Fri, 30 Sep
 2022 02:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-4-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-4-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 17:11:28 +0800
Message-ID: <CAEUhbmWQA6fLPGUCt=+E8vs=BAjCKzKf93Nzq0sgwbZcUCFsGQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] openrisc: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 30, 2022 at 7:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

