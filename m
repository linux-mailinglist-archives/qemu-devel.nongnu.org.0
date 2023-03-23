Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FF6C6FDD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfPE5-000052-Ce; Thu, 23 Mar 2023 13:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfPE2-0008Vo-D9
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:59:46 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfPE0-0004qA-Bb
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:59:46 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b20so57401258edd.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679594381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=edPREUHUsUeV6RMoNQ/B/Q+71/SbtA+YJ418Q+PnN/Y=;
 b=nIMBsGly4w3mORR2xE0oYdNEW739HGq7rEjsaO40UuLrFB7vC+iJiuLJqAdPBfsZva
 Gb3exHYjpIF3RuSLGkG1PbT9P0NLaBPYKbLVbKBcU+LMJAJMEaZzm2xd6rA9BVfU2ESP
 jbLcOtceYpyc7BkqfJWCavRSr9dJCIz9N5jjqHpCh/SNkz2c3qtEkdMNiKO9n1tJjUy5
 t/7at83Y2Wc0b5Zdq9rwsPe80WoQwh8LKRW1Y+DIefLzkbifvP3tqir2W13+Be8Oe4NJ
 jYnCYA7l0NN3/uXZ+8KrLenrso3ioDxH/8hM7xrck8GfIwD/5njpX4EwTRlKMciDE/nK
 X98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679594381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edPREUHUsUeV6RMoNQ/B/Q+71/SbtA+YJ418Q+PnN/Y=;
 b=mKHOkm3uKVgjl1+2axd6/vnOhkZsbYhSvGH0lvvBSxz40UyvLV1OX+ejgSF8Ev+zKR
 vFT7nuCIXTSt78wIo3LlNbex6HcilcxDCNzg6RFBS39lTHavfcNT2QPPqzzzaMfwRiRx
 q8g+LU7gx3G5tYb8hkkRBCwxhTRJTziL92heWDs3u0hKAs2y6mCppTThaNutOyh838QP
 oOMLn61ExFVLDvCUaqfSlZQfElRWbmQ0oQSMtqrGFkWHJBx+omzISmi6mtL0tGE/YzQv
 BfMTWSuc+pVO4Dph9TgSCIL/6NV/VcoN75IhpPCPdCqjCkdrs0adkk44VIbRLovOOq2w
 WqgA==
X-Gm-Message-State: AAQBX9fclt1IKo4MjR+BlhBJVcH8lSW7HDidV1FXacNwZkiBKArDo3Bv
 3EhSdxjtK+AwYoYrudIaNi84q5htkPCHBp1pM2vbEg==
X-Google-Smtp-Source: AKy350Z7sz7dD5K4DPBc9CI1DIG2o/rKnERdTh6VSh/cxZLOIVXqzVYEnims3ZrJw0le2M/V7DYDixMsfRMO/6V464A=
X-Received: by 2002:a50:bb0d:0:b0:4fa:e897:7467 with SMTP id
 y13-20020a50bb0d000000b004fae8977467mr147133ede.6.1679594381678; Thu, 23 Mar
 2023 10:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
 <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
 <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
In-Reply-To: <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 17:59:30 +0000
Message-ID: <CAFEAcA_MXhG7-J9qAv-9cmHKC-qx5nKfZPHi7jXyqdoYumH5-A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Mar 2023 at 17:54, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 3/23/23 14:38, Peter Maydell wrote:
> > On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> >> -    g_free(fdt);
> >> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> >> +    ms->fdt = fdt;
> >
> > With this we're now setting ms->fdt twice for the virt board: we set
> > it in create_fdt() in hw/arm/virt.c, and then we set it again here.
> > Which is the right place to set it?
> >
> > Is the QMP 'dumpdtb' command intended to dump the DTB only for
> > board types where the DTB is created at runtime by QEMU? Or
> > is it supposed to also work for DTBs that were originally
> > provided by the user using the '-dtb' command line? The docs
> > don't say. If we want the former, then we should be setting
> > ms->fdt in the board code; if the latter, then here is right.
>
> My original intent with this command was to dump the current state of the FDT,
> regardless of whether the FDT was loaded via -dtb or at runtime.

Mmm. I think that makes sense; we do make a few tweaks to the DTB
even if it was user-provided and you might want to check those
for debug purposes. So we should keep this assignment, and remove
the now-unneeded setting of ms->fdt in create_fdt().

thanks
-- PMM

