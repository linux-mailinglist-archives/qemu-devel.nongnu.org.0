Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2733AFD4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:17:51 +0100 (CET)
Received: from localhost ([::1]:51144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkII-0005t6-PV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLkGN-0004nJ-6w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:15:51 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLkGK-00027z-38
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:15:50 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b10so32655831ybn.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BbbLEG8Np10qAfhn8p1y7WamooAQ5+M1vliHCeGKqMk=;
 b=C3JngfndtvWUxMVelDFI0I0Qzqd5AsUlLXWCIbUWyLj9GJoR/QuwaKBlEa7zreTIIg
 ZWoBoP+O9BJXv2C7sh2K0P2h7cQSUkMuS2VTmnSbaROn3Qo0WkuEoLfXCgHwlASe5L20
 KzXobEeo+AY3uAWulpdMmZFcGQmTNU1xlW9vbVOQ/0y2Et4tt74PBnKfTzt41rCZPDlI
 Jeyh5WRF6LUnHMP+mMpAURWkPiYDp5L16pBLNp80R2A941v9iaOUKJlZPhI0JDfkYjFh
 5RbOHPxKHGHjHKzROG+onSIjRiTtyJA+rdLkK9BD9eQwy7HSVuvjitIllkgfDnu9QQMl
 6oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BbbLEG8Np10qAfhn8p1y7WamooAQ5+M1vliHCeGKqMk=;
 b=PJNMKCyT2zDJLo7iTnkKNbVFCCr3ENvYVcIKj4uoVrVPUiZOCpVS+/icpWZTnN0QLM
 yCw0oBS3CkQxiTmnrQjZsInboFB9L0PUNKCclAXvA2mfVGjK8IANLL1NvjOgFk9QEtLM
 zmsuuZLGQgwBdQfIb6Ptth4Pw3paQ9DprmDeztyWTXq6/RspmFEu6OyL+8daLgn48B91
 PMJSaz5zgDrhUspU40KRcu9nQiji9+qMEbcn3s0lmpusLR61Ae7UHISlbkEZk5Lqf5gQ
 8oVjP9+E1yD9/IqWEv8KFeo8VR6ZfCnTqAj+0CBgfqthLd6R6Vg9LmNxTqBL0/ZSfMWs
 toyA==
X-Gm-Message-State: AOAM532GKZvArabK4SP3v5AmR6iUqBv701TV2KriQV5NVRYBWxnSTCVr
 2UYF5rEiXuw5GlM6TfOu6aN6JYA7qpigbsjOG/c=
X-Google-Smtp-Source: ABdhPJwCQ22c4dQDeEYpBS3hu1+JQtd/yTeqHugyBOMTO+x4Kqqb+0OyoMTmnaU+yvC/wyAWB4GtaYmtgZbtIEXUAdA=
X-Received: by 2002:a5b:147:: with SMTP id c7mr36333231ybp.332.1615803347028; 
 Mon, 15 Mar 2021 03:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-2-bmeng.cn@gmail.com>
 <236293f1-c23c-78a9-3e1f-7b523280262a@redhat.com>
In-Reply-To: <236293f1-c23c-78a9-3e1f-7b523280262a@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 15 Mar 2021 18:15:35 +0800
Message-ID: <CAEUhbmWHQ9ifdeaGRDp-iEo2AyTV-bmTOd+xHJ+O1-BT0Nig0g@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] net: Add ETH_ZLEN define in eth.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, Mar 15, 2021 at 5:13 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 3/15/21 8:57 AM, Bin Meng wrote:
> > Add a new macro ETH_ZLEN which represents the minimum size of an
> > Ethernet frame without FCS.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  include/net/eth.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/net/eth.h b/include/net/eth.h
> > index 0671be6916..7c825ecb2f 100644
> > --- a/include/net/eth.h
> > +++ b/include/net/eth.h
> > @@ -31,6 +31,7 @@
> >
> >  #define ETH_ALEN 6
> >  #define ETH_HLEN 14
> > +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
>
> What means 'sans'?

sans-serif font? Does that sound familiar? :)

Please check:
https://www.dictionary.com/browse/sans

This comment was not invented by me, but was just a copy from the one
used in Linux kernel:
https://github.com/torvalds/linux/blob/d635a69dd4981cc51f90293f5f64268620ed=
1565/include/uapi/linux/if_ether.h#L35

>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Regards,
Bin

