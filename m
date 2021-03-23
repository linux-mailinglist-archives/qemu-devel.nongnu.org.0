Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E93465BF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:56:21 +0100 (CET)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkKK-0000uT-CV
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lOjPe-0002wA-7V
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:57:46 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:57330
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lOjPb-0006iG-Ot
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:57:45 -0400
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 36DA9DA0226;
 Tue, 23 Mar 2021 16:57:40 +0100 (CET)
Subject: Re: [RFC PATCH 03/13] blobs: Only install qemu-nsis.bmp on Windows
 host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-4-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <e1224a19-9aaa-6ed8-8fa8-e168c654566c@weilnetz.de>
Date: Tue, 23 Mar 2021 16:57:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-4-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lqdBmkZW8mPjzzaZXItAz9qkZGdutj1pD"
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lqdBmkZW8mPjzzaZXItAz9qkZGdutj1pD
Content-Type: multipart/mixed; boundary="RAQT3Vm2jW8qNlIhegnmBqjkwBycruvj8";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e1224a19-9aaa-6ed8-8fa8-e168c654566c@weilnetz.de>
Subject: Re: [RFC PATCH 03/13] blobs: Only install qemu-nsis.bmp on Windows
 host
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-4-f4bug@amsat.org>
In-Reply-To: <20210323155132.238193-4-f4bug@amsat.org>

--RAQT3Vm2jW8qNlIhegnmBqjkwBycruvj8
Content-Type: multipart/mixed;
 boundary="------------E4A6F4DCE458EA0A96EAE9D2"

This is a multi-part message in MIME format.
--------------E4A6F4DCE458EA0A96EAE9D2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 23.03.21 um 16:51 schrieb Philippe Mathieu-Daud=C3=A9:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Stefan Weil <sw@weilnetz.de>
> ---
>   pc-bios/meson.build | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index d270d8516c9..007cf9d2afb 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -60,7 +60,6 @@
>     'efi-virtio.rom',
>     'efi-e1000e.rom',
>     'efi-vmxnet3.rom',
> -  'qemu-nsis.bmp',
>     'bamboo.dtb',
>     'canyonlands.dtb',
>     'petalogix-s3adsp1800.dtb',
> @@ -86,6 +85,12 @@
>     'npcm7xx_bootrom.bin',
>   ))
>  =20
> +if host_machine.system() =3D=3D 'windows'
> +  blobs_ss.add(files(
> +    'qemu-nsis.bmp',
> +  ))
> +endif
> +
>   blobs_ss =3D blobs_ss.apply(config_host, strict: false)
>  =20
>   if get_option('install_blobs')


Thanks!

Reviewed-by: Stefan Weil <sw@weilnetz.de>



--------------E4A6F4DCE458EA0A96EAE9D2
Content-Type: application/pgp-keys;
 name="OpenPGP_0xE08C21D5677450AD.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xE08C21D5677450AD.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFXCNBcBEACUbHx9FWsS1ATrhLGAS+Nc6bFQHPR3CpUQ4v++RiMg25bF6Ov1RsYEcovI0=
