Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CC313EAD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:17:49 +0100 (CET)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C2e-0003F3-T4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96An-0006uT-ES
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:01:55 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96AR-0005HA-DS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:01:39 -0500
Received: by mail-ej1-x636.google.com with SMTP id i8so24444804ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZoanlxQLe4ZKiCr1+9Kb8ho+Q/7NBrIvc7EePg54NpU=;
 b=bt6VEuPPaaZ5BZtbHRtRpCfKashhk+7g0DcfgSG9l4ySvfh1OlnCAqofKWVT4jdi7k
 rYEKAEcyL8RAYp3LhVDnwXKO3bgRXMyhrq93ksoIeoRKe4hUyMwVt0tl11a2zpgIr50z
 omUP7iRr6JPLpikkjh6R0IdX8pmoNJEZHq4tj2TUmdWzXQuqN0WpUId2cIft4JtMKC9m
 0jjJSxgCjLF+yDIZioH0L8VuwN2PMWCdDCwqg1rqFZ4Ibx5t/RnF/wJURtDv+2cAMnCj
 GgUvL3G5aXlHZJBX5o7P2eOtL7cdKotsWfUIaZfoQhuvbZ+yHG6zhSkdkIWZsc3TAzg2
 LgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZoanlxQLe4ZKiCr1+9Kb8ho+Q/7NBrIvc7EePg54NpU=;
 b=jzuTHs6d0SK37QhZPhCZZdh0nlJokJG1nDE25sE4jv9a6kOCvMKqIvdU85WcPsQRWL
 bT/bMSC6kAwjf4nI6Ak8BgrDmXSpih01YBrXR3WAkX/Tlrd4w5DsDe2Al9hzBTnPjyGQ
 SlL75IA/CuTMIbr2KUZRdE+hPGDNtE3Fcp8iOadSV+UkVBaBSPLnI0l/7I4XgX6IBBW6
 Q0Q1LTGSFksCO4ZmUcQEz9aSyv0JcSSHy6O/FYuZ10bWWYxdBO3LvAx3yriUZ6D91fSO
 hryn9ZYrLm0A3lUBDSIncvTgSSar7iX57jhRmEGYNK2PlEvG8jk4n0HK+RqN3h+OSbOk
 +3gQ==
X-Gm-Message-State: AOAM532QIE5k5srbQzsmqaNG8NsP3RztDnLFIemQ/FQbuwU/rKJCryMi
 SzvNga80RTRXnoorQJc3tqofRadHoPd/8SEV3EArsg==
X-Google-Smtp-Source: ABdhPJyRx4zlNtL65uNnanRCs/0JswwwTtORaIrdpPFQZwm+gy4qtm1pUNmy0THjA68AckAkbgJb7jzUJsn1B7V4Kbg=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr16908125ejc.482.1612789246831; 
 Mon, 08 Feb 2021 05:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:00:35 +0000
Message-ID: <CAFEAcA-wRzKJSqh1fVUUkcTsVZCnceoAoe5W+BaCOzcrJVH0YA@mail.gmail.com>
Subject: Re: [PULL v9 00/13] Cgs patches
To: David Gibson <david@gibson.dropbear.id.au>
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
Cc: pair@us.ibm.com, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Janosch Frank <frankja@linux.ibm.com>, pragyansri.pathi@intel.com,
 David Hildenbrand <david@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, jun.nakajima@intel.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 06:11, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' in=
> to staging (2021-02-05 22:59:12 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/cgs-pull-request
>
> for you to fetch changes up to 651615d92d244a6dfd7c81ab97bd3369fbe41d06:
>
>   s390: Recognize confidential-guest-support option (2021-02-08 16:57:38 +110=
> 0)
>
> ----------------------------------------------------------------
> Generalize memory encryption models


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

