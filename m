Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9C66745A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:06:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBU-0002Rg-Vc; Thu, 12 Jan 2023 09:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBM-0002IE-1L
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBI-00062F-7Z
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRXNZcrAKzLcv6sbR6mR0bElefVEIs0jwpufh6V8hv4=;
 b=IMBfIfnqQLEObzx6n1we2HKY5tnxK+A3Enyq4N7QKC27P1WScFYTsYJSWGIbCFXJpEE1ML
 OuUmi9bInv59U0rsbB//r7AjhMdvZndz0JSIbPYm2pi0t2/EqsRNl2F2gfMSnaqJ57uEqy
 CHm4Lr2b6+pE3HfqjNB0fvPilJElf/E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657--nFzPlnmNei9y4AZgrXX1w-1; Thu, 12 Jan 2023 09:03:46 -0500
X-MC-Unique: -nFzPlnmNei9y4AZgrXX1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A6392807D76;
 Thu, 12 Jan 2023 14:03:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14AA84085720;
 Thu, 12 Jan 2023 14:03:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 40/40] tests: acpi: update expected blobs
Date: Thu, 12 Jan 2023 15:03:12 +0100
Message-Id: <20230112140312.3096331-41-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Expected change removal of dynamic _DSM AML for non-hotpluggable
hots-bridge, storage, isa bridge devices from PC machine blobs:

  -            Scope (S00)
  -            {
  -                Name (ASUN, Zero)
  -                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  -                {
  -                    Local0 = Package (0x02)
  -                        {
  -                            BSEL,
  -                            ASUN
  -                        }
  -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  -                }
  -            }
  -
  -            Scope (S08)
  -            {
  -                Name (ASUN, One)
  -                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  -                {
  -                    Local0 = Package (0x02)
  -                        {
  -                            BSEL,
  -                            ASUN
  -                        }
  -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  -                }
  -            }
  -
  -            Scope (S10)
  -            {
  -                Name (ASUN, 0x02)
  -                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  -                {
  -                    Local0 = Package (0x02)
  -                        {
  -                            BSEL,
  -                            ASUN
  -                        }
  -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  -                }
  -            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
 tests/data/acpi/pc/DSDT                     | Bin 6487 -> 6360 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6453 -> 6283 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7812 -> 7685 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 12614 -> 12487 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6951 -> 6824 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 8141 -> 8014 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6416 -> 6289 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6559 -> 6432 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7846 -> 7719 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6345 -> 6218 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6493 -> 6366 bytes
 12 files changed, 11 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 0adf61bac3..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,12 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index 1bc656f2a4897d2932d593e8768173e0d2597d45..0b475fb5a966543fef2cd7672a0b198838a63151 100644
GIT binary patch
delta 40
wcmca^bi<I#CD<k8h6Dox<GGDo<=kA}=VIc6o#F+Y&u#AJ{>`|Vl`n`J03N^%qW}N^

delta 92
zcmca%c-@H0CD<h-T#|u-al%Hfa&9iKYccV`PVoXx*EV-^|7PS7&<r*(i05z&4)tT0
f?8qkv7O;Q_FoFbl1+;<<p(?nTKq8ylc!RhB#Qhje

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 0d4639906ddce689b3dcd9d749c79e3a511d548a..17ef7caeb6fe4445f1234ff060c3db6809184ef6 100644
GIT binary patch
delta 40
wcmdmL)NRP+66_MvEy2LR=(~}toSVz<WK4XpQ@nuN$<5u|JWQJ%`Mz)g0P_G0Q2+n{

delta 110
zcmeA++-k(-66_LUD#^gWIBz3YIX9Qbm6-Tor+5K}E1SEyd6;+vG=mKc;yE0HL;V;g
lGxEuS1uP%}j35DC0j*#|s0uD7xCm4U7c)p?^K{-XTmbFv8Z-a^

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 5077adb043e8021c62e3bf1355bb9645b27e9d2c..675b674eaa92d99513ac243a97064d369791ee53 100644
GIT binary patch
delta 40
wcmZp%ZMETY33dr#m1AIF?Apk+M1aftTugkhQ@nulxy?HSelu=15)R@90Po`rm;e9(

delta 92
zcmZp*X|d&U33dr-kz-(B^xep{M1afdT1<SfQ@nuFwaq&Oelzk2Xa*Y?#B(?Xhx##0
fP85*?3s^t|7(oKO0$Ra_P!(KEAd$_Rg@U*Nv?Ca_

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index d65d9f053910d4ef8a77fe7f9015768dd48a53f8..c1ce06136619f55c084a34c51997c059c29cb06a 100644
GIT binary patch
delta 41
wcmX?>bUcyECD<k8xB&wLqu55Sa&GQ+ccz&5V5fM2KDW(1+-y>t1=UQs0S`?J*8l(j

delta 71
zcmX?}cr1y_CD<jz&5(hC@y153a&GQ6f2NrDV5fM2Ucb#f+-y>env?HJYVZhX1{+w!
bb2tWv`Y}#U<d<U-(3-3$rMY>csu?!`@?jHo

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index ef487176e117acf8f271d0a54bfad8dfa33ef696..754ab854dc48fc1af2d335e7269c23a056e66eb8 100644
GIT binary patch
delta 40
wcmZ2(w!)OlCD<iog%kq=qtQk#cU~^<b20J3PVoZH=Qc<4{$|{Kl|P6Z0Qpo5_5c6?

delta 92
zcmZ2sy4;M*CD<iIU7CS`@ykXocU~^9YccV`PVoXx*EUD<{$}J6&<r*(i05z&4)tT0
fEGQrc7O;Q_FoFbl1+;<<p(?nTKq8yN_=C6sjxQG%

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index d32787aa8669517f6ebbe2e6d6f1f58bb5964ad9..170503336b3fd94cc7a4356003fa080f0ef57b01 100644
GIT binary patch
delta 40
wcmX?Wf6k7}CD<jzPo9B+@$W{iw}M>W=VIc6o#F+Y&uwND`pvkxS|o@Y036s2$^ZZW

delta 92
zcmX?Sch;WECD<k8tULn)<AIG_Zw0x$uEoR$JH-n)UE9nk^qY}KKr`6DAfCf9IMk0}
g@<VYsuz&?bfDt6XE1(r@2vxzw1QOZ&M>vQZ05_H!ZvX%Q

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index c8b388a85c8d7472a5370c9657fa2b4e1a897e38..834c27002edbd3e2298a71c9ff1b501e3a3314f7 100644
GIT binary patch
delta 40
wcmbPWG|`aDCD<ioq67m2qvA%ca&9h{Q!(+uPVoXhCpUL<%Q0=%;CsOZ0O|7!_5c6?

delta 91
zcmbPeIKha^CD<iIK$3xh@$p8ka&9i?OEK}mPVoZX7dLlv%Q10l1{)Z}b2tWv`Y}v4
h6qMr;018+@1Q<aAyaHOmhENq;OdyfXD|laW0RT^!7ia(g

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 119885e89c14f2d59839d04e2d6ae67db75e3748..dd7135602709fc4a361930c74f9bebc6b32e6916 100644
GIT binary patch
delta 40
wcmbPlyugUdCD<iIL6U)i(Q_kLIX9Q{<(T+jr+5MHOPjm7otZZK@&$1N0OqO-lK=n!

delta 92
zcmZ2rG~bxZCD<ioz9a(!BhN;za&9iC+cELMPVoX>w>EckJ2UYJXa*Y?#B(?Xhx##0
f78H~N3s^t|7(oKO0$Ra_P!(KEAd$`Ic!RhBSb!F`

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 45b434d485444750cf00ebc1b2658f2fa40f0884..2f895e9b385c1ae2f58c7ade4de02328b1be7356 100644
GIT binary patch
delta 40
wcmZ2xyWED$CD<iIU5<f)asNiHV**^>=VIc6o#F+Y&uzXX@SAaSh;R@$00@>1nE(I)

delta 92
zcmZ2(v&@#uCD<ionH&QHW79^iV**@W*J9#>o#F+Yu5G?0@SBlGKr`6DAfCf9IMk0}
g@<U-cuz&?bfDt6XE1(r@2vxzw1QOYNRVauX03cW!G5`Po

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index dbed1404bb70eebf1c3cf0f882d3b4b7cccd53a8..c012b63ace2f359eec0368ed22ef507ee3905c78 100644
GIT binary patch
delta 40
wcmX?Uc*=mwCD<jzOM-!car#ECmt0)l=VIc6o#F+Y&u#w8^_y{XId2d*025CR6951J

delta 92
zcmX?QaMF;=CD<k8qyz&4W7I~jmt0(4*J9#>o#F+Yu5JFy^_!7LKr`6DAfCf9IMk0}
gvLLS<Sik}zzz7oH70?PcgsR|T0*P$?!4t#{0R5U7DgXcg

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 6ee52f1230445c0dff01c77e72a74ca37e5864f1..f2ef4b97290cc58c514c3ce7fd45cb08214d7138 100644
GIT binary patch
delta 40
wcmca>bkC5>CD<k8o&*B}W5q_UT5c}yb20J3PVoZH=QdB|{>`|Vn=gnP02yixaR2}S

delta 92
zcmca-c-M%_CD<h-R+52%(P|@CEjO3fwV3!|r+5LUYnvx>|7PS7&<r*(i05z&4)tT0
fTqr097O;Q_FoFbl1+;<<p(?nTKq8xac!RhB!<87c

-- 
2.31.1


