Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550764D8036
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:52:19 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTiJG-00067K-Dv
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:52:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH5-0004bZ-4U
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH2-0004OD-Px
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647255000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OvWci0yWarAwRj37UrhUyvV4jWc9ZT+6Swnw675Ygs=;
 b=B6j3wLZWoMerFLMzY41TubJWeP7wLRrZzU6ZurbcLGl9evznFIT4ajCvocy0BDvL5Wd7/V
 56oSTkSn/MJLsZ3TOfLfS3i84HPcSTqKO3W8dOakHyco9vwlyxs+QJ/jKOUOB0z96Gpyyr
 GISlWtFyvIjBKbzrNeEdPo3cJxS17w4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-L2jFWk7uNNOPPG3JZfeA4g-1; Mon, 14 Mar 2022 06:49:56 -0400
X-MC-Unique: L2jFWk7uNNOPPG3JZfeA4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC42C811E7A;
 Mon, 14 Mar 2022 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3BFE4050C65;
 Mon, 14 Mar 2022 10:49:54 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] docs: rSTify "security-process" page;
 move it to QEMU Git
Date: Mon, 14 Mar 2022 11:49:41 +0100
Message-Id: <20220314104943.513593-2-kchamart@redhat.com>
In-Reply-To: <20220314104943.513593-1-kchamart@redhat.com>
References: <20220314104943.513593-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, eblake@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is based on Paolo's suggestion[1] that the 'security-process'[2]
page being a candidate for docs/devel.

Converted from Markdown to rST using:

    $> pandoc -f markdown -t rst security-process.md \
        -o security-process.rst

It's a 1-1 conversion (I double-checked to the best I could).  I've also
checked that the hyperlinks work correctly post-conversion.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
[2] https://www.qemu.org/contribute/security-process

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst            |   1 +
 docs/devel/security-process.rst | 190 ++++++++++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 docs/devel/security-process.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index afd937535e..424eff9294 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -48,3 +48,4 @@ modifying QEMU's source code.
    trivial-patches
    submitting-a-patch
    submitting-a-pull-request
