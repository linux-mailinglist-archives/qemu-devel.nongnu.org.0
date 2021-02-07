Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CA3123AF
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 11:53:22 +0100 (CET)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8hgu-0003SB-Ow
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 05:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8he7-0002p7-Pm
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 05:50:27 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:56178
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8he4-00067b-PU
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 05:50:27 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 32254DA0782;
 Sun,  7 Feb 2021 11:50:22 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
 <95d0b17b-b1ed-6b4f-f26a-69ec6a2e6e03@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Increased execution time with TCI in latest git master (was: Re:
 [PULL 00/46] tcg patch queue)
Message-ID: <e5c2d572-f4dc-62a7-8bac-c5968c3b6da7@weilnetz.de>
Date: Sun, 7 Feb 2021 11:50:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <95d0b17b-b1ed-6b4f-f26a-69ec6a2e6e03@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.105,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.02.21 um 04:45 schrieb Richard Henderson:

> On 2/6/21 11:38 AM, Stefan Weil wrote:
>> I am still searching what caused this detoriation. My first suspect wa=
s thread
>> local storage, but that wasn't it. Do you have any idea?
> No, but since it's 1/3 of a complete patch set, I don't care to investi=
gate the
> intermediate result either.


Your latest code from the rth7680/tci-next branch is twice as fast as my =

code with BIOS boot and qemu-x86_64 on sparc64. That's great.

With that code I don't get any BIOS output at all when running=20
qemu-i386. That's not so good.

Did I test the correct branch? If yes, I could try the same test on=20
amd64 and arm64 hosts.

Stefan




