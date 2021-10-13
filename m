Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03A42C189
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:36:25 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeQi-0005bG-Na
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiwei@inspur.com>)
 id 1maYn2-00010k-9s; Wed, 13 Oct 2021 03:35:04 -0400
Received: from ssh248.corpemail.net ([210.51.61.248]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuxiwei@inspur.com>)
 id 1maYmv-0007Og-IJ; Wed, 13 Oct 2021 03:35:01 -0400
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((LNX1044)) with ASMTP (SSL) id GHV00126;
 Wed, 13 Oct 2021 15:34:26 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 13 Oct 2021 15:34:21 +0800
Received: from Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1])
 by Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1%5])
 with mapi id 15.01.2308.014; Wed, 13 Oct 2021 15:34:21 +0800
From: =?utf-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>
To: "wangzq.jn@gmail.com" <wangzq.jn@gmail.com>,
 =?utf-8?B?VGFvIExpbiAo5p6X5rabKS3mtarmva7llYbnlKjmnLrlmag=?=
 <lintao.lc@inspur.com>,
 =?utf-8?B?Q2hpY2FnbyBEdWFuICjmrrXlv5fkvbMpLeS6keaVsOaNruS4reW/g+mbhg==?=
 =?utf-8?B?5Zui?= <duanzhijia01@inspur.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGFzcGVlZDogQWRkIHN1cHBvcnQgZm9yIHRoZSBm?=
 =?utf-8?Q?p5280g2-bmc_board?=
Thread-Topic: [PATCH] aspeed: Add support for the fp5280g2-bmc board
Thread-Index: AQHXwAPlQ/aKRtVmw0C4vKN6q6EIeavQAj6AgACGrCA=
Date: Wed, 13 Oct 2021 07:34:21 +0000
Message-ID: <3c29e34c030649f19a159229bfc2aaf8@inspur.com>
References: <20211013072607.783612-1-wangzhiqiang02@inspur.com>
 <CAHwNHZV7BcXE3g=oXcbwVA3gXXOKkp23Cem=OqdvdTF937iQzw@mail.gmail.com>
In-Reply-To: <CAHwNHZV7BcXE3g=oXcbwVA3gXXOKkp23Cem=OqdvdTF937iQzw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.13.198]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_006D_01D7C047.CA158D20"
MIME-Version: 1.0
tUid: 2021101315342657c145b4924858eb76b0332e00739d33
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Received-SPF: pass client-ip=210.51.61.248; envelope-from=liuxiwei@inspur.com;
 helo=ssh248.corpemail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 09:30:44 -0400
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_NextPart_000_006D_01D7C047.CA158D20
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable



George Liu  |  =E5=88=98=E9=94=A1=E4=BC=9F
=20
=20
P.R&D  |  =E4=BA=A7=E5=93=81=E7=A0=94=E5=8F=91=E9=83=A8
=20
=20
T: 15098841013
=20
=20
E: liuxiwei@inspur.com
=20
=20
=20


=E6=B5=AA=E6=BD=AE=E5=95=86=E7=94=A8=E6=9C=BA=E5=99=A8=E6=9C=89=E9=99=90=E5=
=85=AC=E5=8F=B8


Inspur Power Commercial Systems Co., Ltd


=E5=8C=97=E4=BA=AC=E5=B8=82=E6=B5=B7=E6=B7=80=E5=8C=BA=E4=B8=8A=E5=9C=B0=E4=
=BF=A1=E6=81=AF=E8=B7=AF2=E5=8F=B7C=E5=BA=A75=E5=B1=82


5F,Tower C,No.2 Xinxi Road.Shangdi,Haidian District,Beijing,P.R.China
=E6=B5=AA=E6=BD=AE=E5=95=86=E7=94=A8=E6=9C=BA=E5=99=A8
=E6=B5=AA=E6=BD=AE=E6=9C=8D=E5=8A=A1=E5=99=A8



