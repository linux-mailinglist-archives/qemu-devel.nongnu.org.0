Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554BB6BDBB9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 23:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcw7z-0004dI-7j; Thu, 16 Mar 2023 18:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pcw7w-0004cf-Mc
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 18:31:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pcw7u-0006mm-Qc
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 18:31:16 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E2D9C11EF56;
 Thu, 16 Mar 2023 22:31:12 +0000 (UTC)
From: ~titilola <titilola@git.sr.ht>
Date: Thu, 16 Mar 2023 22:31:12 +0000
Subject: [PATCH docs_and_memory_encryption 0/1] An attempt to convert txt file
 to rst 
MIME-Version: 1.0
Message-ID: <167900587283.17294.3216999325882003760-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, oluwafunhmi@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~titilola <oluwafunhmi@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

=3D=3D=3D=3D=3D=3D
PULL 16/26
=3D=3D=3D=3D=3D=3D

:Subject: docs: add firmware feature flags
:Author: Gerd Hoffmann <kraxel@redhat.com>
:Date: 2022-10-13 6:52 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This patch adds information about firmware feature flags.

Changes
=3D=3D=3D=3D=3D=3D=3D

- Add information about firmware feature flags to documentation.

Doc Updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Update documentation with information about firmware feature flags.

File Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- No file changes.

=3D=3D=3D=3D=3D=3D
PATCH v2
=3D=3D=3D=3D=3D=3D

:Subject: docs: add firmware feature flags
:Author: Gerd Hoffmann <kraxel@redhat.com>
:Date: 2022-09-30 13:32 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This patch adds information about firmware feature flags.

Changes
=3D=3D=3D=3D=3D=3D=3D

- Add information about firmware feature flags to documentation.

Doc Updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Update documentation with information about firmware feature flags.

File Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- No file changes.

=3D=3D=3D=3D=3D=3D
Re: [PATCH]
=3D=3D=3D=3D=3D=3D

:Subject: docs: add firmware feature flags
:Author: Kashyap Chamarthy <kchamart@redhat.com>
:Date: 2022-09-30 9:34 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a response to a previous patch that added information about
firmware feature flags.

Comment
=3D=3D=3D=3D=3D=3D=3D

The patch looks good. Reviewed-by: Kashyap Chamarthy
<kchamart@redhat.com>

=3D=3D=3D=3D=3D=3D
PATCH
=3D=3D=3D=3D=3D=3D

:Subject: docs: add firmware feature flags
:Author: Gerd Hoffmann <kraxel@redhat.com>
:Date: 2022-09-30 9:18 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This patch adds information about firmware feature flags.

Changes
=3D=3D=3D=3D=3D=3D=3D

- Add information about firmware feature flags to documentation.

Doc Updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Update documentation with information about firmware feature flags.

File Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- No file changes.

=3D=3D=3D=3D=3D=3D
Re: [PATCH v2]
=3D=3D=3D=3D=3D=3D

:Subject: docs: Add measurement calculation details to amd-memory-
encryption.txt
:Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
:Date: 2022-02-16 19:01 UTC

Comment
=3D=3D=3D=3D=3D=3D=3D

The patch looks good. Reviewed-by: Daniel P. Berrang=C3=A9
<berrange@redhat.com>

=3D=3D=3D=3D=3D=3D
Re: [PATCH v2]
=3D=3D=3D=3D=3D=3D

:Subject: docs: Add measurement calculation details to amd-memory-
encryption.txt
:Author: Dov Murik <dov.murik@amd.com>
:Date: 2022-02-15 6:52 UTC

Comment
=3D=3D=3D=3D=3D=3D=3D

The patch looks good. Reviewed-by: Dov Murik <dov.murik@amd.com>

=3D=3D=3D=3D=3D=3D
PULL 41/42
=3D=3D=3D=3D=3D=3D

:Subject: docs: rstfy confidential guest documentation
:Author: C=C3=A9dric Le Goater <clg@kaod.org>
:Date: 2022-02-10 13:00 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This pull request updates confidential guest documentation.

Changes
=3D=3D=3D=3D=3D=3D=3D

- Update confidential guest documentation to use rst format.

Doc Updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Update confidential guest documentation to use rst format.

File Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- No file changes.

=3D=3D=3D=3D=3D=3D
PULL 00/42
=3D=3D=3D=3D=3D=3D

:Subject: ppc queue
:Author: C=C3=A9dric Le Goater <clg@kaod.org>
:Date: 2022-02-10 12:59 UTC

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This pull request includes ppc queue changes.

