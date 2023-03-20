Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA66C24FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:58:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peOQn-0006rv-5X; Mon, 20 Mar 2023 18:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1peOQi-0006rn-HU
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:56:40 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1peOQg-00018l-Do
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:56:40 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 n27-20020a4ad63b000000b005252709efdbso2187269oon.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista.com; s=google; t=1679352995;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aPY/b7GcVNZm3CA+5FOlTR5HyNImowtmdM7C5obSQU=;
 b=FNg6DOQwBJaS2hXVcxoKDdEN3Cd0QKG8DPQacN0A68Gu1C1ivtdk8z465ZGJUp8TrZ
 ww3OFMGHT6D4qqJFpZZYlIRVVAOwvOXc/rfGn0ebuKNhw36nwtCq7ObzfQjTF36Ogk/M
 e6ULlp5A0C93obz2EbXAvu68m7xcx6nrh9Mhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679352995;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8aPY/b7GcVNZm3CA+5FOlTR5HyNImowtmdM7C5obSQU=;
 b=rGc7w8RQrNW0lgJWUoV4uQ3DVmk0p63cX/n33HkKqX4v+krUdWathO2XUfoogVnav8
 bk88y3/PxDgyWI3yA2yKyutyU9EX5rO/a/Z3ZRg53xo66I0/Ud1SGgKDawzsTHFmUQXF
 dmYJm+OT8Smocml+7lgITq+KJYFkpyw+FndLTyQquGS7YeRHT/ziFJTZCHRMkHEzQGuH
 WUj074eFx3HwSwMEqEyGuSHh8+EgwFIxH9VUiMiVszcmqeCiXfASuHIrpssHcQiytNaR
 FcUEfX61YeRPSwh7O5AW7plYM8emEJZbPCu3PmceVGCrA4unJlmhL3gG3luX1k1vOy9D
 pUQQ==
X-Gm-Message-State: AO0yUKU+ZAyegr9ygU0bBUGkmh+ChOWcbs46tP7sJiDnQM7ZbabrOhaN
 dhCddSLAAMfHhtErZ/t2HlO0wQ==
X-Google-Smtp-Source: AK7set/4XxLSrG4KEoDlY9yaWD71ubJ7lCIK5cDQ6UrxiODaRCERbyrMiHA8xZ4POU/jMvZeat09eQ==
X-Received: by 2002:a4a:eb14:0:b0:51a:182f:65e3 with SMTP id
 f20-20020a4aeb14000000b0051a182f65e3mr639436ooj.1.1679352995574; 
 Mon, 20 Mar 2023 15:56:35 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:fdc0:6131:570d:3c9])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056830004600b0069451a9274bsm4496668otp.28.2023.03.20.15.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:56:34 -0700 (PDT)
Date: Mon, 20 Mar 2023 17:56:32 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] hw/i2c: Reset fixes
Message-ID: <ZBjkoGqk5Uo8Skg4@minyard.net>
References: <20230320221419.2225561-1-komlodi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=sha-256; boundary="BcoKJK1Qn2ii9wHM"
Content-Disposition: inline
In-Reply-To: <20230320221419.2225561-1-komlodi@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=cminyard@mvista.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: cminyard@mvista.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--BcoKJK1Qn2ii9wHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 10:14:17PM +0000, Joe Komlodi wrote:
> Hi all,
>=20
> This series fixes some I2C state variables not being reset when a reset
> would happen.
>=20
> These stale variables would infrequently cause issues, something around
> the order of 5/1000 runs, since the machine would have to be reset at a
> point where they would be in a state that would cause problems.

These look good to me.  Definitely a missing needed function.  Looking
through the way it's handled, I think the proper things are being reset
and the proper ones are being left alone.  There's no checking of the
reset type, but there's only one reset type right now, so I guess any
changes due to reset type will have to come when new types come.

Acked-by: Corey Minyard <cminyard@mvista.com>

for another tree, or I can take them.

Thanks,

-corey

>=20
> Thanks!
> Joe
>=20
> Joe Komlodi (2):
>   hw/i2c: smbus_slave: Reset state on reset
>   hw/i2c: core: Add reset
>=20
>  hw/i2c/core.c        | 25 ++++++++++++++++++++++---
>  hw/i2c/smbus_slave.c |  9 +++++++++
>  2 files changed, 31 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.40.0.rc2.332.ga46443480c-goog
>=20

