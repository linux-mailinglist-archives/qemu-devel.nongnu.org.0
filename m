Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8A30A67B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:28:15 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XNO-0003r2-Tj
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XL6-00025h-RD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:25:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XL5-0006ii-63
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:25:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id 190so12324553wmz.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m5OBG1mxAQtmmh38dFJc6BLX5xdqGhPXpKBfe+9+c7U=;
 b=ST5GYBxnpD5YQCec5Lh6fgW3Aq8HGc0nLIA6MZTnVkfhktZ1sdylJVGVg71kptV35/
 LabsBLi8H7HMNYNcC5QAw5PqNRL5tNIuEGywy1b6K04KYik1qUQTZcJK1Ax8Gh4XvN8x
 gEyHh6rhQsGVrwNWtrzWdqL04boxKizEBA4EGa+0CY8S7v51ATgIKjf+nRDHCpkrQglk
 rupjxAeMWWILa0yMFxnK1hPHUFpbHRfhLLJ72sCMMqij0LlUUlWkAlJfkcUsRKRMyTLL
 wV9vr3920jiyLf8gRG2bxDfrU42W9LPadFmlCmBQ4CKAZ1EtiIEbjKCoFsu555pKcHwK
 mvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m5OBG1mxAQtmmh38dFJc6BLX5xdqGhPXpKBfe+9+c7U=;
 b=Cj+eXJoetYEN4WGKQP+AmGv9Ew5W33klyub/iAH1pR10esQsyo9GMQjMkpAwb4pwFH
 24/AmehCAxGzVV7guPQrFiuw3A36a67n3cZN8xBvlR6pQltoG6irvFkm3fwMmZv19BpE
 /wh/tPcMeFDqt/oqu5C6veuOZG8mRDUtbTkMLiKTWsNqgfxAVoF6sZyiIOQ18HW89V3z
 hwbrq5azJVNjlMA/JzcwRfj42DGlrUCdCAfmqYV88pUNtIW8gjLw997sa+jLI9Tk01QN
 bu5vQbjwIqO8YuG29vluJDYnfEsKAV6kN5SiDZ5L55KKvVgbj5S9K7h6HesCe5LDU9pz
 de9w==
X-Gm-Message-State: AOAM532hO5MSGOzOqjF913oIwFI6fRh2UKl0dZIXI/IhSbGksZqCqp+7
 eCc7w/3qe85Xe6alzBxAekd9Qg==
X-Google-Smtp-Source: ABdhPJz5IEhGCB7KxNMBqgFBwtJA/iRS4VvblX4CzSbed6qw32q+bS2WyFiTMT03nos7jFyHNGg1QA==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr5930425wmq.70.1612178749718; 
 Mon, 01 Feb 2021 03:25:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm20236520wmd.15.2021.02.01.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:25:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C52BD1FF7E;
 Mon,  1 Feb 2021 11:25:47 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-8-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 07/10] target/arm: Move V7M feature to target Kconfig
Date: Mon, 01 Feb 2021 11:25:35 +0000
In-reply-to: <20210131111316.232778-8-f4bug@amsat.org>
Message-ID: <87bld4vxl0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> V7M is an architecture feature, move its declaration to target/arm/.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


modulo previous comments:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

