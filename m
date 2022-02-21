Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3F4BDB4E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:33:48 +0100 (CET)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCZH-0004dH-9q
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:33:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCKT-0006tW-DI; Mon, 21 Feb 2022 12:18:30 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:40207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCKQ-0006q4-PE; Mon, 21 Feb 2022 12:18:28 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvsR7-1oD4Lj123D-00sv1u; Mon, 21 Feb 2022 18:17:32 +0100
Message-ID: <b5e604fa-47e1-de71-4684-90b5efd46f0f@vivier.eu>
Date: Mon, 21 Feb 2022 18:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/avr: Correct AVRCPUClass docstring
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220122001036.83267-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220122001036.83267-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YkE5wvWT5mh17Yy32NeJIzxgpn91qzzurjKacOMB07DaFyW0AKi
 SgDYsGnJ44mVlDbCHr0JacT8TevTRZ0bUzZYGpzsgH7REr4/KW0cZTd2obR913QO5NSBLqi
 NhXE5rmRvp3wy8cyzG1KIQ/67F/G5NmA9UpbG5h9DVNZQFn2lBN7N1v9cHRxIYoY1ifoEzW
 +EqjkZW8oYfU6M4IFsllw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L/6gZOH8css=:pMUelgjygf0lHKstJvBH/J
 9QWd0I2f4kO5/gvD/6W5jYer1fLejIpCikjPDeweNdvnf2kz/i5P/O2h1aUE06VM0i3EcqeCl
 7WnSFkMy/A3ISdgcuT8mKeWbGkYgDaEaN9mop4c9dHpkTb9xQcnfy0uMrzsge6NbR9e8FVaMO
 ufsQHm9S7geZROzwoxILMwL8MK7AnWrANzTnzY5WlVWsfMDRMUw+wy8hCLqMi6mx0SENi3Eiy
 UHmYm3/QDStBju6nAxCZdWM/xgQfiv5U/yH8wckE7Kzb0O01cFvXcz4vPobZKnxiFdGFYKmj7
 G3PFE7sBFTO3H8oAsleQJVA/am0PgqgC9NRDyrqv6XwzebMCvbVfy10tIoJ6nKc/7af3lpEbs
 zpHxZsATtnRPqoyemHrK861dWvXcQ8o8HDAYv4YJ5sexreY35a6BzHnKSIoxiYh3sM0T68YGg
 Lr4gOTY8Tyb7oCn/XTvOzPSGAapH4yM//MCoNfnn5cJ5O1IKMmmuCdIp9qeBxMTSk4Bj0heCV
 LfM5AB3QRHsT4PMqoWnNn0Vqv1G0qcRb7/tVTn6rKg4W/rnCyP+wmK634qsgufL6xdPETRSBH
 mlJfGbJiV5osX+QesM7lg0J7f7rOByzO0WCJmGKlo7M/nLnaI4i358tOosKkjjS9Q01VOsU5D
 DlOXXZykLwi60tUHeKsf++fCHDzDgWVUdJJnKFwwodMI4iTcUiY4TSO0OmzXr6rw8wNU=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/01/2022 à 01:10, Philippe Mathieu-Daudé via a écrit :
> There is no 'vr' field in AVRCPUClass.
> 
> Likely a copy/paste typo from CRISCPUClass ;)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/avr/cpu-qom.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
> index 9fa6989c18..14e5b3ce72 100644
> --- a/target/avr/cpu-qom.h
> +++ b/target/avr/cpu-qom.h
> @@ -33,7 +33,6 @@ OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
>    *  AVRCPUClass:
>    *  @parent_realize: The parent class' realize handler.
>    *  @parent_reset: The parent class' reset handler.
> - *  @vr: Version Register value.
>    *
>    *  A AVR CPU model.
>    */

Applied to my trivial-patches branch.

Thanks,
Laurent


