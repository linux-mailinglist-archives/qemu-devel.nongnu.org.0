Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B830A6E9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:56:51 +0100 (CET)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Xp4-0004on-9L
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XnV-0003q5-UJ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:55:13 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XnS-0004IM-Ue
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:55:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id m2so12399966wmm.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OnTcVhFxVtAZGcp2sDtq2la1CmCDjKQOlS+vEZuYjgM=;
 b=CGRC3A+GzLeScGe85nIxZsYPGKP9DECxpDYHn1q+xbb7iaBudDCnYHMDyi/2XjC2xy
 zSFpAavzvCxEx6i1xcJ3QnSnt50jvvqVd1Tse3B4/xbzn7B212Sg6lVK10aLvk40HH38
 A0ZIMxjwnMmHWkM+1ErcCcKMIQoZDsaDaDZqV+RfVAH0bYdDq1tiiBDfQtCJmvrvWS+i
 /Rhpv1mb2hOE8MLSM6wAh5csIyhe4imJiwMyKg8Hw9AZDoixL7Sz39/BT3DgBfKbxqRE
 SOqqE40s0DXko5DrOSRDR9e0/FXwqSHTWSYnCSIskZmUhHMel5vVzJ1TRPiyuPCDWSaE
 wPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OnTcVhFxVtAZGcp2sDtq2la1CmCDjKQOlS+vEZuYjgM=;
 b=tmPB0bFfs32VCr6R5vIZN/t76r20fMTE8MRrEOtmAfGp+EX/A7R4nKm4Vg9c44YnU0
 O3pc/kLU6ta2ZST7w6XkZdu7COWa6m90eB3HHLjHWZZhEFe9RPSvF+EaZnB5E6FvjYYE
 AhxdnYDMsiJ6KAvBkyaAfKnKpdofuRjYz4jEkPtIn+X0VjyLFxzTDrTgJQthYkDpniad
 jar1pYwiNxVpaKTxaRy7bJctTXYofBpHu3iwDY5Cn9OuE+z7MjWBdP6m4eHqx/h6mN1d
 lEAvpT4rvOh1zYDJ5va2GKw4iLi4pz1APmoW9Kymo2GvJXHfyJH8EMR8hLVYCPjVdDG/
 Np0A==
X-Gm-Message-State: AOAM530CC+/VH+huMjH+TXiro4VxxpS1GnANJVAaPfMUtf3K+Qfz2c2G
 SAo9UHWddxh03z5wMHGef9iWCg==
X-Google-Smtp-Source: ABdhPJxIc9GWoaa6gAKJVd6W5jAQy1yC0E6SQIMbukevjSBegTI7INclf0ufqOMstWX1pCyeO2+7kg==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr12547619wmg.11.1612180509455; 
 Mon, 01 Feb 2021 03:55:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n193sm21181325wmb.0.2021.02.01.03.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:55:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C6331FF7E;
 Mon,  1 Feb 2021 11:55:07 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-10-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature
 to target Kconfig
Date: Mon, 01 Feb 2021 11:54:55 +0000
In-reply-to: <20210131111316.232778-10-f4bug@amsat.org>
Message-ID: <875z3cvw85.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
> declaration to each target/ARCH/.
>
> Note, we do not modify the linux-user targets, as user-mode builds
> don't use Kconfig.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

