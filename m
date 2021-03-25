Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151C349726
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:47:26 +0100 (CET)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPT8n-0007c7-1c
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSyz-0000ep-UM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:37:17 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSyy-0006JT-79
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:37:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h13so3141132eds.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q503YCwLMCzb/TpN1MXknst0JIQtK5DmFb9n0aDt4BI=;
 b=JuyiH5jMeSf/o8df0LH4HNkXXatAF7Aw2RNJM6up+IgHFP76SEXoBkGgk4B/vXHlgJ
 yTghY0/17iI050khd55MQiJngGgA/9u9G3keZhSXLVDcz5PalpeERdxgNWFv19wmU9eZ
 lfbURD+jZOT4Klc5PIvKtXN0KQl/mPiGvEd2rtcckXglWb0H4KNkyge9TyYogH9A3bNf
 tKhuDnu3sHsNR1BSCz+DOTtrSxXzb/dbZXK6q7Sp50JOy01chhEYNbVIXHFMihwsCQI3
 lzckqKUV2ydoqzi8OWuTLvBwhX4amP+3D/jYi0lHpAjxs5Zh3ac4vGMKkH1Jk+8AFile
 8CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q503YCwLMCzb/TpN1MXknst0JIQtK5DmFb9n0aDt4BI=;
 b=YI0KjYfV+yKtXh2sdEdCV//qrzjw/eAX4kWobOyKQ17elT5rk9FpvOzaX9T+ybfaCt
 psxHu+f3Jat5z9QBhq+YeS5ggVbQ6odFH/O/R4oAjXtIX08ZJX0K2vwPSCPbtuFTHjB9
 lbDsPSH8S9r9DNL/xSLZce9R42W6y4rJV3C1sOLUYBI4NHvZ0iop+zdyRI/ghyhUd2td
 SyWAdRGiWwPdne8td/wPgEGRv526ZdH+fnnv96bC+hNv656bp4HlViHwwV2AU3vaYeLu
 4aScl8Lwo7ICZD5KHYQlCpveyxbNfQsPE40qoJDCZgce7cUdfj0V2f406ivujijZv0Ib
 u81w==
X-Gm-Message-State: AOAM531wcCRCpacod0VVg/bdIJTYbVsGmrX0RbWs9RVkgODb9C2ZWEeg
 3XFzK15bFctCNYBxHbJ0q/6PMNhYfNU+rdmM5/CkjQ==
X-Google-Smtp-Source: ABdhPJz/tBL6QvBLNe49ExsIFEDuIaFq+Lx0F1uccbA7iNrsEu/tqKTusUQ5XhinSQVUkn4H17R9KFiB064VD7n39Rk=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9858490edt.251.1616690234620; 
 Thu, 25 Mar 2021 09:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
 <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
 <YFxeRen934TdLvs0@stefanha-x1.localdomain>
 <43869a87-cf42-30b2-16ea-4effb913e01e@virtuozzo.com>
 <YFy6FNLz+uUemP9s@stefanha-x1.localdomain>
In-Reply-To: <YFy6FNLz+uUemP9s@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Mar 2021 16:36:43 +0000
Message-ID: <CAFEAcA9ZxUhbz=T0bNt=yFT-hChGWP6P5Lc4FqwTbs=jPsb9rQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 16:28, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Mar 25, 2021 at 01:17:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > Thanks! My path modifies migration/block-dirty-bitmap.c. qsd-jobs runs block-commit and block-stream jobs and don't start any kind of migration or snapshot or savevm, so it seems impossible that qsd-jobs runs the code touched by my patch..
>
> Confirmed. The failure is not related to this pull request.
>
> I reproduced the same s390x host failure on commit
> 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e (HEAD -> master, tag:
> v6.0.0-rc0, origin/master, origin/HEAD):
>
> qsd-jobs                        fail       [11:04:58] [11:04:58]   0.1s                 output mismatch (see qsd-jobs.out.bad)
> --- /root/qemu/tests/qemu-iotests/tests/qsd-jobs.out
> +++ qsd-jobs.out.bad
> @@ -9,11 +9,11 @@
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
>  {"return": {}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "job0"}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
> -{"return": {}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
> -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
>
> Peter: Please merge this pull request since the failure is pre-existing.

OK, I'll run the pullreq through merge testing again.

Could somebody on the block team look at this s390 host intermittent ?

thanks
-- PMM

