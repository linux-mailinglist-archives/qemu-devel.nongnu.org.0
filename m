Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A043B420986
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:52:26 +0200 (CEST)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXLa3-0008C0-Fp
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXLXt-0007ER-BN
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:50:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXLXr-0007hC-Ic
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:50:09 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5W0q-1mqOrm204I-016wNt; Mon, 04 Oct 2021 12:50:04 +0200
Subject: Re: [PATCH 06/12] macfb: implement mode sense to allow display type
 to be detected
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-7-mark.cave-ayland@ilande.co.uk>
 <c92f20ba-14af-f5de-75a0-aba0c48eb6ed@vivier.eu>
 <22e95f4f-83e0-d165-4649-9cd2de6e8f9@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <65691d54-e705-93aa-1d13-764bcf5fb9f6@vivier.eu>
Date: Mon, 4 Oct 2021 12:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22e95f4f-83e0-d165-4649-9cd2de6e8f9@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9A2inTPf0jGCBnHeaH5HxpBd7hp9auQztpGuTs8+adYAoImDcct
 +NZOe9baSPLB3h0gFJgbB2rcmSDSxahS5avv5Ntu/MM1FcEkz7NSLszGFceQSyf8pJ6ICiy
 s5MPmbuagrZR3JbkaJR+iyaXo1YOD5Je5j2tWiDzqaqpbT9fWKWQEvvH7/HtQDEnp4wKflt
 D2SdKeSCTt9FsbvT9KzFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MeV+44HGmLQ=:WLf2QZdXrnNnS0H/pN+kBi
 h8rMJogK7NL53gDNvS4nREE1Susey3FA0OMj4LOSQzGdSz9NCWyAqp6xS+z2z/UwEm8YLFStc
 5hnzYBWn5xUHZrjIXQPXeJPvJD+2P80y8kIADAEt/7UhLsyH4KZ3K8YIGAplijgYrlKLLCDdv
 2P99ENcGqMIoRn1Gdv8zV6kq3NDdFv8sweXFqjCJq7VXQBy5lCiBLHxGoULzG1bj9pvzBPuZ4
 yLaJxzxpMgR5Byw+FzG3PDb7pIM3BbSWU3aabfU6Qn0rBlmELaUH8ezJAZ4SGuUZDVBupwNy/
 R6gKkj3MYG5tiQbbmy92aPrlUHefumzjkOHkGbvyR4vuBSi0JRIZMQFltHCqQhyMxvQ2CH3pQ
 QMEm0jmvSo13Pxm0yVAPrTWxd9lKhjPSbnxTH8G+5H+U9ezjaecffxc3auH31qaqI09PkoPxg
 9CjCykM2ayA/nmT7hh09HglSr/xcG0FY30PLe6IREiYMmpeMdgKkGU747TRt6qD5TSkHATNW/
 SidKY+6BrZbpshCzUzcEx9XvoXuKYPq6ecxuV4fYl5FxBqq+5huCUmEsFQyXJKjGq80T17pdM
 Ldz9u460KuxgaDxH5bC3apHKJTe+PbBhXu/St/Zs0dnwERLMu2nnpeUzfBkSd2O0Nh5onjpvs
 3/p1lN9jIhJGD5d4k9gkz/Sti05y05CDzsa6DnH4XjPd2fMpNsjLK5HObtrvRlLyzqJEJX9ZM
 4gHiYCw/Ut1bajLcTmQYa41jGIm+Ka355ZKWag==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2021 à 12:32, BALATON Zoltan a écrit :
> On Mon, 4 Oct 2021, Laurent Vivier wrote:
>> Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
>>> The MacOS toolbox ROM uses the monitor sense to detect the display type and then
>>> offer a fixed set of resolutions and colour depths accordingly. Implement the
>>> monitor sense using information found in Apple Technical Note HW26: "Macintosh
>>> Quadra Built-In Video" along with some local experiments.
>>>
>>> Since the default configuration is 640 x 480 with 8-bit colour then hardcode
>>> the sense register to return MACFB_DISPLAY_VGA for now.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>  hw/display/macfb.c         | 117 ++++++++++++++++++++++++++++++++++++-
>>>  hw/display/trace-events    |   2 +
>>>  include/hw/display/macfb.h |  20 +++++++
>>>  3 files changed, 137 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>> index 62c2727a5b..5c95aa4a11 100644
>>> --- a/hw/display/macfb.c
>>> +++ b/hw/display/macfb.c
>>> @@ -28,8 +28,66 @@
>>>  #define MACFB_PAGE_SIZE 4096
>>>  #define MACFB_VRAM_SIZE (4 * MiB)
>>>
>>> -#define DAFB_RESET      0x200
>>> -#define DAFB_LUT        0x213
>>> +#define DAFB_MODE_SENSE     0x1c
>>> +#define DAFB_RESET          0x200
>>> +#define DAFB_LUT            0x213
>>> +
>>> +
>>> +/*
>>> + * Quadra sense codes taken from Apple Technical Note HW26:
>>> + * "Macintosh Quadra Built-In Video". The sense codes and
>>
>> https://developer.apple.com/library/archive/technotes/hw/hw_26.html
> 
> URLs may change or go away so I think it's better to reference by title in comments, then one can
> find it by that whereas a stale URL is not much help a few years from now.

This URL is very stable (hosted by Apple for 30 years now...) and providing it could help to find a
copy of the document in an internet archive. I had some difficulties to find it using the title or
the TN number.

Thanks,
Laurent



