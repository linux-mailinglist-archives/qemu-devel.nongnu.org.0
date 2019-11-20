Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38B103624
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 09:43:18 +0100 (CET)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXLa1-0007D0-Pf
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 03:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iXLYV-0006OG-Mx
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:41:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iXLYU-0000qF-Fw
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:41:43 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:35569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iXLYU-0000pg-6N
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:41:42 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWBC8-1iMlqC2YGY-00XgQb; Wed, 20 Nov 2019 09:41:14 +0100
Subject: Re: [PATCH] Add minimal Hexagon target - First in a series of patches
 - linux-user changes + linux-user/hexagon + skeleton of
 target/hexagon -
 Files in target/hexagon/imported are from another project and therefore do
 not conform to qemu coding standards
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <1574121497-2433-1-git-send-email-tsimpson@quicinc.com>
 <a77ce406-5307-cee8-8e0b-7c08056fb0df@redhat.com>
 <BYAPR02MB488666AA94EBB57C2A318004DE4C0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <82dfa44e-0a27-080e-2653-b004c27fc3d1@linaro.org>
 <CAL1e-=gmLywnyUoySxuDPS1FQRx=WiH1kYrqEJDGAAcO5vDg4A@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <27c3a0d3-7f6c-bea6-022d-1ff3e2f6dda5@vivier.eu>
Date: Wed, 20 Nov 2019 09:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gmLywnyUoySxuDPS1FQRx=WiH1kYrqEJDGAAcO5vDg4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H6b1j/60m+sgAjzSbc2UbSDUGhrgrh/YyUe4i1kjoqZfYctwOl9
 gH21MEfVCq50qeJ+FhfMTGhe4pjmUSJTBTeHzVv2NcEM5kov1jrDt+++d88y082MrPIiZET
 nx3KYlpn8dv8qnXEpagGYbSDKxcFXpAFSlEUFx3RmyWATc56DktJ/otQyIbQ7pbe4OJJTRK
 A87l+VO3wvGO1B/Rtb1Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OzDKO9k1Dug=:h8ri74Lmfri+M2zqP5PBr1
 8BPOCM3XZ2UX1yG3jbEnnFg5HdpgNstwNbfmctFEC/3iM9fIhzx+RWnW95bxEw3sy6BfPhBq7
 VIakjLECh+zbCKMwM3tgBDp3mOThB6QobFmuJazF/2wueat7cNpNbE9e4Y03k//imCA6bk5KF
 CFOIuVAqPaBj3uMBHAYxvjx1f/P0SDM8dycof57qIQ+wK4m91s/SFbT8V544qvdYxEETmiSgU
 6GEsxFqItHtgWkYcAu4Am+GgPHurf2fjLLlwBeoDgUDzChSkORZArSozfZNvMvUCCNcdRaMps
 Y+1W1sH5qTsGnMD1Ft7z1t2YgpP7hRGWP8jEgH30x/drXqEUHRtdBci5crShbsnq7SjlVF9za
 EmeYEo/dwbEiFPqbARQ+QvLe70lRPb0/VH5lFCvZYo3B3WMev1y3jjM4+eI8n5gjUJTAZNOkF
 PioZkhyGzkJejM5VqxJYbqCw2TeavAoYHTpNxnGpF475mfIKHM0l1QsiMT6RYhYWG7B2Et4+q
 XhNOxOKLF52if0hBtKiVwO4VTHcBNRI/m7eUT7lTjN+fb9/n4jpP0r0N9OeE/vpVv4bt5MsA6
 VLjNiukEaQOx9MqdHnWWe41iI6uwlmB1jDALynWI5N5nI6YghK/Gm7Dh8zwfLApTGR3TkUfJg
 EZLL58iRyaHrdgefMmVz6l3vkEoo6aX5v7+8eJIsmGindET+pKe+/Sl/2qSSLVyUG+AnsHnpR
 E3sANmcUQwxqlLFZLqEmYobN7Y0alZnpmnlTWHIjIx7SS9r5HHDHeVXOCk/cH1bJxbxTGzKrS
 U/b8nMOEqOuIsfhu4Dx03V7VJjwcTUswbv5N2qqdbyQtG0pkhuet5tofcwghfchI7DuLirPgB
 TwJiCnAadsFq+Txv/NOA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/11/2019 à 03:26, Aleksandar Markovic a écrit :
> 
> 
> On Tuesday, November 19, 2019, Richard Henderson
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 11/19/19 6:22 PM, Taylor Simpson wrote:
>     > - Laurent suggested I split the patch into two parts: linux-user
>     and target/hexagon.  If I do that, which one should contain the
>     changes to common files (e.g., configure)?  Also, note that we won't
>     be able to build until both patches are merged.  Is that OK?
> 
>     The configure parts should be a third, last, patch.
> 
>     The series is bisectable, because before the configure patch,
>     none of the hexagon code is compiled at all.
> 
> 
> I don't think this is a good advice. Yes, at first glance, that would
> make the submitter's job easier - since he could divide the whole code
> into parts practicaly arbitrarily - but the resulting series will be of
> suboptimal quality. If the submitter was forced from the outset to add
> segments of his solution so that each step actually (not only
> ostensibly) compiles, he would also be forced to organize patches in
> much more coherent way, organize his code in much more modular way,
> possibly improve initial organization, additionally making reviews much
> easier.

I totally agree with you but in this case I don't see a simple solution
to be able to compile each part separately.

If there will be problems in the way the code is divided in patches, we
can point out the problem during review.

Thanks,
Laurent


