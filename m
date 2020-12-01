Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACE2CA1DF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:55:48 +0100 (CET)
Received: from localhost ([::1]:35660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4G3-0004fT-Hu
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Et-0004Df-Iv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:54:35 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:36725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Eq-0006tK-Pb
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:54:35 -0500
Received: by mail-ej1-x641.google.com with SMTP id lt17so3559743ejb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BSp+fq8LvCYxL+tAjipD3SNRBEkrUwAJlgzMD1hu4No=;
 b=GDqc/6stCinaXZb07ex33bw3JlhuLZmgquF34i87+FjBf26yioFj++a2nWHCVBad9C
 ZjNUNectCWXeQkPuvZaasOz4Z9cj0gKoPKbpsR/6msJ6Vor0iY5rtU2YEVRRqR+jsxpa
 iV9UG/tVd1W6B1aq9NY+yhxyB+Jv6Q8WO/ItE666E1wSyWDGJk6JfXqeQZ2dDrt8gF7n
 RIgnPaAntGOlhZ2e6QmqyNe+LvMA8zj7Te7ICYMsQGJpvLl9uDtaaXpf7ePPQcmCoQtn
 DquJU//zOzthljwxD/5XUcHH++fk3GFccNBbDI2CLK8iwRQ3Wj/HdGkJiD8UdmX1j9p9
 AhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BSp+fq8LvCYxL+tAjipD3SNRBEkrUwAJlgzMD1hu4No=;
 b=hVK7CQNalmBanH5pdKBgl+am0tv2yrcyTD7Siq98T93tvQuBLTk0NVR+ksL1r/sp4I
 pphunbfcF/xiGU+482noGhGY7YYbL1s1ismt/UOU+U/LTvnx6Q6nNUEUbA+NadFA+Aqx
 bSCs++gGNMUF2XDhSG6brFuGvaoDFyimN3Pd/mK0Q0SrH9IAIE6J4SrioBv9VrLsrxrl
 V5IPE331CBptkG/IZV+UObUgRYC39sZlqlj9hQ2IzeB1qLIFAtLLQNleHu+OFPg7xd4E
 8mQUf7LUskmMXbtTnafA36OiI4FBxIuyX+PLejpXs9BCib8FssA4v/OqutEZMGtUyDER
 fhSg==
X-Gm-Message-State: AOAM5324aabu7h4XPiWxp6De3e8MFgte7SBVKr1sZTunccX5qjKtBAhK
 L9EtnhQ59bPapWrfhl/ilaEftLxqP5sfGxBNj3gNXg==
X-Google-Smtp-Source: ABdhPJxq425o/0S4gddVffNbNVH9SInCANGpqpelDExjknpcgteEd0bqb2+W3D3pfYNWcDkwUqGHTUkgsz57EVyWvvQ=
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr2689197ejg.250.1606823671071; 
 Tue, 01 Dec 2020 03:54:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <aa90b9f98f7314ae8c197a16e2acedbd29e16200.1605316268.git.ashish.kalra@amd.com>
In-Reply-To: <aa90b9f98f7314ae8c197a16e2acedbd29e16200.1605316268.git.ashish.kalra@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:54:20 +0000
Message-ID: <CAFEAcA-bFd-hk2aDr14kkbsOFFa5p_jPAbAtYPh1ZcZRiUmCRQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] monitor/i386: use debug APIs when accessing guest
 memory
To: Ashish Kalra <Ashish.Kalra@amd.com>
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:29, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> Update the HMP commands to use the debug version of APIs when accessing
> guest memory.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  monitor/misc.c        |  4 ++--
>  softmmu/cpus.c        |  2 +-
>  target/i386/monitor.c | 54 ++++++++++++++++++++++++-------------------
>  3 files changed, 33 insertions(+), 27 deletions(-)
>
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 32e6a8c13d..7eba3a6fce 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -824,8 +824,8 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
>
>      sum = 0;
>      for(addr = start; addr < (start + size); addr++) {
> -        uint8_t val = address_space_ldub(&address_space_memory, addr,
> -                                         MEMTXATTRS_UNSPECIFIED, NULL);
> +        uint8_t val;
> +        cpu_physical_memory_read_debug(addr, &val, 1);

Don't introduce new uses of cpu_* memory read/write functions, please.
They're an old API that has some flaws, like not being able to report
read/write access errors.

If debug accesses are accesses with a MemTxAttrs that says debug=1,
then you should just provide the right MemTxAttrs here.

thanks
-- PMM

