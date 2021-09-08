Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA734034AD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:02:41 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrbU-0005cl-AU
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrTn-0003W7-Ep
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:54:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrTk-0003t3-Tw
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:54:42 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXH3Y-1mRe2j1Fkc-00YeSx; Wed, 08 Sep 2021 08:54:39 +0200
Subject: Re: [PATCH 12/12] mac_via: add qdev gpios for nubus slot interrupts
 to VIA2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-13-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9b69baa7-26de-f743-db35-96523e44598d@vivier.eu>
Date: Wed, 8 Sep 2021 08:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kSRqjbJSBcICNc6tC75GFGBSuCjWOuU6pC5IkOsVddx9Tupi+6+
 zmUbbdiRBoHGxosWYHgE5QauC2B3EybeDd8p8H+W4aI75TdJF2c+vzhBOBQfaH/+lp56isI
 HednvlycvTDAA5uPPVAGBuW57v8nbn7kQi66omh4mD3oGRw5gFenIkwQC08UMxCdHUl8ytZ
 8xGtpd959/qKp2GkDcF4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqG8jx6D/gw=:Vqe/WbfFZmvt9+2/kNweJ+
 v1ErPnjM4NJLZfaDsU0z6dT8W4BBSVGHkAO7mK69Kp493MVZKlCYpXSGgqu9V9g/caW/pTIkF
 ceMMEBhAXhCAf+ixo+lWvER8xaGL9hy3FauOvU1PEHsK+dh8696/YgMD5x8MNQrb/MvxlbND/
 OVrUbfVnrWsqdDQFE2bRXzKtS2JrOC0En9yU2YFQ+eMcBtSgh0D6aOfwFb3v2I4N8PsUcik03
 C3eV56MjQdoPfzO1mAUoPLLoQ4M2kEnMdwsRbFtCUnzdhJQpfTtR9PA14/fFPRPoCTTFofuDc
 go+7nQhIDJYkcC3WPeOEITWj7aNPsKP1pbO8k8461kv/BHesEEjb98NFrjG0dPAyoI0XWMND5
 A2wT+5OXeHW6IXrZguSNDgQ3/M2JCs913rZ/lD31XiJBvrECN7B62bBs4LJgHktCrhqLoQpPI
 KaxBPSKR2uuXFyCg9PZnCbzBUh5EDnKPPoTlmenc9UOxvzya9vvQBPnhfVNPItX75YNZ03Mkj
 Ahk+QKr9XV/lpQhg0H9C2U94M4XBorA4ryPvXgyzVsifE1Py+aOY4eUQQb/Evmz/OxK/AlbYL
 HTeu7+KJ7H0gJotixFNCeEy66SIx1RGybryI9+AL9GiLGdh2B/q58fdeodD74xd3t48Z1XFhc
 /IEoZPzq+x82H93BIMyuLJlPe+69njKQZFFnTFGUdOH1edYps/TrE+ltzE8oI9agIc96eX7GJ
 yNjx3I7TrkD7qcGAZDoXjPpHCd5kedKa/7sLqZ0ilNSwhx6XheR7c900RYFluDBb/luNTj7PU
 QavKQQO50qS4fKyv4Ygg5iC+ooQihneBzFzXXygzDfpdJXTMbcytMtQGi2AVUxt4aS/eEL7
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
> These will soon be required to enable nubus devices to support interrupts.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 23 +++++++++++++++++++++++
>  include/hw/misc/mac_via.h | 10 ++++++++++
>  2 files changed, 33 insertions(+)
> 
Reviewed-by: Laurent Vivier <laurent@vivier.eu>


