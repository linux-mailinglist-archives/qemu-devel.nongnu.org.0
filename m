Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AB2CD3F9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:49:12 +0100 (CET)
Received: from localhost ([::1]:44736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmAg-0001HH-UL
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kkm9O-0000kj-Ga; Thu, 03 Dec 2020 05:47:50 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kkm9N-00081n-2d; Thu, 03 Dec 2020 05:47:50 -0500
Received: by mail-ot1-x344.google.com with SMTP id k3so1281724otp.12;
 Thu, 03 Dec 2020 02:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3KR4rcdmhXcKTvQPLRfnpgUfwX48rLjUTZQL1v3S794=;
 b=QV9CpxUyyPLpqrIrgszflTN9WsqerYpGoTWzqQHtDVKGWuwd26y1HWRL2VEVkvgGJG
 JAMtGxVkerV5IQFTJgCf2FURBYU0EzxZZ8AUoBNdvg5vLwHqSQSML3kDsagM39+odBS/
 Wb4OGS9xjcN+qL/FVfG6SFJZwXPZprp/BWMf47H3GarbQS9oqMu2p5L0UTWdNAOSMOiY
 c/HBBSO3BDVe7IqfbuSZs95QdnT/IAOLJgvJ+hdNWYSAFtRI43PF/qXng7lbKFwsodDg
 LSIMsu8H4DCdm1YDp7BTGXb7a5WB0B6DSVbAFGLCOu0UMwSfyuplN4UuDQpJbRPNwhR8
 kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3KR4rcdmhXcKTvQPLRfnpgUfwX48rLjUTZQL1v3S794=;
 b=g/b2nsFlWO0m/X+exLwJt3DNbibk4ZsJf55zzFxnEc5J6fjsVFCNz6K3CCE3gVKf5P
 rJS73ChXhBBsSgDTJaeFDtuEgdqoH8ufsYnAIpZfKJV6tE2yjHCrbQckoSNOMyVUlIfB
 KONTqJOnLVCrSZxA8Bm0b4HB+4bgab2mU+k/Kyr4egYleWYzn/3//9qY2H7217rtWipZ
 jo7+5i3CXluRyo94HhloSkcuREcAchAUW+D/PNOn/xeaq4bRLSMIuSUeR0Vh6/yQPAAV
 g8Y/QX8RaEHxFzAA/IVHQhKbCFVDfUOKKV6TyRIDUIQ+oXBFSZV+VR8e6Bp1x7u95ZSw
 U7qw==
X-Gm-Message-State: AOAM531UAZyUB8tRE8QTOt2koyVPmZARKBw/ViXn954yogCb8VOTn5qN
 So4iNJkJmN3Ij1H1JOhRrmHe9zruWjYodpL39Xw=
X-Google-Smtp-Source: ABdhPJwC3DFfH7okFht2bOuLLdLPOcghGxCR+68x4MUcgTTtO2cW03TExoc1ktjEWxQ8tUF+BLQTp3SIOuckA9IXCOg=
X-Received: by 2002:a05:6830:1d3:: with SMTP id
 r19mr1517093ota.333.1606992467182; 
 Thu, 03 Dec 2020 02:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-2-philmd@redhat.com>
In-Reply-To: <20201201191026.4149955-2-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 3 Dec 2020 18:47:11 +0800
Message-ID: <CAKXe6SKwaUdA39Qoxxt_3ZvNytXy8XnrSpPJ9wLGX-w+mYNfaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] tests/qtest/fuzz-test: Quit test_lp1878642 once
 done
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=882=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:11=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Missed in fd250172842 ("qtest: add a reproducer for LP#1878642").
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  tests/qtest/fuzz-test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 9cb4c42bdea..87b72307a5b 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -45,6 +45,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert=
(void)
>      qtest_outl(s, 0xcf8, 0x8400f841);
>      qtest_outl(s, 0xcfc, 0xebed205d);
>      qtest_outl(s, 0x5d02, 0xebed205d);
> +    qtest_quit(s);
>  }
>
>  int main(int argc, char **argv)
> --
> 2.26.2
>
>

