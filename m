Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D53B8D3E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:59:05 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyon2-0005QN-GU
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyojh-0003Hw-Jw
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37581 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lyoje-0001DN-3q
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:55:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GFm9m03Zjz9t0T; Thu,  1 Jul 2021 14:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625115324;
 bh=tuqEaZIuw7rTe2CgGWTdR7rsYWp8EWYOUWNc+mUFQyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwJpHwc0DXkD0pSPtNxa2BRskNomTtcRwkN1ArlIVW2rIRLlIRMmCipA+YneYuxnO
 sPbcc2U7h/tOSMZ2d8BR2jPH7UFoHsI+OEhM9UxL6g/4p7IgtIYwef4j2xBfIILeNs
 WMTM4XHPxonhXIVGNUX6J6BMXk6Wno//06Sv3Bc8=
Date: Thu, 1 Jul 2021 14:54:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 7/7] bios-tables-test: Update golden binaries
Message-ID: <YN1KjOhsDOcly9Zk@yekko>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-8-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SY/LRyh7yPUSObT5"
Content-Disposition: inline
In-Reply-To: <20210617190739.3673064-8-jusual@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SY/LRyh7yPUSObT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 09:07:39PM +0200, Julia Suvorova wrote:
> Add ACPI hot-plug registers to DSDT Q35 tables.
> Changes in the tables:
>=20
> +    Scope (_SB.PCI0)
> +    {
> +        OperationRegion (PCST, SystemIO, 0x0CC4, 0x08)
> +        Field (PCST, DWordAcc, NoLock, WriteAsZeros)
> +        {
> +            PCIU,   32,
> +            PCID,   32
> +        }
> +
> +        OperationRegion (SEJ, SystemIO, 0x0CCC, 0x04)
> +        Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
> +        {
> +            B0EJ,   32
> +        }
> +
> +        OperationRegion (BNMR, SystemIO, 0x0CD4, 0x08)
> +        Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
> +        {
> +            BNUM,   32,
> +            PIDX,   32
> +        }
> +
> +        Mutex (BLCK, 0x00)
> +        Method (PCEJ, 2, NotSerialized)
> +        {
> +            Acquire (BLCK, 0xFFFF)
> +            BNUM =3D Arg0
> +            B0EJ =3D (One << Arg1)
> +            Release (BLCK)
> +            Return (Zero)
> +        }
> +
> +        Method (AIDX, 2, NotSerialized)
> +        {
> +            Acquire (BLCK, 0xFFFF)
> +            BNUM =3D Arg0
> +            PIDX =3D (One << Arg1)
> +            Local0 =3D PIDX /* \_SB_.PCI0.PIDX */
> +            Release (BLCK)
> +            Return (Local0)
> +        }
> +
> +        Method (PDSM, 6, Serialized)
> +        {
> +            If ((Arg0 =3D=3D ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c343=
4d") /* Device Labeling Interface */))
> +            {
> +                Local0 =3D AIDX (Arg4, Arg5)
> +                If ((Arg2 =3D=3D Zero))
> +                {
> +                    If ((Arg1 =3D=3D 0x02))
> +                    {
> +                        If (!((Local0 =3D=3D Zero) | (Local0 =3D=3D 0xFF=
FFFFFF)))
> +                        {
> +                            Return (Buffer (One)
> +                            {
> +                                 0x81                                   =
          // .
> +                            })
> +                        }
> +                    }
> +
> +                    Return (Buffer (One)
> +                    {
> +                         0x00                                           =
  // .
> +                    })
> +                }
> +                ElseIf ((Arg2 =3D=3D 0x07))
> +                {
> +                    Local1 =3D Package (0x02)
> +                        {
> +                            Zero,
> +                            ""
> +                        }
> +                    Local1 [Zero] =3D Local0
> +                    Return (Local1)
> +                }
> +            }
> +        }
> +    }
> +
> ...
>=20
>      Scope (_GPE)
>      {
>          Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardwar=
e ID
> +        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=
=3D0x00-0xFF
> +        {
> +            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
> +            \_SB.PCI0.PCNT ()
> +            Release (\_SB.PCI0.BLCK)
> +        }
> ...
>=20
> +
> +        Device (PHPR)
> +        {
> +            Name (_HID, "PNP0A06" /* Generic Container Device */)  // _H=
ID: Hardware ID
> +            Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
> +            Name (_STA, 0x0B)  // _STA: Status
> +            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource S=
ettings
> +            {
> +                IO (Decode16,
> +                    0x0CC4,             // Range Minimum
> +                    0x0CC4,             // Range Maximum
> +                    0x01,               // Alignment
> +                    0x18,               // Length
> +                    )
> +            })
> +        }
>      }
> ...
>=20
> And if there is a port in configuration:
>=20
>              Device (S10)
>              {
>                  Name (_ADR, 0x00020000)  // _ADR: Address
> +                Name (BSEL, Zero)
> +                Device (S00)
> +                {
> +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> +                    Name (_ADR, Zero)  // _ADR: Address
> +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Devi=
ce, x=3D0-9
> +                    {
> +                        PCEJ (BSEL, _SUN)
> +                    }
> +
> +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specif=
ic Method
> +                    {
> +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN=
))
> +                    }
> +                }
> +
> ...
>=20
> +                Method (DVNT, 2, NotSerialized)
> +                {
> +                    If ((Arg0 & One))
> +                    {
> +                        Notify (S00, Arg1)
> +                    }
> ...
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
>  tests/data/acpi/q35/DSDT                    | Bin 7859 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9184 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge             | Bin 7877 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp               | Bin 8323 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9513 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt             | Bin 7934 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp              | Bin 9218 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64             | Bin 8990 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.nohpet             | Bin 7717 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem            | Bin 7865 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis                | Bin 8465 -> 8894 bytes
>  12 files changed, 11 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index c5167f48af..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,12 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/q35/DSDT.tis",
> -"tests/data/acpi/q35/DSDT.bridge",
> -"tests/data/acpi/q35/DSDT.mmio64",
> -"tests/data/acpi/q35/DSDT.ipmibt",
> -"tests/data/acpi/q35/DSDT.cphp",
> -"tests/data/acpi/q35/DSDT.memhp",
> -"tests/data/acpi/q35/DSDT.acpihmat",
> -"tests/data/acpi/q35/DSDT.numamem",
> -"tests/data/acpi/q35/DSDT.dimmpxm",
> -"tests/data/acpi/q35/DSDT.nohpet",

It seems odd to add all these, then remove them again 2 patches
later.  But I don't really understand what these tests are doing, so
maybe that's ok.

> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> index cccf92f0466fa4eaf2e9e06675b3b102c7a8eb86..842533f53e6db40935c3cdecd=
1d182edba6c17d4 100644
> GIT binary patch
> delta 466
> zcmdmN`_O^QCD<h-QGtPh@##jc-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
> zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
> z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=3DjoM6?}&nlO|BRe=3DmE
> z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
> zAUQdci)n%Iq}s^|43iUh{sRHS5=3DB8~#>OQ;f?=3DWf0@2A?T<irxtV|5N42cB^9f=3DGK
> zOA<G;GT)YD@@JX+P)68R#4_I1z>pzYIYyru7HSX=3DAqfOH`-McSBME?12>6O_{w~AM
> zs2<(q#S-8V5X2Gh;pxH~;1^)vXkf;`5g!WTIeRL2<d+oWl%`L9C@af$gy#qkqr_wu
> axlArUmKczQ0&Xmm%j9g?Mc6>LFaQ7^vWU|F
>=20
> delta 57
> zcmaFpu-TT&CD<iovm65h<GYPqznM0xu-ukp6q(E@C(JD1D7ZOLj-PSz8u@fiH<p<A
> NV5fKiyUDT&wgCMJ5G4Qr
>=20
> diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT=
=2Eacpihmat
> index b3c1dd6bc40210425ac37dba88a650b0ea60ce1c..8d00f2ea0dd78f962e136273d=
68cb0c568e43c27 100644
> GIT binary patch
> delta 465
> zcmaFh-sjEb66_Mvr^>*<xM(BSZ>D+yKS90tV5j&1XHSFZh5+Z_5Jv7JJX{>njRGK!
> zGf+HK0Z6zgL^lMxdc`wxpW)$RiEiWuah#nDT)lu2PJX^YjNDfs+CUs<C%;f%g#b^N
> z2!&`yCm&~T1`*W&XIC$#Xk`%Z|NnvvkcxuJdd5r!kRj3PAn_#(BHE5XO&H36sz8Pn
> zfQSUB+5{07wg8u4U%mxCtdlbYg}DSSn4f$aY+B_zQT&y!<Y8yu0+3lbxd{uDCucD%
> zker;!#k4?pQtjjfhRF#$|AByEiJ~AgW8)Ga!LU$#f#~EcF7^T;Rwf2shQxw|jzk8A
> zC5f9^nK|Tx{8{4N16(=3DcJv?1_9i0O_4Gav-7(^`NT@4HwqLpLxnPFiF@g9;ufU{pn
> zv^tUiNQHo}=3Dw=3DlqenyVyCNGu%kAR@bfwCgpz+hJJ$S*0#DNUcur!32Mgy#qkqr_xG
> a<xDO=3DmKcx?0&Xmm7c1Mci?D%=3DWdHyz0)`?0
>=20
> delta 71
> zcmeD4e&EjK66_N4K$(GoarH*7-%OiTSUBXxMdIB9Tsh)BJY9GlodY}#3=3DGT|1RMo7
> b*D3QePQIy<&gsSy6CdmpFJL#>OVt(t-l7wM
>=20
> diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.b=
ridge
> index eb5d27d95b2cdeda5f7e1f6b151cfea02e6bd907..55ad4bd7ab4759d68031b2f1d=
0307355a7332fe7 100644
> GIT binary patch
> delta 3198
> zcmb7{PjBNy7{<qr)4Gn+I*q$&cAGY+LX|*TvUJ;~5-Xb6L2YP^RW}I9E1aH4$|7<A
> zA*j%#J*>Ebzd(?3;ItCjk3cyfap1s>(;m2R;mDzf?)%1mvr$RXI0q}wJmcRyGxq%P
> zuaB<kis_igS8p&T{QI+VC34M5-S?cbXB!6vw__X5v5>e_71=3D%4P#92N&%?#cyB()e
> z^@POlsv^1P2^2=3DTP^p4ZwrWR0;?LkV6h_&q*Yfs(`BB~#%7@1LOn=3D=3DrDpk>4M|FMO
> zZeor0*IZ~Zgt!}6-edZkCAjH-)u0x_+IVS%bsM@lW1CKGzIzz=3Do2j&-{ju}g-_F)I
> zweK_k)Uv-AwKlSzeAei$`=3D_j%^;?SAP5<z%-(Y@2y@ns_y_Sjz=3DRLTvA2Z!0|5TZ6
> zFUCcdWGC&$cPEVXPM*hOe`UoFB>%-q`jNitRSFN7yZ-pC7>!!cp`ilXu#Vl0p#rR-
> z)s~+Bx3VB?xEEE)-nWlrZ~wqd+Lm1?6}Fk|)lnG-`TftoXg~S#6aPgnH*=3D|8s=3D~4_
> zt)9+3dyMUAd(Zr@R^R2;PtJpaCwnFHNM%f9a@naIGWX&gr+~#y-2x(*OkeaW)q;Ry
> zk5$moGaihZ+QYGHwoX5#a`&PnIfY_yyFhGV6oQXul%*gUG^B_G5l2BLGr}B7j2N*Y
> z2A`rc5ajJ}EEI_#(hy`y1_g-|BhGXlWmF-^CIy)x$V}uQn-pYL_IU8zXCp%%QV^Mf
> z$k7=3D^kN00OWsV?oks(_YL?MO}fx#{J0)};qh9p6dL<C5{*rp&VG1S``e0bJCkZlT*
> zBuMgh$PLC01(_$t{8$DbIej6>4h2~t$ii62I7X3zXvENNGWg_m1cDSPNQxk-n~+->
> zyA))R7>gl;Pr0B$kX;IrCP+GRkP-#aLk4GhbO;4mq999=3D8RaktSMCtxPIL$b$q*wG
> zmBAf@hGdx_%TXbYK|!*_$WF=3DN{f(@@2ACA&E<x^22^nHgkbA_qH<`h2?ws(VRVc^`
> zK~^S1MlmQzju^R-3_f-Xham4!kX3@Lj)Y8PP>?lZtPL|bof*dM;kuPGKeUd;ZsM#d
> zu%~z`X?4}JrXr#!hC%`X$C$v8QIMm7fZaQA@+ipJ1F^};>Yzd^dDcuYYzcO_P+?OK
> z2OhQsn@;FqW3YRK3R{DHAXL~KEa;)a_F!oa6}AU!EN^ue&YE!Y5*QS~f=3DOEJYrHw|
> zCDgEvk(T@Vm9L?O<%RrwU%&GAP{XVzzth)6J}Bt-873oDfV1FJoLB>m{f0R*(AaZx
> z$j83Jt2^-XsE7PL(C|hL{0?dyR(%c6xvb6bAde3lzZ8V<kEz6T_<jKY<NNrC@$XB%
> CMohN=3D
>=20
> delta 73
> zcmewzdeoN7CD<k8s2l?WWBW#~-%OiTSZ+%)icDsd6J{206x<vr$Im!<jeG_tYfOBw
> dQ@nr!>ttC4dw%|4LxXsZct@8Y9tH*`1^^Ot5>o&G
>=20
> diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
> index e55d12990c98d8eed760b858ce18a036b612da1c..ccde2add9f87db0c0eaf0cc15=
5717d5744e4ef40 100644
> GIT binary patch
> delta 466
> zcmZp6+~~sP66_LUsKmg)=3D(&;WH&eZUpP*iRuv2`1v!_9HLx6K|2qX6q9xjgPMgb7V
> z87LmA03=3D)#q8ox;z2X_U&+u@uL^pDSIL=3DN6u3kV1CqLgHM(!&RZ6J=3DblV7N>LV%}B
> zghDi<laI4EgNSN?v#S?Vv@(eI|9?RSNJT+qJ!2*V$dG7tkoXb?5p74HCJbdjRUpF(
> zKtuvmZGwmkTYyWjFW&+m*2x)y!dwCu%uhZIHm&lVDE`V<^02dS0m!VJ+=3DK<nld~8W
> zNKVe=3DVp<?PsdjP#!{h{>|3JX7L{X5Lv2h8IU|1-=3DKy-2z7khyaD-#1RLt;TfM<N5m
> zlElrd%&VoD{8=3DV%loPfUv5a>$Fl2~Uj?rg^g&M>|NCE-Qej(B7NCF@g0=3D}Y~kIV5h
> zsz*0@u>^Po1aZWBc)IWg_yrg^8kjL~#D{`-&YlV$`6UH8rRkG5%FD7H;W@&?C^7kp
> Zd?uG4OAN?D0XLS(ZVI;SB5WXA7y#g;hnxTa
>=20
> delta 57
> zcmdn!((K6P66_MvtiZs)7_^b=3DH`8VnmetaXB9kx53o{Ei3T{?Z;Afm%qnOU=3D#u5`B
> N>=3DZ9xH~FoiEdbPr5E}ph
>=20
> diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.=
dimmpxm
> index 95901f94c0d445919cb84dd1f6d98c646ae8176e..b062e30117f955c7a2ac9629a=
0512324bbd28bf2 100644
> GIT binary patch
> delta 500
> zcmZ4Kb=3D{ZCCD<k8x*7umqwz+r-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
> zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
> z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=3DjoM6?}&nlO|BRe=3DmE
> z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
> zAUQdci)n%Iq}s^|43iUh{sRHS5=3DB8~#>OQ;f?=3DWf0@2A?T<irxtV|5N42cB^9f=3DGK
> zOA<G;GTSPoIkUyP2e@*?dw9C=3DIywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
> zXmun3kO~oDpiUEpwis~O`-Qm#aWx3|if+zT=3D4VuoZt`LY@CXQk*cRXyVBiR}j3Yi2
> zXg4q>6g=3D`v3UW%*Cx@%ZvK`?$!ow&rxk@FI%a0`n<Ol&bmdS5aY}rNFKsGY~09jj*
> AH2?qr
>=20
> delta 75
> zcmccayV8rxCD<iIQ<Z^%QFbHOZ>G&EEVc?F8u9J{t{m|mo-VwO&H<hV1_ovflQ*b{
> fGC2xvKCZ&gI9W+8ozsmaCO+6HUchehWHnm=3D`KA-;
>=20
> diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.i=
pmibt
> index ce07e9f152def6a22ab29b3bde98b7d1f15a0522..1c5737692f56fc678e685a4ad=
0bb1df38d487a14 100644
> GIT binary patch
> delta 480
> zcmZWlF;Buk7`=3DlEq!cYuqYRQ7Vi+`92Q>~3^jZa^<w7AbIg*x1AQ(I7povkOT=3Do7y
> zO&DE_zre_1;^5%s?Bb6Q?}8>I-tdz5?tSm&`@XmD^P=3DGxwR;r+n0^p<!WXigTyY)U
> z#i*!}ON^Wvj1MF+MtU+Qi0O5efuWL1$1J%p{wj$A>BTugx@MNxhi+R{7=3DIs)ae{Qa
> zZmGCv?5hOoWwZyBMU2c+h-5h%4*eE)_@@`J4R{F2alH?er92z@XJalN=3D5z3Vy`Ex3
> zu;EyfL3x6<k||Ms+kE+S*3Yb)*)J>oj4YpLbq~EDOFJM))3z82Qn%;S1Jsj-?1BD5
> zG7Nit2H<Wsn4ujp>Q7IEKms&<@45*<zxjy6AL(jEaCfm8a|=3DZykw>_wY1#%*wp>$N
> z10>s64gcM6wBDG2kzFIXF@ZZ|Yvxg(pMp7ZRT6LkS4YX%##){Q$J{#WVOLiRN5_8m
> i<bW<`<|6}XAi+6W$+SgVXz)ULN1#uc?WhvrE#L<Umx=3D`d
>=20
> delta 71
> zcmZ4E_|KNhCD<k8pBw`NqtZq$H|EXxEVm`aMdIB9Tsh)BJY9GlodY}#3=3DGT|1RMo7
> b&ynM2ocvurozsmaCO+6HUchd0hJq~s<(w1f
>=20
> diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.me=
mhp
> index 7acf6243f08cd906aa8a02d3acf1d720b36385ea..7b6f6487b229cac3424a5215c=
8f1755c0c85310c 100644
> GIT binary patch
> delta 480
> zcmZqj*x=3D3O66_MPL6w1l@%l!t-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
> zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
> z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=3DjoM6?}&nlO|BRe=3DmE
> z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
> zAUQdci)n%Iq}s^|43iUh{sRHS5=3DB8~#>OQ;f?=3DWf0@2A?T<irxtV|5N42cB^9f=3DGK
> zOA<G;GHb~P`Lo2k2e@*?dw9C=3DIywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
> zXmun3kO~1`(amm3{EX_+O<pVk9sxlRlLPz$3><+5bHs-N?E!|mf=3D7NyK~8D<WCLYc
> jwj(@8co-!n2P<cC`LV=3D+EEI5KnS4~)mR*DmWD5fTV<d`8
>=20
> delta 71
> zcmdns-Q>aL66_Mfq{6_!cz+|;Z>G&EEL!s7BJu74t{m|mo-VwO&H<hV1_ovf0*->4
> b7bx>HPX4Wu&gsSy6CdmpFJL!0N7WVpu^|&B
>=20
> diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.m=
mio64
> index 77d46369e48efca9a9e5024542c77cd26144beff..2e0a772a85275c9c3b4c9317d=
98cc7c3d27417f3 100644
> GIT binary patch
> delta 479
> zcmZWl%}T>S7~Ji@Y1C9x)PoXRr3XPH_=3DDb>O|+>dU78kztt36!iee6WP!L;BUUlyh
> zp)Vjlg1v}>9()BazJiCkOBDq7Ffg<8&G3D<8_%YoJ9_1L1^`I!g|E<sWT)m`M{_YU
> zRno%9sla4c6cVH@ae|m$RT$_BX*ovGg~=3DCDh>&)Y6Qrp|k$q^kRffs;{un1nv#XYZ
> zO?^ipP}@dZK%T|OD27OuvtG|{aEE_-0h@q_kQ~=3DLK%UF9p?@~!;$c1q@5k%OdJOB1
> zH56<|X(Kf%NN=3Dl8AI|cbbv^cJO*|sY=3DUE4bUXZ2xAef*{Ary?>oKp`_PwcS=3DI@75z
> zY<C!dyRjfm_l3AW5)FYtQ1`v7Isl#eLo~cJRW3!`O>89Gf~gPY5jIs-T><i%Yp9EW
> zWNQoI-y8PV`y*gvS4i%Uz#Wp6e!$biFh?$n5nRCKeloVPnrFcYx5|3h)s@20v43!~
> hN7plxv98z^;W*vRGzUu28ZVSK>1(DGmt(vHd;|L@ije>S
>=20
> delta 71
> zcmX@@InRyDCD<iIPMLv$amq%n-%OiTSWM)^MdIB9Tsh)BJY9GlodY}#3=3DGT|1RMo7
> buTtV?oXo0{&gsD#6CdmpFW@k_RK*_vr*sly
>=20
> diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.n=
ohpet
> index 0b10128e42af0c7b65e010963085bbf690a64065..ceb61f4115c2ccf4bcbb0d529=
551236933ecee15 100644
> GIT binary patch
> delta 504
> zcmZ2#bJ?EDCD<k8vOEI=3D<NA$UxlHu}eu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
> zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
> z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=3DjoM6?}&nlO|BRe=3DmE
> z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
> zAUQdci)n%Iq}s^|43iUh{sRHS5=3DB8~#>OQ;f?=3DWf0@2A?T<irxtV|5N42cB^9f=3DGK
> zOA<GiGu@U9@@I*64{+s(_waP#b#xB!G%zqQV-T^7cQr6%h*pl#XNH9##Cu2r0nUCQ
> z(dtM7AQb|>qMI{i_!+&To4i;8JOY9sCI|Qh7&rnA=3D7<jk+5-%A1&{oaf}GNHg`(8r
> z{L-T2)MB7qaEK!pH%Gj4P_Q5`7neKZ5uPJFj1rT}WHY(^SYkj95pZLf{6f~2U4#u}
> GI|BgciIJ56
>=20
> delta 71
> zcmca?zto1yCD<iIRgQsyar;KDT&B&_m~Tspi^RJJxN^jMc)IX9ItO?f7#Nr_2sjFE
> bJ}k@6I9X0UozsmaCO+6HUchd0zq~B~$tDvn
>=20
> diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.=
numamem
> index e4c4582e7f76b072ab1123c748b89ea33ea1db87..a3f846df541a70ce0730d0351=
954b78818bbcdd0 100644
> GIT binary patch
> delta 480
> zcmdmK``m%cCD<h-U4emtv411iZ>D+yKS90tV5j&1XHSFZh5+Z_5Jv7JJX{>njRGK!
> zGf+HK0Z6zgL^lMxdc`wxpW)$RiEiWuah#nDT)lu2PJX^YjNDfs+CUs<C%;f%g#b^N
> z2!&`yCm&~T1`*W&XIC$#Xk`%Z|NnvvkcxuJdd5r!kRj3PAn_#(BHE5XO&H36sz8Pn
> zfQSUB+5{07wg8u4U%mxCtdlbYg}DSSn4f$aY+B_zQT&y!<Y8yu0+3lbxd{uDCucD%
> zker;!#k4?pQtjjfhRF#$|AByEiJ~AgW8)Ga!LU$#f#~EcF7^T;Rwf2shQxw|jzk8A
> zC5f9^nIB39`Lo2k2e@*?dw9C=3DIywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
> zXmun3kO~1`(anEl_!-rso4i;8JOY9sCI|Qh7&rnA=3D7<jk+5-%A1&{oaf}GOy$<JkF
> j*^clW;bD}R%q5q}<;M~OvQWT{Wpa(2ExQOC$QA|wu$qg6
>=20
> delta 71
> zcmaFvu+x^yCD<ioryK(V<BW}5znM0xusoC$7m0TdaOH^i@O0sIbPn(|FfcG<5O5US
> b94^PtIC+zNI;R^;Onk6Yynx+gWd&OR`Gym&
>=20
> diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
> index 15a26a14e4be5280c0f1cc09f66428311100b7ab..d1433e3c14570bbd17b029a9a=
ec6bc53134c3b7d 100644
> GIT binary patch
> delta 469
> zcmbQ}w9l2xCD<iopArKD<JpZ|znSU<`~>ylgPr07oIMSq8v>kzLm0V_@NjWNHwu6_
> z&Oq@{1t8&~5Zw^$>J`t(eTIjNCAyIt#Bp{qaP<O8IQjVoF>+slXajMao%}+56#_h6
> zA{3$-oqU|V8AMbAoL#+`qLo3s|NjdzKq?9<>lrf{K!!xCgT$9Gh-f<kHDM?Nssb5S
> z03s5gY7<0U*aBRFefbvnuujep6y_4RV1DvxuxXX=3DMDbU?l82pr3qWS&<R&aoo}9(7
> zKyq>>7t;daNwt#`7$zt1{09PtC5nQ~jEzfx1j9n{1)`I)xY!GXSeY1j84?Q;IuaQe
> zmLzUwWxg%R<j*qsp^UJth-JL1fgwY*a*RGREYu(#LJ|mY_6vztM-l+35bzY+{9Q(x
> zQ9ZiJizUD#Ac!O0!_$Q~z%RhS(ZGy>BR&+wbM{p5$S*0#DNUdJR#ukn2+t87Mv2J+
> da+#d|nlT^?1>7e$$=3DR`quz@Vuyk9Pe2>{`!ixL0;
>=20
> delta 62
> zcmdnzI?;*CCD<iIP?3RwasNiH-%OiTSZ+%)icDsd6J{3h72F&sC(Sr{hkQDxhh|KC
> Suv5H%!(<HwyUn=3D@flL4**AWN+
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SY/LRyh7yPUSObT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDdSowACgkQbDjKyiDZ
s5IJtRAAqIbExRN+wcnjkQYq4S4M2Bw7YH0VLRWcylUPZmK7Adxrs7Ly9+NbzAHA
pIW+vq0RXTNt5lVL/xZ2d0DKsTqBBKBYN09pqdNTvoNYgeDdVTB6WeJicQ35awHG
8DzmKl6RfC+T6pTFCrhVrClhiCT9JjLD0hxxyTblyuFpNY0XNw7R4aRQc0mpTjdh
wax19A9pXLZJqkPh8o51zCZ66k/DguxhnMecb9rI8YcMuLZYyJp6OmmW4VsTLUrT
546DrLoqTK6hBLgXIETYJlA1wmPbNdTjVZGgNtYHn6GKomC5XOkIbjYtCuLBnuT8
X5PFJks8aS0ne6lR/7PJDFukAPQTGBeWnr2BiUmQkS2NsaUKcmKn7Xb8zpwEc4EZ
el8vBOHLhZQFfd05ROq6uVfcIOZUMqbuVmbZgczOLMWKHJkx8rlQ7w+R4TgHBiML
GAK3dr0I8OauQgJeI2GMBQAudNYTJhsIEB/E0b0b/ld/KVksxVVRxouJaSy4ivuq
8X94PeHn8QlEqpCYLJeGMwkYn3oBYxqRPyd4sDQSJfMhyoBwadU1xQWwgcnmht7T
d6fgcINA/M0/t2305HkMfXHyeE/yATWtrEhIZuwADZOsvTmB3Qk594OWmCgq+ApJ
jQHgrFQl+zYZx63Vs+q3Bgd5kory58MNZmcxjbACZ/NlskAJvwE=
=bp6o
-----END PGP SIGNATURE-----

--SY/LRyh7yPUSObT5--