DXG
h6Ma+l6dRlvUXV8tMvNwqghDUr5KY7LN6tgcFKjBbXdv9VlKiWiMLKBrARcFKxx1sfLp1P8Ri=
aUd
Ksgy2Hq4T1PPy9ENTL1/FBG6P/Rw0rO9zOB+yNHcRJ5diDnERbi3x7qoaPUra2IglmQk/uxXK=
C0a
NIhpNLNiQ+YpwTUN9q3eG6B9/3CG8RGtFzH9vDPlLvtUX+01a2gCifTi3iH38EEK8ACXIRs2d=
szl
xMneKTvflXfvyCM1O+59wGcICQxltxLLhHSCJjOQyWdR2JUtn//XjVWMmf6bBT7Imx3DhhfFR=
lA+
/Lw9Zah66DJrZgiV0LqoN/2f031TzD3FCBiGQEMC072MvSQ1DdJNOiRE1iWO0teLOxaFSbvJS=
9ij
8CFSQQTnSVZs0YXGBal+1kMeaKo9sO4tkaAR2190IlMNanigCTJfeFqxzZkoki378grSHdGUT=
GKf
wNPflTOA6Pw6xuUcxW55LB3lBsPqb0289P8o9dTR7582e6XTkpzqe/z/fYmfI9YXIjGY8WBMR=
bsu
QA30JLq1/n/zwxAOr2P9y4nqTMMgFOtQS8w4G46KUMY/5IspZp2VnPwvazUo2zpYiUSLo1hFH=
x2j
rePYNu2KLROXpwARAQABzRxTdGVmYW4gV2VpbCA8c3dAd2VpbG5ldHouZGU+wsF6BBMBCAAkA=
hsD
BQsJCAcDBRUKCQgLBRYCAwEAAh4BAheABQJV04LlAhkBAAoJEOCMIdVndFCtP5QP/1U8yWZzH=
eHu
fRFxtMsK1PERiLuKyGRH2oE5NWVc5QQHZZ2ypXu53o2ZbZxmdy8+4lXiPWWwYVqto3V7bPaMT=
vQh
IT0I3c3ZEZsvwyEEE6QdRs52haZwX+TzNMQ5mOePdM2m4WqO0oU7YHU2WFf54MBmAGtj3FAQE=
AlZ
AaMiJs2aApw/4t35ICL1Sb0FY8d8lKBbIFOAaFfrlQTC3y8eMTk1QxOVtdXpRrOl6OE0alWn9=
7NR
qeZlBm0P+BEvdgTPQt+9rxbe4ulgKME2LkbDhLqf0m2+xMXb7T4LiHbQYnnWKGZyogpFaw3Pu=
RVd
9m8uxx1F8b4UjNzI9x2Ez5LDv8NHpSY0LGwvVmkgELYbcbyiftbuw81gJuM7k4IW5GR85kTH6=
y/S
q6JNaI4p909IK8X4eeoCkAqEVmDOo1D5DytgxIV/PErrin82OIDXLENzOWfPPtUTO+H7qUe80=
NS2
HLPGIveYSjuYKBB6n2JhPkUD7xxMEdh5Ukqi1WIBSV4Tuk3/ubHajP5bqg4QP3Wo1AyICX09A=
1QQ
DajtMkyxXhYxr826EGcRD2WUUprGNYwaks4YiPuvOAJxSYprKWT6UDHzE3S8u4uZZm9H8cygF=
a3p
ysJwTmbmrBAP1lMolwXHky60dPnKPmFyArGC0utAH7QELXzBybnE/vSNttNT1D+HwmsEEBECA=
CsF
AlXHk6gFgwHihQAeGmh0dHA6Ly93d3cuY2FjZXJ0Lm9yZy9jcHMucGhwAAoJENK7DQFl0P1Y4=
kwA
mQGs8dw4sroNe2kmEZYgWca+CmViAJ9FuiK/BRAS5WRLA3YdgH/nqR8uhsLBXAQQAQIABgUCV=
dL5
YAAKCRC6nHgGHd2Mm+PaD/9zFLQ/UOmv1A5mmna9RVohv9XJ3fjdBved7XOIpZnFSyJ/dNTAQ=
3X4
61glowWmKDMrJfmGZt1+cmYCSRjuybPqFPjgItTRBuC08w+2b8gy6CbdaWWYFBDaMBBRLcgmI=
YU/
pm2npGklcWaCCp0JgtzOljp4yLLcrFY1bsslCNK2JCutdYc5zhvaT79RnwmY9jvU8PXarOOLz=
3Ee
qEBOQh/jnKYXgsVBQ8dR5d8NZUyV94T4CiaxiLiCf6LPlfzYgyY6RTZzqEVX6sOLOYVrvrXU3=
iK/
K7NlV5qoPPLZ7igR57uaBs0dFH6q8mpf9p31TKHtaXJL9f/RJ89a7OBSC89T+mrU0ih9TQd+c=
lcU
joZjP2hjYR+JQviAmjRKpDbBiYqxAP8bwMroc4PKwocvPvG4GCAar36BF/LQxbrbt05N9//sF=
Dvv
FAhXx3knd9yfHw6aSdJrex4YDKz/taoo0EcCjLKkigYGJNGpYL6X1WcuZYtY9TYTOArgQoZXi=
B0a
GZM3LQaKyU8yO+F2DkVs6IXPL1Ef2nHorzkb7NGvh7YN3tAhm6PDxzCq49p2MVtXi9JC6DjlE=
0XS
p6aYY9kGgmOvT0oJ2I16VMagpf/cYISHXve6igWXxy99XFWG/JICzhl5n20pzN7svXoKEMRAO=
4jh
ijSqPrxvd9J90kl18AmzMMLBXAQQAQgABgUCVdkH1QAKCRCtKQPr+2fvbKuWEACVpQlqabad7=
PFQ
ffcNiNDEtNlKCm+Zvg4tgJcnrSejd7Q/5BBw2mGYBGQUvANFMhswSllqMhGSqvBvqo3zE9kQ/=
i3O
xnBoBPHveCymRwdlClbsNlGnsNaaX+mf8jhC1+lJErvYK2VznATfAyBYpxdFMAuWPpXWFfdu5=
h3c
g9mAV9oPFFjN4yjQJCaP6ZvQv5CkRXcmtsWmkEx8w6HJHzKf9iuGZjGrQUWBr6NiI+P6FTSN0=
DBp
7oQI1uisALgbnrDfV2/WfR9wIWsHc7Rr1ktIl6KPYHgpFZe9p8aIxbFdE/SJRgqG6ixAa36vI=
AEV
tSnfwVquxkL1yrdUtgVMlZ9mIta63CHIQNpx7YvGkhRwg9ORp5A2mE1UHbasK4oZy98ukcG67=
8GL
pGC1+ox+lvaznAq624Tl6BvjkHEfIl9l/6ZK+ywiPWozuiZNAI711H2kqnT9pYq3n1wXBPGgz=
HxS
lIfVAOU8PvdA4z2IsFPEbX5T/1yPDi3YBDJdQSvWTWYKoE0680LErMJO+TfpdxtQO+/GioVCd=
7rd
WifG7JvcH9FUbaRgn4OdHoFJsaNPkELKNbrrTmcjMX8KPaK65E2/ptz2A8bbKsMCaUBPE4f6V=
f4x
J8vALfFd0ZyYUKQKJMqJ4fwIekqtkQH22sN0/GwdIIR1TLaK3n5vauJnfsHQeMLBXAQQAQoAB=
gUC
VdoyMwAKCRDGh181Qc794CpVD/9Nh0rYTNledHzRzUTBre7Yuvp1NJ9Ss2/OenliVPNk4Jbuq=
LAL
zNm1uPQMdIT3o9XrUykDlNTZ8Dg4LXZXmtpj4VU02+8R5gebq7A9G05OBWV1qBMboK+Qv68Gg=
7vw
GG2gn9Y+vj7qCZ2ALWue4W9Tb6AUIZSocBk+mk+Ba/Wj3Ki1PxmxthHmtPhuOsGhD7zyn6EvA=
YDN
I5qRIPDEfBg2W1RRx+2ezrNAgN23kvGMO4bVGSfD0j2oNEL1sNkpzeeyR3H5lXNNTkUTqpqUb=
tdu
SDK/T8YVEXvquGJq0xuIugCQdh7MO1vdYDx8u7d+Kb7kyupiD07cbD7P+Ejxqw9ymMaYvhFov=
8pm
k/vraxYH7Hi6Zr4T3dwazvElCiw9pWMWJFj66fhVzTNbr9M/ZO8itPsjSvYpnT3A4jb7nr8Pz=
SuY
eiP1sCyPTPa9mvRF57QqF4n1kpsHr/NTLkNc0vlgD+xpL6+qSYXKWEHFD0baXdiU21TynHbER=
p0J
WNN28tbzli+ppyFzO3kvTZK2fmaCDcHDsDf7QGviWfqtY5Y8cYnoZ1mz1SOeTrmSsiA/uxY83=
CY1
9suTtlqhIM33DIdaUw51cCMBp0XvMSCN2MUM2sDfh38aKF4h6u2rn395Np0fBT4ljRQ0tlE9V=
dTl
x/IvrfI7+Hinxny91htif6zlEcLBXAQQAQIABgUCVdrQPwAKCRC0SJDe3jybwKUZD/4v0LLhE=
e5w
ckhj9AIuzmqBQCl+5kmgrm9xTHXglL0tPSiecApc4XR6OoOO6urIY2nJ7UMCB1gcGMJTUgfr4=
52n
cKukCCoAKUg6aKwA1K6v/+ZjV3jv+GrUXpDzxgF04aS/PW2Grrm96Aw2xs6sKo43G9VK8nzza=
olo
YMpjwQdrXe3Oaxe6wBYnT2ud+fHgoddJb0QcS2a9eToQQh7dtjmVRAzR56zBUCUMrzRTaJJab=
OdI
lYWNzr0PUOvuA+5ywifLLf6ewXrjiS+Y2MYB5rOauo0HRCtE8xWHjFWpGhpwz8P6b0kAYVZOp=
GEI
m/tK9zmOzni/v4JimuLLkqexCAuSnXAZuzGw2KcCNzVJHx23yvJ6qK97CZ0SkDTy7K6Mj/DOv=
kdd
UXvcfsm0Btwpdk8ZgbuHur7osoB5+WoNCmjOUVNNDE65wMEhTl4nwDr22nOWLGXHXPsX8ufHb=
R2a
83PYqowuyTvJFrTz/q4yHgMMttCO+40By509b80q3/6q0ACJk3n2waKu1MCMQLVWc4G2GZXFU=
C4U
99hofreRZr58y6eAM/kgKBtJ2MEA049gOCltarElS/dA6DFO8jjenlQJ5QHzrN5pk+0cPnr9J=
CMQ
JG5PqL5dUvf08EX639EiY2Ss+ip1wM9GHONezd8ybU/e9VB0iXexk/9scfwjTNlNAMLBXAQSA=
QgA
BgUCVdxy4AAKCRDSZcCFMe2K72PXD/9rANPfeKhTv4z61jEKhOHULbQuHx77ABf0ifDSNUpoE=
Czv
Q3AviHgtUUshFH5izMcd8TWH9oKL5hSXfqtsmBn1B1O8s/bBVpVwA06wzv+kHXHP+ZZ6iaVoV=
H2e
zAg+o7JReNYM5e+pzLr7+iTqsvOnWHyz1YpHT8MBw5uxU5LMLYyMfswWnKYEXn+j+p6lfw7Y6=
p2A
hQxvCd+Vt1Uiu9Ihrg6ytZpAEF46GM75cyZ4TO/Qdf1nTVF1qM6Jj2dGcBGmOdX5HlKretLuc=
Emq
8pIOaZHamW0zL1jLlEYX+N4nEhFfQr/7vtFCQRWBOxKV+HjPAjwtfECZHJo0GSp23idrUCyWG=
pAA
Vx1bJ0/kZIxmC6QHqta9/BzlUfw7P6WL+blc3ssrDbKpT/6KfxP0vXiFkUt0wE37fklvysGSf=
mL1
eyUtbNsZwPJtVHgehKyrTegk4btkBnCxpXxVt8l0DnsFRK8ORvlcdM6smLNSpXTGfP9CrvQV6=
FYi
Z4PgrvdUzEARHVMnGzO8sVyL95mqkiXj6PW6lOe5B6+nayoQZVr0QwNAyjD0x4uBTErEOaR22=
Pi5
y0IUJn5ldhAgqcnS3K4wSSUcNaK7C3FDaxHlGb/m7MJHtN0R4GphQD2z4DHsJE3/0swoQHI+M=
/hK
BTOg08gUshBKdzNKu2hZZaL2dZHcWMLBXAQQAQgABgUCVeWiCwAKCRAr+Nn+B0vN5L2AEACNf=
vcc
vF2PdWFy3+ohyiQcMLm9YV48e9mZjycTIpM2Es5L/PtjOSMrnBSyVHKTwWNx5YoYsoMsTCBZd=
9sr
HExsg2Jmf9qSYcAan0OVlViHp4WwFkZBv1qIOWXZp1GLoULJ4nTiIQa/kce0G2WV+Wz2IsRgg=
+pE
qbyDT410mvmjcKJwOwnvztXoLPxotqkUe5fkb+VdXMV3IKWcx89oRBCO7ofihJoJ69IK35mVp=
dYv
8dK9Tl9SN9n8Q8B9IVQez5RY7i4lL9cfCGHrlPoeiTvl5uXchzCXp0rgWs3+QRBvO/Xtfz6jv=
ZSJ
vHnGUKbxCZYY6V1siyTkWQpVzcgfqxAT3NVn8wlSP9n1Ei2O8yvMVvr4IYaOy4mceCFA8fzG6=
j6k
iWegTQ/5gj4vgXhXz7GxOxGXBHQM0j2MHLiAg4SP3XBfxzd18iIg4jsk5KxU0yub1RT/I90mo=
s2g
Xld1w4iiY0i11yyWYnXJyeQ3tQTll1JgTsIdrXcnv/0eucCIAnlgmxcHsPb1ZSiW+r8n0mkNH=
L56
t936DqDPgpeiV4l5sfUr5Ken9U55fHjia1Z48JRESUsetozsabJu/gZXoNnRfred+8BRvUI+X=
jaW
Y0RuA6S+dunqP7fdZ6pIswPi+9fE2DD/gEp7dHDsZHU56aG7SrkN0s3kdZ+9db7YAsoqD8LBd=
wQT
AQgAIQUCVcI0FwIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRDgjCHVZ3RQrdeWD/9fT=
wbW
VkGE3fMZczajfyrEhIYgUnFljxoRORyw0Jp6uvqmASMvWwzPN9/eGT8bzW+XCbOy34H60SSo9=
/Oj
gfGwDfawfXWxsTJYqwaSVSASY/9jpH4A5PtfYzS61GhgvallSXi3+2f5Q12Jj9Bps8yGTc76G=
5OV
09Rb/dROBypQWjKEvRYrm8TSkssM4iPvp9qjeZtXXiNfJUu4kp1CGk0ryr78lPY6hsoIVuqXv=
GlZ
rY0NY2Br9UZsTifC5C5fenMv2ioT8BCSikeH9+Fcyr8Hj3DYnFaLMvT73bwr7JP6II7M2/bTf=
xw9
A7MveJLmMhN0JIoQBdg7/zctHS+f5/ntuZyqJLHFB34C1cASy06f/o8yC+mkQ6tMnqu4Jypiu=
Dme
kkJHSKwhC1vBoTAXv9RARoHt9D3FtQvAeVrxRovEdcWhcI5u61sGz7yHkh3YYlYoGrZeiewxA=
j7N
lOeUSUNMtSEpdD1qR3nMlqn9hMFsfj9aiBuxKgcbChiCOhdDGGkhDMER3BvGLmtZfphYGZ8Ch=
zjI
+L5gxVHspBh1DbtXJEBjHS+OgPNj/q/0155UD992/g/t/t276h+jcP2m4csjbVf48fxIFL5Zh=
b1R
jR1e8ZPwJIoMCbA8PDq+nue5qIfVIqvUynNqmPKmXh6wGKv91kLF+tSUn9Kw9Y3GLlTO0s0lU=
3Rl
ZmFuIFdlaWwgPHN0ZWZhbi53ZWlsQHdlaWxuZXR6LmRlPsLBdwQTAQgAIQUCVdOCwQIbAwULC=
QgH
AwUVCgkICwUWAgMBAAIeAQIXgAAKCRDgjCHVZ3RQrfrwD/440Fk2ZUFCB11viO49tpfy2wBWi=
TPN
j2aO0Zo0ys8yrOTlBv+1z4bHhvz3q/LuqLVFgkxLXf6SMmauOdctM8x7fjL7634/fbsppHy8O=
cKl
gdiTP2wcHSWZbBSLkcNmmKcABqXgKlWbrUgpva9RpqcQ0OL49LRSmQE2bPYY3DCgasmT9uq7a=
37v
NQDl5uA598ges74/nYlS8I6u4aNjsZZKt/JGAuKYekWlb7g1oMwPPnuAVEn/VR5l8+S1wl4E6=
sKz
bLhor/g51EX6RjOgJMEEkDv4sTX6zFX0GogqMrABgeIGbVgAHW5IPinN0HAbUcsaAIS1hGMLu=
G/z
nyxNE0C5+mmNOpHAK+wrgup1qHvlhUxxChul4WLkunpvfj2qELTVPh0b/EHgbOGj2Si/jbzSP=
/jU
cOAeqQ+W+N3I24hAGRlcHCURKyigue0bnqwgtVKLT1hp/L3C+i3ykwGfRYekAnIjrVMaPbfZn=
X1O
Fotc5f3/Fc7aKgQcfC/I1sZI0ZN22VTPhyl7Zv8/kwxnlqSTVM8kYiB1/wDJhxNQaQXU0/5qQ=
KRn
q8KzmA2kwL3N77WJNvQbnsIoud+NK0K1C21giJaUMCApsIQRkB2ujeO1TL4ODjOCFg4tx/qTI=
c3M
x7ALjZjtP1EPJ8yGB75islokTSMucfC/2OteekMXLt4IGcLBXAQQAQgABgUCVdkH1QAKCRCtK=
QPr
+2fvbNLJD/9c73cz8WuJEuX8+39nVpfg4rmmb2frhKh9qjY7KvINk6VMYFIAKneFzUItqBwjv=
aOO
sOichKBviaQ6CdIZlMYDc73p44rcvYYeDbxuAoBqg/ILoJ2kpJ0UX2o/3/QsnJw5ee2eRUcVg=
mwt
JvPe6O0hHekLwckSJUdoZVwjk4xAsZLKOeB4TQC70spJbJoQE8NxLFszmeGf03ATnYUsuZGrr=
KSP
+Ja222YN0pzgaFhpKpN0wW5RWzChOGAHOUgaY/cF/KTW6Al2eNgWvYbvhq7yOOATyayuIT4tS=
cIU
ZW6FJ2Q3Saqvo0o5oJT1A8kBxhZQ6VmwlkKrcXgwpJ+KM2hNUTCs/k5CbrcDHpnZTIop2Yo18=
N4e
C4NJlxWPqQLPFT7AHhVY08YKFVeA169VG9W3COcHoFtVp5r1ALAer5AyYpOpD3DBGynw+veKx=
H4K
laPEC+eg4qSyeCDySOaBdZUND4ICyhgQ0/3JewR6ZrF6LCqv7CkJbzkgPER4toTrutKvCPMmM=
y1Y
x+lVkXR7rY1ZphjrHAYDLMvyHIqA6SKL72RLrUqoVumG/v3sgmYBWeTri58xlyHZkOos6xsg8=
m4K
oRLT3liaNTae3z0TjqKlHc5cgUhP0wCqAi8pXvRTY5ASHBWeATmec6QCWhRQ75DlJBtFnJZ1n=
19W
3L6O5ea8OsLBXAQQAQoABgUCVdoyMwAKCRDGh181Qc794CPoD/wLhXkliK4OtH/LnmokSgUZE=
j3B
ypQIaOvmRet19zAoIK11BisbDmlCscS/7vf9dV6KFqBh5zTreKTa6pACwgq2se+FX1xCVZVvn=
Vos
YbkRC4Wy9XpkwqsItAziU9r1CslelhM55qugl9pEOpjrLweJLlRSc9SZzWZ8kfFPvZBD6aGOt=
pt+
mlFLv+2gIh2NweKXiLh8JRvpwSr51koTBQr++a1z7JYJsTccKw2HHBxCFoXFPadkNit+Bsuwl=
WRU
BHImc2lNKyO1s7gNyOOFcG3i41WTBpCapboQmhWTFuz/5y7JoZXYbAhU7H4ObXbhsVBt6mTRm=
hlI
LRDLoRGMt3rHBzrdv5NQbOXfqUjhGEpM7L67S8gqIcY0E/nwKD3THyQ2ZsyCUdpaAM096IE1V=
nmT
lo6HzI4YYZvKEUMc4RssxLOS0pTNP5hcXXq9zVKkNLKNR9T7Z/2k/qUuwIWPi8RgRzFMcCg6F=
W9G
L1UpBVpxKZ2cIFfiWmNkHgVYl2fy8RaBTJUCA4yiZ3R30EFBGUeWqqth1EXThivxWFxU7I+W0=
+kr
zbVjE+4t04Kk6H3pzL3qzAqwV/+QRwpns4RVbzwyCVOJ5/qxfD7g76FMn8Ib6qMxwbX4zd6C1=
9Hd
6rJS71iyMK4fzXGxhHZAmGc2xA1MoZH5jCP+Ew2smCaGm1rzmcLBXAQQAQIABgUCVdrQPwAKC=
RC0
SJDe3jybwAKrEACBtGh2a7l5HiaOK6hSyZ6DZCrvO1zoos+uAdYFNG5pG6Ca1UjZynMz9j5OR=
l1r
12VPB0HVhGOq4AdZdvAX9uDgzpklyPpZ6c7J/Yz/TLpYShrM9xVyPMi5F0FSmhdp6L7PC6486=
FF7
AN9klIt4BGCeJSNzWLFjdJR1US7UkGChJyesaGqfO9XkztBnC0Y/bKnOf1wgBWcMU3TjRwHyL=
iE1
NaZiXqT08iIiF0luWFJ6qTVqM/0b/erFl02dzJ5EVM15pbiz7LflBqhDUAvsbSaybbyZueoQE=
5zn
mt+/cTOHez8GZxuxELOlszexD+0KyDuKg1euk9HnXoRLUQCA9m0P6h4COD2jSQzYn9M7tX/LM=
uCx
qOPHamrRNHKOnetyNeNeUwMo9gbtAUR1K5E0RnT5WUpHky2ez24SBkStr/opYnvx5ln21KPl0=
HRj
I+JbF+wFKvVxMo1Znl8jzWA47gmJOKt7oBPLTDQ8LnGY4YSRAzyfjTZU+hQ9jxf4nQVtjxfRP=
i28
idBDSflXQJgBG0N8RjCqFrOSPxMblIwX327lGVVFNjUwXU4jijfZsOXegf2nxqHsYXiQ/CeNp=
/UD
kPtlvjCyr4paixl2QEpb8AiA84tlwBDRGgxBciIC/8FMJlH7uleOCce8b+R5JdCC5brQ7Kh8G=
NVe
t+T8/656LV/o180tU3RlZmFuIFdlaWwgPHN0ZWZhbi53ZWlsQGJpYi51bmktbWFubmhlaW0uZ=
GU+
wsF3BBMBCAAhBQJV04MXAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEOCMIdVndFCtj=
/kQ
AIi2gJp9M3PMTU13b61km5Xo0ptWxmJ6qNtUZZZyOGqS+1u59a02oJ0JxtK9s095SS7e60gYX=
exg
R8o4ifNKJlt53+XFh1F9ddhxjryCTm2oyHwKX1+G/sv7zFfHHK3c84S1rKH4fHnK39SGkeE1F=
/7v
ZNoueJ30GIu3/JzwM/zDquq1+yHLu6kpyCe2MNTSzhHd0Bm3YSJvsYtiB40ue+a2sRAN0SMxn=
h8H
74P+/S/c/08tRoqwPRJq4QPFim4fffrzQAi4XxlFLL4hxo5I3nV6cit1c0Uq7OtJKZb9f4LXo=
zLT
Xz40N9R1SGjtomMpuPCv9KNWgkTYR2nLI8vxcYZXcAsKfBEh5qdMENDxxIek4GJBoJqsVQjs/=
W8r
agj5FWIQw0XYK6YC9xVnMaqFQn74kTQQIWzvoG/1SpHd7IGmD0+7ogtGk8ALJ4opZ9VxZRgSE=
jSw
dRy/4FHPRSY/KpmIL1AWSM1I5puerqenq/HGvdrQEXQcpUBdxPTCfxOHVa5k8rzpXXQG/zBtR=
nuN
uZo7dHUXzsfEHOz8bPnd1DVUrgZvlrbkoJPiTSE9PHPlkl3nPJhOIVXaymwLwqPXXE+Rmpdq+=
hUr
0VWOZG2t7dvNMbrS0qeO9JN/gzvgIFYoGx697HF5SV2XtZuJbqgUpBAQzR9rAEKAazVcFWgma=
mUU
wsFcBBABCgAGBQJV2jIzAAoJEMaHXzVBzv3gX7cP/3u6hTiKZbSD+xs0AGFJvZ91CkNXI+RA2=
oUx
FDqCixxqeCRQN60XF8FHybhbEjjyd69zDf9kWFM0d18dstVfTFtXoE5QX2K/rNiB5BGjcq5m8=
8Rl
6YJGfM9WL/YHYXnwjOHjwetYXKNHQxujiX4kcLMqVizQr2MHXNb5G47OWZMaoLXSsS4Mrtkd0=
QuK
PWKf6SdxmuCEgiqvRXsc5cVoOhcFmp97QkXOHk7RSn2wxDNUAwnZS+jwJsfQykfxHeQI3F4zV=
5we
puznrVZQwh3EH4i7y1Q03hZlDLNyAy/+sxUfD2cgEHnS/OoO8BmueIiUNBN+Xmgav8FN6Q2mL=
hsH
pWIV4I0IsV/9pXcNUN4locTJDSLZ0qyJlEAfmV1f4zyqd7dDAn9+vbpasPOnguC+ZcNvevIOc=
77N
YWGpO18P4NFnj0OcTMDQPEnjaQyDKd6oap2iuNskJMfQ7ewhbObjESqaLBFXeD0bxOBrvmiob=
vcf
6+Bblg7I0yH+fCj3J9oaKUSANKagszg2rfO1SqkGnUeLZqFzlzuB5DK1hDCEYp5ccFSQht/84=
6gF
cDSrYi+HKGQmws3kFBp6CkLyyVX5WZPfyD8JC5ehtgSS120eQ9iaLSFvyKyFLR/qisAU/Wk7e=
kFc
VWjE8ey6FaB71vqcSfAqrqpjjuC1QRmYrtBS/QjiwsFcBBABAgAGBQJV2tA/AAoJELRIkN7eP=
JvA
A0AP/ihXIrdprG4Cte4jx8ZqItKmCI7rBb65M5hS3qdK17lr7P3xh+xI5M5V8Aalx6SyqXObT=
tjW
z26wHdrjOYoCpaUFmMwsc0ZYUcK50IdIbitSjU5Y33PMHBFdKzHtu6VJU74BFV5m084o6B9MN=
cuF
b16jnlhB4ETTtqPfqhua3DC09uRuvJ/k0QJBhzWPgpczCWeoopLHLsKyyURlXBUjw7ylJG37e=
/xN
j6UO/7k8FTN0VbHahLobSuEGCWzUkV5PGDP+0aBe3BiQleixAZmsbosJQvZvOjGlB0JeNI6U/=
K9a
JVoPjTtveapXA6fo4akA0WdUOBdK/WDew8ijw7hRq5R50RTDIsFW8XuqsqK3wx4o8JYLRSEn6=
aZX
eiRd6f7d6z2/gftCCZ9BOdqZlHeVzNfMNX5ceKFC9zFb1GLi+BFzffgWcm2k0W06EGXiZ8JgV=
fLJ
hyNVdi+sWlF+Dv+d9XBaNbpdXA56HLrBSoIq48iF6wkYrwY7kBWkZWoHaulD1Fj9o3tXYtUEA=
bTS
P9v66Qxvmyf3vsSF/4k4v67jkUMfXVx2jQytr0woVwUMsRvAQpvkTMbJW+y/b8WAQi+bzdEXg=
sE0
MYFGAA4hhMll0sGvD7zAxA4BxncbFilit5lirw0dEWQx6iycRIK211NffsiLVoJsK4JpykYt/=
u0x
84ehwsFcBBABCAAGBQJV2QfVAAoJEK0pA+v7Z+9sYZQP/2Z4F/Eu77B8DwD1wkh2yRsKVGVDT=
um4
dHuAdjEKObN+1mn7qJlUAyD7PB7ywZIEYzUok2LyV0nHNi0Uk5dq+DWVwj1Yy+diZzUNc9gCQ=
NBa
JOrf/GvAd7nTp5it3HdD6laiYi3OX5wZslYID2YAojYQEGZeUMTV3poTrqY9mO6UbSJaxRqvL=
RfO
p9idHaXqygHjvVXeoU4vNsTtYaacCAA7i22Ah2uyHq5rvXQjVAb4gtW6hNQvzD8U0Ez45VO1X=
8NB
59v+gZla60AA7mVNk0pbzRRNWnEGeAHwQmtuhTEE7KQwNIvxOICJ4xYPam1jXbm4nw4zSUnP4=
39D
rkhbEdxxeNgCnGQMvEN71ZwKTQL+WzlaZLmA1eZKJXQR5ZFjGocInIecvEuOG6XF+LXK7EBWa=
c8s
lT2bNFZKYPm7Zqe0COf1oQf0j1+xNrCrR9fBSogc8rN6dPrfXdwaNvFLO+YlB6L74TV5YXrs3=
5l0
yNsu1laoyudqwjMa/6uCNb9MlD6sqBbTuT2ySY+FqIhiXcngST77q3aLkdcGbwciW1/8K4s5c=
koK
scTfLFh8DR2abp0qPezuvHi+p+P5GOKmhe1bdSSC7ir1tJcoSL0ZVaktwSLBWrzDFd15YNnN8=
E34
CBeNTcHV/Jg4BpRZlhQ1kiMIClE/wU/e8mrVK7FIb7x5wsBzBBABCAAdFiEEQHf8HnnvXGEFZ=
VeN
hOAqAqO72aUFAltg1lYACgkQhOAqAqO72aVAtwgAzKdzVOKbYOLpAaMD998RTaWBL1ZBe3jkE=
mnW
HgCStcvbyJkrN7/iWdCZr9ilD/b24h+IPGUr9LATHA+T8ztOM3CxctAjuOOQy4kb6aF5O9VlU=
pkw
Xvf7aTpsFWGWQj5+NSi4sCaEO1FEMYXDlRYhNyz3QWo0pg36PwE6sQXJsBndAzoqUqz0HpnTP=
43I
DSwqxFhMC0LApjaTmOsrYWpPx4UdTmy/2ocvSI81Mo9ktK42anidl/YhFQjA8hR8WF7mI7+Lp=
INQ
MdKyHWqXmoRqnkP+sfdnZSWjLyePMqlLW7k9Vz2bIHdI2UOjp089ha25kLhcrpWUtHI9Qkjk2=
nnw
Pc7BTQRV3J49ARAAt9nArtjFnqmRHL0oY5KCrF5ONph6xm3rof74lZ/CTkG0zu9OhmbWs6MMN=
sHg
M7lRGIcKou7vUQE8/TEXh3+0eRdCiEYXP9jYTTXosU/+y/hOY33x9Sw/tCEHXiz6M+rp74O1P=
+zq
XSlmx8zzNy33dDdXUT+bF1C6Y7WEChIIjlOfLHOBeazNdCqDxRDM/CKeI/UWx/wm0z1DNEuD8=
crU
XIgdxY3dBAm1bBK041+3GXP8gYLN4qewT1VoG35Ya3PrrTC/zMAumagjiF3/1NCAmH6eSOzw2=
1El
oDBR76K1noDGCfRM2dp078rS/BO+QtlN4+UWQLkB+crHxqXWk0u+gka2A7ZBHFYky/oUVIK1/=
ar6
swnTRHj20Ga+rukzcdxQRJ2kwGeRrqLH1JO8p72ptvswMyzVPhk8sE2S9llPrbznj6fc9f5my=
5x9
i5Fh4Mt2z7u+wBSdck2wV5eThEPz7UziXgtbq74Hja7tuoQxUhcpOIBXKl8bMLtjxlO7VmH31=
2Vz
fiBYqQku9fHg3E/Hi+uon2fJaifFbuViZqfZq9bKT/UWG0+0cKc2d4os+3uwGcjraUjCFSXmG=
U27
YqiW8jeM7pIa03QoAhWIH9ApAOVBqWF6drFz6/oFcSl9qbY/4IneJ/eb0eyjHllegydGEuISh=
rXY
ZLiQqSX4yj/3vE8AEQEAAcLBXwQYAQgACQUCVdyePQIbDAAKCRDgjCHVZ3RQrWEaEACTrt0WU=
xL1
AT6BarJ3fOPVZjiioO+3LPhw98ci7afeScEK84cGv+KLgxawvOo7dbwEX6VceQvJ0LTZ1oYPu=
YeZ
MjiG7Qdf9uwgk3VwHf4S9pNxsqyVxHPotN9RPWwqoH9ihmO/ml7uC3gH0SFiU/RRlc3c9X/u+=
6Sb
kSEUZrUrPFQKJ3dpfjnA3RCPTI3fTKr8jycA5A5A77Daba3L+MXjc71/tn6MZCZmK7unSfpXq=
4rb
GrIgMWnFKMBgeRONUWRFIOm5lReEjLHiABCli8t4Txr2ATswA4atmC4JzP8J/WPWe2xDMvsOX=
u+b
GgW5BSO053MQz1JyJf1ExClNTkYuVlm712JFE7Xzc2cg9P796KI3CKGbytTpaTrVx3ZajqHY1=
xfZ
y3vHolR8pfGZ8xcYXhFtkD71/BSyqpkrPVvbGkLZOm4b/SzWCGCDYx9xBB//m25lfpZ+Du2u9=
1pv
C97Z6Qty5nRp9kZvAeidmSunItU0Q4jKQlFnn6ZyLhPk4mwuVSUec8dGIdda8cQRaG/JlpLUZ=
i2c
nhKAnGaAaLGycQ/NEMVjtN8z6ZHCe3eAa1bEPwSZAbRHuCZ+Iqh6gPznK88LhGUr/vzHYKKn2=
5QW
YQ7rJi2H1cu8BQ3lQpRunkCIithJ5gwoS0ZFSEM25FdIhvjSVVSRyxiu/zrDuO/s6g=3D=3D
=3DoVqG
-----END PGP PUBLIC KEY BLOCK-----

