Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8B4F3B40
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:16:00 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkuV-00086W-N9
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbksx-0007N3-FK
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:14:23 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbksv-0003Bc-IQ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:14:23 -0400
Received: by mail-yb1-xb35.google.com with SMTP id w134so16053185ybe.10
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4l3BcG3UpNh7VwdIBmaR1+Gc1gGpMv3a4o9v9b8pOsM=;
 b=a3IXveyVBN9TGI7z6x2T/JqL53oPRCYGPN4DYJ3A1huiZa+KiCbR9ITDvPapgKfv+T
 en/XG78KWaPOzMrVkQKr/7WBuhMO+oNQK5dyKZRDaZDeMhquWgqfldgpel+9964vCXk4
 ZGzn7/ZTU4/m2E6wAcigEGgK6SjOPo1UcQeOXrfOlZyQNHGtvvua7Bg+kPCuN7LU1ULm
 pndsn4qjMAcS1Zd9uaNUt+1RsVkSYHtMwthnApTRvfNXPpiJ4/REvwtBOr+D8/Bbmu/9
 bLBGpEAbR6zmahDimr7mHRmmpHowQ2MyAAso5tvJEMLCdnSt1iVLjWPdtQgazgmmOL/m
 HwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4l3BcG3UpNh7VwdIBmaR1+Gc1gGpMv3a4o9v9b8pOsM=;
 b=utZ5uwQR30vnkJKjysrTHJcR+RWii7XK6prpC5cOQEo6UaCW4EiyRGi9v4JB8PgPJY
 H+lh+trBR0md6vd1SU8Khnn2lM9yY8K7JD0hJbh6DlJZJBQGSIKoSRj7Oo3bbyY3K7lw
 indGOwUI2T1n7AlcMQwG/bH4z5uZ4qUfxd1rIMMZWwJ8LwRUpDlKXWxZBkqT35wMRni8
 qQJuubXYzSlbSAH1w015cWyFiCIakAjmg2dLjNwjrTe3rBMXtwT7kvVV1+lstBBOHrou
 pmIiL0MKAsIRfe7iflGBP/rLz5EcFwJRpo5ON68SHP/VhiCKMPvgb9lznAw/T9YmqQ0I
 vRkQ==
X-Gm-Message-State: AOAM530+TwXRrw4+5CF/k42w/hxx8Id4l1P4+G+6X8OR7xb9PnFEpmQn
 V6UU1b6gAkRA7AahVRPLETzRLgsksQgzAnKW5Sn8Kg==
X-Google-Smtp-Source: ABdhPJwp908EAjUssoe4YjdPX3f7Z248I4HslipV4siax668v3bheSEvs1z11xuRUic2DJXcRc/yjAsgxck2dKwpPTM=
X-Received: by 2002:a05:6902:1546:b0:63d:a6af:1c87 with SMTP id
 r6-20020a056902154600b0063da6af1c87mr3072983ybu.39.1649171660405; Tue, 05 Apr
 2022 08:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220405103455.4145273-1-armbru@redhat.com>
In-Reply-To: <20220405103455.4145273-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 16:14:09 +0100
Message-ID: <CAFEAcA8rm8Cba_fzz-Ks3xnq79xOS0hoWBRDGuW=d3hVBmm9=w@mail.gmail.com>
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-04-05
To: Markus Armbruster <armbru@redhat.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 11:35, Markus Armbruster <armbru@redhat.com> wrote:
>
> I double-checked these patches affect *only* generated documentation.
> Safe enough for 7.0, I think.  But I'm quite content to hold on to
> them until after the release, if that's preferred.
>
> The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:
>
>   Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-04-05
>
> for you to fetch changes up to 8230f3389c7d7215d0c3946d415f54b3e9c07f73:
>
>   qapi: Fix calc-dirty-rate example (2022-04-05 12:30:45 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-04-05
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

