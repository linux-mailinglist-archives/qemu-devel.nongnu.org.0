Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F374034A7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:01:10 +0200 (CEST)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNra0-0002Z7-A3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrS5-0002D5-Te
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:52:57 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrS4-0002RL-E3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:52:57 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mv2pC-1nEj3N3Kts-00qzM3; Wed, 08 Sep 2021 08:52:53 +0200
Subject: Re: [PATCH 09/12] mac_via: remove mac_via device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7d640353-0f85-552c-0b1a-d7973f3b03bf@vivier.eu>
Date: Wed, 8 Sep 2021 08:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Katac/MNdeIODGsve4rXHflcdB+FXvVJp1VUIYzGkvfVcaPU7C0
 u3+T7ffM4tcInbsf6S3NE0Z1RhpfnqL30bsI3MZ66pHQQ4vLx0d3UTKnl0Nu3/G3fbBcfjS
 R3yD3G5TZbAJ4voYZpalqF6Hw0YpyDeY/rdGywrnT8pYKhJ7BtJRNxAYEJjsO5rhSEh/Lpv
 0T7MpW4/RHZFhvpvwo/kA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VkGxx2H/mKU=:6uIujnM3XsOTeS3PpefXjP
 F+xMMCXIKO8rzhMRM4RcmfIHw1YyJQqJSeBR4AkYo7LddR7bkMF49KGo5dIaCqzLL4OuAChDo
 1Ox7r5easq4yBWTPMwxg15INKQT7nLKxzyyZrNnrVmTaZkK/MXeSjnOBFhj7qjnKH+5OMNNfE
 BoqVY72/kJCycZ+4FwPsT1sMsyoFutfpmuOowiOniF3/azBfDFOfss2X5txRLIBS5MCE5YjD0
 Jw088NiJEsXtKXns0h6gEKFz2L10eX7tjaANgx2UqWNwxJVJ/w0TX7Rjbbe6LxGDqynthOQAK
 bbHAatUG655+kkZFzKtxuA0SPWC8nCvIzAveajRoV61suK595ufrJGAjvzgrBkUZ3frvzqYbo
 /IIiT/ibZxc+FaDoKzLAwTdAdaGkybLiDQiNq4oxynzSdDhy2Ss5McYe2c7p7SIEh75vyraew
 WmTsyEzd4rCH1p0tF63COOqJl/qskZs95rPJJCnGqFQRNJf/kExGu5et4l5Cn4hf5VVRRMdWA
 22Zk98IVJrp3Efmm/nSjkfFzFxlnfM1YwxKjtD+Cuo9F7f1joGw8fQkh0BIJfUxsdipP8k+CY
 +8j9edFP66vuNXdqzGU92kyQTtOJyPdw5Ehb8c9z9NGNhEAV5/s0yEL/hEtsiemjfM2ROYcWB
 Y4BouqKGae7frYzdALIwRiEfD2okTP1KFe4vDdRTF4tz2VGFA/P4j+9RZK0ckPlJQwpYDht4z
 5BRifmYqff0qFXh7YbUIcDRwywiaMMuQkAUojw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> Remove the mac_via device and wire up both q800 VIA1 and VIA2 directly for the
> m68k q800 machine.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c            | 34 +++++++++--------
>  hw/misc/mac_via.c         | 78 +++++++--------------------------------
>  include/hw/misc/mac_via.h | 21 +++--------
>  3 files changed, 36 insertions(+), 97 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


