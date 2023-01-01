Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24165AAC7
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 18:22:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC20x-0003z4-6a; Sun, 01 Jan 2023 12:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC20u-0003yh-PX
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:20:48 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC20t-0007Ie-8f
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:20:48 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4NHS-1on7IQ0UMQ-011PvF; Sun, 01 Jan 2023 18:20:44 +0100
Message-ID: <e6db4f1f-b686-e039-4801-1e708746e2b1@vivier.eu>
Date: Sun, 1 Jan 2023 18:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] target/m68k: pass quotient directly into
 make_quotient()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101144339.60307-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BNQ2vHw8cdOfux4qfEsofAlRbz64dR4HleErHYBB6Cx+C+2MWCS
 lSkwqSUyv+WM+1+xUAsKpp5UcEWnCx65/1I54aNJ0fOD681ndCbbdzWVmEuoBgf+RHe2ehc
 ukX0PFSdgQZrAOgDMfMoSwkwGK9C8jD27xIOjdpUV/+oIgciXJSZrhrrOARpyAeT2OD8XVO
 FjAATjHV+s1TOdQASlQIA==
UI-OutboundReport: notjunk:1;M01:P0:I3wUKDb2ZJk=;T20ScA1uXxXFnHZmMqREzFi9NUG
 V0opdPdPfwpCpM9RFb+RZ/b9E2kuTpxRHW+DSmcJiTTsSINuRyaZYcOJi0WyMVY57EAsdpsUF
 88cCQaLtWlDErDtrYxTfuBHbtxi5VUf1YvxZukgycovdXz4paGeYkq4OPkOGog2kFy24RT1Au
 DBO5dzpXwf9Bthf/sk2TqrzhuoDrvR0UHwA5mD14eKcX5R4AGruFpI38I2g+z2Nz9etE32xGQ
 6CRG0v6TvLEAdIOEYkuPsGzH7dkrYXp4cRjFbMYBzUJqM6DjqYNTA41uppOFmGTFAjhYCyMqL
 mMBLlAaNz5eF1a9VbuFcitBmmAR++UcVngkAckPs8QzxGJaMM2h3U3Ue7NUE6/Uyt5zdbgZ3C
 TtFXyvf3lEdMfBbDx4lUWJ6/K4Y/RF2ExngpUBnsHLssiPzD6kVB8MW9J5w8/yvQkOiLgTOKY
 cs7xJSVWiGBuXDg3/P8AWomSUxr/wqiYqIWKH9fpdZs773RWbTw17myjrlwnwLp8GvBBA3Boc
 XjA7sNyQ3C/3oox2fVOtTJrlwX0OC4nJnYySKLA0rKwQPpUlvBPundTiHksB04HLC8rFopIZQ
 7lDRJ/xYo0FZCh33z99u6fx7FchkBx045u1rawSg8cmvM/tSH6RjZ0BoBou8fczLQXWjCKNcs
 ya9hMok7ElPV/PKjpNhAdgauno290toWrcaWfb7AGg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


