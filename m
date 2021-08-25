Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC43F743C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:19:02 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqvt-0004fF-HE
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mIqh9-0003zG-6I
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:03:47 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mIqh4-0006wA-Id
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:03:46 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id gf5so1845118qvb.9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LF80IcLcroicPi6L9GSHC+en1S+G/o9+iOc14bEKlWk=;
 b=qLDKfUW+yQKO+4tg5VL7GO3Bkg79D9KcTUAfptAzy4JD54oJGfC3SiPzLcqNVPVkZM
 9+jzcQEaDsDszacAzWZ1gc5DAH46yu+sBLhY+FZ+tNszi24bNzP7DnU0t7C+9c1sZtY9
 pXRQTk7xXV1t6mhlWrFGiMZNvYrt+If4Xi26QnL3/TSd/ryoNxlf+h45tLUZ4mN3vBsC
 XTeNtAVFedqfpBY0/eSgZgzKCfo7GjWpNejsPtoEr6JIdgAr5AEvMKQ0QlqdvC/tG6FW
 iJnPYBaHI3qJWX0DcJO9Sx8nff+B273ouEDGtoKJ59BCnoBiBObNB72TBumyacQEfVyb
 6FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LF80IcLcroicPi6L9GSHC+en1S+G/o9+iOc14bEKlWk=;
 b=ImjyIYIkp+bJEJHAF/wFlK9DzUR37+wolz11tAxBXbxAyb0/CX4GPSLLYZMlCSP1tN
 iDf5fB2KuJJdIeR9hdfs00Gmocp2V01sf+rAkOUb+w/GhuDRqGnu6hfLvMd2I9rOhy5I
 oCIzdq0TYyoEHGsVOB/xbjOlTVJ0rz76ZiwmBTvuBcp6xTTMqCAMhcIDPZCXw22jg+o2
 ekDAhQ19MbeOLB9/w7+ivF/HQoLG9O4Ah471yRhmkwd5jaCVh5/FLxtnY+X6ojMA3BVn
 JGgMi6FmWrCiVmzqMRA+coRLvji39Spr2fb1Ndmu27/30zX/d/frucVgi3oDPJDcsN1e
 5CnQ==
X-Gm-Message-State: AOAM531alkaBDnPUQL6pb0r6nvZumpO0aqMa/aA9e3JlVHGZYhWssXi4
 2z4jwjI0VCUreetzEddGNpw=
X-Google-Smtp-Source: ABdhPJxb+7LXJVizQ26Aajdkh4Jg9Vwr28HzL7ZZUjYkWrErgPQmv4vRYW3wHDpC/aq3HSzsB4Wzwg==
X-Received: by 2002:a05:6214:194b:: with SMTP id
 q11mr44044293qvk.33.1629889421761; 
 Wed, 25 Aug 2021 04:03:41 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id s18sm10795577qkj.87.2021.08.25.04.03.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Aug 2021 04:03:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: edid support for a Mac OS 10.8 guest
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <97B8E871-07B9-445E-8BC7-3A7BCE7F06CB@me.com>
Date: Wed, 25 Aug 2021 07:03:40 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <26BC8BC2-7AC5-40E8-87B8-5A0BC3AC5357@gmail.com>
References: <97B8E871-07B9-445E-8BC7-3A7BCE7F06CB@me.com>
To: Chen Zhang <tgfbeta@me.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2d.google.com
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
Cc: kraxel@redhat.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 25, 2021, at 1:24 AM, Chen Zhang <tgfbeta@me.com> wrote:
>=20
>> On Tue, Aug 24, 2021 at 05:46:43PM -0400, Programmingkid wrote:
>>> Hi, I recently tried using the edid feature in QEMU for my Mac OS =
10.8 guest=20
>>> like this: -device VGA,edid=3Don,xres=3D1280,yres=3D800. When the =
guest operating=20
>>> system loaded there were no additional options available in the =
Display=20
>>> settings. Would you know what is wrong?
>>=20
>> Probably macos just doesn't read the edid block ...
>>=20
>> take care,
>> Gerd
> Hi,=20
> Probably it was due to the low default vbe size.
> Adding a `vgamem_mb=3D64` to the option list would suffice.
>=20
> Best regards

Thanks for the help. The option unfortunately did not work.=20=

