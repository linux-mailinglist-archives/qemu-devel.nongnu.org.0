Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C474237C5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 08:04:29 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY02V-00031X-Mo
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 02:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mY00y-00027c-Fp; Wed, 06 Oct 2021 02:02:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:35053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mY00w-0003F7-Sa; Wed, 06 Oct 2021 02:02:52 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MG90u-1mZ2jN21oi-00GV3T; Wed, 06 Oct 2021 08:02:25 +0200
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Warner Losh <imp@bsdimp.com>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org> <YVGUX6FZlFBhhgwn@redhat.com>
 <a34e4f8a-36c5-4b87-52b0-f622a78b8d70@redhat.com>
 <f38b33f2-57ff-da66-9d91-679ab5a821f7@vivier.eu>
 <CANCZdfqQMaaKQUP2+Kuq453bs5k6GvP3i1272uqwFhvyZHjf2A@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <55c1bfaf-4b0d-f433-6a72-46330006798b@vivier.eu>
Date: Wed, 6 Oct 2021 08:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfqQMaaKQUP2+Kuq453bs5k6GvP3i1272uqwFhvyZHjf2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U2FgbbyG/Rqhwbk2iaurzU+7YmDVgCyUdF8DvjT/0b/EH1fXuiP
 AaXnkSVuzmrOxlajbIDmCsi9dM7mxwRvHnYphUVDVtpQ1Z/MrfQhKpG6n/0+ooaP8VER5z/
 oniwmIp/ieaY9q4hBvo1rJAIIBoDzzQK7HdQWQ34TGG85jsrYn0jgKyd74zml6mdtcE6Fz8
 lKSdXaO0RRYmb+TNayi4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Swmo7+Qceqo=:Zem9wz1yV6LAO3hEn/244L
 cviRn7Pp3/DWVMrY74+U4OkDLs39peu59TJ+2pZgW7iWOMFQREUOMQKeMLJolgsDFvNskB/bT
 6VRNjYk3uZFCyb2wqmOdcGXWpwWuRCXVfTxG8weg/A1kIlvn0iD+bvlw+NOIcCV0/F4HC/+HI
 kbHQZ/3RY6O6+2pd/mht392NxrhhIBz66EXCXt+jvWOPVduTvXsnD5BKspg7J84IQKTXcGcnR
 uApj1fDOhg/AQVJ8Vb3tAtWmaVqmsEmYhGtu2di4bQWk/pfl09YF47Uuqy2JBBQsk1i9KM3dn
 a4jjVYWNXz3wtC/a+hq/GgJPXwjy6xG6dNm5iC/L9qUB5lH8M+ew704fpEK9xZ8V7qbMGzt77
 sEwIeFnfovLRTtu1rDehfMedlxvauDq5d3/g2uphehX2gnkkbkjYKRrlon2p6OBgEmJOjw/zC
 Ez5i7AfiFybHGIc0TnR2Ek36p22lO7HlFcjAMqXgblRKv438jC38StFnU7ksfmxavGwvV3OQl
 DAUdppn63fJ2DItiGHwU8iUy99jkqkTfoz5+5LQWadhkOdw3Xl5Xxa8sz7heMR+7ukywm9A8L
 iUxZ64ldWzoLINe8ZncdGS90/YoZlDOZrxiPgTfl0L0wE5KvG/1Xx9qkZrc+cztQtTmspos+u
 SVV7tQQf34mvLTO7Ta9v/+ABu7a4MuI8Hxh3EBMLpsgNDZpSB7BML8A/gIi5fUtcC7Zi3S6/Z
 zpS39emMffn/vLUYfBI1sAmAcppBQLF+oD2V2w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/10/2021 à 22:46, Warner Losh a écrit :
> 
> 
> On Tue, Oct 5, 2021 at 2:41 PM Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
> 
>     Le 05/10/2021 à 21:26, Paolo Bonzini a écrit :
>     > On 27/09/21 11:52, Daniel P. Berrangé wrote:
>     >>    bsd_user_ss.add(files('gdbstub.c'))
>     >>    specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>     >>
>     >>
>     >> So without this change, we're already correctly dropping bsd_user_ss
>     >> in its entirity, when not on BSD.
>     >>
>     >> With this change, we're dropping some, but not all, of bsd_user_ss
>     >> files - gdbstub.c remains.
>     >>
>     >> So this change on its own doesn't make a whole lot of sense.
>     >
>     > Agreed; that said, the gdbstub.c files added by
>     >
>     >   bsd_user_ss.add(files('gdbstub.c'))
>     >   linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
>     >
>     > are unnecessary because there is already
>     >
>     >   specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
>     >
>     > So, with those two instances of gdbstub.c removed, both patches are
>     >
>     >   Acked-by: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>     >
> 
>     I can take them if a v2 is sent updated accordingly...
> 
> 
> I'd planned on rolling them into the bsd-user patch set that I'd been working on
> that is almost ready to go in (this is I think the only remaining issue with the patch
> train, though I need to double check threads). I'd planned on doing that tomorrow,
> but would be happy to coordinate with you since one of them does touch linux-user.

You can take both.

Thanks,
Laurent


