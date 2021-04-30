Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6336FBED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:13:04 +0200 (CEST)
Received: from localhost ([::1]:37330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTt9-0003sw-7j
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcT17-0001nz-Gl; Fri, 30 Apr 2021 09:17:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcT0z-0006Lc-8w; Fri, 30 Apr 2021 09:17:13 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTAJr-1m0VFg3yhj-00UdKs; Fri, 30 Apr 2021 15:16:56 +0200
Subject: Re: [PATCH 3/3] hw/pcmcia: Do not register PCMCIA type if not required
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <224bb111-585d-fa11-6a36-fb9a9f0eb7c4@vivier.eu>
Date: Fri, 30 Apr 2021 15:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H4MOLWgczDgmUzBHTynduUDT8i4nCsuxBp5RkxsiJRZyshe4bmE
 r/h/99eyfWH1HwLTvaFvWnTcEjWEgTHlFyOCQJniyyklPEkRosoLcUGwe18KsPlkBgoRpNh
 UCjdIM05vLS3ueInEtgeqp/Ra56aw4ViQTPEhbYrQeowqKoyyednBGibk/HMoWJtF6WoLj4
 5BW58wVaYoX7enwgAq7RA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:upLJ7otRu7Y=:jRaOx/86aRpz1ky3My0hFy
 VtLrIgUEigHKx699E0n/tY65XEEnHmhZwIKhNIjj5qt88R8ZrF264TfbBPP1CzM1uVOZ7tldl
 5RQs6VNBydxWaUKObCX8UT2Hr0uuYxg38s5BEfSGpuGfWrgTmT7TWx18f5CfK+bpf58sFLN0p
 ssMK/Nm7E+KXJvfJlKtnDWSmNREgWLfSPp3oyEyHVBsrWHrTUGaEoI0AVKMb5OMo8zd51XR+X
 U/i0gFs0OANYWsY4dc215ZKa7vsRTFWPLbymg5wz+qSxLMEjBul0Oa8cTQ29/LKRMKP0GrxdS
 LlidLAih3DFmnUlE07UTLSAsoDw6iT1E2sxOWQ2S2SeM8wy3yj7NY0uA4vjGuy4iJWAiFrfsC
 049VnwGmnIkKnaqwM7Iyx0BztC5Cwniwv78HF7ZdKVk2wg8fcm289o6d6f+CycksD6fdxgxjJ
 Q1pEFMZtHIQMiEIaExNql1/g9EUo+TdMfdjNS0QmfwBJ+56aXCW3Mk6r0yHRPUfOuWgipnQS0
 4mtagkfcLQbqugw95R2XHE=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/04/2021 à 00:20, Philippe Mathieu-Daudé a écrit :
> If the Kconfig 'PCMCIA' value is not selected, it is pointless
> to build the PCMCIA core components.
> 
> (Currently only one machine of the ARM targets requires this).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pcmcia/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
> index ab50bd325d6..51f2512b8ed 100644
> --- a/hw/pcmcia/meson.build
> +++ b/hw/pcmcia/meson.build
> @@ -1,2 +1,2 @@
> -softmmu_ss.add(files('pcmcia.c'))
> +softmmu_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
>  softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

