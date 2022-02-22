Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AA4BF4DC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:37:32 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRbv-00053Q-Ac
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:37:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMRXa-0003NH-VP; Tue, 22 Feb 2022 04:33:02 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMRXY-0005zh-TQ; Tue, 22 Feb 2022 04:33:02 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4R0a-1oLNpK2xGg-011Pa2; Tue, 22 Feb 2022 10:32:53 +0100
Message-ID: <610ad47e-b991-1502-5197-cf8040989ed4@vivier.eu>
Date: Tue, 22 Feb 2022 10:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hid: trivial change to support side and extra buttons
Content-Language: fr
To: kraxel@redhat.com
References: <20211126140437.79745-1-noah@statshelix.com>
 <CABjy+RiwQLNmdSYop1zWq40Jp2HRvf_z5xtDTmKT1R3ff0bHdg@mail.gmail.com>
 <CABjy+Ri7Cnnnkn8PqhNwfDeNYo8y526TnTanAwV+DuLZWGQ-9g@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CABjy+Ri7Cnnnkn8PqhNwfDeNYo8y526TnTanAwV+DuLZWGQ-9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k+hgf3Uqc4MkDdAvofs2vZ8Rlj2jgPekn9TOlWj3/geAV7JQDOs
 eAh4i7+fM47+hrHgOl5khEf+dUnPVerS4bYqbsVCnPl+Ea7zRGrv/yGh7XVDvj0V5A8oqNL
 xakXz0ByeNhdyLhxTFuBdlaydizareHYhHQjpCtTbObaZdXtpc/9noGCkvE2AqAHnCI9LMS
 tE56zD4xAwpWoA3xkY4Yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MUl3bFSaf0E=:t40hYXCgnZSqY9D9fyZw23
 hkK4NdvkEGBvbozJ+AIs6bz39NO7gH5pfduEoRcI8eVFyt6ccsgv63PX8gE80UEM4c/Hl9Jzw
 Y7njM/wsv7cJwr+bpxHzRk09VzPl40gK6nY6bJPnNNtlA47BVOloY3HtEAUPwZkzvMTZ7qAlD
 PTinuNrFEHyc1LrJiV/r/zriIONDuOrrQrLj24bukOcJOhRpY9F5NlQJ8ieUlgo2MAuVW4vjU
 wDYrzZPQeNzOsrFQIZHGOKeq3lw04dm3oH7lu30GEMn4PjWhfdEAWVG8b+pfIcfnhfMYSGYAx
 EfwL+XyMlAzV3nNb06NvRrUUOHHXRyv1Hv3ZNZi7NaAxjmEWZrhGwLonsAFYcjgw3SAGwGsVH
 EzvG1XyKhRFMJJ/Dhv1NeCGy+3OyHp4+d7k4g8BsVAztdKjxG5zJQshDKEAo36sOoD82bucSX
 YDTaHVUj1kvM1pSMwG1nyIjwCQ9zVqcNlbXx+h8VvajxRhqopB+X3p2tTrLQChLpOekSEFedO
 0eqT4qDbeob2rbJQqDZGo1GQovNHB1hZAoJrboitFAGjOusDxRLbtak78jDNvCeQmlgG4JdIS
 8G/pKjYWKgR4nu5Zf4J/IYE09XqsLz0thUtEeaQ2gSJobhlGPG0hSjx+/bSjc7gYaxXm2PJQf
 kkLoApNgDpwXL8NQY0prr5mKQsdSop5eynJBmy8BVfHw2ExwFu4fetO5ypuVhMXZLROM=
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
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
 Noah Bergbauer <noah@statshelix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd,

if you acknowledge the patch I can merge it via the trivial branch.

Thanks,
Laurent

Le 22/01/2022 à 10:57, Noah Bergbauer a écrit :
> ping https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/ 
> <https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/>
> 
> This patch is really small because all of the necessary functionality is already in place. It's just 
> a matter of setting the respective flags (instead of just ignoring the buttons) and allocating these 
> bits in the HID descriptor.
> 
> On Sat, Dec 4, 2021 at 12:20 PM Noah Bergbauer <noah@statshelix.com <mailto:noah@statshelix.com>> wrote:
> 
>     ping https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/
>     <https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/>
> 
>     On Fri, Nov 26, 2021 at 3:04 PM Noah Bergbauer <noah@statshelix.com
>     <mailto:noah@statshelix.com>> wrote:
> 
>         Simply set the respective bits and update the descriptor accordingly.
> 
>         Signed-off-by: Noah Bergbauer <noah@statshelix.com <mailto:noah@statshelix.com>>
>         ---
>           hw/input/hid.c   | 2 ++
>           hw/usb/dev-hid.c | 6 +++---
>           2 files changed, 5 insertions(+), 3 deletions(-)
> 
>         diff --git a/hw/input/hid.c b/hw/input/hid.c
>         index 8aab0521f4..e7ecebdf8f 100644
>         --- a/hw/input/hid.c
>         +++ b/hw/input/hid.c
>         @@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuConsole *src,
>                   [INPUT_BUTTON_LEFT]   = 0x01,
>                   [INPUT_BUTTON_RIGHT]  = 0x02,
>                   [INPUT_BUTTON_MIDDLE] = 0x04,
>         +        [INPUT_BUTTON_SIDE] = 0x08,
>         +        [INPUT_BUTTON_EXTRA] = 0x10,
>               };
>               HIDState *hs = (HIDState *)dev;
>               HIDPointerEvent *e;
>         diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
>         index 1c7ae97c30..bdd6d1ffaf 100644
>         --- a/hw/usb/dev-hid.c
>         +++ b/hw/usb/dev-hid.c
>         @@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor[] = {
>               0xa1, 0x00,                /*   Collection (Physical) */
>               0x05, 0x09,                /*     Usage Page (Button) */
>               0x19, 0x01,                /*     Usage Minimum (1) */
>         -    0x29, 0x03,                /*     Usage Maximum (3) */
>         +    0x29, 0x05,                /*     Usage Maximum (5) */
>               0x15, 0x00,                /*     Logical Minimum (0) */
>               0x25, 0x01,                /*     Logical Maximum (1) */
>         -    0x95, 0x03,                /*     Report Count (3) */
>         +    0x95, 0x05,                /*     Report Count (5) */
>               0x75, 0x01,                /*     Report Size (1) */
>               0x81, 0x02,                /*     Input (Data, Variable, Absolute) */
>               0x95, 0x01,                /*     Report Count (1) */
>         -    0x75, 0x05,                /*     Report Size (5) */
>         +    0x75, 0x03,                /*     Report Size (3) */
>               0x81, 0x01,                /*     Input (Constant) */
>               0x05, 0x01,                /*     Usage Page (Generic Desktop) */
>               0x09, 0x30,                /*     Usage (X) */
>         -- 
>         2.34.0
> 