Changes
=3D=3D=3D=3D=3D=3D=3D

- Various changes to ppc queue.

File Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various file changes.

.. raw:: html

   <div class=3D"toc">
   <ul class=3D"toc">
   <li><a href=3D"#id1">Re: [PATCH] docs: rstfy confidential guest
documentation</a></li>
   <li><a href=3D"#id2">[PATCH] docs: rstfy confidential guest
documentation</a></li>
   </ul>
   </div>

.. _id1:

Re: [PATCH] docs: rstfy confidential guest documentation
**********************************************************

On 2/4/22 11:12 AM, Cornelia Huck wrote:
> This patch series replaces the SGX-related documentation for the
confidential
> guest feature with rst-based documentation.

Thanks for doing this, Cornelia! The new documentation looks much
better than the old one.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

.. _id2:

[PATCH] docs: rstfy confidential guest documentation
*****************************************************

This patch series replaces the SGX-related documentation for the
confidential
guest feature with rst-based documentation.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/confidential-guest.rst | 2416
++++++++++++++++++++++++++++++++++++++++
 1 file changed, 2416 insertions(+)
 create mode 100644 docs/confidential-guest.rst

10. [PATCH] docs: rstfy confidential guest documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This patch series replaces the SGX-related documentation for the
confidential
guest feature with rst-based documentation.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/confidential-guest.rst | 2416
++++++++++++++++++++++++++++++++++++++++
 1 file changed, 2416 insertions(+)
 create mode 100644 docs/confidential-guest.rst

11. Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest
On Mon, Jan 10, 2022 at 12:00:21PM +0000, Xiaoyao Li wrote:

On 1/7/2022 10:06 PM, Daniel P. Berrang=C3=A9 wrote:

On Fri, Jan 07, 2022 at 02:58:57PM +0800, Xiaoyao Li wrote:

According to https://github.com/intel/KVMGT-
Kernel/blob/master/src/kvmgt.c,
there is no such kvm-type as "tdx", so I think the following document
may
need to be updated.

Thanks for the pointer. Yes, we'll need to update that.

Reviewed-by: Daniel P. Berrang=C3=A9 berrange@redhat.com

Regards,
Daniel

Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest

On Mon, Jan 10, 2022 at 12:00:21PM +0000, Xiaoyao Li wrote:
> On 1/7/2022 10:06 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Jan 07, 2022 at 02:58:57PM +0800, Xiaoyao Li wrote:
> >> According to https://github.com/intel/KVMGT-
Kernel/blob/master/src/kvmgt.c,
> >> there is no such kvm-type as "tdx", so I think the following
document may
> >> need to be updated.

Yes, it should be
Re: [PATCH] docs: Add measurement calculation details to amd-memory-
encryption.txt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By: Daniel P. Berrang=C3=A9
Date: 2021-12-17 13:24 UTC

Thank you for the update. It looks good to me.

Reviewed-by: Daniel P. Berrang=C3=A9 berrange@redhat.com

Re: [PATCH] docs: Add measurement calculation details to amd-memory-
encryption.txt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By: Dov Murik
Date: 2021-12-16 21:41 UTC

Thanks for the quick review! I will incorporate the changes and send a
new patch.

Thanks,

Dov

Re: [PATCH] docs: Add measurement calculation details to amd-memory-
encryption.txt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By: Daniel P. Berrang=C3=A9
Date: 2021-12-16 16:09 UTC

On Thu, Dec 16, 2021 at 10:38:26AM +0000, Dov Murik wrote:

Add detailed calculation of the SEV-ES guest measurement.

Signed-off-by: Dov Murik dovmurik@linux.vnet.ibm.com

Looks good to me.

Reviewed-by: Daniel P. Berrang=C3=A9 berrange@redhat.com

Re: [PATCH] docs: Add measurement calculation details to amd-memory-
encryption.txt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By: Dov Murik
Date: 2021-12-16 10:38 UTC

On 12/14/2021 8:39 PM, Daniel P. Berrang=C3=A9 wrote:

On Fri, Dec 10, 2021 at 04:38:51PM +0000, Dov Murik wrote:

Add detailed calculation of the SEV-ES guest measurement.

Signed-off-by: Dov Murik dovmurik@linux.vnet.ibm.com
Re: [PATCH] docs: Add measurement calculation details to amd-memory-
encryption.txt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
By: Daniel P. Berrang=C3=A9
Date: 2021-12-14 18:39 UTC

On Fri, Dec 10, 2021 at 04:38:51PM +0000, Dov Murik wrote:

Titilola (1):
  initial commit

--=20
2.34.7

