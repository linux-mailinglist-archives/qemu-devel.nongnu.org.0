Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00E600F83
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:51:32 +0200 (CEST)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPad-0002Vr-K1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okPT3-00042T-J4
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:43:42 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okPT0-00036w-MZ
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:43:41 -0400
Received: by mail-io1-xd2c.google.com with SMTP id o65so8910366iof.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B0zbiBP3+7WEd64Q3MURz5VBn4pvkKaXYBu8pvNOv7o=;
 b=wOBy/z3nFd6o53PnNyZX8Wf6ZMS4Suq55iQJii282yv0BZPPMrK+QC9lHbJb15BfyL
 3xH1bvBOEgtk8CURUguvvKWx34DsqrjxsG7Tm1KSPfnzY02mhfcJXkQUSXixlkQPKZdG
 dCCTeXe4jnkPUxc3uJfP85vG4F9gP/HLm/u44U0xR5I/5yHyeeEOQC5n2QM2897vEAe0
 xVleMjHQmiLTv9qdf/owhQxk3tEOgsq4PT2zex7A0SYvjg7cKI7r8AFcrWvBxJLGAt20
 /M2WpIMxn/NQjzpaEC3ANlZxFl0OqupVHus98fAwn9hRrHzKuWhRClAcV/gZ5/DoIV0B
 a2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0zbiBP3+7WEd64Q3MURz5VBn4pvkKaXYBu8pvNOv7o=;
 b=JY/NYyPC2SXa/JWOn+OSOL7soq7vwwWDrCtgLBlh9rqObYscBZmjDlO1BhqwUtB8p+
 ajJFvKa6J/DK6mCGAuW4tD9mP0UQw/ai5p4cJk+XKovFjtmbussaNtkpiwVmxL9KHfue
 /SnEjebAJqFD8ooPvtn/6Tk4nCOp7J8J4k5IErXytYIFZOCqG9aBfqwQc3ar6MUVuGXC
 uL+yZePBj9TScKPYV5ol1TJ7DFHWkwHLsmhch+kCCAeZ7gvFaJovEcn4/3diAawshMcA
 HpVTN2rkfcLBHCnGkyPBxKsS1optKIYTRjiszBj6XMAi2sm6sHfVOGVXDdOxd5e6pnYa
 HA2w==
X-Gm-Message-State: ACrzQf0tzWiZrqBKwjg/9hPsxEOtOo1y0SwJqW3nhB2z/IC25SV09kaB
 e3cM9CfwrN7WJAgKxLCFvsABCNMzu8gr1paFEEw58A==
X-Google-Smtp-Source: AMsMyM7Lx5SJUxYLhsgA75dqlxH8nYNtTF9r1F9zoYyXkKsgrtzKHt0k0PbLQpd2C8kE9w0eZYgxbYRv7rubvnR0yQU=
X-Received: by 2002:a05:6638:25ca:b0:363:e467:3d7d with SMTP id
 u10-20020a05663825ca00b00363e4673d7dmr5399233jat.174.1666010617003; Mon, 17
 Oct 2022 05:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221017102146.2254096-1-imammedo@redhat.com>
 <20221017102146.2254096-9-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-9-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 17 Oct 2022 18:13:14 +0530
Message-ID: <CAARzgwzn3X54FvLUsQ3P5GEP9mhOW_mJh+rZZwDDgSHxss_Vwg@mail.gmail.com>
Subject: Re: [PATCH 08/11] tests: acpi: update expected blobs
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 3:52 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> Expected change in q35 tests:
>         @@ -2797,14 +2797,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>                  }
>              }
>
>         -    Scope (_SB.PCI0)
>         -    {
>         -        Device (SMB0)
>         -        {
>         -            Name (_ADR, 0x001F0003)  // _ADR: Address
>         -        }
>         -    }
>         -
>              Scope (_SB)
>              {
>                  Device (HPET)
>         @@ -3282,6 +3274,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>                          }
>                      }
>
>         +            Device (SFB)
>         +            {
>         +                Name (_ADR, 0x001F0003)  // _ADR: Address
>         +            }
>         +

Which code generates this hunk? Shouldn't this be "SMB0" for Device?

