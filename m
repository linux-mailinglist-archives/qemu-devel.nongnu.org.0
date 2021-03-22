Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88428344B77
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:35:44 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONWp-0005PJ-Gu
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONS2-00029l-BB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:30:46 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONRz-0007hJ-R8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:30:45 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l18so11917027edc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=acBtFHruMMUX3S3irtzsMOxVVdyRREIFpTkRncG5PVo=;
 b=bCIh9bF+zxs6m671WnLUR9j1O4DU+4UQgNUq7s87wBesFf7AjqKPFJ8eS1l6EBpU++
 hBIBGiH0cqE3pODXmljZrOXrRuPqqKQx9Jhm848rcfC11dNzDfijNfgXN1Isd8wOYOBf
 BINPFZMzWqcX/qXti5Q4pZ8xBpDk9x1BEf2ILFM++UgMUb7MBjEGfl2zxbdbTOAfwuf0
 j89XFYsPL/4NHVAy40VqDQXtxrR1I0hiII0qiKVj9Wnx19B6JCramv3zso/VWoKlZxH+
 M6/UMwxy1KIBhO2eLAyxAqdBS+AC/uixx0BDg1ThmNATGpQyESK4X+pv9uvuD8zrxcjF
 uAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=acBtFHruMMUX3S3irtzsMOxVVdyRREIFpTkRncG5PVo=;
 b=QR9L3JOdWXdpYtk+07XRVGzwu/7WnhnH8n0rWLojHgICV0A083VU/66pT1tX4kNCbT
 TboJfZ5aJTkoZXanYdomJ59a3vOe3dxQ75O+2BB9fHvR1EfR62mb8N709n/L0hCaSQl4
 SSVbs3BjT+3HqpQlqZF6sf8ApTIWbyp5aZlTcmaPB/UNVxD/O2D8uLbnX8rN3G7462MY
 1JOifcNb9FW6tdKgiSFjrhXpB3wZ8UcufYxw1J4ILT9hponFf1Y9yZIPTnU7nLO81er/
 rv2XGopSG/N6uds+gaVcHOJBmD2TNJJrDywIeyrQXIISp3ABfRI9bimoeechc7CqLBZL
 iYCQ==
X-Gm-Message-State: AOAM533e6lw4f89UFEBuvFr16I7p4AdmHeoA7UgE3cGcDh5WufZXq1tx
 U97MmkvbsuAgGCMFdgGojrS0Lg==
X-Google-Smtp-Source: ABdhPJzLrknxBE9Jqxn+XgKS4tCttlAQbJQHvJTEkcnxUo9CziUXP7MWCy+xZNYzCqb7YpHItzm17w==
X-Received: by 2002:a05:6402:d07:: with SMTP id
 eb7mr424568edb.242.1616430642179; 
 Mon, 22 Mar 2021 09:30:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm11592830eds.26.2021.03.22.09.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:30:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28A361FF7E;
 Mon, 22 Mar 2021 16:30:40 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-3-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 02/49] target/arm: move helpers to tcg/
Date: Mon, 22 Mar 2021 16:29:47 +0000
In-reply-to: <20210322140206.9513-3-cfontana@suse.de>
Message-ID: <87lfafjglr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> [claudio: moved vec_internal.h and op_addsub.h to tcg/ too]
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  meson.build                          |  1 +
>  target/arm/{ =3D> tcg}/op_addsub.h     |  0
>  target/arm/tcg/trace.h               |  1 +
>  target/arm/{ =3D> tcg}/vec_internal.h  |  0
>  target/arm/{ =3D> tcg}/crypto_helper.c |  0
>  target/arm/{ =3D> tcg}/debug_helper.c  |  0
>  target/arm/{ =3D> tcg}/helper-a64.c    |  0
>  target/arm/{ =3D> tcg}/helper.c        |  0
>  target/arm/{ =3D> tcg}/iwmmxt_helper.c |  0
>  target/arm/{ =3D> tcg}/m_helper.c      |  0
>  target/arm/{ =3D> tcg}/mte_helper.c    |  0
>  target/arm/{ =3D> tcg}/neon_helper.c   |  0
>  target/arm/{ =3D> tcg}/op_helper.c     |  0
>  target/arm/{ =3D> tcg}/pauth_helper.c  |  0
>  target/arm/{ =3D> tcg}/sve_helper.c    |  0
>  target/arm/{ =3D> tcg}/tlb_helper.c    |  0
>  target/arm/{ =3D> tcg}/vec_helper.c    |  0
>  target/arm/{ =3D> tcg}/vfp_helper.c    |  0
>  target/arm/meson.build               | 14 --------------
>  target/arm/tcg/meson.build           | 14 ++++++++++++++
>  target/arm/tcg/trace-events          | 10 ++++++++++
>  target/arm/trace-events              |  9 ---------
>  22 files changed, 26 insertions(+), 23 deletions(-)
>  rename target/arm/{ =3D> tcg}/op_addsub.h (100%)
>  create mode 100644 target/arm/tcg/trace.h
>  rename target/arm/{ =3D> tcg}/vec_internal.h (100%)
>  rename target/arm/{ =3D> tcg}/crypto_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/debug_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/helper-a64.c (100%)
>  rename target/arm/{ =3D> tcg}/helper.c (100%)
>  rename target/arm/{ =3D> tcg}/iwmmxt_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/m_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/mte_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/neon_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/op_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/pauth_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/sve_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/tlb_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/vec_helper.c (100%)
>  rename target/arm/{ =3D> tcg}/vfp_helper.c (100%)
>  create mode 100644 target/arm/tcg/trace-events
>
> diff --git a/meson.build b/meson.build
> index 3be616e39b..53f2650907 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1845,6 +1845,7 @@ if have_system or have_user
>      'accel/tcg',
>      'hw/core',
>      'target/arm',
> +    'target/arm/tcg',

This confuses me when we already have a subdir("tcg") in the previous
patch.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

