Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F688241B07
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 14:40:38 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Ta0-0007tz-Ji
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 08:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5TYx-0007SS-Ry
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:39:31 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5TYv-0006Xo-Tf
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:39:31 -0400
Received: by mail-ot1-x341.google.com with SMTP id z18so9928626otk.6
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/p3g6aJdl6zVZze9qpTS8QC6weQ0+lBuua3fUEENZkU=;
 b=MxdMjHQhBps9vVjRJb0zqMVxDVfOWATFaYIjRyI8vj3vgeoOwbRpTqybLgpUCcF0Bg
 cbPyZI88nVbH/6ZWffG5KbqVPggSWdlU6HesCpOQ0lr5a9Tj9d0D8f+9hVGl/ygAKc5l
 vrYih/XpqT2DAOrC7UWH2/ieMFMQ/9yWn6xQpbk0lklgTM7EygNFSewC4PuySlnUVXzE
 GOAVtrlz1oDq4AYtHm8ghagc2Mu1V8h0Uuyy/6rWWfvkMd7vQM+ya5zpCRpo4Nq/4nDX
 mbInUG6e7uG6TTqRJPcSBWuBp8XQQL4tuAeC1/K/hq1zg7ifObToOQ/JrGzkVhdO5VPR
 v6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/p3g6aJdl6zVZze9qpTS8QC6weQ0+lBuua3fUEENZkU=;
 b=Ijhb1sUxiE/iKnBv0iLeJjPItJHAODD8xmdjf74gCUyVZKPzm3ppxgcT0tOXipiwlf
 BotfED4ER5KwjFUAZK4AglRlHgqd0pP5GLGh58XAGH98833wn4wj84UAqMnKTSRVquoO
 jxTRjLI/UwQSRKy01LX1/jJkeVWBjvYaDA+s2gNy7Z491AHuRBae4gWyJeTqg9Ic/Ab1
 8W9N0CO7e9veeM/2Tv+J3iRtOGUS81oQP0b27mDdqDsbJV3bUMmzP+gMid6Tn4UQ+rD5
 Tqo85ODmUHspNCXDISuK3JH6iJuGX8zptd6A28HhJ+AjCjGCZlscqSP6tas6fgmI7Voh
 qJKA==
X-Gm-Message-State: AOAM533DWYMhr8A9yVOQoJnjCPsKKidj2tJiTrZxZsgJcrBzjP2qzblc
 lh3DyFRFLl1OuGIo1892Z6Q09ZVPBhOHiHOr55VWqg==
X-Google-Smtp-Source: ABdhPJxEufjGg/KlWd5ijgi4RAPqzBTt2xwkyKJZ9sJzOC3O7bZLyGxuikfevJg4yq/2PpLHmjntRJP8bP1t793LEDQ=
X-Received: by 2002:a05:6830:1305:: with SMTP id
 p5mr4859956otq.135.1597149568218; 
 Tue, 11 Aug 2020 05:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-15-clg@kaod.org>
In-Reply-To: <20200806132106.747414-15-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2020 13:39:17 +0100
Message-ID: <CAFEAcA_rAre03ATda5rxgear4wsoef2-qD5SyAjunH8QW65W2A@mail.gmail.com>
Subject: Re: [PATCH for-5.2 14/19] ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Aug 2020 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When inserting the VLAN tag in packets, memmove() can generate an
> integer overflow for packets whose length is less than 12 bytes.
>
> Check length against the size of the ethernet header (14 bytes) to
> avoid the crash and return FTGMAC100_INT_XPKT_LOST status. This seems
> like a good modeling choice even if Aspeed does not specify anything
> in that case.
>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 280aa3d3a1e2..987b843fabc4 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -540,10 +540,21 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint=
32_t tx_ring,
>                  s->isr |=3D FTGMAC100_INT_XPKT_LOST;
>                  len =3D  sizeof(s->frame) - frame_size - 4;
>              }
> -            memmove(ptr + 16, ptr + 12, len - 12);
> -            stw_be_p(ptr + 12, ETH_P_VLAN);
> -            stw_be_p(ptr + 14, bd.des1);
> -            len +=3D 4;
> +
> +            if (len < sizeof(struct eth_header)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                         "%s: frame too small for VLAN insertion : %d by=
tes\n",
> +                         __func__, len);
> +                s->isr |=3D FTGMAC100_INT_XPKT_LOST;
> +            } else {
> +                uint8_t *vlan_hdr =3D ptr + (ETH_ALEN * 2);
> +                uint8_t *payload =3D vlan_hdr + sizeof(struct vlan_heade=
r);
> +
> +                memmove(payload, vlan_hdr, len - (ETH_ALEN * 2));
> +                stw_be_p(vlan_hdr, ETH_P_VLAN);
> +                stw_be_p(vlan_hdr + 2, FTGMAC100_TXDES1_VLANTAG_CI(bd.de=
s1));
> +                len +=3D sizeof(struct vlan_header);
> +            }
>          }

If you want to be picky, this will unnecessarily fail for the case of
a packet that is big enough for the vlan header but which has been
split up into multiple tx descriptors such that the first one is
smaller than the size of the eth_header. You could fix that by
doing the insertion of the vlan tag when you process the TXDES0_LTS
descriptor rather than when you process the TXDES0_FTS one. (We
already save the des1 info where the INS_VLANTAG flag is in the
'flags' variable, so we have that available for the LTS descriptor code.)

thanks
-- PMM

