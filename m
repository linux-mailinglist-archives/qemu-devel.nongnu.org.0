Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77505321DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:14:20 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEmp-0000jh-Gv
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lEEiA-0004Gw-6G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:09:30 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:34249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lEEi5-0003JR-LZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:09:29 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MwQGj-1m5eAn1hPJ-00sP4j; Mon, 22 Feb 2021 18:09:04 +0100
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <3b5b0aa0-6fde-3e71-0e69-6bf127e9c627@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
Message-ID: <995d4f7d-3afc-f0f6-0a86-c1eb0488bfa1@vivier.eu>
Date: Mon, 22 Feb 2021 18:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3b5b0aa0-6fde-3e71-0e69-6bf127e9c627@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NjspMy94Rv2VwF6RYmfF2svZnjbtpE6mh9q52YX8HqjDgMvM4uo
 m4FjB/SFX36dIJHJnZFQ4WGP0jd3kUt/E0JTkXxiIS578tkrN7hGMWSXKRf0yFXR/OOjGe6
 O8M45HwB/i/BZy/NJCnFvOpK/SRg5rWpBB1T10+ZOaBkmQnduF0v6oYkVIboPA3aeRGAaJ9
 OwfVG0IUPQJ0fnkUeMYoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5jMbSnzXo8I=:JuCrDmpnS/sYUdTAw1EaSa
 yqM4OckrjsVNprVKLI5HhfayNko3ajiYihgeSmdVHL8dcI5I7qWwH8o23LdK3vH+yn0xd5O6k
 2609qmRg95AHva4U+yrRVbZSbuiDZBtcI6zqbDA2jM9h9pDuL0vFl4u+nJzqJmeHgqi8CTsq2
 mu2q73S1uyTPAh1QtXIadpqMLdCCmiiAjYpTQIlPJ8A/2DsM+dxxq0qB4tBiRAjWvLW4H4KMM
 BaGizPR+7/NwZjaSkvOI1G8egUUA0zDKXlg+yH/ht+RuMf1n4AB7BDKu+XUIRwtI+8jZKkeZH
 tGxIqWKyZPv/tcZVvDS6TT6zfwtmKMxbJ50HQdmeoa6vT4auPAVFWrlKnXaMaz5fGHYAHfUtZ
 aI0FjJMrFbeFCB6t4IVG//gTKFduva70g/uit05RuRnKJNqrkSwj7rkuvdYRgh6O+vjpdhe2e
 1N2Ja3mugw==
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
Cc: Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/02/2021 à 15:45, Michael Tokarev a écrit :
> 22.02.2021 13:50, Laurent Vivier wrote:
>> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
>> flag.
>>
>> This patch allows to use new flag in AT_FLAGS to detect if
>> preserve-argv0 is configured for this interpreter:
>> argv[0] (the full pathname provided by binfmt-misc) is removed and
>> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
>> 'P'/preserve-arg[0] is set)
> 
> A few days ago I sent an RFC patch which fixes this issue without kernel
> patch, by registering special binary name in binfmt (note: that patch had
> argv[1] & argv[2] swapped by mistake).
> 
> Here it is: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04639.html
>
In this case, we don't want to modify QEMU to manage special case based on the binary name but
instead use a wrapper:

- add a proper parameter to manage the argv0 case
  [like this one https://patchew.org/QEMU/20191024153847.31815-1-laurent@vivier.eu/
   but I think now it would be better to use a new flag rather than using -0 ""]

- write a wrapper and name it "/usr/libexec/qemu-binfmt/foo-binfmt-P"

- the wrapper will call qemu-foo with the new parameter:

something like (with the example patch above):

#include <stdio.h>
#include <unistd.h>
#include <string.h>

static const char *baseargv[] = {
        "-0",
        "",
};

int main(int argc, char **argv, char **envp) {
        char *newargv[argc + sizeof(baseargv) / sizeof(char *) + 1];
        int current = 0;

        newargv[current] = argv[0];
        current++;

        memcpy(&newargv[current], baseargv, sizeof(baseargv));
        current += sizeof(baseargv) / sizeof(char *);

        memcpy(&newargv[current], &argv[1], sizeof(*argv) * (argc - 1));
        current += argc - 1;

        newargv[current] = NULL;

        return execve("/qemu-foo", newargv, envp);
}

Thanks,
Laurent

