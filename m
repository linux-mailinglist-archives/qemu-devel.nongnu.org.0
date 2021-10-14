Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08B42D630
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:36:15 +0200 (CEST)
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1max9r-0007OB-13
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1max6d-0005Xp-F9
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1max6a-0001Ua-TV
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634203943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2fzvM5dF+MHLMV66xTNa6ALuvTaeUXnZCtZI3Uln3h8=;
 b=OwSflhwJuxbnDlSfec/5zEfZ9iITL+OuUUCY4S6nZL022aH0IdfsxsFjqKLX9Gm0ekZ4kA
 7t6Zqp4P7Aru/CcQb3UtcLKXiitqTDXfGVG9n/K+yZlJV8EhrTPXG5NXWrb62fobQAAzy6
 zOpucJSthMj0vm3uLJBCULKeBYLtfqE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-DuEZBvjbMsmUSf75m8wPig-1; Thu, 14 Oct 2021 05:32:21 -0400
X-MC-Unique: DuEZBvjbMsmUSf75m8wPig-1
Received: by mail-lf1-f72.google.com with SMTP id
 z18-20020a0565120c1200b003fd76d7ca21so1219917lfu.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fzvM5dF+MHLMV66xTNa6ALuvTaeUXnZCtZI3Uln3h8=;
 b=S5hYMMt267kNKZrhtBapIkBrgnXLUhW7wnALRoX2gq9JbP/FD0m+UHp+D7Ne3bG/Si
 OMX5hER0oYwxksZeCaTCZZlqwgT3UWcYLRaT7lqdZK+OYfqOzjtqCFCtID8w4S/Fouam
 isZ0sNL8FqnVGSIPD6qseSUDzS3Ia0h7YeH5Eb5DCSFx5kx2XjxhBfH9DHt1kaAiSobD
 bSRnd584ZgHEgIuQ2xo8CnHXTSkoj3b0dqN71BQUjW5LiBD48EaHf+8IaunVCdg19GIe
 0eXg9BAA2+ilPGwq3CrtmJi1n/zZj2yQLoSQn/u3zX+1YTLIgo/e9cZbytkvApnap7AC
 Rq1Q==
X-Gm-Message-State: AOAM5331wPo9VRXd+n5g7zXz7zR3F5VT2boFFaW3G8FiSb253ZbTmqcz
 eF3rvytW9/TMbttyRGMCGEPEQadTm7Plq7tWaU4c7pj5kcAcaBw3fjO7PwPKFC/PGuqvfFpL4Nb
 EZCHgk/Xyun+L3nMt6w70+gdPnC9Tqcs=
X-Received: by 2002:a19:c14e:: with SMTP id r75mr4121381lff.275.1634203939699; 
 Thu, 14 Oct 2021 02:32:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQOR0OwnIpFXLkG1G6MkBUHI37Un/B/H82rEOwmVRht1Qqfq5bf2/ax1OF7zjIt+t+iVEay23/lGzrrkcByE4=
X-Received: by 2002:a19:c14e:: with SMTP id r75mr4121352lff.275.1634203939307; 
 Thu, 14 Oct 2021 02:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210923143100.182979-1-sgarzare@redhat.com>
In-Reply-To: <20210923143100.182979-1-sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 14 Oct 2021 11:32:08 +0200
Message-ID: <CAGxU2F7EtMg7w6eDmJV+FGUSjr4uTC6=ROnERms_Frz7PSu9SA@mail.gmail.com>
Subject: Re: [PATCH 0/3] linux-aio: allow block devices to limit aio-max-batch
To: qemu devel list <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kind ping :-)

Thanks,
Stefano

On Thu, Sep 23, 2021 at 4:31 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
>
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
>
> This series add the `aio-max-batch` option to the file backend,
> and use it in laio_co_submit() and laio_io_unplug() to limit the
> Linux AIO batch size more than the limit set by the AIO context.
>
> Stefano Garzarella (3):
>   file-posix: add `aio-max-batch` option
>   linux-aio: add `dev_max_batch` parameter to laio_co_submit()
>   linux-aio: add `dev_max_batch` parameter to laio_io_unplug()
>
>  qapi/block-core.json    |  5 +++++
>  include/block/raw-aio.h |  6 ++++--
>  block/file-posix.c      | 14 ++++++++++++--
>  block/linux-aio.c       | 38 +++++++++++++++++++++++++++-----------
>  4 files changed, 48 insertions(+), 15 deletions(-)
>
> --
> 2.31.1
>
>


