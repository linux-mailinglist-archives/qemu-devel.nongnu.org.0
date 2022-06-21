Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1B5533AC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:36:30 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e3Q-0004MX-N2
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e1G-00030u-TZ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:34:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e1F-0002oE-5o
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:34:14 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8yU2-1o0uyv0KW6-0069Rf; Tue, 21 Jun 2022 15:33:43 +0200
Message-ID: <a1925dc1-44c3-0729-9ed7-0d6e58d3bbbf@vivier.eu>
Date: Tue, 21 Jun 2022 15:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/7] semihosting: add the semihosting_exit_request
 function
Content-Language: fr
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-3-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-3-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hGm292gRltgg7IIk4TRYLAAA8hDIzGmF6I8U81Ne5o4UrGU2Vcb
 hY4dTS2pptxbr/DDpTEnvKlzflGPf0dGp34O3pDzmxOrON14DpugMdJidl3NyiXpsEGWCFA
 /gMrGkFKFnjlWwFQI+QXzeWDMZFcbV+fKx6Zhtiz2dpyPy4GgZVTyh9NFN5zK2Xf6+74bgZ
 24mymVNoEknyZZG+dio4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:26JLh6eGcJk=:Yuyq4hdOsBGRjL4D7fzKIJ
 tWA3pgzkJS3fhPIHmggFizcbhHmlIc3pwc3wTc9cbmQPnNytWyScFWMQLihcboU5fLeUwl3Ft
 IuOzevjwSYAanPngNT7LDLo2JaWXGLsyQ+QIHFhedW1X3DLeYsSxdGk7VLPFdjIQO1TnzvXOg
 VjSKDkQ8+U7mgVBnPF4e3FlDWPa/XhF3bCqgHxbPXAWVO4hWnp4k9kA3IUkykbcFUXeZySvS2
 ZDSogAjxf/MsarevGBHh4jKgalT8/JHLRTTuo+HpGQ1tJFX1HEXH0+lN7ld84s+ttAZpCRkhz
 pvdvn0Ez9eSZE8Np8p11pazYjXSJXZOy+7xPMLigZfbHH0Pliiax4gedO517YJ1X8drdvR6Dl
 7PV2tC/MNR+XmCVBLyZ/wcTeXITKq+ciwJyW4XIaAFmsLu24QYnCLNqTVpWhYCpay4Ha7HlVJ
 YbrdCrg+RWe7qJlDbNqZRd5jA8GEw/6u4Xyc8s2jnG9b1q/YOFo2MntDAJvp3SpRMwTQqnyeK
 p1EMNQf9GfKqcFYPT4jiTF5Qo9yp6nxN3LsdyIWkVmIWT2r9WahlLVEHlrWTizl/XgAVprYHk
 w/AVjAye/lCFcEuuwwleoeXDuH2N/1/MgegaH5vE5xzrOvZny64XwJpYL0FokkJkUv/n/W8iv
 8qK/jUZsbdKIl/xwTruQEy3CMFRGqL4zbQxbD0WIp4QaPzMG+bp2sJhCwI3t8vNBLq6X2RFgP
 jyx0wQ3cKH2CZCasQ+zPcUbdsxpyriQtwXHe6g==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Le 21/06/2022 à 14:59, Luc Michel a écrit :
> Add the semihosting_exit_request function to be used by targets when
> handling an `exit' semihosted syscall. This function calls gdb_exit to
> close existing GDB connections, and qemu_system_shutdown_request with
> the new `guest-semi-exit' exit reason. It sets the QEMU exit status
> given by the exit syscall parameter. Finally it stops the CPU to prevent
> further execution, and exit the CPU loop as the syscall caller expects
> this syscall to not return.
> 
> This function is meant to be used in place of a raw exit() call when
> handling semihosted `exit' syscalls. Such a call is not safe because
> it does not allow other CPU threads to exit properly, leading to e.g.
> at_exit callbacks being called while other CPUs still run. This can lead
> to strange bugs, especially in plugins with a registered at_exit function.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   qapi/run-state.json            |  4 +++-
>   include/semihosting/semihost.h |  5 +++++
>   semihosting/config.c           | 16 ++++++++++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

