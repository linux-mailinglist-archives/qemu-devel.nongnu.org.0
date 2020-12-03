Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB52CDFD0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 21:41:51 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkvQD-0004rx-VG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 15:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkvOu-0004Ba-FL
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:40:28 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkvOr-0003zm-I3
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:40:28 -0500
Received: by mail-ej1-x641.google.com with SMTP id x16so5460385ejj.7
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 12:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YrgB3bdf+d7CgKv59gCWbIYE6bPHwWY36lz+HTA3S5U=;
 b=DaAZnXRDboFcmCmA4WMuJEMYQfToo1bP1SEkp9bkL+HB1kIRNtnPSn9oHoctXxITCt
 n7O8YlP+MsAHg5d5B3g/Ly4RYoFJmUQPyvIRkO60QF/YLZZ7hFQ0y2ihjMRDBmL8XwFz
 JDb5Xjwgmtr7YWGm4b2CDrgUxzRqYr30DMXoUqP87cD0smQNpCmqQR2huMjMYj4s3NIG
 Xi6qu9+CWdGcbTFqS5T0KE2vo2hNv2SQ0TEhEeG4HVKm0l3BouKCqdd0ujttIIwvRla4
 Msd2sYl7jZnvFWIK/uK2h6CQpNc0ZJwDE2SR0klf7O1UzdEJpF+t7OBpv5O/d7uIV5aN
 YIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YrgB3bdf+d7CgKv59gCWbIYE6bPHwWY36lz+HTA3S5U=;
 b=UYQCOc/6k49j9dpBCK6wfyF9ix1ONl/v/3eImXWyW+qS3de2bYfry3VDEl40kCqHG3
 a6A064N/hwwBGcdrLMJNtE9jvtcP/S+ogzLmDFwRg+XE8+kCIKhgLpN8y/ffUV5DvO7V
 y08JPlwMuAo/wQ8UTGTxD4iMQ4ELs4AY61Qeens+X4A7DKX1EP+FBvNhioAS0mM2h0dh
 SmHcgsQxU0PJL3DxNXlcBD6ek5aS7tKjnaT17XXNPLowhOOfS2w1bEXUuVInM3Bun/4S
 jNP8qWmUGdtD8s1EM/6QoVdHSz4ULfnz+yO8h9dQ9DOSIM+bydd/ghYWokZXxVRt+m5P
 XM9w==
X-Gm-Message-State: AOAM53226NO8Z+NNyqYZ9ESrBrR2UAFL9jvPKVV7sbXaTW85O04WeiNd
 0oRqKv0tPnDD1boFvcyhZom4DCzJWlgdoNneT7hdtw==
X-Google-Smtp-Source: ABdhPJwic98v9GDXHdFKQAsrPzkeRlp5RwcWxLSuOK1m2Yeioeb83n7LOGK67jlxchpppj8WrXhIvUe8e+OTXyyn2zE=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr4112561ejd.85.1607028022810; 
 Thu, 03 Dec 2020 12:40:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <20201203091404.GA687169@stefanha-x1.localdomain>
In-Reply-To: <20201203091404.GA687169@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 20:40:11 +0000
Message-ID: <CAFEAcA_YTeBy3T5umkRKnUx90yqLD1HRHzcW9FsA1iDJGezcEQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, john.g.johnson@oracle.com,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, thanos.makatos@nutanix.com,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Dec 2020 at 09:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Dec 01, 2020 at 03:22:35PM -0500, Jagannathan Raman wrote:
> > This is the v12 of the patchset. Thank you very much for the
> > review of the v11 of the series.
>
> I'm in favor of merging this for QEMU 6.0. The command-line interface
> has the x- prefix so QEMU is not committing to a stable interface.
> Changes needed to support additional device types or to switch to the
> vfio-user protocol can be made later.
>
> Jag, Elena, JJ: I suggest getting your GPG key to Peter Maydell so you
> can send multi-process QEMU pull requests.

I would prefer to see this going through the tree of an
established QEMU developer who's already sending pullrequests,
at least initially.

thanks
-- PMM

