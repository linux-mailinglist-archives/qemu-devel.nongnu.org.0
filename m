Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3455657E9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:56:30 +0200 (CEST)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MYv-0003RW-PU
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1N-0005Q6-V9
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:21:49 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1M-0002te-BK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:21:49 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l144so4367783ybl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFWcARzgioLhc7mszRFWnY3H5j6n7sixLEMnVdjW1JQ=;
 b=QtVVg7cS55S/3GXKZUTYwMw0QkgTJle3AhHfmNj2kUGF3HKBDjhv3yCR8fXTn5y4D5
 /D0oWzPjZF5hfX56IeztY4vDHCxrymy39bjHrFu2ZN/ImWfY9ds9yhDrXwdKJu+okLyV
 TKliFspDvbFyLANwswj0cCNqwhBiaKggTQ99CPmeldcc+ZqPNr92B6/b0Sj58KS4HwoU
 Miq5d7PmnFKzKrna7Zrfu4+KApcpXmcZvSVFOUL9w+svQvkc0m+4q98NIGbklVMMtCed
 e1wbQKI/ZB3OPLTrU8lEsBPOHW96RiFfWa8De77W/48nqxGL1NZFJfFSj4mE3SFUmOj6
 VvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFWcARzgioLhc7mszRFWnY3H5j6n7sixLEMnVdjW1JQ=;
 b=GFgSv3Avm0IIPmk993pKn4+aGcwvbYricUlD1tb/Nb3s5ZfZsHAgxbawz4mjI7etTB
 8ZCzVio/jEp3qfs2FI/3C3KjJWk9Dj8O3duZ57AmoHhZ6ZnB/+4m3h9XF5Lk1E2ht9E9
 bxlQKAF1zH3QMNp1mLxmQp9RddZ4kEH1WOF1TyKVLlVKewEDMP1dAgxdjovNAeVB5JTJ
 +qTBfcMKe5ui+R5TGVrETXJqMd7KhH79PtUIe+0+LAUUL+9EAoy6oPGvdXeivxhgIrMr
 AIRuvvtTDP4wlqPqEgDWUJGTDKUi/nIhi61nHNE6/8fd1TSjQdq0Eimtq/0iITUY7Rjr
 phCQ==
X-Gm-Message-State: AJIora/APbzdvJzjbuyLdyy7mZnEGVzaGQPtPzeIi02IdPYfTdq0Base
 l3vwViVnT3xHuVGxyRqW3xRUL5qdybXJ34QTst4UWA==
X-Google-Smtp-Source: AGRyM1s7dlwSJHfOmYPJaTFviIObSJ9aXASKzu+Zflz1DvxVEyFUsVt6g3piYy8TET+2hPkgsqUyiLC4H60DBA3Aqvs=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4873819ybb.85.1656940907140; Mon, 04
 Jul 2022 06:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-14-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-14-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:21:36 +0100
Message-ID: <CAFEAcA_zL1OaBJMoQZC-1vz1KRSf-rn=f3K7VGVFhk7nu+S-WA@mail.gmail.com>
Subject: Re: [PATCH 13/40] lasips2: remove the qdev base property and the
 lasips2_properties array
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The base property was only needed for use by vmstate_register() in order to
> preserve migration compatibility. Now that the lasips2 migration state is
> registered through the DeviceClass vmsd field, the base property and also
> the lasips2_properties array can be removed completely as they are no longer
> required.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

