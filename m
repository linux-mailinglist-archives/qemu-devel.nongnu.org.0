Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96872333FFF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:11:24 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzYZ-0003mb-HB
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1lJzXJ-0003Ay-Kv; Wed, 10 Mar 2021 09:10:05 -0500
Received: from db04.iswnet.net ([2001:bc8:3515:300::1]:57866
 helo=db04.ivansoftware.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1lJzXG-0004hx-Ur; Wed, 10 Mar 2021 09:10:05 -0500
Received: from [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6] (unknown
 [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6])
 by db04.ivansoftware.com (Postfix) with ESMTPSA id 11BEABE3243;
 Wed, 10 Mar 2021 15:09:48 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at db04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vmfacility.fr;
 s=mail; t=1615385388;
 bh=RqJsuMNnM2bKN6wCNA+sGgLSIaNwzCmKj5byTXNHMjo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mLzofKpkXanYGpmqldZaNe74LhYrxr5TPvStMFSH8R8BSki1FMGM9hA0/0p8fcxaH
 9BFlY+YmTd6MRdwVXprHbpESUpSJIbV/49HASPE75pl2nnIuMlo39Qzcwdni6sQlet
 3d5RdkWq2aZH0h4WEJQtKYP1CKdIMGlAwu7EKyCQYaMWwke+pvUIyVptjXUNxYUsWv
 rdBxc1td2BwR1VPgN7hqS1vgNWDar+520yw2bUFwhHsfugj/8mOEW3AKGDDbgYl6tQ
 mTmZ0+NjgfA2XR06fxy+G2+YiOMXnzFtY+0tW/xF47vOxF2uQASFpz/FbOkAOeoIXO
 LO9VfT9JM0vIg==
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org,
 groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
From: Ivan Warren <ivan@vmfacility.fr>
Message-ID: <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
Date: Wed, 10 Mar 2021 15:09:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms070208020005030809040109"
Received-SPF: pass client-ip=2001:bc8:3515:300::1;
 envelope-from=ivan@vmfacility.fr; helo=db04.ivansoftware.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a cryptographically signed message in MIME format.

--------------ms070208020005030809040109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hey there,

Any chance the MSR[SF] mixed code issue fix gets addressed at some point =
?

(Apparently there was a fix but it was breaking some tests for some=20
unknown reason)...

--Ivan

On 3/10/2021 5:09 AM, David Gibson wrote:
> The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c=
942a:
>
>    Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210=
307' into staging (2021-03-09 13:50:35 +0000)
>
> are available in the Git repository at:
>
>    https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
>
> for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517=
:
>
>    spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:=
07:09 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-03-10
>
> Next batch of patches for the ppc target and machine types.  Includes:
>   * Several cleanups for sm501 from Peter Maydell
>   * An update to the SLOF guest firmware
>   * Improved handling of hotplug failures in spapr, associated cleanups=

>     to the hotplug handling code
>   * Several etsec fixes and cleanups from Bin Meng
>   * Assorted other fixes and cleanups
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
>
> Bin Meng (2):
>        hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
>        hw/ppc: e500: Add missing <ranges> in the eTSEC node
>
> C=C3=A9dric Le Goater (1):
>        docs/system: Extend PPC section
>
> Daniel Henrique Barboza (11):
>        spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logic=
al()
>        spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unu=
sable
>        spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
>        spapr_drc.c: introduce unplug_timeout_timer
>        spapr_drc.c: add hotunplug timeout for CPUs
>        spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug stat=
e
>        spapr.c: add 'unplug already in progress' message for PHB unplug=

>        spapr_pci.c: add 'unplug already in progress' message for PCI un=
plug
>        qemu_timer.c: add timer_deadline_ms() helper
>        spapr.c: remove duplicated assert in spapr_memory_unplug_request=
()
>        spapr.c: send QAPI event when memory hotunplug fails
>
> Fabiano Rosas (1):
>        target/ppc: Fix bcdsub. emulation when result overflows
>
> Peter Maydell (3):
>        hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
>        hw/display/sm501: Expand out macros in template header
>        hw/display/sm501: Inline template header into C file
>
> Vitaly Cheptsov (1):
>        target/ppc: fix icount support on Book-e vms accessing SPRs
>
>   docs/system/ppc/embedded.rst      |  10 ++
>   docs/system/ppc/powermac.rst      |  34 +++++++
>   docs/system/ppc/powernv.rst       | 193 +++++++++++++++++++++++++++++=
+++++++++
>   docs/system/ppc/prep.rst          |  18 ++++
>   docs/system/ppc/pseries.rst       |  12 +++
>   docs/system/target-ppc.rst        |  53 +++--------
>   hw/display/sm501.c                | 160 +++++++++++++++--------------=
--
>   hw/display/sm501_template.h       | 131 --------------------------
>   hw/net/fsl_etsec/etsec.c          |   1 +
>   hw/net/fsl_etsec/rings.c          |   1 +
>   hw/ppc/e500.c                     |   1 +
>   hw/ppc/spapr.c                    |  67 ++++++++++++-
>   hw/ppc/spapr_drc.c                | 110 ++++++++++++++++------
>   hw/ppc/spapr_pci.c                |   8 +-
>   hw/ppc/trace-events               |   2 +-
>   include/hw/ppc/spapr.h            |   1 +
>   include/hw/ppc/spapr_drc.h        |   7 +-
>   include/qemu/timer.h              |   8 ++
>   pc-bios/README                    |   2 +-
>   pc-bios/slof.bin                  | Bin 968368 -> 968888 bytes
>   roms/SLOF                         |   2 +-
>   target/ppc/int_helper.c           |  13 ++-
>   target/ppc/translate_init.c.inc   |  36 +++++++
>   tests/tcg/configure.sh            |   6 ++
>   tests/tcg/ppc64/Makefile.target   |  13 +++
>   tests/tcg/ppc64le/Makefile.target |  12 +++
>   tests/tcg/ppc64le/bcdsub.c        | 130 +++++++++++++++++++++++++
>   util/qemu-timer.c                 |  13 +++
>   28 files changed, 751 insertions(+), 293 deletions(-)
>   create mode 100644 docs/system/ppc/embedded.rst
>   create mode 100644 docs/system/ppc/powermac.rst
>   create mode 100644 docs/system/ppc/powernv.rst
>   create mode 100644 docs/system/ppc/prep.rst
>   create mode 100644 docs/system/ppc/pseries.rst
>   delete mode 100644 hw/display/sm501_template.h
>   create mode 100644 tests/tcg/ppc64/Makefile.target
>   create mode 100644 tests/tcg/ppc64le/Makefile.target
>   create mode 100644 tests/tcg/ppc64le/bcdsub.c
>


--------------ms070208020005030809040109
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CykwggURMIID+aADAgECAhABSzGLseyYaS5Q+y8WzDO3MA0GCSqGSIb3DQEBCwUAMIGWMQsw
CQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDcwNDAwMDAw
MFoXDTIyMDcwMzIzNTk1OVowIzEhMB8GCSqGSIb3DQEJARYSaXZhbkB2bWZhY2lsaXR5LmZy
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA16J+MNpaqIEV5b2WoLC+l2PP5n3W
CtXrhU04ursB8Ib+TIGaJQQigdKp2pX7xwY9F/h1vukcYHNxILOvpop8AYyFbCMwmh0r2vZs
hDpYA1adv7wGsL3tbV155FTk0RewY8//18CaQ/SwVMRiUtqwbsUlbHkHtQRm32r/Otpzjd4/
vcTshpsPRIcxEib2UMRP6WGjHurC4rd/3pcWlP/GsjA/aGNb9yaNunHBTJzVaqSeiwwYObco
sJi1199wNBePGrZK6WF3XumgA6++kTKEieJ6hSj2amTR80VaYIzKyjCu4SklI7+ouBL/8UsN
ljRrIL8sCLkyBlYjWYNsQR3ZbQIDAQABo4IByzCCAccwHwYDVR0jBBgwFoAUCcDy/AvalNtf
/ivfqJlCz8ngrQAwHQYDVR0OBBYEFEmwhbO6wfSTbflKHMQwSp7HWMGvMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBABgNV
HSAEOTA3MDUGDCsGAQQBsjEBAgEBATAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28u
Y29tL0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEF
BQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JT
QUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGG
F2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMB0GA1UdEQQWMBSBEml2YW5Adm1mYWNpbGl0eS5m
cjANBgkqhkiG9w0BAQsFAAOCAQEAPXjOtK7xHfpAU3HUn5hIlaWUzkbaMI1R8tiefaJsHJks
4dkh/IqQhI+3yCjPybY38NP+ctwgpOZo7ARK/lLKo4+yooYs+5MrwCvP2Kw2RKPp+ZjhJIWX
DVcoVUxkONrVJH/VuTB3zeJDZ9nrODK9D3X1W2+8srQKgDjlx0sLYuBQEwNDEft9Ag9rL4/5
X1nlZJZbR8KWM0BxpHYTi7iGL2Gk8GE+beHDmyCAJHolkcs6G3GXwsp03hm300PGbEVsuWgA
5zHW90OSi/5CnrN15TaOC2yd9nRsobe5ajJAUjvCyVrl+tLmiM/KYJ24/R5Mb+CF6HhhiUa4
IwbWGZZbgzCCBhAwggP4oAMCAQICEE2ULBDUO+CUCcWBLTorBk8wDQYJKoZIhvcNAQEMBQAw
gYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkg
Q2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1
c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE4MTEwMjAwMDAwMFoXDTMwMTIz
MTIzNTk1OVowgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1
U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0Ew
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDKPO2UCkH/3vlGuejWO+bakr8rEE6q
GryCvb4mHCkqKtLNnFCBP22ULvOXqGfV9eNKjkypdR8i0yW2sxpepwRIm4rx20rno0JKuriI
Mpoqr03E5cWapdfbM3wccaNDZvZe/S/Uvk2TUxA8oDX3F5ZBykYQYVRR3SQ36gejH4v1pXWu
N82IKPdsmTqQlo49ps+LbnTeef8hNfl7xZ8+cbDhW5nv0qGPVgGt/biTkR7WwtMewu2mIr06
MbiJBEF2rpn9OVXH+EYB7PmHfpsEkzGp0cul3AhSROpPyx7d53Q97ANyH/yQc+jl9mXm7UHR
5ymr+wM3/mwIbnYOz5BTk7kTAgMBAAGjggFkMIIBYDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA
4dibwJ3ysgNmyzAdBgNVHQ4EFgQUCcDy/AvalNtf/ivfqJlCz8ngrQAwDgYDVR0PAQH/BAQD
AgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwME
MBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0
cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwdgYIKwYB
BQUHAQEEajBoMD8GCCsGAQUFBzAChjNodHRwOi8vY3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQWRkVHJ1c3RDQS5jcnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVz
dC5jb20wDQYJKoZIhvcNAQEMBQADggIBAEFEdQCrOcIV9d6OlW0ycWiMAN0X13ocEDiQyOOx
vRcxkfO244K0oX7GzCGHYaqRbklCszzNWVT4DZU/vYrLaeVEDUbCYg+Ci7vhNn9dNqscbzN0
xKBoOuRVjPPWDechU70geT3pXCxpwi8EXwl+oiz7xpYfY99JSs3E/piztTSxljHitcPr5yoW
r9lbkFR8KU3+uGTZ11BfKfuSSaRrZFBv133SeY0d2AqvB9Dj2ZDaFZA0OQkkhfAqNgDpVRH9
9lQV4JSKx0N7/QAEtMj6OF5dRXV6hhXuU3A0Eql4d0247oBpxvnfcmV95QfG8HP059hZSJe7
T2wwC+IzXVDQO4xnnvrQJ07ZWemxc/grFpgiG+o+pQxapF1bKftysi02Rl6uhdp5wbTeLeYz
t2SI9oKSChwGDQQFixtkNnxuwbdrTwvASwvViDPdIGzIQJrTBqriE5/9nzkXbDZmld8/7Dyr
iJ/A73RIZllX4dH8mHqsRpU8NEX8IQZWpHWGK5A5nVgvl7MxNfRlIvCvKZQTSnCL8oNqJgHX
m6zCB4gBwDonM8V/2kuQAUVazVA3I376eIWGwzjuqh3H88v7mNHzubLHm5h0ERCSQNz6UoHV
Zy3q5xeqbYSaxpDQz3lCNObL6sNaOQNh3DcyzqZJYTcGfuLlmC3AIteAAh7lbybJszYnMYIE
MjCCBC4CAQEwgaswgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0
ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UE
AxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwg
Q0ECEAFLMYux7JhpLlD7LxbMM7cwDQYJYIZIAWUDBAIBBQCgggJXMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDMxMDE0MDk0NlowLwYJKoZIhvcNAQkE
MSIEIP7SLE2eW+CdOhUbQ8BdHj7yzEX4i5A08uVCiju92EtXMGwGCSqGSIb3DQEJDzFfMF0w
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAw
DQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgbwGCSsGAQQBgjcQBDGB
rjCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
A1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0
aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQAUsx
i7HsmGkuUPsvFswztzCBvgYLKoZIhvcNAQkQAgsxga6ggaswgZYxCzAJBgNVBAYTAkdCMRsw
GQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoT
D1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRp
Y2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEAFLMYux7JhpLlD7LxbMM7cwDQYJKoZIhvcN
AQEBBQAEggEAFFXJq6BquibVjat4by3To8hIkYD/pcROhH6VScU+qLzM3qu3yuNGqCBamjjz
6PkORnJQyxeybKSDKgCUFMALP18sqWmQpQkiaVtUFAVBvBMfi3bg+MosXDE2qZyCgh+wpyqU
tOlNMrlquDsibHi4Vn/Xftzj5CadYo4h2CaEoBvgrdX1oCRHLzNWFgMEusa4O+T0qis6YRcK
9Vg7kuy7PV3KpuBMyBsV/unY0Rc7XaM/cc9xvtBSOfvGdf5J88o41SxP18WIaqwBVjxecRik
juN8kofq0Q6YaOleyIeRKkMPmVTDBV1/VyHY7euUxc2n7fOEt5Gwvx6uHIoERxHVCQAAAAAA
AA==
--------------ms070208020005030809040109--