-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: =E7=8E=8B=E5=BF=97=E5=BC=BA =
[mailto:wangzq.jn@gmail.com]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2021=E5=B9=B410=E6=9C=8813=E6=97=A5 15:30
=E6=94=B6=E4=BB=B6=E4=BA=BA: Tao Lin =
(=E6=9E=97=E6=B6=9B)-=E6=B5=AA=E6=BD=AE=E5=95=86=E7=94=A8=E6=9C=BA=E5=99=A8=
 <lintao.lc@inspur.com>; George Liu (=E5=88=98=E9=94=A1=E4=BC=9F) =
<liuxiwei@inspur.com>; Chicago Duan =
(=E6=AE=B5=E5=BF=97=E4=BD=B3)-=E4=BA=91=E6=95=B0=E6=8D=AE=E4=B8=AD=E5=BF=83=
=E9=9B=86=E5=9B=A2 <duanzhijia01@inspur.com>
=E6=8A=84=E9=80=81: C=C3=A9dric Le Goater <clg@kaod.org>; Peter Maydell =
<peter.maydell@linaro.org>; Andrew Jeffery <andrew@aj.id.au>; Joel =
Stanley <joel@jms.id.au>; open list:ASPEED BMCs <qemu-arm@nongnu.org>; =
open list:All patches CC here <qemu-devel@nongnu.org>
=E4=B8=BB=E9=A2=98: Re: [PATCH] aspeed: Add support for the fp5280g2-bmc =
board

This patch is based on https://github.com/openbmc/qemu (commit id:
2856503299534aab7602de2aaa88dd9ee7e9d61a)=EF=BC=8Cnot  qemu/qemu.

John Wang <wangzq.jn@gmail.com> =
=E4=BA=8E2021=E5=B9=B410=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 =
=E4=B8=8B=E5=8D=883:26=E5=86=99=E9=81=93=EF=BC=9A
>
> The fp5280g2-bmc is supported by OpenBMC, It's based on the following=20
> device tree
>
> https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspee
> d-bmc-inspur-fp5280g2.dts

Nit: I think the latest branch is `dev-5.14`.

>
> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
> ---
>  hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c index=20
> 01c1747972..3587788f63 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -141,6 +141,21 @@ struct AspeedMachineState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                            =
  \
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>
> +/* FP5280G2 hardware value: 0XF100D286 */
> +#define FP5280G2_BMC_HW_STRAP1 (                                      =
\
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                   =
  \
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                      =
  \
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                             =
  \
> +        SCU_AST2500_HW_STRAP_RESERVED28 |                             =
  \
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                            =
  \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                 =
  \
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                  =
  \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |              =
  \
> +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |   =
  \
> +        SCU_HW_STRAP_MAC1_RGMII |                                     =
  \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                     =
  \
