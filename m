Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ADF28313A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 09:57:57 +0200 (CEST)
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPLNb-0000dv-To
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 03:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1kPLMN-0008Rr-PI
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 03:56:39 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1kPLML-0003yk-Gj
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 03:56:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id w141so7918041oia.2
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LzLB/iUr7qpEkFbMYGW431PJIuI7K+4KgmNIuEPa174=;
 b=Jxmro1GHPPEOB5qMv31U12yYoxGIXfHNzW9UNouPeK6aP48hGRYbl1ZbrRL620Hs6y
 HxyYD6OWiBtEbWzapVles9KIm4fp5kmf0A2BlE0Rokiyhye1KpYTkLN/AM2WfxCnyGw9
 NkF+kKSWZkF+s9dieUdSFpX/OnpQIjb4ROlKNqu+0Bil5IRRfY2dDQEbSxyjyYu2xwEN
 3BVgZulxiCCvo+6LxSNrTbKGkLam11WPQk2VV3Peay8321CYI0RShN1IS2GlGYmtXok+
 fz1EEDnQz44tzQ6LMT3NJhYEYbhpuXsMAlyG30l4sKJYCOvlBWb5mPWpgHxajTMgEscp
 BXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LzLB/iUr7qpEkFbMYGW431PJIuI7K+4KgmNIuEPa174=;
 b=TQAc6MZs4tc7ATfkM/gQx3O2PmHoC8cCbmihZVgtz/uBPXhnxXdVGuVVdNhI5h/0u7
 SM6jouvavfVL2zVrBSCTGoBu6wZOYww1UJRaeVqYkHfNizrceB1lQEM53UNoSXWcyozt
 mKYyLVOHguMPPcd23NiCGcUsmeQ9R/pNB78aYbRdrSXDJS757ZPyHXSh8gpOxFJ11KYl
 WevOlGwupOgXgtodeCluJxMq/qPOtBhEikrry7OEIvK2Qspsa7aqMMkY4y1Q2fsdGd0r
 CY4q6K7RRSz9Bz/ZsyrJo9gEkRsNpu4eFzHNboMMBIsdIjteiDo9R4nMHMxD2rBHhGvD
 fPZQ==
X-Gm-Message-State: AOAM533wNUVjZ/JCR+HbXeivoKtX15lLE1PHKN0z+JAwIB+gYXvX7XQY
 OFHoePnDH5cut7TuGCSQJ34KPL6Ioc9Ce4hbR20=
X-Google-Smtp-Source: ABdhPJxXEdaFEn5iU7xX+W0Rnk2u7p91s7VhJg6ey5oPkBmZ0BLfeAagVFCl4ulXWZNW34eG1ytQXS/4eoqmkoM38Xk=
X-Received: by 2002:aca:c546:: with SMTP id v67mr4753006oif.24.1601884595654; 
 Mon, 05 Oct 2020 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201004172644.2027440-1-f4bug@amsat.org>
In-Reply-To: <20201004172644.2027440-1-f4bug@amsat.org>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Mon, 5 Oct 2020 09:56:24 +0200
Message-ID: <CA+MHfouh=edtCxcDrCqzH+Agp07E2nFTded=6fhJVxv_gnUqaw@mail.gmail.com>
Subject: Re: [PATCH 0/2] .mailmap: Fixes since v5.1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Anup Patel <anup.patel@wdc.com>,
 Pan Nengyuan <pannengyuan@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 David Carlier <devnexen@gmail.com>, Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Oct 2020 at 19:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Fix incorrect entries committed during 5.1-5.2.
>
> To the developers Cc'ed:
>
> If you agree with your entry, please reply with a Reviewed-by /
> Acked-by tag. If you disagree or doesn't care, please either
> reply with Nack-by or ignore this patch.
> I'll repost in 2 weeks as formal patch (not RFC) with only the
> entries acked by their author.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   .mailmap: Correct Marek Dolata name
>   .mailmap: Fix more contributor entries
>
>  .mailmap | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> --
> 2.26.2

Acked-by: Erik Smit <erik.lucas.smit@gmail.com>

