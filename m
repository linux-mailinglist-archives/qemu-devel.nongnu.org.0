Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC48423249
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 22:44:28 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXrIZ-0008O2-Hw
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 16:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXrG1-0007PC-3N; Tue, 05 Oct 2021 16:41:49 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXrFz-0005iw-DO; Tue, 05 Oct 2021 16:41:48 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjSPq-1nE1ks1KtG-00kwR4; Tue, 05 Oct 2021 22:41:24 +0200
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org> <YVGUX6FZlFBhhgwn@redhat.com>
 <a34e4f8a-36c5-4b87-52b0-f622a78b8d70@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f38b33f2-57ff-da66-9d91-679ab5a821f7@vivier.eu>
Date: Tue, 5 Oct 2021 22:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a34e4f8a-36c5-4b87-52b0-f622a78b8d70@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:noBP2QQ7HaA89+WEJDYwzjswp0ca2R369c2tF8OX7XkC3PFxOuH
 V0iNcwKZS6zvfpP8LY9OZ8ajSem1cLlnTIuOR1B6+543+bUGVkIOhCtji95bMJfMT2Z0hQr
 /KR3z2JK8EUTymeeqt6gScOrSUusR0DUl+U/hnZbXvOSx+TDBud1rTEs0K1VUX8dpwpqJ6o
 BVvlTHIMks9t3zv5SZsEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:upEen/eyM78=:yiajRisN9vvugw2qCBOXjW
 uZIvJ8YI1AEevp33KFQMU4xbINQFdy82jRnc/R8u5RoGgp0VjxzhM+GKkK1FTi1LZXR3ZbWBk
 wP80kMkRHtUhmXluiePRjzHm7Q7hTFKLEvmUOhmtz2h6kLMKLbX18Q9FgYjnWKgsHvJSeLzY9
 HLKaqwh/bgRqwZLOr9k2b5i/yJRiRN0MVmG5zjcpzM+gMdnFpa1XXnGf3gMogXUsXccaK7ndW
 Cf6lLdQzkOJtMVzrlwkeltSVs1lIfhP4pTknUsLEt6Qm6ZD6yXTOkRNIl0PhWw6/XOhDCMlPY
 X1i+Im8HlQTUJPSQBjlXdklrOiecRe8Fr2NcdDG/ie7pkwvZvqCSqnvWxSfr3ai2CEr4LLgU4
 vjp8UV/f8WerKnin92Sb4R4EJA6XukTYzCJMYipZvp8OGIeH2FLXkvEHY9Uv4zjhon2jw/Joj
 fe5Sc92zFU5M5JhI2GMGpM+RoPVxrCeioikxXXJRBCZLVyx4Aji4CJUdoVuGcGp4XTSNLw9Ow
 8lv+N35Vw3dm4ccsfuF54r5OeuA8/yrq2EKTDwL/PaU/FWAINYMgXyA1/ZXj/w8isS1PxZUCj
 DRisDmP7FUjaq1obOx7XbTNFgfnBqToYajH/ePMlUxo62bC4/Q60ZjhtLuq+lX27IiWuQMLzZ
 WQmbu1wzoLlhNeilhV++x6IsBLc3HdeMMBKL0U7FxT4zTomYCKI0qs3zO3pDJ2PN/eEbgDirF
 eFfIsB4bUpDlw3TyoIGMVwQH4t7OvaR4IlAokw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/10/2021 à 21:26, Paolo Bonzini a écrit :
> On 27/09/21 11:52, Daniel P. Berrangé wrote:
>>    bsd_user_ss.add(files('gdbstub.c'))
>>    specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>>
>>
>> So without this change, we're already correctly dropping bsd_user_ss
>> in its entirity, when not on BSD.
>>
>> With this change, we're dropping some, but not all, of bsd_user_ss
>> files - gdbstub.c remains.
>>
>> So this change on its own doesn't make a whole lot of sense.
> 
> Agreed; that said, the gdbstub.c files added by
> 
>   bsd_user_ss.add(files('gdbstub.c'))
>   linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> 
> are unnecessary because there is already
> 
>   specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
> 
> So, with those two instances of gdbstub.c removed, both patches are
> 
>   Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 

I can take them if a v2 is sent updated accordingly...

Thanks,
Laurent


