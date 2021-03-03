Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46232B9BF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:12:09 +0100 (CET)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVyi-0007XD-QA
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVx8-0005q1-C8
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:10:30 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVx6-00054G-KV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:10:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id bd6so18027669edb.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=piG1RcT9ZLNlYF54LyASagleUCQS+FSLj2aAWCXgEtM=;
 b=iOGaye8+ZkmYe2Vd/r3IiJMrJ85ridoRt09CZd+hCWeV/T8xYWEMOx+6NbqQEyFFLs
 M2Y/GISaC7QeKv8/u++od67jNMqBYM8T/LzeUO98tCRbIPR4NCVo5eo0Z0KcBiPX/Nqh
 WsQ1UOcBl5dFC1lFdQ1JmyMhuJhzfcCXjNCNEDy8Mx78/xw/A81Sv92aEbXgD70Ucq0x
 R3+JQmq4iB+vPcugsJEmE161vlUen72JKuGGIJsIBTR72JrG45iNah2yMGyiaC9j1H47
 uDrqE+jYbSnTmim6nENUwbOl907HbBhR9ay9kOGvPML4P0xbWWduh1QNi94Sd6RllQD4
 fVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=piG1RcT9ZLNlYF54LyASagleUCQS+FSLj2aAWCXgEtM=;
 b=btTSPFFHiftplYHGuYdwYECgFtApisJtonUG6EPHmf0VViZ3cyCbN6etYYVLu2+l7C
 5P5kj49SClLL/xO1L8dO1PV64Ww4wtuUq44RmYPCDimA6mPJqfZz9G6xUvO2w18ZTHgd
 rLkY0Rxt6AQpmqL8buHlIBVl88ewjsb4Hstn7Y+AZ+9cuOpDgRYcYMuSyckJuMi8gY5J
 kCKl/lT/nXS5Y8fvcltOoG9lkVtruuzz6GvMfCdVgCCuiRwn0v2gZoLTJL5lLCPAnmcc
 T6WXszKy/q2xm52bdoa5L/Jf5sxLoo0feJ61+r21sykqHgy/ARhRBfnxsTqS0nLREs5O
 XLHw==
X-Gm-Message-State: AOAM530N4gfxHq6nZAhABgxSGWt1Dju4aqM4m4YUZKkYNuQGsM/TL7Gn
 YvkcLR1oDbU5GjE3jVQSmbsmk4E1ab83rX3YXLansg==
X-Google-Smtp-Source: ABdhPJwOm1JtAQqzVaqhAHZ00epT3I7oLZDPCJcWJwQ9DcB/RYBOsWeibd3JBGRlXjjzChhopyZVpgefMLJtCzgMVfs=
X-Received: by 2002:a05:6402:17e7:: with SMTP id
 t7mr600625edy.44.1614795026724; 
 Wed, 03 Mar 2021 10:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20210302142014.141135-1-mst@redhat.com>
In-Reply-To: <20210302142014.141135-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Mar 2021 18:10:11 +0000
Message-ID: <CAFEAcA9G3y28Eh=JGQRYqnWW==1Dv4Dx3+ANZZLfBY8Qg1er=Q@mail.gmail.com>
Subject: Re: [PULL 0/4] pc,virtio,pci: bug fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 at 14:21, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> A very small pull but there are a couple of fixes here for
> bugs that have been biting us in the field.
>
> The following changes since commit 51db2d7cf26d05a961ec0ee0eb773594b32cc4a1:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-25 14:02:16 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 1d8d014e936a49795de95a35a2a1ab8000ab2e5b:
>
>   vhost: simplify vhost_dev_init() fail_busyloop label (2021-03-02 09:16:18 -0500)
>
> ----------------------------------------------------------------
> pc,virtio,pci: bug fixes
>
> Fixes all over the place. Specifically this fixes
> a bug which made windows guests lose device config
> (such as the configured fixed IP) after upgrading
> to the new QEMU.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

