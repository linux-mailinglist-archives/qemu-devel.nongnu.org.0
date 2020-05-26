Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1641BD7E6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 11:06:22 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTifd-0006XZ-8t
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 05:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTiaD-00009e-RS
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTiX3-0004iJ-GM
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:00:45 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jTiX2-0004YN-RM
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:57:29 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N6bwO-1j7Iuz2exa-0183Dl; Wed, 29 Apr 2020 10:57:23 +0200
Subject: Re: [PATCH 2/2] target/m68k: fix gdb for m68xxx
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org
References: <1588094279-17913-1-git-send-email-frederic.konrad@adacore.com>
 <1588094279-17913-3-git-send-email-frederic.konrad@adacore.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d565528d-426f-bf00-5974-5653eaf5cd25@vivier.eu>
Date: Wed, 29 Apr 2020 10:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1588094279-17913-3-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d6kiePoPrg9YUn8DSnmKRPWxH2lmWpumJisRusdAWK6+iSER5zK
 GvvfkuyQvtpRUNlKM0c6gLvT6I47uqO70Eo2SeeIfPSBfWIMSZlxTpg8KzKdoWUuYgr07IC
 b+O0Dp/mhgEIu+mIdH4f66kfuGP1nTf5aduh1da9sUtWqpKXVoHu7Bbd9PZ9OlJnCC6gdFx
 5k1qvNEAWvph89AuLWy6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F48xH8vGGLU=:5/TcUeoOM9Rb521thRgjEL
 tCkeB1bbjyo3nCwAF3+itaoznguEvJ9v+Qi9T07xdRRkw22vId072N27y1HYPV50WATUDYf7g
 vezOxzhgq6KYws+oiLwksYzqqRnhlFJj6V62ijpVRJPTHbJ1AgseSxgj62mfQ6V4dL4/IYK2p
 ESgIFBeMSwGTCh2Shq7aN9G9fh9rvxOvert17ALU+yg56VyTKljt+6NlZy3H3WF8gdF4rMhS5
 alfc9MD/yU1cU8S3DAHWVEE/4pzwz8b9TkLELOmqNNT0V8wsSkhaRQuy3v4bnP49r6Yrj8YhP
 YwL7vUAnlvtoz9xwcJr9W3MwgwoANL4u4AW5FlNjWdVNfizru3Kb3pYxfQrFKZ/moiQpMQTFs
 OFFjx0VdshEkeJ3bXRyWZUzYSEA4BXPqMx38mTpI+7peBCCuXPHru/N175uitBCq+G2uvucqx
 4AwJMSDC+LI4r7HP72fVJz5DWu/keL4+24hUCnpynMkTKnwE5DJDcQn9Giy5Zn4YUEzfpLmkK
 C/26f5uFhd96vWvggU3lF0BUsSfglVw7czfo2mFdqlBx9sPt8Ct2opu0FM9FjOdAXMfAVqq5U
 td4JK5yj6G/A3zr/yIaugAyyT3a+6zlhsQSHsFEXYnpVjR9ElMf4bwB19mHpnnQjqCjmzxD8a
 i2wYc2RjiE2HfEOg+e18CQX+orFG4JMmAZHv8h4AqTAA9wJfINJ45CaWyclyv5px72bVZa5M1
 QJfvmcdhHh2fiO+gasClyclAoz1ai3sbtXD/h9n/L1i6wEjif+JulSUUkmKOj5Zvcc4thJEzv
 KH37bdQ5KNveAG6kc97b1xwCJfBchxb7rEvmBaa/TNJM7Nkzz3H/FcC2PU3P5aOp/PsB8RA
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 04:57:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
Cc: philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/04/2020 à 19:17, KONRAD Frederic a écrit :
> Currently "cf-core.xml" is sent to GDB when using any m68k flavor.  Thing is
> it uses the "org.gnu.gdb.coldfire.core" feature name and gdb 8.3 then expects
> a coldfire FPU instead of the default m68881 FPU.
> 
> This is not OK because the m68881 floats registers are 96 bits wide so it
> crashes GDB with the following error message:
> 
> (gdb) target remote localhost:7960
> Remote debugging using localhost:7960
> warning: Register "fp0" has an unsupported size (96 bits)
> warning: Register "fp1" has an unsupported size (96 bits)
> ...
> Remote 'g' packet reply is too long (expected 148 bytes, got 180 bytes):    \
>   00000000000[...]0000
> 
> With this patch: qemu-system-m68k -M none -cpu m68020 -s -S
> 
> (gdb) tar rem :1234
> Remote debugging using :1234
> warning: No executable has been specified and target does not support
> determining executable automatically.  Try using the "file" command.
> 0x00000000 in ?? ()
> (gdb) p $fp0
> $1 = nan(0xffffffffffffffff)
> 
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  configure             |  2 +-
>  gdb-xml/m68k-core.xml | 29 ++++++++++++++++++++++++++++
>  target/m68k/cpu.c     | 52 ++++++++++++++++++++++++++++++++++++---------------
>  3 files changed, 67 insertions(+), 16 deletions(-)
>  create mode 100644 gdb-xml/m68k-core.xml

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