--------------E4A6F4DCE458EA0A96EAE9D2--

--RAQT3Vm2jW8qNlIhegnmBqjkwBycruvj8--

--lqdBmkZW8mPjzzaZXItAz9qkZGdutj1pD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmBaD/MFAwAAAAAACgkQ4Iwh1Wd0UK2d
XQ//Sq4XW+XPmsGHof/QahLipl3A6L1JdXMfuBnVJjU5V5eVLir3xyf04K0CgD1xizcYE2DSRBi8
3wPWU7wrFNBS3PXyoHlegA5GpMhAudhWAUZ6xCJL+duGW99twkKTCXaOdVERZz+6d5p1P/5iZ9B7
qQvVB+0R9XarqgiZqpBh/Pr7nh+ZBHll3H3AdWT9ZwA99ZsYpOYrHSfRWC1uus/ymir79zoSsW+I
NPEIqzYByWB9dszvNhg57CzPN7A/cv7Rk7e57bZsY0RxC+UPkNrPXkILOmQifjMnvfSv593h/V+L
8YjRTzbO+6nI6X3DCJcxm8Fy0Lx4+5S3a9WUbInnC1UPnj6OKTuCqJntXHC/mboqjeG0fsNxoG3M
W0/8D5OUoKtSljOmYgo/4W3Ogxqo153fvyhXM2Ct6xqa2areg8LiYPRco5j/fZmBhy/crVwfcF44
rRQgpP5IVNDyDsMPBadHHbZEwD44bDvS3sz4c47WBwmUXWmP9gpQvTuL9Wl5nKQtfc8ze66LqYNG
wJjBAmYujlESJUjKOy2KJnmxpLiTRGUmsYa6HMxng3qiCvkVQ6Duvs8cKHFtIiGyc+QKGrW8tMfq
I02zwbYWEZ6QyjYfL5agTHNImsITBt41lGZ/U3TtA68ghrr6Uxwhll2y54H1ON4+KIub01388lsB
7Pc=
=KlP3
-----END PGP SIGNATURE-----

--lqdBmkZW8mPjzzaZXItAz9qkZGdutj1pD--

