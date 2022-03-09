Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B454D3519
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 18:07:48 +0100 (CET)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzmt-00053H-NC
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 12:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRzks-0002np-U1
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 12:05:42 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:41211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRzkr-0001eH-93
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 12:05:42 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MaInF-1ngVvg0brB-00WIHf; Wed, 09 Mar 2022 18:05:37 +0100
Message-ID: <2eba81b7-f176-ab34-560e-b8d36c4c6d31@vivier.eu>
Date: Wed, 9 Mar 2022 18:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/22] q800-updates-for-7.0 queue 20220309
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tUcN9Hr0vhEe1FsoN8BTwIyxaZHh+RhZd9wm1XwnBIagsypu0Lc
 fe55IujMxWa0AUmMQO6kbzlznB1rnpwt9nx4mxijyTevYJg1rOFiWTJBXj+AgtlbE4oCwk9
 IfSnT24XalBUBj7oCsF+6d79h7qCUNjTRH0lfQ5g83eeL1M74Imh6+c9IxMb4CuqEJKGW/4
 d4kqwzUrjSZ/VZmreOYEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cy7132wGqjc=:GBChT95o7hhkSFr4w6nT8M
 6FG9moy/JuW5FQn6VW3SefreP7MQ6crTAPLniBH2Amy/XIF1zUes92UEYw0ZcNIx/rhoq/aws
 JTt/4wYP3wozzaFb3fCGLmOstAqi1ar+1aewe/FQ1WHw/mdascPsUNI6O+X4jFVTB1imIz5Dl
 gV7MLiROh1B4Cz06pcoRZC9kGDW0qFhDnFgdE0SWNu0azZFnA6GMHdlvkLmLJbLSwJIuqzX4D
 iI+8ppmPb+cN3ZElWgQCcTFo5+J5G9S0tcGO8dNgHqyP9ZseyL9kaYLTIg5T/yJ+CN1wSN2+5
 FQcnwa6r3yCSR0VmxK93fOd3jCIwmhfUfKU/kYQ7Qk0eLLS69H+Rjm+ivOF8AnXJDcSqwQNHD
 ngqIGJ6fMn9w/PtPf/6smkN6rU03jMikajoDNqDgUG9Wky5CRQ/aRAiZoOdLeqCyCeYubogeB
 aHH93BU3zGofQipaoeW0A2oVyNNkW9AzCVnPrOiZu67BBrCi/sw2Pm3+UASklN1D5TwlsT3xu
 4SArE65W0N+7SHnpkvEtGTW6t5W18TuawNOjafHvaA03k/q/eFBW5vsnQ4WvObTH4ImFlznTV
 LqV4OlVjUTcXZURGVHxFR5hDL4V+vwBldlaNOqiIxNADXTEHrUPaaJu0NKw9+COC2LS7N9wnV
 8Z2at7GkTMUHPH901zTA8nOpcYaDt6QsSHfXamLFYSmm8kGi3PTaihWKtkDJlwKKl6CU=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 09/03/2022 à 12:08, Mark Cave-Ayland a écrit :
> The following changes since commit 9f0369efb0f2a200f18b1aacd2ef493e22da5351:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2022-03-08 22:27:34 +0000)
> 
> are available in the Git repository at:
> 
>    git://github.com/mcayland/qemu.git tags/q800-updates-for-7.0-20220309
> 
> for you to fetch changes up to a7a2208862bee2bc4fe55adfd947dc4a15ad0216:
> 
>    esp: recreate ESPState current_req after migration (2022-03-09 09:29:10 +0000)
> 
> ----------------------------------------------------------------
> q800-updates-for-7.0 queue
> 
> [MCA: this is the current q800 patch queue for 7.0 which I'm picking up on
> behalf of Laurent]

Thank you.

Laurent

