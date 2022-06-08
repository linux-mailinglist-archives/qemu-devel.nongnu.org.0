Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B965D542B98
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 11:30:42 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nys1R-0007Kq-MP
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 05:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nyrzv-0006eZ-4H
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:29:07 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:49195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nyrzt-0006WG-I0
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:29:06 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MS3zP-1oAZxl1q2d-00TSQp; Wed, 08 Jun 2022 11:29:02 +0200
Message-ID: <8536e43e-1512-93ef-6d77-cbf4ea073631@vivier.eu>
Date: Wed, 8 Jun 2022 11:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/3] target/m68k: Make semihosting system only
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <20220607222616.717435-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220607222616.717435-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IWvCUzNQ/58Bs/MN79kRcgd1qZSDM1MVzGqCNP+jYW8BXvDhHGn
 xMJxzFHZ9SD1jnaeheS+P6QpnPC1oE1+LEdSVtHs8/juH1b/c186em3esuDeuFgThUjUE3a
 B0E0GaiC4uANjUZBeyE3P2GJkUtGdKpxPksaO1EwzIxVKAfd9CPHoo+cD9jz0t2gJ3kmEMs
 IsLwuDF+42TLLfLn40VXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U00YdOpcGok=:pn60eMm0fQfHpgwtZ0hFZl
 cZiSte0llvPZhK9m3vMRB9LwbdOOR92Vvoe7Wdw8uw6rJbJhDU1fjoDPBzB+eBqvRZyF1f5kn
 RtOZ7aTcfIZfacdxO//crG1am01Um9vs2EcEPdSA0MOghyE9LPsMSMuwR6PHbOpyehOt1PoD5
 UFkXISFr0hUa3GofsRvsSxD3YeDp3cWl2mbINba10DFD0weLXL079lDn4zs4kn8eRNQDejWs0
 ARFVVkhwxxbzD7cVJtbKKU2eNLeYPGPJzcMdy0hSu2YVx+z/z5zWtHrSw0/51/jsibIMTCODO
 T551oW7kKWxbH6/kva5JtzMKjq5cUTTIq0hbte3jPeOLtWHk5A7HRbMyv8BxmHRsKKEtbrfyj
 yOBfXCE60QouIJb2mROWog0KoXLaJCeWAfJt048qAlfOsHUNDRv3qX+pZLqg5rPEGzynfxLIT
 ESUujy+Yc7ER9dpa2bs6PbNmgbtjXbSJrvOqEgPDOGFU1RwkFQSv9Cx7qo9QHxNo3NDyvD+xg
 xR802raqlsS1TNbCzYlVhilnbH4xcR6vZxbPaHobos4Gi8HEYlFKg60g8xy2E2hNrUicJNyt8
 om02+htAS7ECZPBPfSWtB+htHPfYbk7EJ7Y8tqKEHTfX5rNkWSevtD22cT4KAdQIruG764lpL
 M6tQENvhtRCpxit3Ardb7eOB13RCWbXR/XK8gDKfHTzHpEnbizseru8kvo9gQOcsz7k6SIh+y
 BiziBzh4V3n5ynQHmrw1sXA7vL8JfKzWXbKJJw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 08/06/2022 à 00:26, Richard Henderson a écrit :
> While we had a call to do_m68k_semihosting in linux-user, it
> wasn't actually reachable.  We don't include DISAS_INSN(halt)
> as an instruction unless system mode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c |  5 -----
>   target/m68k/m68k-semi.c    | 36 ------------------------------------
>   target/m68k/meson.build    |  6 ++++--
>   3 files changed, 4 insertions(+), 43 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


