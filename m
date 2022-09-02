Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C895AA6D2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 06:21:36 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTyBT-0000Na-CA
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 00:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTyA0-0007N3-DR
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 00:20:04 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTy9y-00045H-PD
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 00:20:04 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id x14so610919qvr.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 21:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+cAh5kUbdViXllY63eJK2360+f4ULoqb7V1V6LblPrI=;
 b=YXHvmYyjJuzdDX7j5H0U8DaidbtIaOLzhO2/unk7q9P5Hqrf4g8P3ROKDociM5ZK0W
 L1B3MkuyKlc7rFuD0v+lt7VLqzAh+dHnCpOt+7iNAdEUDMozqTSoZ4J/zcjWCIpHM9od
 0r55O7YuWjB8o3peL975zA7tkuvpA5kk3YRiwM5CGoVGWlpZ7iKdof8jl4LxgMjUAatb
 P5LGVcmIO0QWS+M0rF5AuOGXFeb8ulQ4+oLiD+nJX1lOHGv8k073ybUqnU6zx3hYHnue
 L/n2uqpb3nzorWubOgm0iNefihVR9zo9fKqZBrSVH6+gcVd1WfeFclU/g65MfIAn7M6k
 PDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+cAh5kUbdViXllY63eJK2360+f4ULoqb7V1V6LblPrI=;
 b=XgT0lMBq+0NlvQqVlh8qO8yLsoIEiHx2kULmOC0tttaFl0XBPnpRLfZhaBGeaI1Jpc
 AZhdC17byLCw2QCfw6Jvz+1cEfroCrARGiS0Cb+pK6l21rN71GMw5CpuQJG8moBZSQCg
 hHznIDNoEfnHfVRQ3y7RjCPSmqvNhOKevhA1dOya42blpdn97h/6R2G6I6vbQrTuM2Em
 4yN8rubxCq7etQSZsibVrVoZr+yycmyWPTRt7GRss8HmcbeDH8gy35higtq7LIuAXDW/
 +JEtq0S6g+Vh8Q4gh3pkXmx45bqTzZeMO0Cja9OHxXoqQ/cBAHBhYnEOT52tt0hTymOI
 UV4A==
X-Gm-Message-State: ACgBeo1z3fEFrCe7zXYLYtKtkQ7gbRnlnbVkGVlmeeoRkzFW7Q7aJRx7
 EAN5KRRfcd6cXtyctpqRVf37FLRFg4HiRsTD6bwugZY2
X-Google-Smtp-Source: AA6agR7zKjNRfuYoq/GIpCwUurjUxp4D9iaOE/CleyPaOMTMlkNbUz+yHjwvc4GMqD9PtgUjer9Q/F5wQikh2DvX0lo=
X-Received: by 2002:a05:6214:ca1:b0:498:f96d:4a8c with SMTP id
 s1-20020a0562140ca100b00498f96d4a8cmr24112051qvs.51.1662092401630; Thu, 01
 Sep 2022 21:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
In-Reply-To: <20220824085231.1630804-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 12:19:51 +0800
Message-ID: <CAEUhbmVvQcAkEw=Kc4SGHmn0_DmT_yKqVBtgbY7_qUhyOvAT=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 24, 2022 at 4:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - move the check of adding the same HANDLE twice to a separete patch
>
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>   the same HANDLE twice
>
>  util/main-loop.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..cb018dc33c 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
>  /* Wait objects support */
>  typedef struct WaitObjects {
>      int num;
> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> +    int revents[MAXIMUM_WAIT_OBJECTS];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
>  } WaitObjects;
>
>  static WaitObjects wait_objects = {0};
> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
>          if (w->events[i] == handle) {
>              found = 1;
>          }
> +        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
> +            break;
> +        }
>          if (found) {
>              w->events[i] = w->events[i + 1];
>              w->func[i] = w->func[i + 1];
> --

Ping for this series?

