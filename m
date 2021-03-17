Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176733FA42
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:03:40 +0100 (CET)
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdKN-00087q-ES
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdIa-0007FN-T4
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:01:49 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdIX-0007eL-Ae
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:01:48 -0400
Received: by mail-ej1-x636.google.com with SMTP id k10so539826ejg.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/40ItPJTK+0Z+5i6M6FkN3eo3VSqzVoG2jS5OxroJA=;
 b=UadXAXoQ3yScPlpYbqzuIQQeCLV49cZmer786kg7lnntQCC0/zfC3HUloKrbmoWYXb
 10uzipRZwzoDEoP8FwIjqA5asQYE4H6w/7GUvWlnQ3VjkqniVhATf9lBZ2yJrpU1jwef
 r9ccpjad9sOXjGf+wAs8xBRYnLFfrH0Xf6sTXv9ymFjteDM1CZ32Q+8i7RdiL0SVGZu0
 mtEXz+AMrBxbRi+IozwYUVDTs+AchNPjxY7V8cSAxyO6QZMLJ711nkUGkKCFqvqlbytH
 /rErq1oWlbYnSAx5CO5VnRCQUCmwKJH0mxBOLMS9+KDs+UcT7vXoaptCLL8wZTiZEuEG
 /UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/40ItPJTK+0Z+5i6M6FkN3eo3VSqzVoG2jS5OxroJA=;
 b=MBU55r752V34pioa0FCUzgDixbixuJ9+vtMHWssaSb6Tn1BtthYMHZQeHJaPWlU67r
 V9VVq4g+ftNZcvffXTAKGAmMlTRxUSoH+pCD2BAps0lbhdDeevfW2Lquq9ZTkdtv7AC/
 NdH9zi/O4d53XX0DZTv+tnP4Jz9mb0bXPeaFDNnuWwqiUjlmhsKOh0CUuyRgrElfIrL4
 RX/wrvfhv0SAyr8NeC4HeXptEhMYxAUgkP2ZetYrFyYw6s6NS6o/2MsnUBxER/9QvqSe
 iTdu5VwlyF85bTGnSPVFjnTI7x7p1UgKSFHiEtvmd+cttd2r29/8wCchOrI5tisiYNMA
 LewQ==
X-Gm-Message-State: AOAM53045XwZBUeCXd6vW13LzFKdiFyz9Y1BklXyw41b2C2A2Pg7lgkb
 W79J7BkSVCJbIkWz0ujgsQE+6uT4Ub+GKxh9uXok7UGfW7IVBhwS
X-Google-Smtp-Source: ABdhPJx+QgYNOynBiZY2JQ6DdjVKfe9pA5vDdno4wM4Z1uxvX9f3Lv/CvL+o/UshXDbDFu2ZbALX8HW7pPAKC3iXws0=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr38265314ejc.250.1616014903817; 
 Wed, 17 Mar 2021 14:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210316181216.414537-1-kwolf@redhat.com>
In-Reply-To: <20210316181216.414537-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 21:01:20 +0000
Message-ID: <CAFEAcA87MpMh-nRViCJB4ow_myLJKpTFxFK0ZPch3anG43Fo9A@mail.gmail.com>
Subject: Re: [PULL v3 00/42] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 18:12, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to f5dda4c2186975ed75ec07b58bc6031e4867bb45:
>
>   vl: allow passing JSON to -object (2021-03-16 18:52:10 +0100)
>
> ----------------------------------------------------------------
> Block layer patches and object-add QAPIfication
>
> - QAPIfy object-add and --object
> - stream: Fail gracefully if permission is denied
> - storage-daemon: Fix crash on quit when job is still running
> - curl: Fix use after free
> - char: Deprecate backend aliases, fix QMP query-chardev-backends
> - Fix image creation option defaults that exist in both the format and
>   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
>   default was incorrectly applied to the rbd layer)
>
> ----------------------------------------------------------------


CONFLICT (content): Merge conflict in docs/system/deprecated.rst


Please fix up and resend.

thanks
-- PMM

