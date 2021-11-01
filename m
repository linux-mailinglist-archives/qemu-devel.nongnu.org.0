Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57184441C93
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:25:29 +0100 (CET)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYFb-0003tH-W5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYEP-0002Gf-Aq
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:24:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYEN-0006hr-JF
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:24:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id o14so28305629wra.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2O2dzk0vmPrHDw0tCUgOrb5w3SvbzaPB0p43Tr/T6E=;
 b=YPl+7tm14/5AxZMR7y0yDA4AKAvAUeUaMGn9Iox32ysa77jbBsg6X0EDeMxhJFNnNN
 AlnYAD/poY/5Itfsp2iRV130La11/ORCI/UjYcMzHJ63lOijebhZKNJyWPUKwXpob26t
 Lm/50N+bQUHBECWMamGGbRtQojdrbP9z5XfGTdygO2YiQBH/Ikt+RPr8bvHvcLiAAzWl
 1zFhiYGPQujSTazfjtDviFIGXrVwZp3Gn/ft/oNZDhfHVprHeVOkmcR0gXTr5x1gQRES
 +Q7xAClgNrq4RLVAT6H9A43BfTnXM5Oq/sc7oUvlFYG9yaexNLUQDBlOsSdPxKipaf6c
 svmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2O2dzk0vmPrHDw0tCUgOrb5w3SvbzaPB0p43Tr/T6E=;
 b=CAgWLGGR8FLkfFIY5ZKmXHPW4Nd82xuNmOhp5tCJ6narPI78tzzPC1DRyaTvM8W2kE
 9k4sz8EYTZP/+ZEZiFnlLvC0TnLmH/diSWoigsbHiarG9rhW29qqPiCSE6wzGn5crR2v
 Aue4U1LGa9+hiBlNPLMg2B2upOqS+WEfRkihTM1HFE0/BDBexdc6ftOC06m8WQp9hWUA
 SCHufDaBAZpQWPzsgfpLsfPWp2nfJtJp04eCH68y4cVLjFosqkgVvXNloYHVi8yQjKcK
 21y9ASNoifPW48usQvStcHptMufMM0mM8xHV0llD3twyVdNq0kDDdlNUIX81X3TU3UWA
 CbuA==
X-Gm-Message-State: AOAM532kBbYUre2RsdeMBBJpymYaH70cppqcMe1hqCxd5d4jDd7G/e1L
 S++W35zeCtBgROToQN3xL+kx36OCj0AZmWJrL/81UQ==
X-Google-Smtp-Source: ABdhPJzQvTql3hCddlCgu+z5R74IXE1W2/bU2Tg5kptRhT57ochenROZcWV9+yC70v40ojfrQ47dwkS+eVHxvEGm0nY=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr38451554wri.376.1635776649905; 
 Mon, 01 Nov 2021 07:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
 <20211021042027.345405-15-david@gibson.dropbear.id.au>
In-Reply-To: <20211021042027.345405-15-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:23:58 +0000
Message-ID: <CAFEAcA_Jj4diaUQTjUjrAUy+rR-UPDxYUXXX+NPAbo_yj1-2dg@mail.gmail.com>
Subject: Re: [PULL 14/25] ppc/pegasos2: Warn when using VOF but no kernel is
 specified
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021 at 05:20, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: BALATON Zoltan <balaton@eik.bme.hu>
>
> Issue a warning when using VOF (which is the default) but no -kernel
> option given to let users know that it will likely fail as the guest
> has nothing to run. It is not a hard error because it may still be
> useful to start the machine without further options for testing or
> inspecting it from monitor without actually booting it.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Message-Id: <a4ec9a900df772b91e9f69ca7a0799d8ae293e5a.1634241019.git.balaton@eik.bme.hu>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/pegasos2.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 474cfdeabf..a1dd1f6752 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -194,7 +194,10 @@ static void pegasos2_init(MachineState *machine)
>          if (!pm->vof) {
>              warn_report("Option -kernel may be ineffective with -bios.");
>          }
> +    } else if (pm->vof) {
> +        warn_report("Using Virtual OpenFirmware but no -kernel option.");
>      }
> +

Hi; this change seems to have introduced new "warning" messages
during "make check":

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/qemu/qemu-test.3HLBcg/src/test
s/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-ppc
tests/qtest/qom-test --tap -k
PASS 1 qtest-ppc/qom-test /ppc/qom/virtex-ml507
PASS 2 qtest-ppc/qom-test /ppc/qom/mac99
PASS 3 qtest-ppc/qom-test /ppc/qom/ppce500
PASS 4 qtest-ppc/qom-test /ppc/qom/sam460ex
qemu-system-ppc: warning: Using Virtual OpenFirmware but no -kernel option.
PASS 5 qtest-ppc/qom-test /ppc/qom/pegasos2
PASS 6 qtest-ppc/qom-test /ppc/qom/none
PASS 7 qtest-ppc/qom-test /ppc/qom/bamboo
PASS 8 qtest-ppc/qom-test /ppc/qom/40p
PASS 9 qtest-ppc/qom-test /ppc/qom/ref405ep
PASS 10 qtest-ppc/qom-test /ppc/qom/g3beige
PASS 11 qtest-ppc/qom-test /ppc/qom/mpc8544ds
PASS 12 qtest-ppc/qom-test /ppc/qom/taihu

(similarly for ppc64).

Could we suppress it for qtest tests, please?

thanks
-- PMM

