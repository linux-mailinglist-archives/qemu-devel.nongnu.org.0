Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1853306562
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:51:26 +0100 (CET)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rmf-0002ub-Qs
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4rlN-0002Tz-5M
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:50:05 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:53578
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4rlG-0005FC-Pw
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:50:04 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 749A5DA06DC;
 Wed, 27 Jan 2021 21:49:53 +0100 (CET)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
 <87wnvyw3eh.fsf@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <d265dadc-45e8-3813-4e2d-cde007c389ac@weilnetz.de>
Date: Wed, 27 Jan 2021 21:49:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87wnvyw3eh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.01.21 um 20:52 schrieb Alex Benn=C3=A9e:

> For example - debian-buster (arm64) running ffmpeg:
>
>    alex.bennee@8cd150a4b35d:~/lsrc/qemu.git/builds/all.tci$ ./qemu-aarc=
h64 /usr/bin/ffmpeg -i theora.mkv theora.webm
>    TODO ../../tcg/tci.c:882: tcg_qemu_tb_exec()
>    ../../tcg/tci.c:882: tcg fatal error
>    qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>    Segmentation fault (core dumped)


Thanks. All I tried to say is that I prefer to replace those TODO=20
statements by working code as soon as there was a case which triggers=20
them. Most of those TODO statements are very easy to implement, so=20
anyone can add them when he/she detects a missing one. If I get=20
information about a scenario which triggers a missing TODO, I'll fix=20
that of course. I just don't want to add that missing code blindly.

Using `make check-tcg` helped finding and fixing one of them, future=20
improved CI checks can find more, and so can examples like the one=20
above. The error message tci.c:882 is INDEX_op_ld8s_i64=20
(https://github.com/qemu/qemu/blob/master/tcg/tci.c#L882). The missing=20
code is nearly identical to the existing code for INDEX_op_ld8u_i64, but =

with *(int8_t *) instead of *(uint8_t *), so maybe you can try that and=20
confirm whether it fixes the reported problem. Otherwise I'll try to=20
reproduce it with any mkv file.

I recently tried running tesseract with qemu-x86_64 because I had=20
expected that it might trigger some unimplemented TCG opcodes. Instead=20
it showed a general problem for native TCG: qemu-x86_64 allocates too=20
much memory for tesseract and gets killed by the Linux kernel OOM handler=
=2E

Regards,

Stefan