+   security-process
diff --git a/docs/devel/security-process.rst b/docs/devel/security-process.rst
new file mode 100644
index 0000000000..cc1000fe43
--- /dev/null
+++ b/docs/devel/security-process.rst
@@ -0,0 +1,190 @@
+.. _security-process:
+
+Security Process
+================
+
+Please report any suspected security issue in QEMU to the security
+mailing list at:
+
+-  `<qemu-security@nongnu.org> <https://lists.nongnu.org/mailman/listinfo/qemu-security>`__
+
+To report an issue via `GPG <https://gnupg.org/>`__ encrypted email,
+please send it to the Red Hat Product Security team at:
+
+-  `<secalert@redhat.com> <https://access.redhat.com/security/team/contact/#contact>`__
+
+**Note:** after the triage, encrypted issue details shall be sent to the
+upstream ‘qemu-security’ mailing list for archival purposes.
+
+How to report an issue
+----------------------
+
+-  Please include as many details as possible in the issue report. Ex:
+
+   -  QEMU version, upstream commit/tag
+   -  Host & Guest architecture x86/Arm/PPC, 32/64 bit etc.
+   -  Affected code area/snippets
+   -  Stack traces, crash details
+   -  Malicious inputs/reproducer steps etc.
+   -  Any configurations/settings required to trigger the issue.
+
+-  Please share the QEMU command line used to invoke a guest VM.
+
+-  Please specify whom to acknowledge for reporting this issue.
+
+How we respond
+~~~~~~~~~~~~~~
+
+-  Process of handling security issues comprises following steps:
+
+   0) **Acknowledge:**
+
+   -  A non-automated response email is sent to the reporter(s) to
+      acknowledge the reception of the report. (*60 day’s counter starts
+      here*)
+
+   1) **Triage:**
+
+   -  Examine the issue details and confirm whether the issue is genuine
+   -  Validate if it can be misused for malicious purposes
+   -  Determine its worst case impact and severity
+      [Low/Moderate/Important/Critical]
+
+   2) **Response:**
+
+   -  Negotiate embargo timeline (if required, depending on severity)
+   -  Request a `CVE <https://cveform.mitre.org/>`__ and open an
+      upstream `bug <https://www.qemu.org/contribute/report-a-bug/>`__
+   -  Create an upstream fix patch annotated with
+
+      -  CVE-ID
+      -  Link to an upstream bugzilla
+      -  Reported-by, Tested-by etc. tags
+
+   -  Once the patch is merged, close the upstream bug with a link to
+      the commit
+
+      -  Fixed in:
+
+-  Above security lists are operated by select analysts, maintainers
+   and/or representatives from downstream communities.
+
+-  List members follow a **responsible disclosure** policy. Any
+   non-public information you share about security issues, is kept
+   confidential within members of the QEMU security team and a minimal
+   supporting staff in their affiliated companies. Such information will
+   not be disclosed to third party organisations/individuals without
+   prior permission from the reporter(s).
+
+-  We aim to process security issues within maximum of **60 days**. That
+   is not to say that issues will remain private for 60 days, nope.
+   After the triaging step above
+
+   -  If severity of the issue is sufficiently low, an upstream public
+      bug will be created immediately.
+   -  If severity of the issue requires co-ordinated disclosure at a
+      future date, then the embargo process below is followed, and
+      upstream bug will be opened at the end of the embargo period.
+
+   This will allow upstream contributors to create, test and track fix
+   patch(es).
+
+Publication embargo
+~~~~~~~~~~~~~~~~~~~
+
+-  If a security issue is reported that is not already public and its
+   severity requires coordinated disclosure, then an embargo date will
+   be set and communicated to the reporter(s).
+
+-  Embargo periods will be negotiated by mutual agreement between
+   reporter(s), members of the security list and other relevant parties
+   to the problem. The preferred embargo period is upto `2
+   weeks <https://oss-security.openwall.org/wiki/mailing-lists/distros>`__.
+   However, longer embargoes may be negotiated if the severity of the
+   issue requires it.
+
+-  Members of the security list agree not to publicly disclose any
+   details of an embargoed security issue until its embargo date
+   expires.
+
+CVE allocation
+~~~~~~~~~~~~~~
+
+Each security issue is assigned a `CVE <https://cveform.mitre.org/>`__
+number. The CVE number is allocated by one of the vendor security
+engineers on the security list.
+
+When to contact the QEMU Security List
+--------------------------------------
+
+You should contact the Security List if: \* You think there may be a
+security vulnerability in QEMU. \* You are unsure about how a known
+vulnerability affects QEMU. \* You can contact us in English. We are
+unable to respond in other languages.
+
+When *not* to contact the QEMU Security List
+--------------------------------------------
+
+-  You need assistance in a language other than English.
+-  You require technical assistance (for example, “how do I configure
+   QEMU?”).
+-  You need help upgrading QEMU due to security alerts.
+-  Your issue is not security related.
+
+How impact and severity of a bug is decided
+-------------------------------------------
+
+**Security criterion:** ->
+https://www.qemu.org/docs/master/system/security.html
+
+All security issues in QEMU are not equal. Based on the parts of the
+QEMU sources wherein the bug is found, its impact and severity could
+vary.
+
+In particular, QEMU is used in many different scenarios; some of them
+assume that the guest is trusted, some of them don’t. General
+considerations to triage QEMU issues and decide whether a configuration
+is security sensitive include:
+
+-  Is there any feasible way for a malicious party to exploit this flaw
+   and cause real damage? (e.g. from a guest or via downloadable images)
+-  Does the flaw require access to the management interface? Would the
+   management interface be accessible in the scenario where the flaw
+   could cause real damage?
+-  Is QEMU used in conjunction with a hypervisor (as opposed to TCG
+   binary translation)?
+-  Is QEMU used to offer virtualised production services, as opposed to
+   usage as a development platform?
+
+Whenever some or all of these questions have negative answers, what
+appears to be a major security flaw might be considered of low severity
+because it could only be exercised in use cases where QEMU and
+everything interacting with it is trusted.
+
+For example, consider upstream commit `9201bb9 “sdhci.c: Limit the
+maximum block
+size” <https://gitlab.com/qemu-project/qemu/-/commit/9201bb9>`__, an of
+out of bounds (OOB) memory access (ie. buffer overflow) issue that was
+found and fixed in the SD Host Controller emulation (hw/sd/sdhci.c).
+
+On the surface, this bug appears to be a genuine security flaw, with
+potentially severe implications. But digging further down, there are
+only two ways to use SD Host Controller emulation, one is via
+‘sdhci-pci’ interface and the other is via ‘generic-sdhci’ interface.
+
+Of these two, the ‘sdhci-pci’ interface had actually been disabled by
+default in the upstream QEMU releases (commit `1910913 “sdhci: Make
+device”sdhci-pci" unavailable with
+-device" <https://gitlab.com/qemu-project/qemu/-/commit/1910913>`__ at
+the time the flaw was reported; therefore, guests could not possibly use
+‘sdhci-pci’ for any purpose.
+
+The ‘generic-sdhci’ interface, instead, had only one user in ‘Xilinx
+Zynq Baseboard emulation’ (hw/arm/xilinx_zynq.c). Xilinx Zynq is a
+programmable systems on chip (SoC) device. While QEMU does emulate this
+device, in practice it is used to facilitate cross-platform
+developmental efforts, i.e. QEMU is used to write programs for the SoC
+device. In such developer environments, it is generally assumed that the
+guest is trusted.
+
+And thus, this buffer overflow turned out to be a security non-issue.
-- 
2.33.1


