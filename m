Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBF3337F0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:56:26 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJudl-000838-Uo
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWT-00089L-WB; Wed, 10 Mar 2021 03:48:54 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:41468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWP-0007y9-2n; Wed, 10 Mar 2021 03:48:53 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id m9so17031871ybk.8;
 Wed, 10 Mar 2021 00:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9vkS6fquogSbwggCUNrlHvGIf0HRYVZZCWQs5QH/a7o=;
 b=WPkxCgopah3XvApUy8oEKCAgxxNuSLFg1X3ioIb1tzT2/KPx41ZQqrhpn9/W15hD1I
 KWjz7cyRJVs07TtSVsqsCouqTS6qntPx0JabZirAYkdaS5MOyNs13n8qHPI2wPivpFik
 34SUOf8/NVyTLqtZR+a7qwCvlQFzYXMzlmAAGkc5lyLgtibEe+zgDWAyGyjcD969UcXQ
 uowVpW+P6IFVK46Iw5pJeBJaZBBDf5eZvQzjwwYyfCbJcrAJHoXVhgevYpVRCc4QGSdt
 jM9cEcMrJVejpm/+bRl4Q4zkd2W6HOaZjZGh2y9gx27dolwpPMfzYaCL75ARXykkz3+5
 o43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9vkS6fquogSbwggCUNrlHvGIf0HRYVZZCWQs5QH/a7o=;
 b=lReNdNqN1EQEAzmeDrfJp62G9EauI/uiDPfkfBdWVT6ny5Jz56TIZHGW019IeqATPk
 chBbfmUsSp3Y5XyVFbW8FL4JYhkLocs0cs6xUoX3m5y1IGUupgbFWxDDbfnXNqcI+7NI
 YTpHiezXW4DYgCvLhw0IQCvjkzKVCFbl7FqXOWtsRqs+T3b3dJ1mEccK1C7RG+2pedZK
 XoEqPnB1imV2k1DXFECkYZvtHXOLWrawPOuy+dBFqYwF8+w+yE76xXiMIgwhQHOAUR/k
 GyM0Rfyok8ANYq7fQO1IPiS1Rk4NFgxD5PpCs3SdOHGxiHmW8iqAKC7+wO9vchcHGJZS
 hc6Q==
X-Gm-Message-State: AOAM5305clThhuJPMVeYCSA00TGXTAIUKWwsCqUFWqKUXMrATPKhgROT
 VUP1CDt6vfF3FEuSYPnFxvOaG1HAp1A3qEMDDUM=
X-Google-Smtp-Source: ABdhPJyxXLBIdOqDz9gpCiySLABxUZyvQGjNZ3cpva28GMHL3DqBB1wUA1IqTIXJqExESKKgJLsC/7a/85epebZVyes=
X-Received: by 2002:a25:d744:: with SMTP id o65mr2868700ybg.387.1615366127980; 
 Wed, 10 Mar 2021 00:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-5-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-5-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:36 +0800
Message-ID: <CAEUhbmWk5_AbAr52+TYre+q+GfryDvey=9khXw7U3g5KxrSdKw@mail.gmail.com>
Subject: Re: [PATCH 4/9] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:54 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
> to boolean and set it to true directly within pflash_setup_mappings().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

