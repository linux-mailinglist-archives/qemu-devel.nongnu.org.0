Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95F3F9B2E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 16:56:00 +0200 (CEST)
Received: from localhost ([::1]:42988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdGx-0006hh-NL
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 10:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdDV-0001VN-PK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:52:26 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdDS-0001FB-Su
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:52:25 -0400
Received: by mail-il1-x136.google.com with SMTP id s16so7247308ilo.9
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Lz7Ue4rZgpTgyBOCyRDQvwPs5AK7TtWfLTwGVu1UIcE=;
 b=sYFj0kPmQ5tHmEdkb2PIXc7xDWpPsaTyaEMTF2c2lw2c/YNzz6KaWxkGKgSNoxf5vH
 TBmVYvYEiNOZdPgFHmLKgXOZn4TKvime0mLnOcq7p0owmroxPvvD50K/y8lGP7vJCrZl
 mAArYNxyn3Tr7Bs76y2SxEPH/HCJgSehJrGUNV0vs1ZgyQFeeNYoguNpC8jfcO07YSRd
 YsxPBm8oLbRgCIFDW/W2NrjhyJL4OkZAkkcGsCw48pcvSF/cg761zBfY6Nw48vqgvtut
 pU7PGtn97cRlUkf4eJZI+g662P//2DanksVo1wftAOdz9fjx0vTH86L8ffuSwPzcV1IJ
 TZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Lz7Ue4rZgpTgyBOCyRDQvwPs5AK7TtWfLTwGVu1UIcE=;
 b=LPYA3+AVZdiBwHFSc7SikT+LxMkcuwcMxtaAonI04h8MVCVR8P5hdDpi0DTk44uR8n
 r5xbd0HtKsy8EkDcWjEjLnNQdzCMN6//cqDAZPGJ9SN15nFrmD+Lzsg0ENJmWfoJAGId
 tsTsqqaNEpTWGwVdzOg28S/F316TKWWxaTEFJYQBlqV/SXyWblGfNE3/w2IUpTmlaQ5L
 utu0uM+XLK7L5ZS0fZSSGlo+oGME4EQYL4bZWOvPkKTPFeT/4vGtmGPTm5bJ1efuTkeK
 VssX0hO3FDW+C0tn5oLSgjUj/8pI/BwbdU8DfqFYnX5dy5tPd3glf+P1iVGEX3rXVfUs
 fdqw==
X-Gm-Message-State: AOAM530YRKfb5muMqxlE23g2QvPEgrWyarrXFzSycFmm336yfrBbEmBb
 KjNTmGIYtbZITYXPosCdj2nXbg==
X-Google-Smtp-Source: ABdhPJw1UvQp1/xRZzlFDy/G6JgJiwpBz2byiFphWyRz80J4iE2d4Q3jkQZ1xLe7IL2oitp9H5GT6w==
X-Received: by 2002:a92:194c:: with SMTP id e12mr6437694ilm.199.1630075940794; 
 Fri, 27 Aug 2021 07:52:20 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:e143:d455:15a1:490a?
 ([2603:300b:6:5100:e143:d455:15a1:490a])
 by smtp.gmail.com with ESMTPSA id k21sm3483480ioh.38.2021.08.27.07.52.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 07:52:20 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <9FF11B14-6845-42B9-B0D4-157DE600FBA9@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_D964C189-526D-457F-810F-F0E6D223A6AA";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 42/43] bsd-user: Add '-0 argv0' option to
 bsd-user/main.c
Date: Fri, 27 Aug 2021 08:52:19 -0600
In-Reply-To: <afd0da77-a175-63c7-7ff8-9b4a298e5db1@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-43-imp@bsdimp.com>
 <afd0da77-a175-63c7-7ff8-9b4a298e5db1@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Colin Percival <cperciva@tarsnap.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_D964C189-526D-457F-810F-F0E6D223A6AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:48 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:12 PM, imp@bsdimp.com wrote:
>> From: Colin Percival <cperciva@tarsnap.com>
>>=20
>> Previously it was impossible to emulate a program with a file name
>> different from its argv[0].  With this change, you can run
>>    qemu -0 fakename realname args
>> which runs the program "realname" with an argv of "fakename args".
>>=20
>> Signed-off-by: Colin Percival <cperciva@tarsnap.com>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/main.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>> index b35bcf4d1e..ae25f4c773 100644
>> --- a/bsd-user/main.c
>> +++ b/bsd-user/main.c
>> @@ -268,6 +268,7 @@ int main(int argc, char **argv)
>>     char **target_environ, **wrk;
>>     envlist_t *envlist =3D NULL;
>>     bsd_type =3D HOST_DEFAULT_BSD_TYPE;
>> +    char * argv0 =3D NULL;
>>=20
>>     adjust_ssize();
>>=20
>> @@ -390,6 +391,8 @@ int main(int argc, char **argv)
>>             do_strace =3D 1;
>>         } else if (!strcmp(r, "trace")) {
>>             trace_opt_parse(optarg);
>> +        } else if (!strcmp(r, "0")) {
>> +            argv0 =3D argv[optind++];
>>         } else {
>>             usage();
>>         }
>> @@ -413,6 +416,8 @@ int main(int argc, char **argv)
>>         usage();
>>     }
>>     filename =3D argv[optind];
>> +    if (argv0)
>=20
> Style:
>=20
> {
>=20
>> +        argv[optind] =3D argv0;
>=20
> }

Done in v3.

Warner

>=20
>>=20
>>     if (!trace_init_backends()) {
>>         exit(1);


--Apple-Mail=_D964C189-526D-457F-810F-F0E6D223A6AA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEo/CMACgkQbBzRKH2w
EQDc3Q/+P1a0hSbIJTG4Ijw7EwCWJ5LRBSn3hQFNJa9pSMBhgJG1VjuIwf8j688B
LigoaxlyHlyGA9hxWhZZNAhnJST8wRLdtr0HVdT1GplDhg/jo1sMZSHv4TfMn24p
CtLMydYot0pifZ/odXYPfJT425jIaWpWt6qO17O3HoSwDOUF/EI0fQNNFAQsM2M7
TYw/koIfXoAKsBXF6kpXZDniv4ML1GTzveQ7Wze+qjJSor1CNIknP0DNpcjWc3Ks
db0WelLJkU7siCnY9yMKIqVoo8Po1KtwscBGVhLPX5/DjsnY1aWadpZ7U4TliB47
RNsaPmdx4ZBER+D3qfjsUaYQo19PVIyGY0og8/wDosRmgQjnCM8B5vVIzJsx2o8e
6eFYumoqc2z3GxOSxx+ChnoFMpxlWy73ogqjxQOF1mVICrs1RWaz4I1Uygbg34VQ
7D0mSPDXHIuS7enlL0iTWMUD8af69sVENnwwKykJd5NluE2rPYtUCOKw7XQbiV2k
DzE06jhkFlrcuQIB7NbXZhspwtM9ryLaiX22oeVUtGepr3FOfFFJz992vMhtRYCZ
rfJ2vxA4/SJ3PAHQ8lFqN5Nvx9Z0DUAbOaxfwxDQjxw7V+gcE2n0CKO/0S+jziHj
AaI4xNI8mU9Qa4DTjBGl4mDDkrGW42dCRF56mqSNoxzzWt8CCYQ=
=/y0u
-----END PGP SIGNATURE-----

--Apple-Mail=_D964C189-526D-457F-810F-F0E6D223A6AA--

