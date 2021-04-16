Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F355B362967
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 22:36:05 +0200 (CEST)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVC8-0006XJ-TP
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 16:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lXVB3-0005yK-OB
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 16:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lXVAz-0000k2-Pp
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 16:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618605292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fNNgqRlm3js3tNLBhWoImjB77nBgPnyaatPVka/WPV4=;
 b=AF+7KL7S47Kc+GRtZ7oeNKt6iOqBjJA+i2KpY4wTJgVy+an+/1uKolxd9igwnknJC6iiRv
 M2ptvfSucdaMF8J/xTo8rgbe2nDbLyrJfVzSJpzQslwjwR4DI17+hVAarRL+B27H0xkECs
 wsAUevni3eSNjgE7XzvWSfjXaMw903w=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-uykM7sJgMWmigL_BtOvHMg-1; Fri, 16 Apr 2021 16:34:50 -0400
X-MC-Unique: uykM7sJgMWmigL_BtOvHMg-1
Received: by mail-oo1-f71.google.com with SMTP id
 62-20020a4a11410000b02901b6bbbeb606so2968380ooc.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 13:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNNgqRlm3js3tNLBhWoImjB77nBgPnyaatPVka/WPV4=;
 b=UHHytiKm6RCzRMqUEZmrkmph4uc9xFQX+C05AYC3WiTl5lZLZSn9v3ja7id/7+YmGm
 dvgic5Ao/TK8VCjgGfbVeMRkBMD3Jov5zF7uoacFMvH140kvOPo91MFQ5vaQ/FicKWO5
 kFU9vQWuMvJrFyZyjcFHTj+NIM5c1luJ3CKgk5SnsoAvQRMv6+VQy5uwFeQQSvFuYxQ6
 sKFtsQxNxcIAnHWLBlhCMCH/Ze5U0SiDAFejbDlvxjWWLvgwq/dXdK9zLAWj3mgf3CL8
 ZEBfsLOq5X3Iu8s2/RiW3SmbiBFHK58e42/p1DVLOd+LHm2/veBGiwR06yLYTFBkLr1o
 Wq5g==
X-Gm-Message-State: AOAM531ZDt7pJM96N7yI9aJWKK/uFQAJ9lL8HGD5SLVAFNlAvienz/wC
 m0ySj4V1pyM+0mL2SnmoFLT7sLTKHq7XEWcH12NEHCEQG+pEQp51vSEKExCvWiCunhWSV/whiK6
 RL8xSwWnb91S0TLZvLHFpP4wvPGSxlK4=
X-Received: by 2002:a4a:c3c3:: with SMTP id e3mr4655694ooq.79.1618605290158;
 Fri, 16 Apr 2021 13:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUiI2dMYztfWWY85POkf76RGuF8GkqbQemboY9ymDm/sxGDClAZcWwh+F+fbzc4iKMNOa/Q5G79leC9R5Cs7I=
X-Received: by 2002:a4a:c3c3:: with SMTP id e3mr4655677ooq.79.1618605289805;
 Fri, 16 Apr 2021 13:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210416052333.1548853-1-thuth@redhat.com>
In-Reply-To: <20210416052333.1548853-1-thuth@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 16 Apr 2021 23:34:33 +0300
Message-ID: <CAMRbyytmcZHggOtxJ09Lu4QEke-B=Hz_+cf_HLqRV9joQWaG=Q@mail.gmail.com>
Subject: Re: [PATCH] block/file-posix: Fix problem with fallocate(PUNCH_HOLE)
 on GPFS
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 8:23 AM Thomas Huth <thuth@redhat.com> wrote:
>
> A customer reported that running
>
>  qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2
>
> fails for them with the following error message when the images are
> stored on a GPFS file system:
>
>  qemu-img: error while writing sector 0: Invalid argument
>
> After analyzing the strace output, it seems like the problem is in
> handle_aiocb_write_zeroes(): The call to fallocate(FALLOC_FL_PUNCH_HOLE)
> returns EINVAL, which can apparently happen if the file system has
> a different idea of the granularity of the operation. It's arguably
> a bug in GPFS, since the PUNCH_HOLE mode should not result in EINVAL
> according to the man-page of fallocate(), but the file system is out
> there in production and so we have to deal with it. In commit 294682cc3a
> ("block: workaround for unaligned byte range in fallocate()") we also
> already applied the a work-around for the same problem to the earlier
> fallocate(FALLOC_FL_ZERO_RANGE) call, so do it now similar with the
> PUNCH_HOLE call.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  block/file-posix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 20e14f8e96..7a40428d52 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1675,6 +1675,13 @@ static int handle_aiocb_write_zeroes(void *opaque)
>              }
>              s->has_fallocate = false;
>          } else if (ret != -ENOTSUP) {
> +            if (ret == -EINVAL) {
> +                /*
> +                 * File systems like GPFS do not like unaligned byte ranges,
> +                 * treat it like unsupported (so caller falls back to pwrite)
> +                 */
> +                return -ENOTSUP;

This skips the next fallback, using plain fallocate(0) if we write
after the end of the file. Is this intended?

We can treat the buggy EINVAL return value as "filesystem is buggy,
let's not try other options", or "let's try the next option". Since falling
back to actually writing zeroes is so much slower, I think it is better to
try the next option.

This issue affects also libnbd (nbdcopy file backend).

Do we have a bug for GFS?

Nir

> +            }
>              return ret;
>          } else {
>              s->has_discard = false;
> --
> 2.27.0
>
>


