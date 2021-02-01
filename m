Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8830A6E6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:54:47 +0100 (CET)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Xn4-0003Cr-6W
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xm3-0002TK-V1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:53:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Xm2-0003Zc-C6
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:53:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a1so16267279wrq.6
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R+V+kC2d8aoq+VSZEaBx/xD8jU8GUz2o+HPVO863Gp0=;
 b=c68Dv9c5OlBr4jluQsyMLSSZSjFcgvDEHTOG7DD/WIg+Htur/ClrkdyUzzqU6+7mjZ
 x4PFWfjpUFFMiteZZ1vyKdnRs6KhW+F8LGk2v3R+uS6y2DWetfse/4jhDvIlQL9FR3GQ
 bTF7pWR+oG1FCEHbwIjfnj6MoJxTFAxY+p8PGAeCl+DojLzEQrqwV/gjXWQJ6OpqCKkm
 vEgHr79j/WoIXF5rQ7GBBo4x5BrOCfWrbBbMeFAiefRx/AXyhIrwbp6+TvwsZEW44cE4
 yBes7cNdNfvyI2jYhYAgqVIiJq4aN3CmhSzB0k18eEUS82Y1joDSZuO5Ve9ObcMEpZlI
 PlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R+V+kC2d8aoq+VSZEaBx/xD8jU8GUz2o+HPVO863Gp0=;
 b=k329jYQWpMkFCv1jasOu/7TVlhAkbHSAQyenqiuphGuupAOXA3Gqmn3ib5w4JqU4Y8
 38O4pIYKhb9zhfEoXl331u0sP4bd2Yfpgt30Zs+V5GPftyU7OvTZmxPUOk4o6wqps6wi
 g9j1WDF4Gc9UkqoyHTOMVQx/FkB7pTaW0T2QDxebYZZK6JcWKUp7mePZ6RJrxBuHGiGS
 R3R+RODDRIX2ixr7l2rSbHAoSjz2kRmtbt5f5GK8GGfMg1+EBB5wpDFKk50SaWEDOa1U
 N7SSqhb4IcjR+vuZB7wOB+C0VFfGP8Qcw5xVwZC2laOJEoRPmoQqSFQxDyJ3Yy+7Jkb0
 r39w==
X-Gm-Message-State: AOAM533r3NV53TuSu2SOT9kfvHUMHlPBW3jwNmVUjKOSn8PCqFM1i7z1
 4XEvu/zBWOSX6SvWbU8ZEcQDgw==
X-Google-Smtp-Source: ABdhPJx1E+Q4/p67XumpENPRRn4qb0QmbmU4P27kVJ0hYNkrROTcKiCSLSaxRgrWk7qIzH5UhnmZEQ==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr17288039wrs.217.1612180420682; 
 Mon, 01 Feb 2021 03:53:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm26200893wrx.51.2021.02.01.03.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:53:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E420D1FF7E;
 Mon,  1 Feb 2021 11:53:38 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-9-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING
 selection
Date: Mon, 01 Feb 2021 11:53:34 +0000
In-reply-to: <20210131111316.232778-9-f4bug@amsat.org>
Message-ID: <878s88vwal.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
> already selects SEMIHOSTING. No need to select it again.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