>                      Method (PCNT, 0, NotSerialized)
>                      {
>                      }
>
> Also for ipmismbus test, child 'Device (MI1)' of SMB0 will be moved along with it
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |  21 --------------------
>  tests/data/acpi/q35/DSDT                    | Bin 8418 -> 8407 bytes
>  tests/data/acpi/q35/DSDT.acpierst           | Bin 8435 -> 8424 bytes
>  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9743 -> 9732 bytes
>  tests/data/acpi/q35/DSDT.applesmc           | Bin 8464 -> 8453 bytes
>  tests/data/acpi/q35/DSDT.bridge             | Bin 11547 -> 11536 bytes
>  tests/data/acpi/q35/DSDT.cphp               | Bin 8882 -> 8871 bytes
>  tests/data/acpi/q35/DSDT.cxl                | Bin 9744 -> 9733 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 10072 -> 10061 bytes
>  tests/data/acpi/q35/DSDT.ipmibt             | Bin 8493 -> 8482 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8507 -> 8495 bytes
>  tests/data/acpi/q35/DSDT.ivrs               | Bin 8435 -> 8424 bytes
>  tests/data/acpi/q35/DSDT.memhp              | Bin 9777 -> 9766 bytes
>  tests/data/acpi/q35/DSDT.mmio64             | Bin 9548 -> 9537 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8738 -> 8727 bytes
>  tests/data/acpi/q35/DSDT.nohpet             | Bin 8276 -> 8265 bytes
>  tests/data/acpi/q35/DSDT.numamem            | Bin 8424 -> 8413 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8519 -> 8508 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 9024 -> 9013 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 9050 -> 9039 bytes
>  tests/data/acpi/q35/DSDT.viot               | Bin 9527 -> 9516 bytes
>  tests/data/acpi/q35/DSDT.xapic              | Bin 35781 -> 35770 bytes
>  22 files changed, 21 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index fd5852776c..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,22 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/q35/DSDT.acpierst",
> -"tests/data/acpi/q35/DSDT.acpihmat",
> -"tests/data/acpi/q35/DSDT.applesmc",
> -"tests/data/acpi/q35/DSDT.bridge",
> -"tests/data/acpi/q35/DSDT.cphp",
> -"tests/data/acpi/q35/DSDT.cxl",
> -"tests/data/acpi/q35/DSDT.dimmpxm",
> -"tests/data/acpi/q35/DSDT.ipmibt",
> -"tests/data/acpi/q35/DSDT.ipmismbus",
> -"tests/data/acpi/q35/DSDT.ivrs",
> -"tests/data/acpi/q35/DSDT.memhp",
> -"tests/data/acpi/q35/DSDT.mmio64",
> -"tests/data/acpi/q35/DSDT.multi-bridge",
> -"tests/data/acpi/q35/DSDT.nohpet",
> -"tests/data/acpi/q35/DSDT.numamem",
> -"tests/data/acpi/q35/DSDT.pvpanic-isa",
> -"tests/data/acpi/q35/DSDT.tis.tpm12",
> -"tests/data/acpi/q35/DSDT.tis.tpm2",
> -"tests/data/acpi/q35/DSDT.viot",
> -"tests/data/acpi/q35/DSDT.xapic",
> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> index ea35dc5eba8433a8dcb54815f19ed6239f2534e7..c8a2b5df26608f10c75ab8f2f9e404fda987891b 100644
> GIT binary patch
> delta 65
> zcmaFlc-@i9CD<k8x&i|Oqx(iKK8ejH66@Hw92H~YgPr09JQX&-k$cZ55#7We?B*2D
> V5%1^{#KX)W&mh7U;OrN|004sf5rO~!
>
> delta 76
> zcmcca_{fpVCD<k8kpcq)<A#k~d=k>qdhx+d@d3`B2GLFY!M;ug9Py4WK|IV1@(i2B
> eCDyZXIVi+{R0w#;Z@wV+o{?RIEx_3?gaH6HQWQi0
>
> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
> index 146269c68c68238a8be3aa67e049a85c0b8edc66..eb63e439b92424e4c50b7e5f1df92da54ecfc6ea 100644
> GIT binary patch
> delta 64
> zcmezD_`;FPCD<k8g#rTu<MWMNd=i^YB-XKUIVr`&2Rp?JcquM^BgZ5W-NYa4<`mBn
> U@8}Z5!^|MhAi@^l>=(iS0Ek8rTL1t6
>
> delta 75
> zcmaFi_}P)mCD<k8vjPJHW57l(J_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> d66@Kx92H|gDg-<g7GIEKVi#cxaP|vf000r=6CD5m
>
> diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
> index 4dd420b62fbcfdd21485fec2bafdea54f3fdb5a8..f9199a0dd614b30c9e73eb7de7e051ce84c1d73f 100644
> GIT binary patch
> delta 65
> zcmeD8Y4PE533dr#QDb0WWZuZdC$ZT?;x;#zqhd^auv5H%r^04QmG_Ji(M|lpZcgzW
> U@s2J*Jj@L83?gg+&VC^b02Q4NMgRZ+
>
> delta 76
> zcmZqi>G$Ds33dtLS7Tsc%-P7rCm}7Z7a!~tAK>h15Z%Nd?CWH}5%1^{#KX)W&#+ls
> d;tn^LgF*~Qg@A|r=D*7C8QDeH0-XIq7y!*W69)hQ
>
> diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
> index ff25d82ba24b5e792b9d87958aa1b162bc9e0de2..286a4ecec273ca0e2fe2d65f80e8566a68a2f794 100644
> GIT binary patch
> delta 65
> zcmbQ>)au0L66_Mfs>r~=D6x@?Phzu)#5y)Ef906?V5fKicje7*<Ybv7qMP`G-JIe%
> U;vHRrc$gXF8AR9uoc%%=01xsHAOHXW
>
> delta 76
> zcmZp5n&8Cc66_Kppvb_$*tn64PeNK+FFx2QKET=2Ai9Y^*w@K`Bi_*^h=-X$o?)}N
> d#CkR^KcyIu3IR8z%@^cknb<|x0-XIq7y!Nm5#j&<
>
> diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
> index bde84efd1c5fcafee789781f4030d573002a886a..9a733a54e428d3506aaf73f8d4c1f28324a71a42 100644
> GIT binary patch
> delta 75
> zcmbOoH6e=2CD<iIK$n4m@!Li&K8ejH66@Hwyq?6w2Rp?JI6c|?Mox}TDY}V2*v%=P
> dBi_*^h=-X$o<T$)z}YW^Ax<yY&>$Yf1OQ7T6vzMo
>
> delta 86
> zcmbObH9LySCD<iIT9<)=F@7T#pM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> niS=w;o{wWdDg+!KZ@wTW$0sNv5a8?=!VsqyY-j+~=NAG1zta|q
>
> diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
> index 537be7ca37c021e6a7f098e88c40ba178f3ec3e2..8579626c7f1f035c8d400544c2af6ce6372a5625 100644
> GIT binary patch
> delta 65
> zcmdnwy4;n^CD<ioxe@~d<LZrEd=i^YB<eW092H~YgPr09JQX(YQFzZN5#7We?B*2D
> V5%1^{#KX)W&mh7U;OrN|003#(5d;7L
>
> delta 76
> zcmZ4Py2+KxCD<iolM(|1qsT@sJ_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e67?Kh4hk_K6#^den-?g&XJi*)3vl)eVE_Q*#}dW>
>
> diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
> index aeea64d1cecad0ad011870ed5e04bfea1ae62510..96594c00b3b0e0a4933d6d851d927487ad4d18eb 100644
> GIT binary patch
> delta 65
> zcmbQ>)9S<J66_Mfs>Z;;Xupw*Phzu)#4c_wXXTjqV5fKiZ>7yYlm(e2qMP`G-JIe%
> U;vHRrc$gXF8AR9uoc%%=03WdrZ2$lO
>
> delta 76
> zcmZqmnc&0a66_KppvJ(!xMCw0pM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> eiQU{>PD(K#6#`z0o9`$KGO>%W1vvYKFaQA0rV=jz
>
> diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
> index ed11aefa4a56a8408bd4e0de83bf2373e6025449..e2a3ecf7d90c8c411550505c3b70bf8d19ba4bc9 100644
> GIT binary patch
> delta 65
> zcmccNch--~CD<jzSDk@@amq$6K8ejH5-Pl0j*2ny!A|i4o(h|jRNpg7L^tsVyE(;k
> V#5=kK@h~&UGl;MSIQxY#002@W5KI67
>
> delta 76
> zcmX@>cf*g%CD<h-LY;wu@$W`1J_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e5~{ph4hk_K6#^deo8463GqQ`Y1vvYKFaQ7)&=U>-
>
> diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
> index d9d1e75c987acd42be4576688621be07b21f0e7b..427272b95692099edc47f569e41fbb3ba69f6b60 100644
> GIT binary patch
> delta 65
> zcmZ4Mw8)9eCD<iINs)npF=itdpTuSpiFIsTKB_VC!A|i4E~=Z~$XPK-L^tsVyE(;k
> V#5=kK@h~&UGl;MSIQxY#001=^57qzx
>
> delta 76
> zcmZ4FwAP8sCD<iISCN5%@#sb_J_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e66@Kxyj5aADg>NWHeZmlVqzCz3vl)eVE_Q=2@;q9
>
> diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
> index f6e124137721312722c820b5c084a143492945c9..794779e75aaf33902de834caaa6b0763c4513615 100644
> GIT binary patch
> delta 61
> zcmdn(wBCu!CD<iIUy*@<@%2V7K8ek}66@HwJk?_2gPr099Mv|v%D-pih;DLc3wCpg
> RpR6sB$S%Sb;OrN|001n-5byv1
>
> delta 72
> zcmZ4QwA+cxCD<jzT9JW)QEwv`pM<aryIy>-Q+$B4r$Ka+J6o`?lfmTU3W=M=CDyZX
> aIVi+{Bn3R=H(!u@&&V#q7U1j`!T<onCKIFp
>
> diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
> index 146269c68c68238a8be3aa67e049a85c0b8edc66..eb63e439b92424e4c50b7e5f1df92da54ecfc6ea 100644
> GIT binary patch
> delta 64
> zcmezD_`;FPCD<k8g#rTu<MWMNd=i^YB-XKUIVr`&2Rp?JcquM^BgZ5W-NYa4<`mBn
> U@8}Z5!^|MhAi@^l>=(iS0Ek8rTL1t6
>
> delta 75
> zcmaFi_}P)mCD<k8vjPJHW57l(J_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> d66@Kx92H|gDg-<g7GIEKVi#cxaP|vf000r=6CD5m
>
> diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
> index 3e79ba7ac0b9a466fddd2213f32d20c522b8613b..923e213ab6a3c82faa6f659c29de9c8afb6878dd 100644
> GIT binary patch
> delta 65
> zcmdn!v&@IfCD<iIO^tzp(PASPpTuSpiND-jj*2ny!A|i4o(h|-Ro*j7L^tsVyE(;k
> V#5=kK@h~&UGl;MSIQxY#002TP5G4Qr
>
> delta 76
> zcmZ4Hv(bmkCD<jzP>q3sap6WTJ_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e692fl928<eDg->_H_NNMXJi*)3vl)eVE_Q{`4Z;<
>
> diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
> index afc260ebf4d91a2a9f7be5ff21968e99b1f9c5d1..a77aa37ca0bb407abbef134e8dce4461070856a2 100644
> GIT binary patch
> delta 64
> zcmX@(b<m5;CD<jzQI&y#@ykXoK8ejH671YuPD(NH!A|i4UW$udm6;@>oA`s>oZ>m+
> T9bJNWm>J|5MA!nH{X!T3EYS}}
>
> delta 75
> zcmX@;b;gU!CD<jzN0otrF?J&tpM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> c2@Y;9N5vSB3IR`r#hS`Y>>_Ld&VC^b0K(`I2mk;8
>
> diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
> index 7c14ce3a986fa06e88f3adc088faae54bdd2d8e4..43469e6c89813025b902534ed61d39ad940ff7bb 100644
> GIT binary patch
> delta 85
> zcmZ4FGTnvCCD<iIT#12!apOiVK8ejH66@Hw98F{5gPr09JWV#gk&|ZDiEiQ#c5{m7
> hh<9`e;$dcxXAqGJaP|vfh|>!;w2TKaK`a9>3jo0872^N^
>
> delta 72
> zcmbR4vdD$YCD<iINr{1hQEDR>pM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> aiS=w;4kj@m6#^c{n=i;oGf)1bC=CF0xDr7C
>
> diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
> index 60595f55fc72397e3ed9b1999dddd39cd98f89a8..e17b252b03b290ba39601afffbee66159a57bfb1 100644
> GIT binary patch
> delta 65
> zcmccOaMFRxCD<jzQ-OhjQD7q%pTuSp2?aJTN5z=<V5fKiPle5Ka_<=>qMP`G-JIe%
> U;vHRrc$gXF8AR9uoc%%=04azMg8%>k
>
> delta 76
> zcmX@<aK(YkCD<h-M1g^Uv2r69pM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> d2}L$82Zb1r3IPxK%}#Rf8QDeH0-XIq7y#w#5=8(2
>
> diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
> index 68e67eb91097c58365e3734c9b35d32796639d54..ade716519de8bd626b3cddee686f55757bb4eb35 100644
> GIT binary patch
> delta 65
> zcmaFic-N83CD<k8t^xxC<HwC$d=i^YB(|_|IV#4)2Rp?Jcq(lEB=??CBD#q`*v%=P
> VBi_*^h=-X$o<W2yz}YW^0RXDm5=sC7
>
> delta 76
> zcmccX_`;FPCD<k8g#rTuW7I}2J_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e5?k50928<eDg->_H(!%`&&V#q7U1j`!T<m#coYl(
>
> diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
> index 811cd27c7e7366e61683c7c5ef67f0996f395c25..b6740b1ec2f4e01bdbdc34bc8bf0a2c36f134671 100644
> GIT binary patch
> delta 65
> zcmX@^w8x3dCD<jzMv;Mm@zq8yK8ejH66@Hw+|*;@gPr09{M0tTkqcpxh;HH!c5{m7
> Vh<9`e;$dcxXAofvaP|vf003u>5Yqqv
>
> delta 76
> zcmdnvbli!{CD<jzU6Fx-F?b^vpM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> eiS=w;u4*wL6#~Ahn=i<PFtLlU1vvYKFaQAK!4j1K
>
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
> index 7a213e3db230064cedf3a30b83b11128286eaeba..5bc095351fd009fb2171daaa4f824c5cc9f36819 100644
> GIT binary patch
> delta 65
> zcmX@$w$+WxCD<jzRGEQ+v3w&JpTuSpiCt`5&TcXB!A|i4-maT}$T_k|L^tsVyE(;k
> V#5=kK@h~&UGl;MSIQxY#0037w5R?D_
>
> delta 76
> zcmdn$cEF9xCD<jzL79Pp@xeweJ_%`Qz4&0K_yA{5gXkvyU|%N#j(A6xARcB0d4|p6
> e61&;BoLpl-Dg?Y-Hs6tRWMLO!3vl)eVE_OJ;S*K>
>
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
> index b55e828c6397f80c14de82f371fa34553008a875..47417f47f7e25576f31207cb0b752b8c086a4480 100644
> GIT binary patch
> delta 65
> zcmccRcHWK4CD<jzUzve{QFtR4pTuSpiCt`5zV0#c!A|i4uI`(E$VIbAL^tsVyE(;k
> V#5=kK@h~&UGl;MSIQxY#003F<5T5`5
>
> delta 76
> zcmX@_cFT>+CD<h-N|}Lyv1TI|pM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> eiQQ~mK5j7}6#_19oA1a)v#^V>1vvYKFaQ7tbrWF#
>
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> index a8a93fe70d8e98ec0e66278b45d36393b75740ec..574b8a0094c556cd8555b7a4e1b92b2d5f64750a 100644
> GIT binary patch
> delta 65
> zcmdn)wZ@CfCD<iIN0otr@ySLmK8ejH68pKhTvcP@gPr09d{s98RWfFhh;HH!c5{m7
> Vh<9`e;$dcxXAofvaP|vf003b*5VQaQ
>
> delta 76
> zcmZ4EwcU%$CD<jzT$O==(RU*kpM<ouUVN}qe1Nm3L39&;u&<K=N4%p;5DznhJi}&j
> ei340*E-En~6#_oWn;$9}GqH=X1vvYKFaQAC!xDA?
>
> diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
> index 8211f5af8f9433b66b64768acb1de61a5716152a..74381116ad7f01a860fee9201df38d1ea24a0be6 100644
> GIT binary patch
> delta 67
> zcmX>)ooUx}CN7s?myliE3=E8aH*)bwY&MaYSjgq57!x1t6ffYZu=#xFdq#=qCjMYI
> Xr+AKdN0%TTW(Ii%5w-wlzYqoh?b#EU
>
> delta 78
> zcmdlro$2UwCN7s?myn~~3=E8E8@c!-q^0%ZgPr07oIMSqoA`r$oeVhQ9bJNWm>J|5
> gHj7J4D&%rdhyke(@Q~lUx$`|Ey9ir=vtI}U0BHvmS^xk5
>
> --
> 2.31.1
>

