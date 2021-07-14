Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F363C7C67
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:03:30 +0200 (CEST)
Received: from localhost ([::1]:52408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VBJ-0007OJ-Vs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VAG-00060E-Ro
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:02:24 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VAE-0006oo-Ut
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:02:24 -0400
Received: by mail-il1-x131.google.com with SMTP id h3so120848ilc.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oy74R2Y/ltGT59WQnbkemGfHYx9QNwsyk5k3N6LxBsU=;
 b=H5f2GSGA9r8c162XFeB2w5DCqS7Xu+8mm7x7cJpiJ5xqzO47EY9KHQU71gMo02dDOH
 7d0SRH6ZCZigQGiTbs4W5FzzJhoque6MD1q546+3IycQFF7wQbABgsv0dfLPZ1u02z9q
 g1rtN9KIfPdNxC5grgYWc15lnb8HjcnhKj5t4McVdjJXh8YsOYIQDEmFXd2ZN2FsuKvc
 Iw9O3LP0QLyy0IO5IROfLseebx0WBlhZQSD/gBcccMGgVDF7HtNhz0J9hmNl1Thw+yU1
 nDm2azfm1qKQL4gO4Hz1wjP5tkiLltB/8vJgSRpxFU7uUGrkr7Z2kUUfhwTwEeEQBrTa
 dOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oy74R2Y/ltGT59WQnbkemGfHYx9QNwsyk5k3N6LxBsU=;
 b=cMkzxIaTWk/EfVexnsJl4iHBTQx4xHGXsvG2xTvlD6qksPHl+smraICSDapW6+wZSt
 7i9woZ4gkd11v0ejFvi9MBS8XAUlgeFiWtYdyMrAa3WF2E9UyoPRtBgVTryfl2PZSvjA
 ntZFYfJ/Ot0PWgJzjgDzV6ousJTGGu8Li4pfSsEb3AEtyaNKIzPb1aLaMhe3SeuZJQsO
 EbDQiOK/4r/Z4kE3OFN+yBI91kxfbuS/H15XpNmn1zAAUVWyjr+QEzBVTxS2XRSC1Lfy
 h0neIf0Ja2jz9IErLRhO+qwWgf0IcyppZ27cqFqf0wiDfSnVcKbbJGcfq7PWA5cPSSW+
 M5og==
X-Gm-Message-State: AOAM532WwPJMQheFKG6Bu7CoS/KXDN19MzoedPmBqQc/WRXogel5b51v
 HvO4zGfXr3zi1DavET8u1cVb+YOseDciV/IoyfE=
X-Google-Smtp-Source: ABdhPJz8i49LZGgrKe+Mi9GmKPZfNngc/uv1D5B1Hs7tBYLIuete4rWZo6FaYspcVkLhB7BQPMvIOX55ohdjg0QOSgc=
X-Received: by 2002:a92:a005:: with SMTP id e5mr5046491ili.22.1626231741940;
 Tue, 13 Jul 2021 20:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210713163051.2133045-1-berrange@redhat.com>
 <20210713163051.2133045-2-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-2-berrange@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 05:02:11 +0200
Message-ID: <CAM9Jb+hE1OezaEzRztOTra-ERMVSTrR77Qj5f1_i8wOvvnjBFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] docs: fix typo s/Intel/AMD/ in CPU model notes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x131.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/system/cpu-models-x86.rst.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-=
x86.rst.inc
> index f40ee03ecc..9119f5dff5 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -227,7 +227,7 @@ features are included if using "Host passthrough" or =
"Host model".
>  Preferred CPU models for AMD x86 hosts
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -The following CPU models are preferred for use on Intel hosts.
> +The following CPU models are preferred for use on AMD hosts.
>  Administrators / applications are recommended to use the CPU model that
>  matches the generation of the host CPUs in use. In a deployment with a
>  mixture of host CPU models between machines, if live migration
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

