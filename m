Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262948E2BD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 03:57:38 +0100 (CET)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8CmW-0002yZ-Tl
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 21:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Ck5-0002AD-1G
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:55:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Ck2-0000WD-F9
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642128900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+5AWMX6I1pIp4fgyLv3QaPBKje4xyjRwFaR5pb/jUA=;
 b=JLEcAvhMSLXpexAv+B1wVh18MjLP/PBdkwnDvFBs/NKgKLh6HJSkYdkNihnVrM6/fwNvz0
 JrsoEfpTc1h30DPWDxGfdkBM3lXpWz8cc1U+3v9uiRBve7Ds68artcNLeKy9Bow6m6EEAG
 eZn0kUyWM3g4Xt3wFTgoWMui5T1WgSc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155--5RW5bOAPD2KkeuMR66H3A-1; Thu, 13 Jan 2022 21:54:57 -0500
X-MC-Unique: -5RW5bOAPD2KkeuMR66H3A-1
Received: by mail-lf1-f71.google.com with SMTP id
 q14-20020ac246ee000000b0042c02909ed4so5253755lfo.19
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 18:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A+5AWMX6I1pIp4fgyLv3QaPBKje4xyjRwFaR5pb/jUA=;
 b=hzghVCatmgfhWuyqwts0kiSyyKv8vU5cN3nFt0eojdzZymLMOsOcqQ+jcL/6QViA3x
 uFapwllFDtlj38uxobHZd5P/PEPlK5WPSjxCbMYZFJ4Q6iaSXZ2DOhbXu2OZL91w9Cbp
 7gsLTUeyAwPMTUS50Fto/ARCANgXcUQ+fHVj14nD2QZO7pTu4UbXNSc+OW208lCwYx2l
 gaoecz/bOA5nwH0l9H1ilfNdd176WFqyJBz7Dt6mTwW1tr3bmoOa0b7ErJfzyCpGfP4B
 SSqZxtEZBW7adEUOd0Bl3+IZMSP/H2tL4KRKHCwcP89jWLanUhO+DvLiQY9Oa++MlYY+
 N4MQ==
X-Gm-Message-State: AOAM532fUFuf30LTkidm+Oqq5UVDSv0Gxd5Xfs+Rfwll9DLAylSRcDyf
 BchoHnfSRDS6ZpiauM3sGRmQzr+cDvB+Fps2oXGkrSoujW1ykEMRvn49qDVqucqeOMlkfaW+Bwf
 nqtpaOf5u+VNATfdvwHZlDvlo8+dTLLc=
X-Received: by 2002:a05:6512:3b0a:: with SMTP id
 f10mr2345124lfv.629.1642128896098; 
 Thu, 13 Jan 2022 18:54:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3BRR84r5WmbfLOCyuFlNmRZhA+NZexSgdsA6xgFiZnkGLketGoryko/oAjFKxny1fs/OlMSb1s97zL/+jJ0E=
X-Received: by 2002:a05:6512:3b0a:: with SMTP id
 f10mr2345109lfv.629.1642128895880; 
 Thu, 13 Jan 2022 18:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20220112083220.51806-1-jasowang@redhat.com>
 <CAFEAcA-CLK0nRgQk8nu0iEcKwGg8tNE=gbXOkR4Pc6RSW83CKA@mail.gmail.com>
 <e42f34ed-79c3-6436-e56c-2aebd96acfaa@amsat.org>
In-Reply-To: <e42f34ed-79c3-6436-e56c-2aebd96acfaa@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Jan 2022 10:54:44 +0800
Message-ID: <CACGkMEtP1Bv8yKuxsrzhrar4KimWvy_CHdQJowMnsWsmDu8M1w@mail.gmail.com>
Subject: Re: [PULL V2 00/13] Net patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 11:36 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 13/1/22 15:00, Peter Maydell wrote:
> > On Wed, 12 Jan 2022 at 08:32, Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> The following changes since commit 64c01c7da449bcafc614b27ecf1325bb080=
31c84:
> >>
> >>    Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' i=
nto staging (2022-01-11 11:39:31 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>
> >> for you to fetch changes up to 99420f216cf5cd2e5c09e0d491b9e44d16030ab=
a:
> >>
> >>    net/vmnet: update MAINTAINERS list (2022-01-12 16:27:19 +0800)
> >>
> >> ----------------------------------------------------------------
> >>
> >
> > Let me know if you want me to apply this or if you're going to update
> > it with Vladislav's v11 vmnet series.
>
> Note, there is also a v12.
>

Will send a new pull request soon (and there's a v13).

Thanks


