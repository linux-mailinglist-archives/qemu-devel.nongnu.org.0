Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411653CA82
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 15:14:35 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx78D-0004ZU-6d
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 09:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nx73y-0002rZ-Sr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:10:03 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:35862
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nx73w-0000gN-82
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:10:02 -0400
Received: from [192.168.178.59] (p57b42628.dip0.t-ipconnect.de [87.180.38.40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 72407DA049F;
 Fri,  3 Jun 2022 15:09:56 +0200 (CEST)
Message-ID: <625aa52e-731c-c80c-791f-12ef8a6c5c3d@weilnetz.de>
Date: Fri, 3 Jun 2022 15:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
 <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
 <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
 <Yozfv2k3dnPy4hEJ@redhat.com>
 <39ab44eb-5115-6af3-37e2-ca79973dad2b@redhat.com>
Subject: Re: Debian MinGW cross compilation (was: Re: [PULL 2/3] qga-win32:
 Add support for NVME but type)
In-Reply-To: <39ab44eb-5115-6af3-37e2-ca79973dad2b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

Am 03.06.22 um 14:56 schrieb Thomas Huth:

> On 24/05/2022 15.38, Daniel P. Berrangé wrote:
>> On Tue, May 24, 2022 at 03:28:37PM +0200, Thomas Huth wrote:
> ...
>>>
>>> Daniel, do you remember whether we supported Debian for MinGW
>>> cross-compilation in the past?
>>
>> At one time we used to have Debian with the 3rd party 'mxe' builds
>> of mingw added. It broke periodically and we deleted it in the
>> end. It wasn't adding value over what Fedora mingw could provide
>> as both more or less tracked the same versions of software in
>> their mingw packages.
>
> I wonder whether anybody still tried to compile with this mxe repo in 
> recent times...?
> Should we adjust our support statement and just mention Fedora there? 
> Otherwise we should maybe explicitly mention MXE there next to 
> "Debian", too, so that people don't get the impression that QEMU can 
> be compiled with a vanilla MinGW installation on Debian?
>
>  Thomas


My QEMU for Windows builds are all done on Debian. They use the cross 
tools which are provided in the normal Debian distribution. I don't use 
the (few) cross libraries from Debian.

Until end of last year, I added library packages from Cygwin (plus a few 
self compiled libraries, for example for braille support). See 
https://qemu.weilnetz.de/debian/.

In 2022 I switched to using the library packages from msys (I still have 
to write some documentation for that).

Stefan



