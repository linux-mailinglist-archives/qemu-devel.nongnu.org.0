Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF489415C22
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:43:21 +0200 (CEST)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMCG-0008Ck-Pr
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM6g-0007bO-87
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:37:35 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM6Y-0002Vu-LX
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:37:30 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlNYj-1n8Uo51OcX-00litM; Thu, 23 Sep 2021 12:37:24 +0200
Subject: Re: [PATCH v5 16/20] nubus-bridge: embed the NubusBus object directly
 within nubus-bridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-17-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d21226d-d91e-9809-7d71-1e0a0b1dcd5e@vivier.eu>
Date: Thu, 23 Sep 2021 12:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:axAum1U+iOZfk9A8wbrDVOBCFLDfhJbBfBp2kwzWtPSgSe/8FX9
 eZVXEa455KME+/gWLpDGt+CPiC/IUnKZBW1QK3IlaydDowyMFlrLkl77R6SHfPCYNDgouvl
 Lb0Wh/PMNECeh6QDg6RQk8q+j7Aq2Fe94Kv4LT7q7uJ1Rh1ohJ9yU7vTJtZ8KgSySVojDNR
 /RAkmvE3CQWkwHfaVu4jQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MaUB/QjiVy4=:888mKu+vl4WwcwlOT70Z1J
 UGrFbTOQ/FVnep3capq/4RjQBdrNLbfYjDVHJ/6vKRo1NL/RlCXI+/WMwaXWo1dFI5hNDOaa8
 WxpzaNU5qlGTB4NqsJ/Zw/gMTOMJ+1qyO+COtWkAGlr1n+ifJSMX88s6b2OUALH6KIKpmLjJm
 kR0g9JnFXkAuW4qM/sD/SwqjsmglYLyf6luZlWk9zgT8VZV0/Ia75pPqfp3aERJs/7rx1KFSx
 0khIMe79vr4kUmC2qQD/bvrKLFlII5zWhOHOQ9DPw7laXHmO0YX5wMqYClW+Ya5eCL+fL4yq2
 Vr404VMq57lhILjhEPtDHx7+nPcNu/gO9QDFX/uQIrCqjmA467mQXdu31fv3Wlm8+PJAxofnF
 Qgj/2bYIoabsLcfo042FjLys06v309NYy2DWDkH4ATyVv52h8hnW2jQW2iHx6peOevEKnPn73
 tJpxKdd/q3Ri1vaDDRu34OhRMpBwnIXruc64eTg2e3i3HHBL06dHgxuW7S30B0FEq1Dt1pc38
 4+U2XOocsU1gs2hGJdY7yZUNkSettY79beFwDDmvT3NSzawOW6xIlJlIlno2liC5/ebuNIFFQ
 QPg3iya7Hx0VikxdKNZeHDrzwtf43qjRshRIpHT7OVQL/MMmkoWlgVb517bcIWcFe0B5f2VxQ
 uude1KZ941Vssnf/Gb3nKJaFeTJSS9wZydqA+yzWaUnQOgreo+0GZOMlvAv4QTX8fxv4SDBEN
 SDouDHVQHxheczTWGk06l2NMRFKH4o8Od1urLg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 23/09/2021 à 11:13, Mark Cave-Ayland a écrit :
> Since nubus-bridge is a container for NubusBus then it should be embedded
> directly within the bridge device using qbus_create_inplace().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/m68k/q800.c              | 2 +-
>  hw/nubus/mac-nubus-bridge.c | 9 +++++----
>  hw/nubus/nubus-bridge.c     | 3 ++-
>  include/hw/nubus/nubus.h    | 2 +-
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>


