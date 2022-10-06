Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD75F6842
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:34:25 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogR16-0002Bl-A3
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQsD-0008V4-Gi
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:25:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQsB-0003Dv-Fh
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:25:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gf8so1727444pjb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wh6HpxJ/CirDaAgIS0qYprbWI9Imbl2zTI6V5eZm4fs=;
 b=twSbEpG9HrVSoPXmEnslvgiP9CG57kUPX5gN13qyQzOdjYgS24snYFzV6o6YF2lNOX
 d53u0VZW8jchPwmoSRstkSGSROxFP7G/BVIiR1AQyoHpOhZeO4HZpxljod650ov9cBzs
 ATxGyrg/Xmmq0p3GvovCY8XFuyz0EJR/RBZ1UItJOwURpUyoJaYavMNp6yKCO+LMZZyE
 R7EQWsG394zvJ9SNSTE4updGzof3R1eNDga+/oG4VlpUKnp1MuBHL78d5KzZ1Tfn5Rei
 k8lUdfzTLdydfZfXtI0sXCj8Xf9jal0iMdRWQbju8uHY/EOh8Xf7/z4afCtelFO/KkI6
 k2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wh6HpxJ/CirDaAgIS0qYprbWI9Imbl2zTI6V5eZm4fs=;
 b=lCPZoRF7/m+JDXbd1WAzenfaNhBp2tKDvRX8QH6WNgRiMBLPhpKeXgQXbCYgeNvxGq
 GMJLp28/cHDU0tNwN0+Fpe1qvUsoAyWBQRvmjRWrue+PJ9TP8WtFFIddSiod1i71H98e
 hCY2poOcap/TCGGLzpli+dl3Yu8y4xQjEIS5hq+d7e+X0wkGvHDjDEhfdqsFf29iwnq+
 VXliz9RQWTQRHDDzo929Ia91n4ETyAIvExUg77QsTz14XKxzZQu72FHlBCvueWM0pjwI
 WIaVlTYtppia74kNdmMjc8YDFIpA0DdMp8w+rWSHEAgBvD+PkggT9dNgdxjl0on8DphM
 X9fg==
X-Gm-Message-State: ACrzQf19ZrnzH3O1xeK3DAVjvtR12GJPt3JqCHm8MM5oVNFaB4luq56b
 Tl3VdktUeyU8YRSCjJ9++kFAPfScKCXXVGOZtKFQfA==
X-Google-Smtp-Source: AMsMyM4B6DBM0pFOZ1KKgfndInpYyK7jZjv8UTC00zpYvFkxETXhY4gAbs3yhsYafvF7npVKZ7Ceb7xRizr9SkXgOiQ=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr4870573plr.168.1665062709072; Thu, 06
 Oct 2022 06:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220929094821.78596-1-faithilikerun@gmail.com>
 <20220929094821.78596-2-faithilikerun@gmail.com>
In-Reply-To: <20220929094821.78596-2-faithilikerun@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:24:56 +0100
Message-ID: <CAFEAcA8Dqq8+5wACvEw3hu-m-FPjKoW1ZBwQi5D203CTWCpPNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] include: update virtio_blk headers from Linux
 5.19-rc2+
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, stefanha@redhat.com, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Sept 2022 at 11:14, Sam Li <faithilikerun@gmail.com> wrote:
>
> Use scripts/update-linux-headers.sh to update virtio-blk headers
> from Dmitry's "virtio-blk:add support for zoned block devices"
> linux patch. There is a link for more information:
> https://github.com/dmitry-fomichev/virtblk-zbd
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>

Just as a process note, if that patchset isn't upstream in the kernel
yet then this QEMU patchseries should be marked as an RFC, as a guard
against our applying it to QEMU before the kernel ABI has been
fixed.

thanks
-- PMM

