Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F8494AF7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:44:09 +0100 (CET)
Received: from localhost ([::1]:52788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nATzE-0007y8-CW
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASve-0006VH-2F
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:22 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:33381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASva-0001eS-NF
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:21 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLz3R-1msf3g3i2j-00HvLO; Thu, 20
 Jan 2022 09:36:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] M68k for 7.0 patches
Date: Thu, 20 Jan 2022 09:36:04 +0100
Message-Id: <20220120083607.1672319-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SZ4TS8NVXDosCtlTjVZQU1POREOh0R2n5Igwj9bcnMwPLu4ogxm
 86iJzIBH2gsn3hHvUsBW05WlzreGRRZJgwHICj+HNLX2dKQhUmx/kzKrGp+yn0iu1OcD4MP
 sAFn1QuHGbto/AK7Rrd3g11wPH0fKpTwbCRevrMASONHNZ5a7PPXK8icFXPdvtxVJncfril
 OK9VQWiDyWAlNgp2kINqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lJDWqQUZTYo=:u8uX41iipPVzzRJT93NxUt
 z8TZgXCVwDmbfB44Uzsuf782QsH1W0lIJLYwzwhl5fO/Jn4WUGRu85nKJDp/UKZjndocqwCy/
 qcPBIUfKsPgmlPZVaizzPKl398zx3T4cfljIwy8F6xHoGJntYfWs5YM3Wb5sKlUOcyqh/8nmt
 aGinKHQOw334NC0j8NtHQp5WQnh8ceZaKrTDUeZZEb8nu92hMb7QQugHwDHkUoGxgBeOQQ89y
 59OKoRYdHIAA5BDncl9raJoSuuXUgFfkxQrBiDDFtimHrmED2EHkiF7l8Ka/gZi7IlC61O+6o
 7sEGkqujn8Dg7s8A83lrsx9C06CNjI6vFNj1XGZ2d8xxYo35SOu1TozDFAS+/QOak3eg5/8iw
 BQSsCZ/z6t10uOkgMv/WtrNTA+FtwmMpVbzUqRzr60+RvDQ0O5EVTUXnzz40Gb6avYVzQst3O
 DCFJsKrtYiMMmoM0re2f1lP6E0br6Z4iXTSyKVhJC5f3irre1NVmNYz1Y7MPSc8ZnNbBcnRlI
 kEuyOeCOiWj0uRmXcuoA5cYzUP1vy4adAfR5kAKBR2RS0iMzazwT6JJXPxxV4O3e2xOrQCpBB
 tPG57S8Ewt6DsAECD2IRMKo5959TjL3CcY2vCoZBAilVZow415NeerEoe9Aloxjf+dCWDUdgN
 qe2jndp0RQxNcxBPO65rG3M2Bcv/gSJkiW+VowIwpthyEL8JJE2LXcSZkVP3u86wa15I=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5e0214cdeee17de949f2565f4429c15173179ae3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022=
-01-19' into staging (2022-01-19 16:37:46 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-7.0-pull-request=0D
=0D
for you to fetch changes up to e48b140eef9775986cc18038c7bc68f8d2b7fe1d:=0D
=0D
  m68k: virt: correctly set the initial PC (2022-01-20 09:09:37 +0100)=0D
=0D
----------------------------------------------------------------=0D
m68k pull request 20220120=0D
=0D
Fix virt-m68k reboot=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (2):=0D
  hw/elf_ops: clear uninitialized segment space=0D
  m68k: virt: correctly set the initial PC=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  exec/memory: Extract address_space_set() from dma_memory_set()=0D
=0D
 include/exec/memory.h | 16 ++++++++++++++++=0D
 include/hw/elf_ops.h  | 13 +++++++++++++=0D
 hw/core/loader.c      |  4 ++++=0D
 hw/m68k/virt.c        | 22 +++++++++++++++++-----=0D
 softmmu/dma-helpers.c | 15 +--------------=0D
 softmmu/physmem.c     | 19 +++++++++++++++++++=0D
 6 files changed, 70 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

