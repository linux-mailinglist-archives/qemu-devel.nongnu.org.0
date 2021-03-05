Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A420032E5F0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:15:53 +0100 (CET)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7Uu-0003vD-7t
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI7Sx-0002zg-9Z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:13:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI7Su-00078b-B8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:13:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so1466303wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 02:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yWNPM1oDOi+xPoG9v7e/3EpJBd9H8y1ByspZKbq2e08=;
 b=VueOOli9Ro11JPL040ZtNb6VOSRP6XBb2MRY5bH/4w1NfrU9AP7azwLBWrz9ULOPJs
 K7LPydDLQWBoQBHQz6t2x8S/eEQhT8EwP02RszRRDg44F8F8voPO7G9WjgOMxCSYDXqk
 +E0QNu6YIOm2ZurESsRacSr3Athm6QurDVpkWuGJaN4BT7lezQJ0tps5/XweDwitEsFG
 Baj1hhrlPow0Tow8y1NGEQxZNJ/Y2sUH2WFQhuC8YqS+72hNGdC2MN7KdortCV978UON
 +A0aAOCcLRQXVgErw4HCR5pTltQyvWZ0aKAuPDLOD84Vwm4wnx/zvAv0TmWEPsvqKEYs
 WVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yWNPM1oDOi+xPoG9v7e/3EpJBd9H8y1ByspZKbq2e08=;
 b=ZejJK2NGCvvUn6MeA6RNiY3/TsPvDJtjJA0pH3OoAyHlnD+pXdY9eNPcw2uj0RGeUG
 S12iCw3CduNPb34Yz3T64g3f2lIL2yoSevKi9Acq1OBiHoUSjzrVMk19lbiZlLVKzRk0
 y/ajbsz/gLK0pvv37U4bB4GRUvlGpA2VDUjEIBfaGdjfVILZICiS1pMEcj9vWAvK579S
 aA65Ix69cu5sYKfTVDf45iJGulxKjTG+SwK/RYBb5TpPp+kvLbX0aYhRcX0vSgKxrNRT
 0xbNN5dEQXrO5/BHYXBjGbnLxivaXwX6Ll5YJKeVTW96/u2B2HqHaeqRHXSG2c6rKFca
 Aqrw==
X-Gm-Message-State: AOAM531O/SCyeoqUW9RH9VJG4LHkbteI0xocLMj+Vue0k1yWAlGp5B9j
 gh8hYLCZSYZrODm74asm2NURzA==
X-Google-Smtp-Source: ABdhPJwpC7T49qHCw4Cao4tNN0yEXugp2RJXfPfxF+jTWAchgfgmxJ14D0Zfg2eYMt3lbW2FC9pbVw==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr8547026wrt.31.1614939226288;
 Fri, 05 Mar 2021 02:13:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x6sm3870813wmj.32.2021.03.05.02.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 02:13:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63D1E1FF7E;
 Fri,  5 Mar 2021 10:13:44 +0000 (GMT)
References: <20210226131356.3964782-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/2] semihosting: Move it out of hw/
Date: Fri, 05 Mar 2021 10:13:37 +0000
In-reply-to: <20210226131356.3964782-1-f4bug@amsat.org>
Message-ID: <87k0qlgb6v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> In order to reduce CONFIG_USER_ONLY uses in hw/, move
> semihosting out of it, being a generic feature.

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e

