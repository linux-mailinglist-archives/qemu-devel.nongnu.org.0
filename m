Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025033AFDB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:19:02 +0100 (CET)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkJR-0007Ky-BC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLkIG-0006VW-Px
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:17:48 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLkI9-0003BL-CN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:17:48 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id p193so32627587yba.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+GEMLuqbQOFS+K9uq4ZWf/HnVyERHy+AWjDzxpHF9nU=;
 b=Jg1T4BXpkxgT9R8+vxdBSBHyeVTRhADeGcVkBRfRdvdr6VPYp/1webo9Jp7W2CKJMa
 +GMBo4D+f9+7f330Ov0VIWk88drpctxHcf+IehoWKiDc8Qz8dXH4fyBMHOITJwZq+Rsq
 joj3toTGaWpkg0Y6Y04NDyxXEQzgzLpnEDVh4N/9bh3IVhaMZulR9WwEqpOm994prxJr
 nMb1RDCMD7RMwvCVyAQ+gfqB5zGtVpaDLWsJ44BqWj/ktWveVmbANy5trnagiKrosO3R
 RuQ0mcq3tU4+h1PsDk9iXjRvejnBsfpiytQDMstokmFhtfZ69G0/VtkqjRnraiBiYFrd
 GI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+GEMLuqbQOFS+K9uq4ZWf/HnVyERHy+AWjDzxpHF9nU=;
 b=WSn9kYjfjNh2VyoPCdV3JpcoAUATmbh293paT9zy3SwlPWurT2KGb9CMmMb2TEGUYR
 1fveIE4UovS6/QQe0idCvs4rUbsm2K7olG3kkgQECHq0TGg/bgYLNib79xjtO8mGockj
 vSYcKu8f6x7avtNcHkpDuQ8wOhH5TjFrMeKwcdY612Smw5Ksw2mVSUH7bgy5yHnlcfVc
 JmB2jOJrbLAbW8MAInnMIOFWlhQfD2V40YQ/eu4+7A284s1nghYqtjhhDuU+WaGdhN1g
 TU7Etd66FKBHpbi+6jZI/SRyup/ACdHrqXme+xKUdDFbAccGq0yVDBqfiddXAfSjNcwh
 rnlA==
X-Gm-Message-State: AOAM5334BfQkkac7s7KwGuja8/BrNb2pMb5nRy8Z4oMaGjm/1UN0GlmQ
 o3EcyC8kgXGf/1BNi8hxD8rWTB93HpeooQ2xzHA=
X-Google-Smtp-Source: ABdhPJxwywaEm7SXvY9+Xyz1D4hUDH0IPumerTHh+qblVsAykXhzpJOlcOD4mn2f3qHP8ptwAqMy2TWL+D9jojSP6dk=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr37565816ybt.239.1615803459230; 
 Mon, 15 Mar 2021 03:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-3-bmeng.cn@gmail.com>
 <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
 <2884879b-d645-324b-e90c-95fd59b66daa@redhat.com>
 <f6f4f095-2a69-5fcd-64c4-38115a35c09b@redhat.com>
In-Reply-To: <f6f4f095-2a69-5fcd-64c4-38115a35c09b@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 15 Mar 2021 18:17:28 +0800
Message-ID: <CAEUhbmWv1esg937aD_S9uUkT+pEzGSvJqQa5NObUQA8yMh8M3A@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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

On Mon, Mar 15, 2021 at 5:22 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 3/15/21 10:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 3/15/21 10:17 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 3/15/21 8:57 AM, Bin Meng wrote:
> >>> This adds a flag in NetClientState, so that a net client can tell
> >>> its peer that the packets do not need to be padded to the minimum
> >>> size of an Ethernet frame (60 bytes) before sending to it.
> >>>
> >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>> ---
> >>>
> >>>  include/net/net.h | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/include/net/net.h b/include/net/net.h
> >>> index 919facaad2..6fab1f83f5 100644
> >>> --- a/include/net/net.h
> >>> +++ b/include/net/net.h
> >>> @@ -100,6 +100,7 @@ struct NetClientState {
> >>>      int vring_enable;
> >>>      int vnet_hdr_len;
> >>>      bool is_netdev;
> >>> +    bool do_not_pad;
>
> Maybe 'do_not_pad_to_min_eth_frame_len' to avoid
> wondering what padding is it.

I felt the same when I added this :) But I wonder if that name is too long =
..

Regards,
Bin

