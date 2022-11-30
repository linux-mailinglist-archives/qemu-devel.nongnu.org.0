Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C707C63E0B5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 20:26:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Sgz-00087c-Hi; Wed, 30 Nov 2022 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p0Sgx-000879-OQ; Wed, 30 Nov 2022 14:24:23 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p0Sgw-0005fH-0G; Wed, 30 Nov 2022 14:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669836256; bh=uHqvc3aUN+Qb0anqE6jGw8PKnjUPlQ90+KzllaGdJHw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QppsumtWAvzneJHheDEaxeCoypUWbsbux6icFltmSXzaQzBATflpJQPbsUtRDk4/w
 JnqqHV27Yyt4HQrz97RPB7kihaA/qOgmQ23Xhwb9fzbvTnTJHHzkKxyNLBOyhQ/1+s
 U6TJAGi4Q6v2NTub8dJeW0EsPjsatIV8JPlePdfna6qLX7H116qqxDfwpxETQ5J8Jc
 Aq6JDdL09EZMfr0/dIkWpzNknh3JguMSzatJG+32gjDvXob5eiXmqpCoCgkqrTVXVu
 t1TnHxbuI/hkIBgVbCNknjED/yfUOQdtnM6qc5Wo+j9AkOzqTcGlYR3ly7MeccoKMy
 8TpFrb/tDScZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.2.55.175]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1odCgm2IhI-00ngbV; Wed, 30
 Nov 2022 20:24:16 +0100
Message-ID: <6d0d9eee-b1b2-df62-1989-f29d53263af7@gmx.de>
Date: Wed, 30 Nov 2022 20:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
Content-Language: de-DE
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, daniel.thompson@linaro.org,
 ~axelheider <axelheider@git.sr.ht>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <166982763526.10484.9925072056712598801-0@git.sr.ht>
 <87o7socl3l.fsf@linaro.org>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <87o7socl3l.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:wKiHLlFK1wDPyNmU3S/b912b0bJsIFG7OfaXv+L2VEIwS3FsBtW
 OpIdo7mkp/y125Yh0yzg//GKJE9F1qIlmZmc5nbUQJvjYO2XSps4oXQN5zqSPlUs09rBtGX
 pqiSooKrK01MS1PqGpeSbZYwntrkUef1ig30BTcMG779iqEl0QF8+V1sL/N1LzcFL/AXWby
 8ZMC2BN7+sptFmYUef3vg==
UI-OutboundReport: notjunk:1;M01:P0:V3eRq+soj74=;q51QfpzqOF6PWft9pBtmnKFOFwk
 COs62EFYn9V/+kdmJPYOetwzMz16v9623m2+/3bPYXYEg3lJYKKTxz57T9+XQUSlRYqDPvdHD
 EQcbnX/VUVwFHqn4kp6zUC9VmQ6B91zjdmI8nqnsZsH+/m1Fefg3IoKulkgsiu5R7QuZsS1VZ
 3YmvyMCy8C96qBSEJV3uU8lKIf1S9lUmRg2uyBi3KB8Ll4yVxKRcuMFdQk3EpM+JYbt0HTeg/
 Dcgz+ey6HmG6nKZggmZmcXz70qlFmbvUJijhQsakXf8eTUkji6q2bj6DYMd59vr+U8zVa0FLG
 yk/Iig0mqS19ASE8l3kaqa37SPsHdH8le/EhNIt/1rfvUAQfhGK6bDEutD5mmOVDBo6Z8Mxjm
 rpdqSIB2crKl7bPemCkNq8/oE3Ib66g2nzAYKrqdVC2pVmCGf2QkOVpYAh3r4mEy9dzS1QQGZ
 XqZCHSfLtqY6cWdPACCfUV9scZt6t3tuVz7WzbvuIZA3Mlwkuac30Vcdn6HTwb3kxHXw6+UMd
 dtBXxQfQCkvDAqYKfwT6k8JpauU0/On+xhl9cYshViKX7wd4BHNgJ/K6kirYd2nnnYJN5huIs
 y9YqWSyGlkRWNYF38c6BALDgNWE6ZIB/phleb1cGc/HUhaDhUSJgAreySIt5XGCgf+Oheja9Q
 wc/kn+CcoVK3urvCTsWRnR2TAOqTtLRKOkyv/XQ6Is3wof9PAmGzbyDoD1swKVu3lcbtS54Fk
 oLMfUpXFNVNUS0vfCvEcnv4+g56Sklh6zfTHorFqbJSq22jNAItIMkeqZodREk4gBuZgF63FF
 Q4/CLtP186xV9JR8Br+7LcMJPuH2/D7eniiqNxR1LG/oOv++Gl0XBiEJwMRl+VVSLLhm71iHV
 D5wHYt1NxwJfI+cppn24atc6S2czIIrQyFc4FQmAq82BDlett2WBPK9rhf+h2xApIA63X/0A4
 ozind1YUlPsNUhpzTcGFh9aO1AA=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Alex,

> It would also be worth updating ./docs/system/arm/virt.rst to document
> this feature.

Good point. I will add this in the next iteration of the patch.
Until then, the proposed doc changes can be found here:
https://gitlab.com/axel-h/qemu/-/merge_requests/1/diffs

Axel


