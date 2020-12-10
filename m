Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA262D5F6B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:21:48 +0100 (CET)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNlK-00029V-BS
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNjy-0001f0-8S
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:20:22 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:38779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNjw-0000HG-Rb
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:20:22 -0500
Received: by mail-io1-xd44.google.com with SMTP id y5so5868940iow.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P5yw0nojv1FxIPkklRD+Vn1mPyoBzspT5SRNNaz7RGU=;
 b=kIdr8oPuKbMPuSqytIabpVf+M8isfoCi3bJgUzBNpduqmRs6PlO+aExAa8yBeWKMDn
 ahjKluUROgVS9FRrTefqt6u96vjI7N16HkHdj9Mm23ZeS6GS7A+JFAbHavsyT19j38Ia
 MB5xmI5PiWQP+P3Xu7ltfVYAG49HmT0Fw2kldNMhi7fZBm8FQ2xIUJb4gshxZw7zIIuy
 7CJGh2rCq8mCgRMMlEhm2elKoZwoQlCzAxa3oIaEe76XRXx3gWjwFBckZO6x03ensySA
 h5bZpJgNfjb+J2w6P1+aS+pAypbINVMqAC5whhvPaRh2gqCvgWuAhkCacmlJQaQFEErP
 MxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5yw0nojv1FxIPkklRD+Vn1mPyoBzspT5SRNNaz7RGU=;
 b=WXsf23bK+ABNBf8/ZykWKMbihl/irXIoLwZyp+I20/1g7S4x51sE4sAXlBz/YcxNVP
 p48bkhHqpJiv5fONAv2TJKF+ZxbavSkJYNey/ajzyImJDKHp96mUN0rpQD/dAAPJTGgQ
 LPToFNw4h9PcPVlkUs1nKbLNmj0aWpazyJcEEgMvap4P3GG3GAzVbWAnhLfBHaGI2VUC
 +k4Jjc28SCC3GvNWTvJOED0CT0Hr4SRILlHRh7kZ3aZZccKw7YOSaTsWwDYMCqe2+v1D
 WF9thX7VLCmZoGd/2w5GB+M0b8JbzO3bDacp8rBtxH7NG35ApxQGAy+P/nJFM34K12Hs
 kOLg==
X-Gm-Message-State: AOAM530YDqRNjEaJJjBjHExXc+ok3d7xzjQ99XWFJXALU796skwQB4Nh
 91JEfR41MZWNNl3GL/l1ZjBGIEV1J/wc6ZTFugY=
X-Google-Smtp-Source: ABdhPJyEZ4S2+oxMimkHdRzgR2seFLMyinaLcN3ZuFQxkKH3nYaf06LyEPgddbRBF/3kaGh+G4Jr0qMXXo5gHK8Dwvc=
X-Received: by 2002:a5d:9c91:: with SMTP id p17mr8676140iop.36.1607613619761; 
 Thu, 10 Dec 2020 07:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-8-david@redhat.com>
 <CAM9Jb+gOvCqW2rcz++SG1VZV0PoaZqx-_fE5X54PFttD-+1X_w@mail.gmail.com>
 <1a69a01e-9be5-0a3f-0ac6-c1f1fb4b4561@redhat.com>
In-Reply-To: <1a69a01e-9be5-0a3f-0ac6-c1f1fb4b4561@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Dec 2020 16:20:08 +0100
Message-ID: <CAM9Jb+iFuVzVpYj=zjQgMZAcNRLAAstzjxp4c1g2cNBc5rnM-g@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd44.google.com
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >>  bool ram_block_discard_is_disabled(void)
> >>  {
> >> -    return qatomic_read(&ram_block_discard_disabled) > 0;
> >> +    return qatomic_read(&ram_block_discard_disablers);
> >>  }
> > return value won't be bool?
>
> The compiler does type conversion.
>
> != 0 -> true
> == 0 -> false
ah... I missed it :(

Thanks,
Pankaj

