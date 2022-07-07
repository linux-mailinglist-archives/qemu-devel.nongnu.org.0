Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59E56A887
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:46:47 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UeL-0000Fc-OQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UW3-00004s-Jm
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UW0-0006qT-AI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94FmLEdnOhdOk/AEHOilX4+G9s1K3ACK3kJoE45hdPE=;
 b=Or2ccf8pBohBQ0x7FUMK2DhU/MVlBPtBqvMKsn7GZPoCeu8aXGvd9gm0sa6USn9jj16nk0
 m8PvbUuaComdNcFzmnT8jX8+AB/Ih/y8CSemmhtmlgB6is6GXPc/a7MJruBeqq1KEN6aWs
 BI2+iOCNzjuaaQqOAmmcgk8sF0sTZuc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-tN2iV9vNMdCzPFMElOQgrw-1; Thu, 07 Jul 2022 12:38:01 -0400
X-MC-Unique: tN2iV9vNMdCzPFMElOQgrw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46EA280302D;
 Thu,  7 Jul 2022 16:37:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5926492C3B;
 Thu,  7 Jul 2022 16:37:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 8/9] misc: remove qemu/osdep.h from headers / included
 source files
Date: Thu,  7 Jul 2022 17:37:19 +0100
Message-Id: <20220707163720.1421716-9-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since qemu/osdep.h is guaranteed present in all C source files,
there is hno reason for it to be present in header files. Some
C source files are not directly directly, but rather included
from other source files. These should also not have qemu/osdep.h
present, as the primary source will have already included it.
---
 crypto/akcipher-gcrypt.c.inc                              | 1 -
 crypto/akcipher-nettle.c.inc                              | 1 -
 crypto/cipher-gnutls.c.inc                                | 1 -
 crypto/rsakey-nettle.c.inc                                | 1 -
 crypto/rsakey.h                                           | 1 -
 include/hw/cxl/cxl_host.h                                 | 1 -
 include/hw/tricore/triboard.h                             | 1 -
 include/qemu/userfaultfd.h                                | 1 -
 net/vmnet_int.h                                           | 1 -
 qga/cutils.h                                              | 2 --
 target/cris/translate_v10.c.inc                           | 1 -
 target/hexagon/hex_arch_types.h                           | 1 -
 target/hexagon/mmvec/macros.h                             | 1 -
 target/riscv/pmu.h                                        | 1 -
 target/xtensa/core-dc232b/xtensa-modules.c.inc            | 1 -
 target/xtensa/core-dc233c/xtensa-modules.c.inc            | 1 -
 target/xtensa/core-de212/xtensa-modules.c.inc             | 1 -
 target/xtensa/core-fsf/xtensa-modules.c.inc               | 1 -
 target/xtensa/core-sample_controller/xtensa-modules.c.inc | 1 -
 ui/vnc-enc-zrle.c.inc                                     | 3 ---
 ui/vnc-enc-zywrle-template.c.inc                          | 1 -
 21 files changed, 24 deletions(-)

diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
index abb1fb272e..709f4167f6 100644
--- a/crypto/akcipher-gcrypt.c.inc
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -21,7 +21,6 @@
 
 #include <gcrypt.h>
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 #include "crypto/random.h"
diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
index 02699e6e6d..f36a9b5048 100644
--- a/crypto/akcipher-nettle.c.inc
+++ b/crypto/akcipher-nettle.c.inc
@@ -21,7 +21,6 @@
 
 #include <nettle/rsa.h>
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 #include "crypto/random.h"
diff --git a/crypto/cipher-gnutls.c.inc b/crypto/cipher-gnutls.c.inc
index 501e4e07a5..c71fa16ed7 100644
--- a/crypto/cipher-gnutls.c.inc
+++ b/crypto/cipher-gnutls.c.inc
@@ -18,7 +18,6 @@
  *
  */
 
-#include "qemu/osdep.h"
 #include "cipherpriv.h"
 
 #include <gnutls/crypto.h>
diff --git a/crypto/rsakey-nettle.c.inc b/crypto/rsakey-nettle.c.inc
index cc49872e78..f376552541 100644
--- a/crypto/rsakey-nettle.c.inc
+++ b/crypto/rsakey-nettle.c.inc
@@ -21,7 +21,6 @@
 
 #include <nettle/asn1.h>
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "rsakey.h"
 
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
index 974b76f659..ba88974d12 100644
--- a/crypto/rsakey.h
+++ b/crypto/rsakey.h
@@ -22,7 +22,6 @@
 #ifndef QCRYPTO_RSAKEY_H
 #define QCRYPTO_RSAKEY_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index a1b662ce40..c9bc9c7c50 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -7,7 +7,6 @@
  * COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/boards.h"
 
diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index 094c8bd563..4fdd2d7d97 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..55c95998e8 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -13,7 +13,6 @@
 #ifndef USERFAULTFD_H
 #define USERFAULTFD_H
 
-#include "qemu/osdep.h"
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index adf6e8c20d..d0b90594f2 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -10,7 +10,6 @@
 #ifndef VMNET_INT_H
 #define VMNET_INT_H
 
-#include "qemu/osdep.h"
 #include "vmnet_int.h"
 #include "clients.h"
 
