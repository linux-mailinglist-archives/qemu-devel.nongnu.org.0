Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C22C6D30
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:28:39 +0100 (CET)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimEH-0003Cj-NB
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kimCZ-0002PF-3k
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:26:52 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kimCX-0002NR-1l
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:26:50 -0500
Received: by mail-lf1-x129.google.com with SMTP id q13so8301388lfr.10
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OgwtkWrhXIbmxf/Bt9eZbn37CHyLK0hWK7GqTEXc3Hw=;
 b=DXVdMXwa+r0gwvIDd2s+rZQVzFX5uxUWHXiya4pevROUbkzSFPuEFf+ICw42Ycbgtj
 oxOgm8MG7YTomNtCcR03RsawVw9ZOn9sms+B+qleaPqCRuNevhd5ab8czJOl0zy6ANMd
 GaMIhwv8bQRYp9IJq1lNxkebMXlVO9EBTX+HyQ1eqoIP24n0rSDYI+IngzJ8dXoLdxuw
 D4CcALU7fvuIYQbj+RsY7xcq9UHEBC5Kuq5VnwvdB0RIgpFRRVL2ajMFEN6mB7Pi5DoL
 oUClINy3U/IgMppfG4X4wVScsIztNSrTENMilkIKfG5IbztoxMzTecQOCufrdyUMPVz4
 UTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OgwtkWrhXIbmxf/Bt9eZbn37CHyLK0hWK7GqTEXc3Hw=;
 b=LpA0VD5LXxIc6E2jSamLHiszxVjfjBfS5omfwbI1g0E6TQqPpsYucam4h3JKB8vyud
 l0SF9eMIynWCsxBjxTpV+9aJtEX7KyB348lOAoCPKK+UzD3FKBXfEXwff/Arh8Y0zJLW
 WmaR/l2CNyPkVxUufS0ieC9mSi8RAc8B7+vswZl8m4XZ3D31qHkOdY39Hp7sPdik8GDN
 B9iYk5gF8hR55dS2U8UGV4ETITLaMs4uKT0RKFc5OzJjm6VKzWxaPl2g/bAl3rtn19uc
 e1gG0SJKTs9d8fMANChnJSR0WciBzsJzSodSfjyurOFrsr8JA3SaKXyeZ1klGuruMSo4
 +I5g==
X-Gm-Message-State: AOAM531kU5jshr6CCgMvfgMRnWztm/iCAZ3lgyoVW8q3PEKC+DR7WGo+
 8FL3sXkMZJLCsvFJW78umtYyD/+kiP42Jbwiuaw=
X-Google-Smtp-Source: ABdhPJx7zmB/tw7+FPEV63af6u9uuLB7vOHq4d+FcR+lOeooH0eUor7CYnU/Q3DpxUtBF6iK/Egyl64gDtWMI4cA+00=
X-Received: by 2002:ac2:5087:: with SMTP id f7mr4745742lfm.369.1606516006634; 
 Fri, 27 Nov 2020 14:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20201126221111.703652-1-fontaine.fabrice@gmail.com>
 <20201127071847.mvs4wikik6jb5vlh@sirius.home.kraxel.org>
In-Reply-To: <20201127071847.mvs4wikik6jb5vlh@sirius.home.kraxel.org>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Nov 2020 23:24:03 +0100
Message-ID: <CAPi7W81Qm_Le8E5BH5Cstg_fc9gf9vtDKbhBnXJ2wC0ngTcF-g@mail.gmail.com>
Subject: Re: [PATCH v3] Fix build with 64 bits time_t
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-lf1-x129.google.com
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Le ven. 27 nov. 2020 =C3=A0 08:18, Gerd Hoffmann <kraxel@redhat.com> a =C3=
=A9crit :
>
>   Hi,
>
> > Changes v2 -> v3 (after review of Gerd Hoffmann):
> >  - Replace include on <linux/input.h> by
> >    "standard-headers/linux/input.h" to try to fix build on rhel-7
>
> Now it complains about ioctl() not being declared.
>
> /me suggests to create a fork @ gitlab.com and push your branch there,
> that'll run it through CI and we have a centos7 build job there which
> should catch this ...
I fixed the issue by including sys/ioctl.h.
However, I have a test failure due to a timeout on
check-system-centos:
https://gitlab.com/ffontaine/qemu/-/jobs/877810804
It does seem to be related to my patch. Should I send a v4 on the mailing l=
ist?
>
> take care,
>   Gerd
>
Best Regards,

Fabrice

