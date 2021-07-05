Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3683BC0E0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:38:30 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Qg1-00006M-DI
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QfC-0007mW-0m
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QfA-0005oQ-JG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625499455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29cIHkQqc4gPN0+IVdiHvI8axtl/sezyL/5pUF8IyWM=;
 b=KKoNA4CmB0QFlXZTSrvgqVQ8T9HqWU0iYNibT3UUpmfg80sCyd//dlwsY2ErzcbqZudXgn
 7DhyTbBJTOgXJVw6r7rwwUomLKxqYyXbgv4klRmB3beIw2CTsiSn/OeU5PrdkFO7Oirf8I
 8aWg1b73pGwK8u97i4l1VBIt5ZYO9/A=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-1Frx3SmCNQaPoM7cfB8LMw-1; Mon, 05 Jul 2021 11:37:35 -0400
X-MC-Unique: 1Frx3SmCNQaPoM7cfB8LMw-1
Received: by mail-yb1-f197.google.com with SMTP id
 v184-20020a257ac10000b02904f84a5c5297so23858963ybc.16
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=29cIHkQqc4gPN0+IVdiHvI8axtl/sezyL/5pUF8IyWM=;
 b=cTgajyPzkKnG589BURRSKv12Z6io12SUG06jcOQkaKkOr5zXmAwluLc3nuGAS1c4nW
 tuSwCVlwNvq0jn5uy8eApY84cFtLRXf12ml3lHVm0Xp1F1nih01qHi1PHpviD1F6xZvJ
 zfZjAj/CfwsiIIUWWG/uAGo5NjIkwUiBpuSPwAN96oZ2pI22DaxmGY4LG83dX3EZkyDa
 oS7FWzH+4Kj12XFRyBywUUmP4FilN1uIaXOQ94YG+fvWihvLggzh8uWSnCTsDLDrEhJx
 pFkp+hc6xouGeyiqYynRHIV6Nbihfz4uVlmZwPEWPH6+cjtmdaQO4rUtQ3ePAldIMgck
 0ZGQ==
X-Gm-Message-State: AOAM533gy8zi/KQVCHyz00RMVILzshgS80qe7+ylpMKTV016vspDgS06
 3IxdLpOO8jtSI0QvGviZeTVLV+1+pm3Vkmg35IPbE/dtfkCSJJC3obynzSCSVO6iISwOz1ItkE3
 jMiVoVLlByDFOoMzMt73Uw/MSLGDzwew=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr11040008uam.110.1625498955187; 
 Mon, 05 Jul 2021 08:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVUrwh6s2mN1YVXihVUAirll1345WhktOxyFQjrVrwKmU1CzaQ7EKwpt6eEweRdAL2C7X2oMnhcEvJL0aZdmM=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr11039990uam.110.1625498955013; 
 Mon, 05 Jul 2021 08:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-6-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 12:28:49 -0300
Message-ID: <CAKJDGDYp=74mxnDmxLOVCix45de9LZ1bjdF-5BC+HUzneSJAkg@mail.gmail.com>
Subject: Re: [PATCH 5/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_uboot_netbsd9
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The NetBSD OrangePi image must be at least 2GiB, not less.
> Expand the SD card image to this size before using it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


