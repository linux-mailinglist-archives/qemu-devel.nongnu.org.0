Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80124CC421
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:39:37 +0100 (CET)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpQO-0001pt-7h
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:39:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpPU-00018w-AE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:38:40 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpPS-0002Qj-EL
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:38:39 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MqatK-1nuRCc3dXk-00mcKQ; Thu, 03 Mar 2022 18:38:35 +0100
Message-ID: <5abecee2-6c54-d525-2c42-563720f3650b@vivier.eu>
Date: Thu, 3 Mar 2022 18:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/12] mos6522: add defines for IFR bit flags
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LLZQtDMajxtELzYyQjmzgeeoi8SFvNRRDz44vJMTnqrKmGP6989
 arqNykO1Cyb7mR/+t4/VAMn2qYaaMMaNiBglXHkvyjCuGhBUSdTakov4soecDlsU4WQtbtY
 9tP7mMddZ7xtIyXM/XifqWYYQiPWXowYcx7b+udUq39nJQ8J4s0852JCm4WK/RE3NzXfYjO
 lomtwQph0va3u4OHi7VYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q9uGezHF+6s=:JkVgox6Eo3U9T404Z8YSj7
 +E2Z+uN6U4ruGrEIgsutf26c/Ix+Yg0tyl6DCNp2RYTrQ8jA5Z9ppemEe+lI2XvJ2+c+AKWTN
 M/x35VcbyeGVAHO+4u/RPWhlrfzOF6A4e8npdriC/TbQB2dIBFCCGfiPrgAtaN2gLsGVq7XJy
 gXjaeUItqKgM5wssjFTNVVBk4wqzebDN//azpQY7BxUvsJDUN5wJHOk1n/0ngONWJbP+IfRuA
 WDgXT1Q/a8nOurPsZdWzj2nt9tmqnTavzpk/sr50ilifF4A7lY1F3E0U3byXM0WIPQZeTMDGQ
 2Lk/vBchN6CKl4sCaPIdzERxBshVk2lbIE8txfLUh7o/w38WpZ/+gaNeV0L0U/fnT25Om507M
 Fql5qHrK+wHxoHEd4okx+czOIm46j7+8xn4GegeXdt3SPttwyFL52LoMR3mbcjowSslO5UauB
 RSvOJrE7TSk1LTHbVjEIJTKQEbTYoWA7Vxruce2QxuKudCLmS0a6pewJ0LmgcJcKfzpw4pvy7
 MnUwCLG0SNYnuQjTlV2r8+1ZxJ0EpO0HLLgEHlSevks5RxF/sFJTAzB9nKJOApYHDRwcRpoNg
 BjVSGMRHxeHbPfb/SQTxDiyjVHZZrjwHF+jRiqCWkBBbOquYV4jZI4x3pwjxppY3UfQimdE1Z
 rl5EFx19Bg9ur2HLMWtsmQMnK/Gr1l16UCpRXFQqQGMmKR+vHUR6+nSm4NprttsOxIdE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> These are intended to make it easier to see how the physical control lines
> are wired for each instance.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


