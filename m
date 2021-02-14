Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC031B186
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 18:24:27 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBL8E-0005OC-PG
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 12:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBL79-0004x4-MB
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:23:19 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:46719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBL78-0007zH-1K
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:23:19 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mvs2R-1m3ZxO2b5D-00sxHz; Sun, 14 Feb 2021 18:22:57 +0100
Subject: Re: [PATCH 1/2] linux-user/mips: Support the n32 ABI for the R5900
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fredrik Noring <noring@nocrew.org>
References: <cover.1541701393.git.noring@nocrew.org>
 <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
 <CAAdtpL4B-19ZrtkLcfY0PY7RUMrEVWsH310jZ6CGHB-K+nKCQQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b2bb8e01-ec38-a2c6-9b7b-f96d811b6b75@vivier.eu>
Date: Sun, 14 Feb 2021 18:22:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4B-19ZrtkLcfY0PY7RUMrEVWsH310jZ6CGHB-K+nKCQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EmRZff9cvnzHOh68QV8mLoYaUdhbysfjoN/jvnLZ7SHX43reoMy
 ap8X+FSO35fPCTh83zLg2Ck2bNBC/3aSaTybDevekp46a0bxpnfmC9cK/B12Ms9UF5Apk7h
 896WB5LV2s9k+GXh4T8E/h5cChLgfuLcUzfTOMHvW/Ws0j3Z7ldXwZZmTpIfaHXOJYngFjR
 Zw/GnuY4nqq73aCYy++5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ngPpJpUXwcI=:QXJ9hbH1jgCMZieKDyKpbn
 5cJ/qIV+aCbD18oMJ1mMPUoH+iRaumw5/F+YqdT+UGsJ1/gxr1YIXSEA4AUyh16sYi3OEd3ut
 4f/JqDr8iL4vZ0dsBOPkKwG2rNwPolQQxJpBrK0BJyavC6sx/7/iZTioehpb0bz7NPV3Pu6rY
 L/PxBCyBAsowCHCGyTahF5CSxClziOctUR5BAxTKRSXjmKnGagsRAFDrUvt1Av322uQvUNujT
 XoUpJbzPRdzIxIlbuTJzyEgTdmTaAN2Da+5+vIkhSBB0K3kGuB9yWZdA/o/bhV1BkzmuPwl4M
 lhBeMPFalky2N1X0zbIFglZL1YEF+K33Uv6//pDcVyOJLeE+RRIuCEyqyFL8sYa0wa7KjPPSe
 IaIUKcRJSIhlcQCadr3V7xA+ebEvj95qdcPkooQmC3YGbsOb0yDhGpm+lzO53M8Y4+R2w/sC0
 eR/btbbbsg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?J=c3=bcrgen_Urban?= <JuergenUrban@gmx.de>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/02/2021 à 16:17, Philippe Mathieu-Daudé a écrit :
> On Thu, Nov 8, 2018 at 7:45 PM Fredrik Noring <noring@nocrew.org> wrote:
>>
>> Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
>> supporting the n32 ABI.
>>
>> Signed-off-by: Fredrik Noring <noring@nocrew.org>
>> ---
>>  linux-user/mips64/target_elf.h | 3 +++
>>  1 file changed, 3 insertions(+)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

