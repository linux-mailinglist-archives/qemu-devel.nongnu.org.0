Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB25375051
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:41:39 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYdd-0003Vq-T6
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leYbz-0001yO-3G
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:39:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leYbw-0007Fe-1A
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:39:54 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r9so6830148ejj.3
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbnfELGyKlzse6K+VACzPi30J5mJ1dSgwEJp9mY3LYo=;
 b=J/pFr45zbngwdFrylYwfagZIJqTRHVM2xXnFeMbSjQpjQNBDju5I/oPbsTEe2h633w
 /b9PgHSz5HeIoekP47VRmkenAvNXB0nGAJh7tVCRhSWin0/TNX2W+nrpYqWl5GCNkkOl
 juqLSOIpPrdv9mhgiBa5iCReHJJ5vUObmsjl7nEdtFUf2tjLmMsqXVfA/cDntuosgPBN
 s1FNH4FxMhBASKs/nhvB3p4Uduanuv+s5uiis1EVkIy+7WPRlJwtep5yA8bLgLOHz2WJ
 tdk7a43miAXO2v6+f62CfM9WLjHhdcHW3C5r6Efr+uqgND858ef24kIJVZYjQ+BidJFf
 nNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbnfELGyKlzse6K+VACzPi30J5mJ1dSgwEJp9mY3LYo=;
 b=O44f9f33tO2c+JkLszeGik86LClmB7iqiRyLmKx6WshGjhjboOaxLxdIfBujMw7iRP
 jDuaftExU13ii3sBtFsywHgZWiEmjMtUsyVOvVV+RMvf7T3Q1dm61p8z4y0uWqGDtuHj
 vqb1FJS0yVfQxnzt6fxFqLSNWLlox9lgyGRd8D8gwsf6ojrELi+8sIN+xDHMRz6pwjan
 MAtGntfo11hDUNuIKjZz6kJBMelBy5B1inxuUbUn7XPrJQT4C5o2GGTNSvC+p1Ol4vIM
 fOkL/bgwxU64vP4iPnnOyY2KW3iWmnSr0M3Qm4mzA6JWROF6cFH0R/mu16zTlProOfcf
 Zrig==
X-Gm-Message-State: AOAM532BPELLU1ggcW152s3neUDOJgv/8Vx95zhspt0t++Te5fNiuQZR
 xaWVggCf4JNIJdW41ysSkOrBjhTyFZgLOsL0T2mCXg==
X-Google-Smtp-Source: ABdhPJxgmQrWfWsixJwWzfmf53sE5w56tSkvT68Tn1F1rGKAjFStEUChxcOyCvwkVlFsISXp7XzXAhLB96C+GDL9cLc=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr2910729ejh.4.1620286790188; 
 Thu, 06 May 2021 00:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
In-Reply-To: <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 08:38:42 +0100
Message-ID: <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 08:01, Thomas Huth <thuth@redhat.com> wrote:
>
> On 05/05/2021 20.06, Peter Maydell wrote:
> > On Mon, 3 May 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >>   Hi Peter,
> >>
> >> the following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
> >>
> >>    Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03
> >>
> >> for you to fetch changes up to 8f582fa290e5d5d0a00db23eaf1ab1bb3d3ae68d:
> >>
> >>    util/compatfd.c: Replaced a malloc call with g_malloc. (2021-05-03 11:40:40 +0200)
> >>
> >> ----------------------------------------------------------------
> >> * Removal of the deprecated moxie target
> >> * Replace some YAML anchors by "extends" in the Gitlab-CI
> >> * Some small improvements for using the qtests
> >> * Some other small misc patches
> >
> > This fails to build as an incremental (not from-clean) build:
> [...]
> > ../../meson.build:1291:2: ERROR: Failed to load
> > /home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak: [Errno 2]
> > No such file or directory:
> > '/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak'
>
> D'oh! I think I can work-around the problem with a patch like
> this on top:
>
> diff a/configure b/configure
> --- a/configure
> +++ b/configure
> @@ -1686,6 +1686,11 @@ fi
>
>   for config in $mak_wilds; do
>       target="$(basename "$config" .mak)"
> +    if [ "$target" = "moxie-softmmu" ]; then
> +        # This is a work-around to make incremental builds pass after
> +        # moxie-softmmu has been removed. It can be removed later.
> +        continue
> +    fi
>       if echo "$target_list_exclude" | grep -vq "$target"; then
>           default_target_list="${default_target_list} $target"
>       fi
> diff a/default-configs/targets/moxie-softmmu.mak b/default-configs/targets/moxie-softmmu.mak
> new file mode 100644
> index 0000000000..23fd596b66
> --- /dev/null
> +++ b/default-configs/targets/moxie-softmmu.mak
> @@ -0,0 +1,2 @@
> +# This is just a dummy file to avoid that incremental builds are failing.
> +# It can be removed as soon as all builders have been updated.
>
> Does that look acceptable? If yes, I'll respin my PR with that
> squashed into the moxie patch.

Ugly, but I guess so. It would be nice to fix the underlying cause, though:
meson/ninja should just DTRT if we remove a target. We have a couple
of other target removals coming through as well...

thanks
-- PMM

