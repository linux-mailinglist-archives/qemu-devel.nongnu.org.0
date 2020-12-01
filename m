Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD12CA21B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:07:31 +0100 (CET)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4RO-00012g-AM
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Pe-0000Uc-Lb
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:05:42 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Pc-0002Qs-Px
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:05:42 -0500
Received: by mail-ed1-x543.google.com with SMTP id u19so2877830edx.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ8sExb6D1TJHHkVCOV6EAQsOL0RaMz69T7dbpfX3OM=;
 b=fXpGGIQs8SwHbjw4dhjwoo46nGqeg5DOxkqINklQ3TOUNuWu24XzRsMf7/mxf1cFzH
 MdYneBqpbJd6vRlM8hOsOSKsfCPvd9hGZxuL6lyYRThwg4+M48piLPWXlBCpsMOhfA47
 GnAJzJe+ryvwhQxytAzEE9SfI67xFI3CpWEVPUT0JClN1i+RU5DFsGaZ6yQYFssrJOXM
 IdlCN1H8b0R244egwcy9hESOG/aKZ10slkeF0HS/rMCzppf8QN5Jwla/kAEmSDEv0g1Q
 DU7y3cwW/ija3T7u/pAAjC+ukJW9xXUB1olMn4Jor9na4Xxrai+oxVjmpOir8TUnrABC
 nJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ8sExb6D1TJHHkVCOV6EAQsOL0RaMz69T7dbpfX3OM=;
 b=jFgOJZTonR7CreTDae6Iku/K8wJx6frQhLMVEMxV6mTF0vOh+Xr+qk88Sc6FFud2H7
 7suAtvwoa/hyC6v5RplTYefShUbI4szdPwQwFjaYZO5TuP6yXqdbavIFjm5iw6bR91vD
 GNjxDVy/8QD7MlXkcmU1VL+kVsP/kZhMPQ/BvkzsNsv7wLwYVjUnQUQZJecqPRzn5FA9
 GsGSajZuxQGiltXUfo+QRwfx+5PaZj0n7B7Y08wzBr6JTe8CUaLJfEItsIcWA/nIHRKb
 e7QSmC+fLz0Z2LuZY7x8ciTN7GyEEy+jwPBzZuhha/DQlv36LAbphujLRCRfatSlNE+K
 KQMw==
X-Gm-Message-State: AOAM532TguBPFUImuc9HOd8ApvCF3oPid4QOODzZpzhvahd/zMphppe4
 sH1mMGmXOEiM337GKP5yVcxna1Vs8ZSHTVeQanPC7Q==
X-Google-Smtp-Source: ABdhPJyxpyeR1SDmXMFDnfu57acDSqOxPq2jB/wG3BKpbmbCQHhdjv1kxmHcygeEpB/gLMfQv/lQ4OZ8z85El5AEld4=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr2689855edb.100.1606824335347; 
 Tue, 01 Dec 2020 04:05:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <aa90b9f98f7314ae8c197a16e2acedbd29e16200.1605316268.git.ashish.kalra@amd.com>
In-Reply-To: <aa90b9f98f7314ae8c197a16e2acedbd29e16200.1605316268.git.ashish.kalra@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 12:05:24 +0000
Message-ID: <CAFEAcA8n353Zs_my_XsLv9+MS7UVo7Kx2Mm84cYrBQzAa_GHVA@mail.gmail.com>
Subject: Re: [PATCH 06/11] monitor/i386: use debug APIs when accessing guest
 memory
To: Ashish Kalra <Ashish.Kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
>          /* BSD sum algorithm ('sum' Unix command) */
>          sum = (sum >> 1) | (sum << 15);
>          sum += val;

Side note -- are byte-by-byte accesses to the encrypted guest
memory noticeably higher overhead than if we asked for a
larger buffer to be decrypted at once? If so and if anybody
cares about hmp_sum performance we might consider having it
work on a larger buffer at a time rather than byte-by-byte...

thanks
-- PMM

