Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620C31CA33
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:54:52 +0100 (CET)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBywN-00046U-6Z
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lByvA-0003ZL-Kq; Tue, 16 Feb 2021 06:53:36 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lByv8-00027V-Vl; Tue, 16 Feb 2021 06:53:36 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id p186so10211259ybg.2;
 Tue, 16 Feb 2021 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=escumCCGGJH1cH9Y/5AFLzOsGzGYqLrJDNBGrlED+pE=;
 b=W+rrTqkm8yH+eOnXRmMSZ4ips/twgEoZutPReUgbk4P+Iae90wNz6+oyEYEzxTgjuT
 6KegkqXewFJ1CZjXJjHhUBDYFzdj10K0sAc2BVHFMK6FssycaJQxrKBYDfnkrjS4Su4N
 RN4/qdwJXLSx7KwH6SiwFz8i6fCJnkMnSOat1rvwrTZ5Va5HOmm95+R2UP1SKJGGZKLe
 9yEdCFjhxqSEXD1acctcxjWartPbA6YqlfmpnPSNzuzkhoOmOBK3h9pC+Y7LYzJh3D01
 OwFu7mAwzf+WgERVPMCBSLDXy6C4XXqgMV/ubYivpq4S3bA4iDGBw1zfw6jnqhu0n87q
 nXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=escumCCGGJH1cH9Y/5AFLzOsGzGYqLrJDNBGrlED+pE=;
 b=hPBqm0on1H+7EUQUIoJx0knJasQvY84sT1PS+89VBQ5AkiKVeZaGt+Zxb2UTBi3o+s
 kQZVlgs29N47T9FohFZdzYoI/5Rp91uwTMu9UJSextdpLeQ7EDh0rCJDUx5UUzf3jwK9
 Sr8pimvtiQ3JeVIEbYOhiHRfXPl8cgY0m8BxxcfSpViMjBHoI7EM5IqzI0A6209fFlGw
 CQRokHemNyqmeSOcX14/to7bDOYCRMMTHdL2wu/lEh/S+3loJUUWEdCN/dFNkvvPQl4n
 zkYf8YGUvR1CxA3GyPREnCc6NoSQtX+mFwcAduwHdoobkRmUpgga1zePBa6kzJSUO4P7
 NONQ==
X-Gm-Message-State: AOAM533U906KeAjJI2ud4dQq4l44oziUzeSaOEsLgcqNxZe4jEcmfalL
 S3TRI7cTxDWb2X8+0YijlCLZ1D+b6OK/ZFZPMjg=
X-Google-Smtp-Source: ABdhPJzdAzKd6Qi3yINOAXZUqH73i8Gvo6GKQ3uc4cFGPfdM+fBzV+k7dlqBVNWjbAlLuynXRDXKSQ4zmPT8ZDjmlZ4=
X-Received: by 2002:a5b:147:: with SMTP id c7mr3005426ybp.332.1613476413685;
 Tue, 16 Feb 2021 03:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
 <CAEUhbmXb58yxg1TAgq0vdH=QE-o0qCTjYghX2XZag-S1cWB=Eg@mail.gmail.com>
 <2a425f7a-67c6-ad96-5351-ac6c28cbc5ce@amsat.org>
In-Reply-To: <2a425f7a-67c6-ad96-5351-ac6c28cbc5ce@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 16 Feb 2021 19:53:22 +0800
Message-ID: <CAEUhbmUeYdfC8GEqJy798d1wmDW3TZA78siiJd3gGBZ0C_E9bg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 1:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 2/9/21 3:32 PM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Thu, Feb 4, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Thu, Jan 28, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> This includes the previously v3 series [1], and one single patch [2].
> >>>
> >>> Compared to v3, this fixed the following issue in patch [v3,6/6]:
> >>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
> >>>   receiving the STOP_TRAN token per the spec
> >>>
> >>> All software tested so far (U-Boot/Linux/VxWorks) do work without
> >>> the fix, but it is better to comform with the spec.
> >>>
> >>> In addition to [2], one more issue was exposed when testing with
> >>> VxWorks driver related to STOP_TRANSMISSION (CMD12) response.
> >>>
> >>> [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D226=
136
> >>> [2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-5=
2427-1-git-send-email-bmeng.cn@gmail.com/
> >>>
> >>> Changes in v4:
> >>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
> >>>   receiving the STOP_TRAN token per the spec
> >>> - new patch: fix STOP_TRANSMISSION (CMD12) response
> >>> - new patch: handle the rest commands with R1b response type
> >>>
> >>
> >> Ping?
> >
> > Will a PR be sent soon to include this series so that the SiFive SPI
> > series can follow?
>
> I had it planned for yesterday but had problems with the mails from
> the list, + the CVE (you fixed) took priority.
>
> Missing review is patch #8 "Fix STOP_TRANSMISSION (CMD12) response"
> for which I don't have test yet.

Ping? If there is any comment for patch #8?

Regards,
Bin

