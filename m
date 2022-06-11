Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0D54767C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 18:37:02 +0200 (CEST)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o046e-0001fM-Lf
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1o0457-0000tN-C4
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 12:35:25 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:56054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1o0455-0003GD-Ay
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 12:35:25 -0400
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout06.t-online.de (Postfix) with SMTP id 6B4A110102;
 Sat, 11 Jun 2022 18:34:40 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.233.154]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1o044C-06EtoP0; Sat, 11 Jun 2022 18:34:29 +0200
Message-ID: <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
Date: Sat, 11 Jun 2022 18:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
To: Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
 <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Content-Language: en-US
In-Reply-To: <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1654965269-01432E2F-9B3FCAFB/0/0 CLEAN NORMAL
X-TOI-MSGID: 97fb026e-e35c-459b-a063-121af80287a2
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Am 10.06.22 um 22:16 schrieb Richard Henderson:
> On 6/10/22 02:20, Gerd Hoffmann wrote:
>> The following changes since commit 
>> 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
>>
>>    Merge tag 'pull-xen-20220609' of 
>> https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging 
>> (2022-06-09 08:25:17 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
>>
>> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
>>
>>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 
>> +0200)
>>
>> ----------------------------------------------------------------
>> usb: add CanoKey device, fixes for ehci + redir
>> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
>> virtio-gpu: scanout flush fix
>
> This introduces regressions:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
> https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
> https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
> https://gitlab.com/qemu-project/qemu/-/jobs/2575867208
>
>
>  (27/43) 
> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
> -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: 
> ConnectError: Failed to establish session: EOFError\n    Exit code: 
> 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>  (29/43) 
> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
> -chardev 
> socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
> -mon chardev=mon,mode=control -node... (0.09 s)
>
>
> r~
>

This is caused by [PATCH 14/17] ui: move 'pc-bios/keymaps' to 
'ui/keymaps'. After this patch QEMU no longer finds it's keymaps if 
started directly from the build directory.

With best regards,
Volker


