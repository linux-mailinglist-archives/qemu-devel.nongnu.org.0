Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A21245CB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 12:30:27 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihXX8-0004l2-A5
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 06:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihXVw-0003x3-Of
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 06:29:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihXVv-0004oA-K2
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 06:29:12 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:56837)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ihXVv-0004hb-8w; Wed, 18 Dec 2019 06:29:11 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFsIZ-1iT0Ot3qZD-00HRfP; Wed, 18 Dec 2019 12:29:05 +0100
Subject: Re: [PATCH 2/2] test-keyval: Tighten test of trailing crap after size
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-3-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7a80fed1-ae16-2fda-19d4-8f0dfa13ebb2@vivier.eu>
Date: Wed, 18 Dec 2019 12:29:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125133846.27790-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RA9BnBGjgeXTH5jGi1LL4j2s7QioSgV5DAr0CsaDErEDhKF+aO3
 Xd8C+oGIRs4H4Yi94G5nYlvviZgeyhscht42mqv2dobK5efL+nY9ZOlLHvGOHuRq8yhTRWG
 sTpF2Ffy7Kaj6Pw+u8T2IEAGkv6x3ymURFLj5eH/kAyE46DibxCO/fENvN3tK+TswaJagK1
 490T2uU9uOMKvFGWiysVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+DusY0GoJGA=:M32nRKoAqA2/H20TAgi+OZ
 C5J3wu1xBoHSYDQpsWpwW7ouLpsSE9o7fQaWHlwXjBuCYYSaupofVY1o35eWsIAfdorsGEbkQ
 Hhug7y5UvvlJSmSTDCLBTzaskOWfa6juSOZCFdcP9FhC2HKlARZqfmjgu3oD1KMKE1JDAt1tz
 x3/urhiVeEQFSLoWS1cIpPITau3y1DPNwhp0Dwe47kD3I4s6qycQCwNvVHg1y8Tw9CV2z+w0a
 CrDsExpje3KfZpN2TyOgnlzJPWL8ozTKiSMDh7aWlqiqqiR3hR7jWUSNct3DZU9RXO258ZypF
 1xB/wL5Q1cb0hOTUwkE7elESLPxIYmMoTEDjxrqTbBogWp9uz355iEC/vccKDWT4P5ajpGhQu
 eKR89GqVL/4jYWnVZFVh+Vf1P2fzRvZ3XkSs2/gfuVte7RCwamrTNFozr8clK5mu1geWNWjM5
 rE8tnSKRnc/JoyX2yTssLS7Pfd6IvjMSsXGPUPOIfMPUgkOiq1FsCogKGiNgHAFf5pnzfKQ2N
 0QD79OJfVGlwwg3EdjIrDkaYaniTSoZRMBQ2fvrpnQTDnTn9eElTaVTd/B1qwxYeCs5dH1CU/
 RE3IDsYJeaCx7I+8hjE28KGSScFlkFDjSoHSYcTi/abZd7zFA7VZGQHbldNxtIxDBqvxtOPQJ
 x79C1qtucL1RGzq2tdabPeyLzcOYSpihF5TbdbO07Sd6auz7OdD/6Fd2deJy4Wg4CMppuvWdz
 x0jJg/dYMfKO4slZ6ygsLPJhYBmu9U7ASHl2/K6qOeWu73G/BdlFPTOWPpupInwExwckMi9ZK
 +tEKAHuPYqLI94xZ2tXr3SkF1JewXFc6HUmC8X8lGgVttyAEcR4KxUaoaMQ5fU7i7bM4RuM1K
 XFcr7znG0/AzLCZGFFtHQzan/J80+wcwCAQO7FKmQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: qemu-trivial@nongnu.org, tao3.xu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/11/2019 à 14:38, Markus Armbruster a écrit :
> test_keyval_visit_size() should test for trailing crap after size with
> and without suffix.  It does test the latter: "sz2=16Gi" has size
> "16G" followed by crap "i".  It fails to test the former "sz1=16E" is
> a syntactically valid size that overflows uint64_t.  Replace by
> "sz1=0Z".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/test-keyval.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index 09b0ae3c68..e331a84149 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -478,7 +478,7 @@ static void test_keyval_visit_size(void)
>      visit_free(v);
>  
>      /* Trailing crap */
> -    qdict = keyval_parse("sz1=16E,sz2=16Gi", NULL, &error_abort);
> +    qdict = keyval_parse("sz1=0Z,sz2=16Gi", NULL, &error_abort);
>      v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>      qobject_unref(qdict);
>      visit_start_struct(v, NULL, NULL, 0, &error_abort);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


