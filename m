Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB7667576
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBc-0002iA-55; Thu, 12 Jan 2023 09:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBK-0002HY-Ba
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBG-00061P-I4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLCtpuuKUwCCPYPde+dgPmG7uJCNWQPdUnIrpvJyvB4=;
 b=ga82GAXiRsXsEkxyia8ssLAWMLavUzdAgBRCaA7uILKyVUpG9W676KgUn+JuDoDoVb/LWZ
 fJbUH4u26jYGA5v7K0EoCHCGyaQn19/5WrnqwxHIGXtD+1ErtO3wAxyuxNHJMXB673A8kJ
 ZjimPGmtn/8TIv9tiZXJ7WdJft+gibI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-yBh8iV6NNqW9d7HUFW43ag-1; Thu, 12 Jan 2023 09:03:43 -0500
X-MC-Unique: yBh8iV6NNqW9d7HUFW43ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D301C0041B;
 Thu, 12 Jan 2023 14:03:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A11444085720;
 Thu, 12 Jan 2023 14:03:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 37/40] tests: acpi: update expected blobs
Date: Thu, 12 Jan 2023 15:03:09 +0100
Message-Id: <20230112140312.3096331-38-imammedo@redhat.com>
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

expected change is removal of dynamic _DSM bits from slots populated
by coldplugged bridges (something like):

    -            Scope (S18)
    -            {
    -                Name (ASUN, 0x03)
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
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.bridge              | Bin 12699 -> 12614 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6459 -> 6416 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 9787 -> 9745 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12423 -> 12337 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a83322cb08..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 4c2d77b8051de2ed21fe43c8283003d8083747f7..d65d9f053910d4ef8a77fe7f9015768dd48a53f8 100644
GIT binary patch
delta 65
zcmbQ8d@PB}CD<jz&5(hC@y153a&GQ6f2NrDV5fM2Ucb#f+&>tZT5319@y_I7a%Gt;
VsHQpj0zcd4Dyf6qo72=xxdF4y6yg8?

delta 64
zcmV-G0KfmnVw+<ML{mgmn=t?Y0qn5~cMA)PR03RIQ$k-5f>g7N3-|#7j(@X;4Ves+
Wyd^5L9~$xt0V<Pc8Y#07CN>MlAQdeD

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index ce2e1430a38b467b212573a896b94c306caa12fb..c8b388a85c8d7472a5370c9657fa2b4e1a897e38 100644
GIT binary patch
delta 40
wcmdmOG{K0=CD<iIK$3xh@$p8ka&9i?OEK}mPVoZX7dLlv&t=*i%=dx|0Qu4l8vp<R

delta 57
zcmbPWwA+ZwCD<jzT9Sc*F?l0bIX9Qzm6-Tor+5LkE1SEy=Q8nV1sht#b2tWv`f)K&
NW)za!tj_n63jo>=5C;GN

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 578de7540f6f09c05ad81f62abd142be8cb288ee..657c8263f0c649abc806a67576fd74cb32af60c3 100644
GIT binary patch
delta 58
zcmdn(Gtr03CD<iIP>q3sF=HcFIX8FrT*jFAV5fM2rn#GYxPLG*wbyKJ<1OWxtRTd?
OIg+o6bMq4A=}Z6+RuYx~

delta 66
zcmbQ}v)hNuCD<jzT8)8$@y|xCa&GR{1&lHA!A|i4J@YsBaQ|RrYOLSf##_q6BcK^<
WU=h#Z7#!-yIC&$#+~(hsVmtuEyA;^~

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 502ae9e745a3899378ea770725836da347d1f804..66b39be294a261a6bd991c6bcbd8e2a04a03403f 100644
GIT binary patch
delta 81
zcmZoq+?c@S66_LUXu!b0*uIggQI5;|e@uL^Q@nul|IO3o44Finjs_cA#&g6wx&-ks
lGB7hlH#r^Nd`Cf(hfjpfCCo2`iNh(_)rX6DbGohqGXU$L7Q6re

delta 96
zcmdm((4NTU66_MvZot66sJD@;QI4mPl`$qh*ePD1gN1SPR5?Q?5w}yphL-Uh@s2J*
wJd6y?4AD(KM>pS6(Bxqf(41VLpdlc_<`U)?!o=Ye?CQhC3=!NcsH?yX0Mzgp3IG5A

-- 
2.31.1


