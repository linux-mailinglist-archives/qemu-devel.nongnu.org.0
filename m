Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9E65AAC9
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 18:22:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC216-00044R-H5; Sun, 01 Jan 2023 12:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC214-00042I-KF
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:20:58 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC213-0007KA-4W
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:20:58 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MwQKr-1ov3Wk2tzp-00sKnn; Sun, 01 Jan 2023 18:20:55 +0100
Message-ID: <3c3f6145-c356-9b85-2c07-a811933392c2@vivier.eu>
Date: Sun, 1 Jan 2023 18:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rHprF3h6R6Vwx8mr6Hzv0ChzYywFVz/FWH9I+h4jYWQ3BlXq66C
 sZ/TqExL0fH1U/Ddgf5AH0VUCjEmW4LJ3CUXDkTvFjxSSdHVPEXpu2Dyb6fhdRzr3ANVGSb
 K6VGgyZTmngZh6IQB8KgDyXxTe1GEO27Ds5LMOH+7/bCJmehUr5FAtKX74E/J3Z3icl/bew
 +mI2dDz0h5AeF93HABFtg==
UI-OutboundReport: notjunk:1;M01:P0:63jW52fWgRo=;9ww+EGHo0ylr2mNsaIjzQnvXni/
 gV1ZLAG5yZ3IUFV01KYJz/AxNSeob3xMf3fNejBoFeUSbNtGr01piwj/LzOKpHokESF0C28SN
 GRErx5jfms6sQg00FY42mYk7Q+WAjnV+v5Z6kt7wz6vq+jChdITcEa9rNdllDU26zHTynOJCC
 D/PnwBXKfzEu5cu1H8UgRhAviSGpo6uEyRkIhzmIdbqXkjcnTHBo5tr7jAMAuRF3riTObbNcm
 +dh57ecu6VslVzIRC98upM/zFDNgEs1ScDCRk3mlBKnCf5XSWzRNTM1WUyysIOeOKj1u3ye/W
 jEQLe4LgRc7NOT6bApBxcREm/AicL2V9pv8gdJajlIKt5A0hHYhH9lw3bTe98ElSWfPP3kZAJ
 i4TjLerN93uxXtQG0Uih9x94LRVCO5H6ZxscWEKu2+pGRNI4GVJkP4BxiSEVRyt3kB+cGcObT
 mJ92ZxHKF4m5w1yh8takEhTDlUIR/Wld2Dqo67Egj6TwQuu2K38j0vq5nYReuojXpZcA1E9ll
 cn/EeQAfn8dg84LspV/rTX9NGqx9fkNGWe7aaa6WfWntxKTUz9/Y7F83f7usaGhg0HrqJ1qBi
 aujnlriDsqrt0vSj6HC1ZRch4pNWIza/uS+U2BVbO8/D0CN1pizpC29bzC5CIfjU5EkxVN+IE
 2H4wRM/nv2nZFAo6jxYzPfhp+vHEWriHjY11uU/tLQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
> This enables the quotient parameter to be changed from int32_t to uint32_t and
> also allows the extra sign logic in make_quotient() to be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