diff --git a/qga/cutils.h b/qga/cutils.h
index f0f30a7d28..c1f2f4b17a 100644
--- a/qga/cutils.h
+++ b/qga/cutils.h
@@ -1,8 +1,6 @@
 #ifndef CUTILS_H_
 #define CUTILS_H_
 
-#include "qemu/osdep.h"
-
 int qga_open_cloexec(const char *name, int flags, mode_t mode);
 
 #endif /* CUTILS_H_ */
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..ecf12961cf 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "crisv10-decode.h"
 
 static const char * const regnames_v10[] =
diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
index 885f68f760..52a7f2b2f3 100644
--- a/target/hexagon/hex_arch_types.h
+++ b/target/hexagon/hex_arch_types.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_HEX_ARCH_TYPES_H
 #define HEXAGON_HEX_ARCH_TYPES_H
 
-#include "qemu/osdep.h"
 #include "mmvec/mmvec.h"
 #include "qemu/int128.h"
 
diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
index 8345753580..6a463a7db3 100644
--- a/target/hexagon/mmvec/macros.h
+++ b/target/hexagon/mmvec/macros.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_MMVEC_MACROS_H
 #define HEXAGON_MMVEC_MACROS_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "arch.h"
 #include "mmvec/system_ext_mmvec.h"
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 58a5bc3a40..4758158e8c 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
diff --git a/target/xtensa/core-dc232b/xtensa-modules.c.inc b/target/xtensa/core-dc232b/xtensa-modules.c.inc
index 164df3b1a4..31222023d0 100644
--- a/target/xtensa/core-dc232b/xtensa-modules.c.inc
+++ b/target/xtensa/core-dc232b/xtensa-modules.c.inc
@@ -18,7 +18,6 @@
    Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
    02110-1301, USA.  */
 
-#include "qemu/osdep.h"
 #include "xtensa-isa.h"
 #include "xtensa-isa-internal.h"
 
diff --git a/target/xtensa/core-dc233c/xtensa-modules.c.inc b/target/xtensa/core-dc233c/xtensa-modules.c.inc
index 0f32f0804a..23dba3f4fc 100644
--- a/target/xtensa/core-dc233c/xtensa-modules.c.inc
+++ b/target/xtensa/core-dc233c/xtensa-modules.c.inc
@@ -21,7 +21,6 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-#include "qemu/osdep.h"
 #include "xtensa-isa.h"
 #include "xtensa-isa-internal.h"
 
diff --git a/target/xtensa/core-de212/xtensa-modules.c.inc b/target/xtensa/core-de212/xtensa-modules.c.inc
index 480c68d3c6..c151f71363 100644
--- a/target/xtensa/core-de212/xtensa-modules.c.inc
+++ b/target/xtensa/core-de212/xtensa-modules.c.inc
@@ -21,7 +21,6 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-#include "qemu/osdep.h"
 #include "xtensa-isa.h"
 #include "xtensa-isa-internal.h"
 
diff --git a/target/xtensa/core-fsf/xtensa-modules.c.inc b/target/xtensa/core-fsf/xtensa-modules.c.inc
index c32683ff77..c7730de786 100644
--- a/target/xtensa/core-fsf/xtensa-modules.c.inc
+++ b/target/xtensa/core-fsf/xtensa-modules.c.inc
@@ -18,7 +18,6 @@
    Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
    02110-1301, USA.  */
 
-#include "qemu/osdep.h"
 #include "xtensa-isa.h"
 #include "xtensa-isa-internal.h"
 
diff --git a/target/xtensa/core-sample_controller/xtensa-modules.c.inc b/target/xtensa/core-sample_controller/xtensa-modules.c.inc
index 7e87d216bd..aa498e9b70 100644
--- a/target/xtensa/core-sample_controller/xtensa-modules.c.inc
+++ b/target/xtensa/core-sample_controller/xtensa-modules.c.inc
@@ -21,7 +21,6 @@
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
 
-#include "qemu/osdep.h"
 #include "xtensa-isa.h"
 #include "xtensa-isa-internal.h"
 
diff --git a/ui/vnc-enc-zrle.c.inc b/ui/vnc-enc-zrle.c.inc
index b7484aef00..3462329142 100644
--- a/ui/vnc-enc-zrle.c.inc
+++ b/ui/vnc-enc-zrle.c.inc
@@ -21,9 +21,6 @@
  * algorithm writes to the position one past the end of the pixel data.
  */
 
-
-#include "qemu/osdep.h"
-
 #undef ZRLE_ENDIAN_SUFFIX
 
 #if ZYWRLE_ENDIAN == ENDIAN_LITTLE
diff --git a/ui/vnc-enc-zywrle-template.c.inc b/ui/vnc-enc-zywrle-template.c.inc
index e9be55966e..e3b2e979d8 100644
--- a/ui/vnc-enc-zywrle-template.c.inc
+++ b/ui/vnc-enc-zywrle-template.c.inc
@@ -100,7 +100,6 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 #endif
 
 #define ZYWRLE_QUANTIZE
-#include "qemu/osdep.h"
 #include "vnc-enc-zywrle.h"
 
 #ifndef ZRLE_COMPACT_PIXEL
-- 
2.36.1


