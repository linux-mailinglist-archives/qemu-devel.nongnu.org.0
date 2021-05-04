Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E940373203
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:47:53 +0200 (CEST)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2tT-0000qq-VR
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1le2rm-0008Nh-3u
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:46:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1le2rj-0005hb-Ox
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:46:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id y26so12189135eds.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 14:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0yTKbx2cSGaDgg2iAWCPaELBXgv4X0HBf3vQFhAZRiQ=;
 b=Chw/Fur26iM4TU1q98FPdes4c7fEXZQZ2dDnFaZO+45guxXim1sWSIsfXC8VkG7ng4
 xDo/o/QMzG1hFR6qfqNA2iHWAMJTrwEbwFJ45SHwhdqwTT8k2dqI+uwQlrcHUIkkmBe/
 VdI2nKD0M3l0LRTKxistQCHjCRGsR+l8647mZti48zvEE9inIr8h0aTPmCVCJcTThd68
 IH6WiNJNNq7xFfszJFDM3sGcC8tV31pBHnMpDwR43Ckb9OcdN2kq7osJUccYFZ3XfIcZ
 GDvO1SwVb+DH1JrBGftf9T/vJcRFsWCY74XLhngdf9Vo9kFewFBJFFbEt/7OEdgojqXN
 njLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0yTKbx2cSGaDgg2iAWCPaELBXgv4X0HBf3vQFhAZRiQ=;
 b=OQE5okFTTolI2ITpcjNfcuVnwrScx/nAwHD3mvazG7LJO/QMIH2Fbj9sOedoLf5orl
 nXUo+iecY7mNo8cLNdaZawhP8MLPxXuNt4rwTkTZqQwMSCD3mdXT3QUjSQ+SjhFJ4+Gr
 WB9TdGwtEU8ImywE8KEFAU0s8TYjKyPZ/rlRNVSqoX/EDgFRcoPf7NiYLV2Qt3c6MvSk
 oj53WO8FSpEKT5iywKOlCDCaSRuq2hzIz5JHnlpYucdbbvEb7i0qDWgDywW8tOOqQHmN
 kjfW08SYVj0Ukh2b/QcvLr7KH1P9ZoVntjRlGQKSDp5kZLvhVDI3CiJudDkRNgvSLpIs
 uY1g==
X-Gm-Message-State: AOAM533Aipbjgo2zpkj3bZpS+HLYogVIOXyCrsiNr7arHvExgc3WV97B
 njyfJawwleC/BoLe5yslL67xrb1GogHIS3/yq95Tag==
X-Google-Smtp-Source: ABdhPJwPA3LUrHxPOp9i9XiojGiQMMtuJJ9iaHESYXDnCGtsk9Eq6aoLWvEYlufV21vgBTy5j0NPHXCiv2FR8SyH93A=
X-Received: by 2002:a50:ec89:: with SMTP id e9mr15673412edr.347.1620164759116; 
 Tue, 04 May 2021 14:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210504162841.2884846-1-titusr@google.com>
 <20210504162841.2884846-2-titusr@google.com>
 <b0e4ed67-d8fd-3902-6a71-144203b9a9da@amsat.org>
In-Reply-To: <b0e4ed67-d8fd-3902-6a71-144203b9a9da@amsat.org>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 4 May 2021 17:45:22 -0400
Message-ID: <CAMvPwGqoeXCCFQusH-gAC+KYnSVSw=yo0RGDDzYNprjkH5m4_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/i2c: add support for PMBus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=titusr@google.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

It looks big but the bulk of it is simple switch statements and
definitions. Unless you mean you'd like it split despite that.

Regards,
Titus


On Tue, 4 May 2021 at 16:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Titus,
>
> On 5/4/21 6:28 PM, Titus Rwantare wrote:
> > QEMU has support for SMBus devices, and PMBus is a more specific
> > implementation of SMBus. The additions made in this commit makes it eas=
ier to
> > add new PMBus devices to QEMU.
> >
> > https://pmbus.org/specification-archives/
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/arm/Kconfig                |    1 +
> >  hw/i2c/Kconfig                |    4 +
> >  hw/i2c/meson.build            |    1 +
> >  hw/i2c/pmbus_device.c         | 1611 +++++++++++++++++++++++++++++++++
> >  include/hw/i2c/pmbus_device.h |  520 +++++++++++
> >  5 files changed, 2137 insertions(+)
>
> TBH this is quite a big patch to digest.
>
> Any chance you could split it?
>
> Thanks,
>
> Phil.

