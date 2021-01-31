Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B412A309BD5
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:06:08 +0100 (CET)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BUV-00054b-Nl
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BM2-0008BP-1F; Sun, 31 Jan 2021 06:57:22 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BLx-00082p-Vv; Sun, 31 Jan 2021 06:57:19 -0500
Received: by mail-oi1-f173.google.com with SMTP id k25so15513224oik.13;
 Sun, 31 Jan 2021 03:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YVkInRJxpduhbRvqa9xcBthpuPzf7AjKpZhjK7Cpckg=;
 b=U4btTzAGYpjIvDeplimZ2uqLXcDl+6ZriVoE2Oxllnw17qbfWKws2ecwV4NF4bsFu+
 FYBY1JYL3cLR164Ji1Bd9EFuhTL4L0Nba7pjkOe/KkRDNpq6V0bfV6oijJ1j6wpATrrL
 3JvTs2ImWIeCFBEO2+28vrfFA3DOarQC9pka2iIyTtM/1jlR8X5MddclfI13xGXdng3l
 Y8W4QxUokO7tMXwzWijE6e2aqwJStpKU+N8As4olKilOc2Iyink3IyDIOplmXiFMo66W
 tDYBNfR1glRRSeQYgHBuZVOTTpvQ+mw4H2gMyND4Kw0C07NPG6CizKJ267VWpzOK9vf7
 l+YQ==
X-Gm-Message-State: AOAM530tzQnMcmi/MHnV5JNID/QottG7qC4q9LE9R+EZDcrGzfXVCVZN
 Yqh4qwHtRALqZul0Lu7XRlciVGfdMrmTSJVjwMR6y0SmoqM=
X-Google-Smtp-Source: ABdhPJzTsVYWTiFYHJJoplW61B8aLyILK891rvibXykh/sCNgQ3gvSZtbxkhWSacPEQCBANMrvfh/48uBylcMZS22go=
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr7974934oih.46.1612094235899; 
 Sun, 31 Jan 2021 03:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-12-f4bug@amsat.org>
In-Reply-To: <20210131115022.242570-12-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 31 Jan 2021 12:57:04 +0100
Message-ID: <CAAdtpL4kPsFE3PuxkdE-Pmc+AqYiXFOEhdBTpvyBckZ1BJMHtQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] .travis.yml: Add a KVM-only Aarch64 job
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.173;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm <kvm@vger.kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 31, 2021 at 12:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Add a job to build QEMU on Aarch64 with TCG disabled, so
> this configuration won't bitrot over time.
>
> We explicitly modify default-configs/aarch64-softmmu.mak to
> only select the 'virt' and 'SBSA-REF' machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Job ran for 7 min 30 sec
> https://travis-ci.org/github/philmd/qemu/jobs/731428859

BTW I added this patch for completeness but I couldn't test it again
as I don't have anymore Travis-CI credit. I however tested it on a similar
Ubuntu Aarch64 host.

