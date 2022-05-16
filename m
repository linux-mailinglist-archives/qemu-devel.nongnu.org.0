Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7E5287A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:55:59 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqc8c-0008KJ-0C
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbz3-0004QN-Rh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:06 -0400
Received: from mout.gmx.net ([212.227.15.18]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbwz-00071N-Ke
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712210;
 bh=rfyRxx15a8XvPRy0PPs1x5JaoFCke6hZ0Qc0piPOGh8=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=hpedlNEdRtkpRyiVJtTyVJmhxoLbCwhCmrRdEtSdLBlEnvpp0akSprOS8LyQNOJdA
 A8xZDg9Ft6eUN8zlX7Ei/N5eBHDFPJalEoVNpmGPnFzXtffrR17M+Ae01ZVLbWi04n
 LrEtSRODbqB3MswL5mN1bd2n4MPrNoppkgUTag/o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1o5iuH2GfT-00GL8t; Mon, 16
 May 2022 16:43:30 +0200
Message-ID: <8b2ac5b2-73fb-90dc-6c42-30ceedf43bd7@gmx.de>
Date: Mon, 16 May 2022 16:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/6] hppa: Artist graphics driver fixes for HP-UX
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
References: <20220511235054.185435-1-deller@gmx.de>
 <cc38de01-0f6c-343f-535d-f84ef35aca0b@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <cc38de01-0f6c-343f-535d-f84ef35aca0b@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vgtpBVbzPlwhZZitqtduetzCfIvkDrrdVbvYsPUULr3Jx5OfD0Y
 p0sJSDjgce6yE5/T/Yni48HQkLXIMJP3r2myo6MHG7j2riCw7TDDjncHpShnBMrtmxLnmR8
 ESdvvReJN7YpyFbcgmpsys1sMSmHk/oXp83loIQhizaO/VzM6vKdmvMrO/2AbmCHfRMax4j
 QNCMt6NOFRj7N33UVwjFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xem8cD0lLV0=:d4v9fmy1CmcAA8dLp+ol82
 AsKY0pIVy9MyTiZHQ4nYzhZi/CSRLRQ2k66+S/g2CY5velu+eykpH3scKuNmZwhMoYMiGvvVu
 jBMdR4yyjDYtVS++wxh1MzZwSiMRXYikUcpnhXqoFNiVGDAg/Iqtnw/ImUOOaGwgtwphBUPEs
 jZgtU474vLNfTeF62eagV0t8ZsA3CmkutnUB9d1Xj2u3NU3gWL9ZTFaRtextlkakD7wKtjTtK
 AybwwA9phqvaf2ilt6NFpq/GTHUzDIPPPch9CLM5I27l8K5Cjla8625pBP1XgQmjPPJwA5Kxq
 BEtFmNiq3zcjY94IyH5e4qIPb9jWvoxU66FmKtTuFbBoFkxsq4qs1kXyhUQVCIa7w3DvVDJBw
 mDKQZkiAT/WzvvjpXCqQJLtPz48uuYJdfhzoMIGABvwcaoCpCpB6GSoBuKL4tDj1dmH2qIFYk
 TqVzq98HY4poqiKReiyBERolh1eKIcinL2Xph3OMwyl+/stGPnkwDt1YQyh09sSsXT/z9Es/z
 W3EZIHj2plmXkhKVCbAHOlBhP3r2T/f6P8OXDJltm497W708AsGRir/seXswJNIfQrrtHcNHs
 m1eip/SmAHC3OtiHkPZeQkl2hUC0JS4tWtB28saOxzrmGdBXOQk4fRzW+rsITSJHYk0l/ZySV
 nYwvfFjoGUlK2d5TT1Fo6ul5v57bcsEk0v33rfopGixpiKSRDtbJ3sPFJA3kYLqpsng+JuM9s
 rkDeB/M0+sbjjEgEIL6h2SMt5x5JsEgkJGrdTjyDoVmkQu/kcMjP9b3ziyeu2vOjQGK06cLnS
 HpAFAQxN1MgTgfqvD2yxlhOIkM4FywQBGvxtrc7QF81w5Abdtn7rk1OtrOoqPje7XxPIMFzQV
 c8XzOIcAzespX5p7Z3FOvuP3YiDrFqQS44pAsBmWrx9pyzUGr+/bn3rK7Zw14jNtshVkzVGX6
 s86qx6t4zHJri8pACinHxZnoQTQXoJs4a20VxPAkFLS7rSh33f+310m+AN9QSDa8IJy07lwr9
 b8U8tOCy+2i/yK3VGf7O+z2Lv8bHbJKoKJRHyKMHVu8riN64jsGcE+mheFIFA6lfG7+9DVY1E
 8qD4y+1prog/hc=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 5/16/22 09:19, Mark Cave-Ayland wrote:
> On 12/05/2022 00:50, Helge Deller wrote:
>
>> This series adds additional HP fonts to the SeaBIOS-hppa firmware.
>>
>> And in the qemu artist graphics driver it:
>> - fixes the vertical postioning of the X11 cursor with HP-UX
>> - allows X11 to blank the screen (e.g. screensaver)
>> - allows the X11 driver to turn the X11 cursor on/off
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> Helge Deller (6):
>> =C2=A0=C2=A0 seabios-hppa: Update SeaBIOS-hppa to VERSION 4
>> =C2=A0=C2=A0 artist: Introduce constant for max cursor size
>> =C2=A0=C2=A0 artist: Use human-readable variable names instead of reg_x=
xx
>> =C2=A0=C2=A0 artist: Fix vertical X11 cursor position in HP-UX
>> =C2=A0=C2=A0 artist: Allow to turn cursor on or off
>> =C2=A0=C2=A0 artist: Emulate screen blanking
>>
>> =C2=A0 hw/display/artist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 134 ++=
+++++++++++++++++++++++++++---------
>> =C2=A0 pc-bios/hppa-firmware.img | Bin 701964 -> 715240 bytes
>> =C2=A0 roms/seabios-hppa=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 3 files changed, 106 insertions(+), 30 deletions(-)
>>
>> --
>> 2.35.3
>
> I've applied these patches to latest git and done a quick test with
> my cut-down Linux image and the latest HPPA image at
> https://parisc.wiki.kernel.org/index.php/Qemu, and confirmed I can
> successfully switch fonts without seeing any other graphical issues.
> This isn't a particularly comprehensive test though, since I don't
> have a copy of HP-UX and the latest HPPA image doesn't have X
> installed.

Thanks for testing anyway. I agree, there are not many people who
can test the HP-UX graphics changes...

> From a general QEMU perspective the patches look okay, except for the
> separate patch posted after the original series which fails
> checkpatch due to styling issues around the block comments.

Argh... I just sent out v2 but missed to fix the style issues.
Please ignore v2 - I will send out a v3 soon....

> It is possible to do this directly on a checkout of the git source
> tree with "./scripts/checkpatch.pl master..HEAD", or once you have
> the final PR ready to go then a push to GitLab to confirm it passes
> CI should help locate any potential problems.

Can you give some more info about this GitLab integration?
I'm currently using github for my tree...

> I don't have any knowledge of the internals of the artist framebuffer, b=
ut feel free to add an:
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> when you respin the v2. It's not far off a Tested-by but I don't feel I =
can offer that without being able to test a HP-UX X environment.

Thanks!

Helge

