Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4B65D7D2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6Fk-0000fE-Jc; Wed, 04 Jan 2023 11:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pD6FQ-0000eF-Uf
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:04:12 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pD6FP-0000ts-CV
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:04:12 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MderZ-1odUNd0MLJ-00Zeel; Wed, 04 Jan 2023 17:04:08 +0100
Message-ID: <894d4d92-5252-243a-4c3a-3e18b3b0a4b1@vivier.eu>
Date: Wed, 4 Jan 2023 17:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] target/m68k: pass sign directly into
 make_quotient()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230104134554.138012-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XV9H5BHdqSOlZ5oaXRqH55STcNYJ7LsJmsNfFrlFkjUid9qcuc5
 j2mVmMlEBshAKt+JOirpo+X5szxiNdZ6YAthBMZjFIRuUdN3jeypZqBtlA7evj5hnYyk7fn
 hErb9f87sLLUDqFYLcDv6dhPFUtTW8wppTlmEjKzRj/sJRqT36gzUfaxi9wHbvy/LziG2Lx
 HJ1AAF5SM9CC0auIPk8+w==
UI-OutboundReport: notjunk:1;M01:P0:ZtZ5CwZBtWQ=;owWnCZmenpuvyrsux8jHfWzgXNo
 ShAmdi1hG73mjohGpf1UP1uN8pOB8tiUie5o/vY+O/jLEXHFeQhr2h/igU9aU/yFTRpEHsskM
 Dkcz+f//yA36ev/YawKTARrKWmfd/0hB+oat3vmRiyhlcwpK1hMBtfdeAVemGVv2KWOkyadSy
 NQRF3PN1gkJK/oSmrrkIumCjk7GBplQXTW1j5LFgY3fTGUu0VOepuetQI4fSRL9xe9b/p4Xs/
 XSlSBViwEMOdkcgMbpuQvkOG/aWMddCvFklvwRZtU96xODG1kZb6cuyerwnT29yo2Fb9W+cwZ
 1ciGAkhMksZ4a348QsM5o9Lghc9KP7i83fe3wI5mwiY/uggE+gDyyxR2mcHmHBKBslUmv8SyH
 TWf0DftQwvWFFCD3kHEpmCa/OleEEOMK7oWNOrbAu15OI0Ygf6+TcXvyJPQjuIri+UK0hyQgi
 FzDcRHYOdwa6VMfjbH3Va1Uhl1XWWd0nYgIPvqS4usyAUW4gTP17nufvJFOzpLJpvsM2CiNNk
 SGIskgPl+Ijh8fpPOy7UBqWroJr/nRtO5dQTU17euBlXMjijKbwIO0fK4C/aL/cIJ5gWLz1cC
 k6z1Gxiuj4+s9fKqsWRa4fkjJEVxNRW1mGNTLeD2xFLC+v4lYf2vH71axtt/AksgHRgXcRfcW
 Nf8410QcJdp1PFwj/DzU5Vx07sBW6blIU/JKUg3aDg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.708,
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

Le 04/01/2023 à 14:45, Mark Cave-Ayland a écrit :
> This enables the quotient parameter to be changed from int32_t to uint32_t and
> also allows the extra sign logic in make_quotient() to be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


