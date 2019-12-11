Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EB11AE3D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 15:48:48 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if3IF-0002fu-Bv
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 09:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1if3GN-0001nQ-B2
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1if3GM-00055E-2p
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:46:51 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56731)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1if3GL-00051q-Pm
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:46:50 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6JtR-1hdFKy1K6z-016hl6; Wed, 11 Dec 2019 15:46:41 +0100
Subject: Re: [PATCH v2 1/6] linux-user: convert target_mprotect debug to
 tracepoint
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191205122518.10010-1-alex.bennee@linaro.org>
 <20191205122518.10010-2-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e35de57d-ef4d-e038-5a29-fa92ed5102fc@vivier.eu>
Date: Wed, 11 Dec 2019 15:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205122518.10010-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dIY/Z9eWjEK/cgGqJKSIH2lF8H07vt5s991NuwpftaKdwUStuOv
 H07trPq3Eco98HeMA6dIrAeb2++PkROOLez0eUG9QAiLBE0XmHtEEITE0fBDtolv6DxKMPj
 0PbLtCYG0hsCCpeVeFARoAbXJx2w6NNGhaOvbgWEwt4c98jNuNS/+3Wcv5lBF8bWHHmrtt7
 /X0DH373xsho8zqX3OmHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QX5PAUpGRvU=:NMVKHORlqDurTJBhnQ8Vws
 3waCs9pYY5A4zxkfWp0vJSxH+MyQ9VVbLewjd4TaigcW4ZSYGrs3fDLrdfirBpmajXZVepfgN
 ioETHvF2vcZj8sgUrbeCJtKKpqFLss/nH6Ql7SPiKTJs5L3rQ69udGBynNLnH9ttFHhBZCKwm
 l7uZoMzTXkxI/fUvNe9IIegGWMySIlfp1haTqKXCyl6uBhd7Mni8DtoFVg9PvDLsz0qRZu2HH
 0Lh1Haa5PsLth7r9LCyN5KLVDJVJ9Cx7KLsD7EzCoFX6si10PEgMAEKuA1QOrKSRR9vJw/Bi+
 Id+lhKMLpcMK6RbmhUCfxIaQZmCr+z9Z6um7g2/OFlHTFenbcuPUd8MEYSouWWH/9eqbzmG5p
 oIoHyINrVDx0UOFVNINDYC9xDgK4+l6sfn1u8Yu+Qq+75F0F4uXGd/XK6dHS/S7GGCEoFrUER
 xV7TvWlanu7873Y2xdM2dWfbdI1hm3FHcZwWaCTVuKzUqoUX+P9nmOxB0y/t2XGqkcNV0kseR
 KGHBMygwgtNMBE8EkTru6z+eNIOBJDRfCTUPVCE30l8DtP26P2Gpky0DDM++2BGmvU5COxy2k
 bFtK5+ddxJxHcrbWTcBOEE0muQ+UhXheDJw89LWhinp2krOWFPFfRFDaJ5sVw8KTE0Kq2Uky/
 kLHwqRmR+vNf8UgD/iDtFdJuu9bm6nXJ2hytGBFTL4usybqIWcO08M0bM3YBiSD5SXRtM19Aq
 MOKRf/fIC1NfGQ7CBelLT014VCrCHnzRRpdQBoMWSJYwKIZESCZTS3RaPB0/Wz0p/vgWoE7kb
 BD4Rq96yI58mf1ewg56wMjnbGSeMBcrz+fQEXk01biF97FJ0YxyjA0mHV48FrWiyVMkO/yEWj
 d8dvbx/TmUWehd+ABD9mAoiIKZPss0m7oD5asJRu4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/12/2019 à 13:25, Alex Bennée a écrit :
> It is a pain to re-compile when you need to debug and tracepoints are
> a fairly low impact way to instrument QEMU.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - don't both with ascii conversion
> ---
>  linux-user/mmap.c       | 10 ++--------
>  linux-user/trace-events |  3 +++
>  2 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


