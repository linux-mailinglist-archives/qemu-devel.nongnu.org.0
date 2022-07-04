Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C0565869
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:14:54 +0200 (CEST)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mqj-000780-QR
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M3I-0000Fs-PU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:48 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M3G-0003Cf-0m
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:47 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e80so9642095ybb.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4lHGWh3OHxHcF8ox67D/rNo02GcKVnustW8Jg6Fa8E=;
 b=hySmIyodHN7QsqmdtyIs5JTrlVRJoEBhlM2ivuxaS7OGMU9bXDvywod4B0+VHF2Je6
 BzyiaePD60ovY+CsjXCU80FyJdBhy4TOlzns2eBDXGWD5XgENIBQnBKuU2y3ygpQ/zG/
 2ygChMf6CjyFOAJmslBbGNS7oSDAJ5uTnD4CnOlwg+TjYoZS570FLK6aNx6iMvJovgyS
 OtM14a7nLwRst1znsVJD7CwggEM99jTTMLb85QxFXmVHWlxxDh/NYvYNhJoY1fBOUg04
 BJbwdtcrN6JFBogQl+vUYl2M8qM1jcNHGAdo+pic6OIv4yho6CQKgEHKh/Fq3DTkfhM1
 DWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4lHGWh3OHxHcF8ox67D/rNo02GcKVnustW8Jg6Fa8E=;
 b=Scx7nfcE5wAyG3zzTDynhmZWrz9Ck9MP5DjUzNUHfJgPVBSqP07mh8ARL5yLg7+CRp
 kFrcXBeHLyjfTr/SkibsDbh0x93z3F9B6Jt0wB9w7kQ038vmrT8dTkm3GUJQ8Ryy3Q8p
 pQmuoOWyrwK1c54PGcg/J01wqgB+rYHWkKYJjPpZFPuziKVk6Zsy5m+2V0XI+I7BK0Rr
 ZU7OzmHykUBWjfoEtUY2CD91NUpB2yGF5off8mONg9mv/ygugxHmAj8zp2um9qa8Yt7K
 tel68crftJuezHAoy02V/AwOZUkNkAdNgEbQpihl4lfMpFd7z9p2DwH3Cgg6P0s6V0Cr
 zEWw==
X-Gm-Message-State: AJIora82AFwIBX4z2sw7t3LvGw+GcPhcRi2FfXLMQuKZtWvv73VVi6s5
 bU/w/amfkpKpKA1lwKOS9AcO3rAidwohZHhYPnJb9A==
X-Google-Smtp-Source: AGRyM1tC8LYSwMrNTmusTUeiN8OMkMxC7Z5AwKgg016TccF2cdT1gM3BKo0zn0+nzQhoXTTSyR04V1m5rlTdrhGtbu8=
X-Received: by 2002:a25:6b48:0:b0:66e:3703:7df2 with SMTP id
 o8-20020a256b48000000b0066e37037df2mr9093342ybm.193.1656941024999; Mon, 04
 Jul 2022 06:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-19-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-19-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:23:34 +0100
Message-ID: <CAFEAcA8q5K3==Eoo=ZyNL-3-DmyLbWe5TmFJ=bCmgkusiePV4Q@mail.gmail.com>
Subject: Re: [PATCH 18/40] lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
> This will be soon be used to hold the underlying PS2_MOUSE_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

