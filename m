Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37011921D3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 08:43:09 +0100 (CET)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH0gu-0006Tb-F2
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 03:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jH0fV-0005uH-RT
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 03:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jH0fU-0003YI-O9
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 03:41:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40201)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jH0fU-0003Xj-Fv
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 03:41:40 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3UEW-1jGSQv3zD0-000f0u; Wed, 25 Mar 2020 08:41:28 +0100
Subject: Re: [PULL v2 0/5] Linux user for 5.0 patches
From: Laurent Vivier <laurent@vivier.eu>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200324111700.595531-1-laurent@vivier.eu>
 <CAFEAcA9-gYfwNCKLkbbbTx1+xSG6E2ErH0NZ=9JPQwNJvwmVzQ@mail.gmail.com>
 <2c2cc8db-32ed-6a25-266b-9a3476f39805@vivier.eu>
 <CAFEAcA-LjJ0KsSTe9O=0thuFmc48BYXWOHQ2ZREptSdCMO16CA@mail.gmail.com>
 <642bfd04-3f58-e1b0-4dde-7bce4dd6d93f@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <41c25eab-a4d2-fe17-b49f-15e39b69f766@vivier.eu>
Date: Wed, 25 Mar 2020 08:41:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <642bfd04-3f58-e1b0-4dde-7bce4dd6d93f@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LFCXEQYFjw/cdcgwMlkiLPprlwbmpgNX79oQ2+OdQT5OtX2zwjp
 Tvtx0F+5mzsnbdu/yVTVrVzulPAwPgOAnciu9FhzWhW0MUn2WufEZDpvMzc4hF0yfHQhVXm
 n9bONJc+UQIHve/tlB/3AiGeFPrngrGqbWJn12nYCAkFNpSQIMEKmxUOA8mmTs/c/Z69XUi
 i+ahYa6av9TG8Fvo5UymA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MNPXwaQA79E=:n5/qAwvmcqU6c/OZzH3fUe
 jc29AEA0dk6ttOnT67sZGNK1mkYCmhkSQDocfhJSWwdNxcw14RC1N3fraCoi50a0MoPs2vkfL
 nX8jFwl2s+rzVfrc4urfcoiA/jPwOHfPxOqjXQS5OYwAvl1xShTgtvsiSj9DKrAcX1Pjl2whD
 QKBLknQCf8pgxe3Tg2yECYMgMxTIdw/Kvo3nQX1RnVbLJ6GnfgfmNwl6qVWZ6z0WZBxOTp+px
 tl7UtRt2N6QO3xLG7XGaWaLPZ2NfGbXHoOOUhllEE4ELz6LnDIJt7fhttn5ESBoZjbQGRkeNU
 NeUnMSuQo82yCpgqDjda1CR7n1NwplaBqgsakNo2ZvouyJpMlzOQd2iGStYgJewM4KH+o0acd
 B2KOH3iCvrSFUngUK9rwDL5o2+inw8J84MttTjojR0p1FZGpRK3RO0J+QLFHYaKe0VN4mrvFA
 mjHnieecEpDeCAOi6tS/Sqs1rrMBGcHrMI30Ce0o2dbsQepEhtn00xXeK8QTZau3tVar4+bfV
 lkathndiqgiaUIzFID+iDzCQOjK3fUuJoe9FPMZXXg9CNcjT1wtWo5EBxsubJznf+SPxQ+PCZ
 BjsCeGxc8m/7pnONz/ETZbwy3/p1Yx9OOOaUCnxMDFi/mXVmcsPkHJfLK84Gx603v6yq5A7Eu
 BGd0N4pMG8Mzp8D0qPtx/bjtptxoc8LeW0OGQNs8SiAF4eOslVuRd42PFYVLGNDuOMGPATPU2
 52WAuWregBhNp8triOWbFSVPKeYA9Qt/Vc+rQR1mYIRGN0+csmXe92hKZO2Uu1dn4OW8DEBcL
 krbNUE82Q1VHrMU4QWMSHW1zdvkuhnNUfC3aP7BlnhDYjSS0mgkUN/b6UwHG4odCcB4y3cy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2020 à 23:10, Laurent Vivier a écrit :
> Le 24/03/2020 à 14:14, Peter Maydell a écrit :
>> On Tue, 24 Mar 2020 at 12:32, Laurent Vivier <laurent@vivier.eu> wrote:
>>> OK, I think there is an existing problem in the build dependencies.
>>>
>>> Do you use enable all targets ("configure" without parameters)?
>>> Do you run make with "all" or "x86_64-linux-user/all"?
>>
>> This config is
>> '../../configure' '--cc=ccache gcc' '--enable-debug' '--static'
>> '--disable-system' '--disable-gnutls'
>> and it is an incremental build, so just
>>
>> make --output-sync -C build/all-linux-static -j8
>> make --output-sync -C build/all-linux-static check V=1 -j8
>> make --output-sync -C ~/linaro/linux-user-test-0.3/ test
>> make --output-sync -C build/all-linux-static check-tcg
>>
>> (it's step 3 that fails here).
>>
> 
> The problem is introduced by the change I made to be able to bisect
> while we move syscall_nr.h from source dir to build dir (as said by
> Richard):
> 
> 4d6a835dea47 ("linux-user: introduce parameters to generate syscall_nr.h")
> 
> There is also a new problem introduced by:
> 
> 5f29856b852d(" linux-user, configure: improve syscall_nr.h dependencies
> checking")
> 
> that doesn't scan arch variant (it scans ppc64-linux-user but not
> ppc64le-linux-user).
> 
> The best solution I can propose is to simply remove the piece of code
> I've added in configure and let the user to do a "make clean" if the
> build fails because of the move of syscall_nr.h from source dir to build
> dir.

This change fixes both problems:

--- a/configure
+++ b/configure
@@ -1910,9 +1910,11 @@ for arch in alpha hppa m68k xtensa sh4 microblaze
arm ppc s390x sparc sparc64 \
     # remove the file if it has been generated in the source directory
     rm -f "${source_path}/linux-user/${arch}/syscall_nr.h"
     # remove the dependency files
-    test -d ${arch}-linux-user && find ${arch}-linux-user -type f -name
"*.d" \
-         -exec grep -q "${source_path}/linux-user/${arch}/syscall_nr.h"
{} \; \
-         -exec rm {} \;
+    for target in ${arch}*-linux-user ; do
+        test -d "${target}" && find "${target}" -type f -name "*.d" \
+             -exec grep -q
"${source_path}/linux-user/${arch}/syscall_nr.h" {} \; \
+             -print | while read file ; do set -x; rm "${file}"
"${file%.d}.o" ; set +x ; done
+    done
 done

 if test -z "$python"

Thanks,
Laurent