--BcoKJK1Qn2ii9wHM
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIINXgYJKoZIhvcNAQcCoIINTzCCDUsCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggqSMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkqhkiG9w0BAQsFADBl
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
aWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgRzIwHhcNMTkw
OTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMyWjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAOqxRa06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnuusnOWvpI
SoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NXjnbOhJS/1NjGq+ug
LMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9wgfW7XuhAi2j0y5d9oMT0SuVe
KFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8RpLt05WI2G2RNVVlHYaU0CAwEAAaOCAgQw
ggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5etI4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXy
uNtgv6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsG
AQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUw
EgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3JsMy5kaWdp
Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNVHSAEgcYwgcMwgcAG
BFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoG
CCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBh
Y2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQC
o3MAIqR0kekGYrC70EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJ
dgkASGsINabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2VjoECzez2
y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7KnbzMS9quFSuyOGILc
g/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUwggUrMIIEE6ADAgECAhAI91Yw
DXfxkIfRnG2PuTKcMA0GCSqGSIb3DQEBCwUAMGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxE
aWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lD
ZXJ0IEFzc3VyZWQgSUQgQ2xpZW50IENBIEcyMB4XDTIyMDUwNTAwMDAwMFoXDTI0MDUwNTIz
NTk1OVowQjEcMBoGA1UEAwwTY21pbnlhcmRAbXZpc3RhLmNvbTEiMCAGCSqGSIb3DQEJARYT
Y21pbnlhcmRAbXZpc3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANjY
cQZ5HQOSUjRGxztwfw4ev2HrLkWD+q2XodUa4cJviNLPKjbKzal4cuHH3v0tZenndhg4atln
f3htoY0+ahiltcn9bmT9pZcru98ibD6DBuB64eFzYOkcmGh70NRFW32AM7zZIyNH8gqpJXCD
jkkcHEXvQSquFIF4ySAZMrG99xTa2kPG0FUvS/GDzX8WVqJ7rIj2ECsksw4KYKdhGIj62BPo
EWyUMFewJYQq+MR8wkyc1VK1NSJeZIFDLQeIORITeV3OGCfsZ9gFZdcnJKU8rgeFOi9tXVPV
UMALBS62pkIZQ0E2KW7jVKj7OTZ5VEGGQe90WTyqEO/eRA1mDP0CAwEAAaOCAfMwggHvMB8G
A1UdIwQYMBaAFKViIFDcu1tXl60jjzXiVGypfvlOMB0GA1UdDgQWBBTWsIdx8IZ4jupYlE50
qQfzLzONGjAMBgNVHRMBAf8EAjAAMB4GA1UdEQQXMBWBE2NtaW55YXJkQG12aXN0YS5jb20w
DgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBDBgNVHSAE
PDA6MDgGCmCGSAGG/WwEAQEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQu
Y29tL0NQUzCBiwYDVR0fBIGDMIGAMD6gPKA6hjhodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkSURDbGllbnRDQUcyLmNybDA+oDygOoY4aHR0cDovL2NybDQuZGln
aWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwfQYIKwYBBQUHAQEE
cTBvMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKG
O2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVudENB
RzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBSm5bBRgylRT6A8rEzMQ86RAGn0FH1kEX38qvl
ZTlVqS3iE+zWeZDf9av4eYHiWVwmPwMz90je9jZaWyvTJ0FaLZkM3ZD41tqlC15P1LMSf86m
zvZvM7OQP9wzKnG1a8n6JSBVh4wbo6CX2bdQycqAMaP6U374Rm3qaYcE3CpWbnSU9DFhiXww
CqVVlHP3ldil7h0o+Ke2eu5X1Keamd8rIOJsXn8ZnfIwh3rbkZR04IDlbpRJ73K1ytilKi03
F4rHlra9IHk8OQfdslIgus5Djm4GCXBa8MxeO56eHxgzjgl+hZFULTaeIKzusKXR2swrlf90
hTtvcpjVVC2D6wyoMYICkDCCAowCAQEwfjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMgIQCPdWMA138ZCH0Zxtj7kynDANBglghkgBZQME
AgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzAz
MjAyMjU2MzJaMC8GCSqGSIb3DQEJBDEiBCC+fOZbeXJS4xfljPxsx/1NNIB6qoh55Mj+xwTu
Q7dQEzB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUr
DgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQAVyioiX9mhKxvaZyfjGC9T
wzdepF/wRSpU/dCmuzcrTM5kl2wVGwN3d/bQ68NmVxF1tRxR6ks5JelipbEjLKVzcv7DEltU
xHIV9bJQ46ODBx1BdF6L9ZLZUbi9gtSb6AYCvZUH5QdbQN+Rl+KhqpLbXh75NMCdSNKZ0PH5
yPFjoDADDH6BqHRjAtb3+zddyvLlWsiVbCy2pwHh6PZWXIsSoWyE1hpQkrpC/a75BiR8T0b+
Nkj4Aasmiy0Msdr8W0tFxdTVH0M0eaScThpq4KEAlxSE3hYVJPSA2LUAk1eACZ1uzglmcOEB
Kvev3O7/yZy8CWR6zo3OWCocvMxlyxBL

--BcoKJK1Qn2ii9wHM--