> +        SCU_AST2500_HW_STRAP_RESERVED1)
> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus=20
> definition) */  #define WITHERSPOON_BMC_HW_STRAP1=20
> ROMULUS_BMC_HW_STRAP1
>
> @@ -717,6 +732,17 @@ static void g220a_bmc_i2c_init(AspeedMachineState =
*bmc)
>                            eeprom_buf);  }
>
> +static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc) {
> +    AspeedSoCState *soc =3D &bmc->soc;
> +
> +    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), =
TYPE_TMP105,
> +                     0x48);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), =
TYPE_TMP105,
> +                     0x49);
> +}
> +
>  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -1082,6 +1108,24 @@ static void =
aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>
> +static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void=20
> +*data) {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       =3D "Inspur FP5280G2 BMC (ARM1176)";
> +    amc->soc_name  =3D "ast2500-a1";
> +    amc->hw_strap1 =3D FP5280G2_BMC_HW_STRAP1;
> +    amc->fmc_model =3D "n25q512a";
> +    amc->spi_model =3D "mx25l25635e";
> +    amc->num_cs    =3D 2;
> +    amc->macs_mask  =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> +    amc->i2c_init  =3D fp5280g2_bmc_i2c_init;
> +    mc->default_ram_size =3D 512 * MiB;
> +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>  static void aspeed_machine_rainier_class_init(ObjectClass *oc, void=20
> *data)  {
>      MachineClass *mc =3D MACHINE_CLASS(oc); @@ -1146,6 +1190,10 @@=20
> static const TypeInfo aspeed_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
>          .class_init    =3D aspeed_machine_g220a_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("fp5280g2-bmc"),
> +        .parent        =3D TYPE_ASPEED_MACHINE,
> +        .class_init    =3D aspeed_machine_fp5280g2_class_init,
>      }, {
>          .name          =3D MACHINE_TYPE_NAME("quanta-q71l-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
> --
> 2.30.2
>

------=_NextPart_000_006D_01D7C047.CA158D20
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
BgNVHR8EgckwgcYwgcOggcCggb2GgbpsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1KVENBMjAxMixD
Tj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJh
dGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwgcQGCCsGAQUFBwEBBIG3MIG0
MIGxBggrBgEFBQcwAoaBpGxkYXA6Ly8vQ049SU5TUFVSLUNBLENOPUFJQSxDTj1QdWJsaWMlMjBL
ZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFu
Z2NoYW8sREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5MCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoDBDA1Bgkr
BgEEAYI3FQoEKDAmMAoGCCsGAQUFBwMCMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwQwQwYDVR0R
BDwwOqAjBgorBgEEAYI3FAIDoBUME2xpdXhpd2VpQGluc3B1ci5jb22BE2xpdXhpd2VpQGluc3B1
ci5jb20wDQYJKoZIhvcNAQELBQADggEBAHvEHNHF1KIAhq1ZiQBaFnY72vW4eJgnvevxHHH6tPHv
tUQsHSUJUMqSptCiw6vphaJolh3orjOrBDlia/6rRG0x36laeVd/6h0Bv3Yy+05Zl8EtrfL0cP0C
QRbR5Yu2M1AP6Z3S/5ggJqJbMRw2hU3ZkR/8uEZH3O4Z4UEbKPPN5BUyfEInCrRAGiGBHzVTo5FO
10ygW33RqQ0bMwG6/FD/dH8NS5wtSeWoonFSJHhSqA7XB1KfJK1TWoF5UEs8AXH2dv2EF5LmfA21
hLjHcQJPs1TIlGPTgPrLED/LQ+OoEinjcm24JTvTtFB1R6mMlVKGKK2y6RYQGpUdCB8bKFQxggOT
MIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hh
bzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAPxyZb22jKtj4
kgAAAAA/HDAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3
DQEJBTEPFw0yMTEwMTMwNzM0MTlaMCMGCSqGSIb3DQEJBDEWBBS9MyMa6KpkcpWyTop2tBjPGKrj
8DB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZ
FghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAA
PxyZb22jKtj4kgAAAAA/HDCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/IsZAEZFgNj
b20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNV
BAMTCUlOU1BVUi1DQQITfgAAPxyZb22jKtj4kgAAAAA/HDCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAIC
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAm5a1qRXabI3x2E6oRV4W5pBZmvr77rq33
vgp7ZUgBra9fyAPFIPKlcFBkR7CJY3Xzf4Q0I6rnxaFok31vSNsJkO4INfSf89DSn9g+LN6TUSos
iqYTNQp6RCDrR3vKUdZ3JzgavTi0gjwEbpEwt17x+GX6LJDst1Z7HB7Ns5+dO3MwbOH7sKx+WMrt
sYyvoxgubM+4DZCP9vO5ddSZJDLFJjsT7vlACno/Q+wBA53+JJvTXLjA5//M6NTOpd5YRxjiVsvl
7PFcDbLJaNtH4RwKVEpxGH1mBDWgZXtruR6/c7T7tqoXYzPz1OFH5W/PXitnTnav0ckhDJF0elJg
0qSWAAAAAAAA

------=_NextPart_000_006D_01D7C047.CA158D20--

