Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAB2647A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 16:02:17 +0200 (CEST)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGN9U-00047u-SV
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kGN7t-0003DN-Ub
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 10:00:37 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kGN7n-00047B-Ur
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 10:00:37 -0400
Received: by mail-oo1-xc44.google.com with SMTP id o20so1469826ook.1
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bhEcD7xo6DzegloYJoWZqzs/lg/Hhl6C7s1uCMA04J0=;
 b=mWX0csWjF3sRA5CAU4zfkP3tC3E9okRS88VOcVpErDBufJf+2sO2eo9BxUhUyoDkOV
 u0hSN54sOhbRIvkLdyMmkPUqVezzeyvY8ZUDbcqwKvtJxMUuQQnyrLtyfuVkQHq2GrRv
 EdU2Js+ItlNxb591qMTn/fQI4o+ALhRLS7/6cXDbNvARHdx44JBF9ONBKQaDqEvcjAPH
 XVKzcmxwhJ2b05xnbc4cY40quLLGneBE1429CXsuOAM7pye1FHckSXmwQ2DM4qZG1wNg
 bhP40usriNLHl9A6vnx/GrgdrE/ItT35ddEpKMZeJC0yny5sklmoUqtnf2chJ+ciBoLh
 VAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bhEcD7xo6DzegloYJoWZqzs/lg/Hhl6C7s1uCMA04J0=;
 b=R4Rfi6gLkFXEIZbCQScLjFBzzP8bJDVcOL/8o18t9NQRzbDPqQGyUcF8vnmeeudTcY
 WIo+KqiTonUkDZE++PDK3+br3qSjqdWlPUTHTZq4ruFZODAXXzR6toIlYCbn51OYPVNd
 VEqktAAmMYPv9W++noe40AUXG7wL7ZCoU6HbpQ/EmGGtw8xAGmzlnVXIeBxok/qsHWsi
 snLRfAAVdqht+Ydc4mt6zsKlT5MYUIzAsuKWxEETh9tsHMUk9mc3yjbAaDAidYlXichV
 UMjhW88oH4bF41zScKkxu6Haj+VXMJNZeWUxv7yuTtCTo7SZZOpc+VMRXipeqVrABeSj
 N5ZA==
X-Gm-Message-State: AOAM531ByhLIYoNLdc7YakFSJDajsqzqsqaMNLSNAnGXrxb+V/P/q35g
 SHz1zc5eulJ1YrQjzwz5DAL3omOTKFVBYVeVH7I=
X-Google-Smtp-Source: ABdhPJygA25JYwq4xThQSLKdARmaWq7BnC8J01kFgvL1yl4ZoPM1QtMtp7/liPIyu1roqf/U1t40rWtrhqCcKifi4hI=
X-Received: by 2002:a4a:ae4c:: with SMTP id a12mr4567884oon.60.1599746429281; 
 Thu, 10 Sep 2020 07:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <1599661096-127913-1-git-send-email-zhengchuan@huawei.com>
 <1599661096-127913-10-git-send-email-zhengchuan@huawei.com>
In-Reply-To: <1599661096-127913-10-git-send-email-zhengchuan@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Sep 2020 21:59:53 +0800
Message-ID: <CAKXe6S+D+15MW2=Bq2o1NGmCgke0EErbPu_-KGbT0PSPhpAASA@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] migration/dirtyrate: Implement
 set_sample_page_period() and get_sample_page_period()
To: Chuan Zheng <zhengchuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, dme@dme.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, xiexiangyou@huawei.com,
 Qemu Developers <qemu-devel@nongnu.org>, AlexChen <alex.chen@huawei.com>,
 ann.zhuangyanying@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chuan Zheng <zhengchuan@huawei.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Implement set_sample_page_period()/get_sample_page_period() to sleep
> specific time between sample actions.
>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/dirtyrate.c | 24 ++++++++++++++++++++++++
>  migration/dirtyrate.h |  6 ++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ae1959b..8a30261 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -27,6 +27,30 @@
>  static int CalculatingState =3D DIRTY_RATE_STATUS_UNSTARTED;
>  static struct DirtyRateStat DirtyStat;
>
> +static int64_t set_sample_page_period(int64_t msec, int64_t initial_time=
)
> +{
> +    int64_t current_time;
> +
> +    current_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    if ((current_time - initial_time) >=3D msec) {
> +        msec =3D current_time - initial_time;
> +    } else {
> +        g_usleep((msec + initial_time - current_time) * 1000);
> +    }
> +
> +    return msec;
> +}
> +
> +static bool get_sample_page_period(int64_t sec)


This function name may confuse people the this will get the period.
But in fact you just check whether the 'period' is valid.
I think it is better to name it to be 'is_sample_period_valid' or
something meaningful.

Thanks,
Li Qiang

> +{
> +    if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
> +        sec > MAX_FETCH_DIRTYRATE_TIME_SEC) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static int dirtyrate_set_state(int *state, int old_state, int new_state)
>  {
>      assert(new_state < DIRTY_RATE_STATUS__MAX);
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index faaf9da..8f9bc80 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -29,6 +29,12 @@
>   */
>  #define MIN_RAMBLOCK_SIZE                         128
>
> +/*
> + * Take 1s as minimum time for calculation duration
> + */
> +#define MIN_FETCH_DIRTYRATE_TIME_SEC              1
> +#define MAX_FETCH_DIRTYRATE_TIME_SEC              60
> +
>  struct DirtyRateConfig {
>      uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
>      int64_t sample_period_seconds; /* time duration between two sampling=
 */
> --
> 1.8.3.1
>
>

