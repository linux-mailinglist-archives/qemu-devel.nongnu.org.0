Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A93386B7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:07:03 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZApx-0004Ln-9c
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hZAo1-0003ca-TJ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hZAo0-0001XJ-5p
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:05:01 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43207)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hZAnt-0001D9-WE; Fri, 07 Jun 2019 05:04:54 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5PRT-1haYNW1msv-001SnI; Fri, 07 Jun 2019 11:04:47 +0200
To: Peter Maydell <peter.maydell@linaro.org>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
References: <20190606234125.GA4830@localhost.localdomain>
 <CAL1e-=i7WfrHq7k266grEs1xyf_FKVG_4JcvCbrrSZt66c4ftQ@mail.gmail.com>
 <20190607032825.GA5123@localhost.localdomain>
 <CAFEAcA-40HYo3RhTPd-U6_iuYR-0ncn6SSgq2W4k1usfaX_0Tg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0d08b574-d695-f748-c614-78c2b4020442@vivier.eu>
Date: Fri, 7 Jun 2019 11:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-40HYo3RhTPd-U6_iuYR-0ncn6SSgq2W4k1usfaX_0Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wmw0rTqBSZ1yzMSvpNvcnTjKyx6Sr7iwLf6VGx2ewQHtOk9cX/t
 CtMiK4O+A2ISVlcpr4k5kAfsCH6Py9Gb+InVx2yyf7YPBz+9QXJG3BjUsiuAbJDrE0JnpbK
 puHgAIqmd69k7kc69k3PkMkPllEoROzNGjXVnhuU7NIlINRal5mwTom9HCWgjzujdVhzYxp
 leuMUdvCRPWXTKgIsCu0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jj2DdFW1St4=:9iwZ+KdMhZLqbDTS59Vay3
 cBcWdW3fP9q5mZuQdIcqHs3IIGrNap9ZlPXd5dBGThTpscJq5AxJhKZLrlJvA+aXDxmtEupwi
 f6ZQZvDo1YBXtdNnspF1xpBDOMRApCxL/HGYTUvOKkCcPrMmyTAqLYq1h9muziDO/hJ2umSCm
 SAot7zlC1N2HFhaC7hcsMRJCDivKyrpCDlMfWL4LWQvfkhQwwqQftc/MEEq6LjI/pXyhXSgwV
 p+CGbpdg/suFv40t1FqBS0tnHzPBEqTmvTPce2xc9xaV6Z3Tul7AHxySocnd7gdGsUzLfiZgH
 wiohMEGgcEUyhX0Yy3pYXkh3GlnGM2+8HMeh9qJj7tOn6abOHYKaRJm0X4L4Pl/W0c5LCKfWy
 bqudImutI2mtGTReO2kbxHwZ/K3+8zgkbWhO2rNORFjxx+YeuMuvjuwmCpFHYyTmQMl6GlJLV
 sFILIYzvwOV3tRefHo95XJSTGIffnDwPE3+EghWvQ/lG/2ZZ1epjN9aNajYL52sL2O12+heyu
 ktynM6j5VaG8nCdjJ0cbahLIRRmz76YhT45POk8MSHESOLSvTtg7DdwdfT7oa6GuI++ZZD10f
 UgmaoJt5Q1kmT7VASctn8owRvVawr3YpOyTsWPE2YCoN3sVhBjUnRg6drRrlCZdM4bgjZY+Nz
 w6JmzMpKDPHTtC9rYQZoYqOtQ8dkdFjA08iNg0WWr6aIKj0VUKSZbzzYFi7F07BgIe7R7So7D
 0JrIKLmDgwywIQnONJ1F5T/jtaP1hemHpFdHzifKbgp+SovX1eyoWvXatNM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-devel] [PATCH v2] m68k comments break patch submission
 due to being incorrectly formatted
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/06/2019 à 10:34, Peter Maydell a écrit :
> On Fri, 7 Jun 2019 at 04:30, Lucien Murray-Pitts
> <lucienmp.qemu@gmail.com> wrote:
>> checkpatch is correctly identifying the wrong style in the changed code.
>> This changed code contains the original comments with ADDITIONAL edits
>> resulting in pachew/checkpatch complaining.
>>
>> The m68k is, by my guess, older code and nearly all the comments are different
>> from the style guide.  Some are "/**" or "/*commment here...." and so on.
> 
> Yeah. We have a fair bit of old-style code in the codebase. There
> are two different approaches we take to this:
>  (1) the most common is "fix the parts your patch is touching anyway"
> (ie in a new-feature patch you make the minimum fixes to the surrounding
> old code needed to keep checkpatch happy with it)
>  (2) mass fix-up of old style stuff as a separate patch
> 
> Mostly we use (1) but this does have the downside that old style
> can lurk in not-often-touched files for a long time. So if the
> maintainer (in this case Laurent) is happy with a type (2) fix-up
> that's good too. (Personally I used to be much more in favour
> of sticking with approach 1 but my opinion has changed over
> time as I've seen the downsides of it.)

I also prefer (1) because (2) hides real commit modifying the code ((2)
complicates the use of 'git blame') but (1) ends with having mixed style
in one file and it's very ugly. Moreover it complicates life of new
contributors that don't know what to do with the errors from checkpatch
or patchew. So, in the case of m68k, I agree with a massive update of
the comment style.

Thanks,
Laurent

