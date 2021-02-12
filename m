Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA53A31A036
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:01:53 +0100 (CET)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZ16-0004u6-G3
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lAYvI-0007Lm-Ta
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lAYvG-0007ah-Dx
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613138149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDtney6krny5k7qISEyYYaDsOIeiY7rMhO750PKB2bY=;
 b=YACerQekXO7kbz4gJNqpnECewU+bys1j91GWVkGn5aLTS4UAqqv60YVWF5Sa6m1ycv+93N
 vs7fa6Fuoauh45o1ilqf3JRbf+t3CFt0YuyaGlwf4RDqRmtrB0WOjj+By4UWWEY+xzR6F6
 gg+50UYovcjtBR8ubftyHZu/ivKFabA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-4Dxe0W4KMCWAPy_Ph5tNWg-1; Fri, 12 Feb 2021 08:55:47 -0500
X-MC-Unique: 4Dxe0W4KMCWAPy_Ph5tNWg-1
Received: by mail-ej1-f70.google.com with SMTP id yd11so6848885ejb.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 05:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lDtney6krny5k7qISEyYYaDsOIeiY7rMhO750PKB2bY=;
 b=nNeUpM9+WkO6LMd8h3BaIdDZ9kWGWYU6/2+4/fy6uaWYvWrp4ElBfQqRWTSpv27GRd
 Fd6o+rJF1Mc3yxgheXxZnj3xY+hEfBLRfxtCCQgXHfrgIN2xGDHthMamY8IRDgBg0iDw
 +hTlr33n5+yblb2limcOgxwY9orhiQmjoTWMJIaIwGOzG69hAmLZpYqO93uWqqYCFDgB
 KMXy76fJKBBu7UGslVI/SamrPpHx2Tp6eb7B7AUJRVdv+GKjaJwipJL7/hyvKEBTzLWK
 hiVVCdIPGZS1YiBnUvbMK2XZObb07xUIfWGCXdQGRCHSlowRSFrUdf5Png4cRpIlWKz1
 EBSA==
X-Gm-Message-State: AOAM531vCf8qLaMsiMWc1WBIFO7JnM3poX/Q0ckJk5d5rmBOi1IEz6Tq
 HmefYcQCbgyuydcgw7qB03DlbN56f5zE+eq4JkejEI4bmivAuWSQWDsRGNoNXjmq4xZBEI/pgx9
 Byg1Wgq9+Gy5wlPIIbr0l4m3k1CZM/ts=
X-Received: by 2002:a17:906:b082:: with SMTP id
 x2mr3051877ejy.100.1613138146787; 
 Fri, 12 Feb 2021 05:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgXrCN95g+7tOuNF82uvutMEG7P8UKaERDEvpdtpqEbLQ6zUu44bSGhzUwvrLVa2E0Y+4wIFKaFk6NVY+1XDc=
X-Received: by 2002:a17:906:b082:: with SMTP id
 x2mr3051857ejy.100.1613138146626; 
 Fri, 12 Feb 2021 05:55:46 -0800 (PST)
MIME-Version: 1.0
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPLD68GXeMyU_LTVYjv8YUXex4wvyAnHkOgu=PK48pP7w@mail.gmail.com>
 <CAA8xKjWojtJgOM-M6NYvWH5cPhEhxSdcWQ55Nz-24MstOr=xYQ@mail.gmail.com>
 <75b11565-98fd-b242-2b32-0c04e5cce181@amsat.org>
In-Reply-To: <75b11565-98fd-b242-2b32-0c04e5cce181@amsat.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 12 Feb 2021 14:55:35 +0100
Message-ID: <CAA8xKjX3D2tu+6EPq5ASKd+iFkBkqTCsV0zgWP=K8Bh=nSr7LA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 8:48 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 2/11/21 9:52 AM, Mauro Matteo Cascella wrote:
> > Hello,
> >
> > On Wed, Feb 10, 2021 at 11:27 PM Alistair Francis <alistair23@gmail.com=
> wrote:
> >>
> >> On Tue, Feb 9, 2021 at 2:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>
> >>> At the end of sdhci_send_command(), it starts a data transfer if
> >>> the command register indicates a data is associated. However the
> >>> data transfer should only be initiated when the command execution
> >>> has succeeded.
> >>
> >> Isn't this already fixed?
>
> The previous patch was enough to catch the previous reproducer,
> but something changed elsewhere making the same reproducer crash
> QEMU again...
>
> > It turned out the bug was still reproducible on master. I'm actually
> > thinking of assigning a new CVE for this, to make it possible for
> > distros to apply this fix.
>
> It sounds fair. Do you have an ETA for the new CVE?

This is now CVE-2021-3409.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146



--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


