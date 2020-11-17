Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD602B68D4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:37:57 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf33M-0008JB-7f
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kf31W-0006QN-Lg; Tue, 17 Nov 2020 10:36:03 -0500
Received: from relay68.bu.edu ([128.197.228.73]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kf31S-0005pL-La; Tue, 17 Nov 2020 10:36:02 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0AHFX0eW014276
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 17 Nov 2020 10:33:03 -0500
Date: Tue, 17 Nov 2020 10:33:00 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] Clean up includes
Message-ID: <20201117153300.yaaeiaxbfh2jojsu@mozz.bu.edu>
References: <20201113061216.2483385-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113061216.2483385-1-armbru@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 10:35:56
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, mjrosato@linux.ibm.com, mst@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu, pasic@linux.ibm.com, borntraeger@de.ibm.com, bsd@redhat.com,
 kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201113 0712, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>     contrib/libvhost-user/libvhost-user-glib.h
>     contrib/libvhost-user/libvhost-user.c
>     contrib/libvhost-user/libvhost-user.h
>     contrib/plugins/hotblocks.c
>     contrib/plugins/hotpages.c
>     contrib/plugins/howvec.c
>     contrib/plugins/lockstep.c
>     linux-user/mips64/cpu_loop.c
>     linux-user/mips64/signal.c
>     linux-user/sparc64/cpu_loop.c
>     linux-user/sparc64/signal.c
>     linux-user/x86_64/cpu_loop.c
>     linux-user/x86_64/signal.c
>     target/s390x/gen-features.c
>     tests/fp/platform.h
>     tests/migration/s390x/a-b-bios.c
>     tests/plugin/bb.c
>     tests/plugin/empty.c
>     tests/plugin/insn.c
>     tests/plugin/mem.c
>     tests/test-rcu-simpleq.c
>     tests/test-rcu-slist.c
>     tests/test-rcu-tailq.c
>     tests/uefi-test-tools/UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.c
> 
> contrib/plugins/, tests/plugin/, and tests/test-rcu-slist.c appear not
> to include osdep.h intentionally.  The remaining reverts are the same
> as in commit bbfff19688d.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Alexander Bulekov <alxndr@bu.edu>

Thank you

> ---
> No real need to get this into 5.2 at this stage.  No real risk either.
> 
>  contrib/vhost-user-gpu/vugbm.h          |  2 --
>  contrib/vhost-user-gpu/vugpu.h          |  1 -
>  include/hw/block/swim.h                 |  1 -
>  include/hw/display/macfb.h              |  1 -
>  include/qemu/nvdimm-utils.h             |  1 -
>  tests/qtest/fuzz/fuzz.h                 |  1 -
>  tests/qtest/fuzz/generic_fuzz_configs.h |  1 -
>  tools/virtiofsd/fuse_common.h           |  2 --
>  tools/virtiofsd/fuse_log.h              |  1 -
>  tools/virtiofsd/fuse_lowlevel.h         |  3 ---
>  tools/virtiofsd/fuse_misc.h             |  1 -
>  tools/virtiofsd/passthrough_seccomp.h   |  1 -
>  contrib/vhost-user-gpu/virgl.c          |  1 +
>  contrib/vhost-user-gpu/vugbm.c          |  1 +
>  contrib/vhost-user-input/main.c         |  1 -
>  hw/display/artist.c                     |  1 -
>  hw/s390x/s390-pci-vfio.c                |  3 ++-
>  tools/virtiofsd/buffer.c                |  5 -----
>  tools/virtiofsd/fuse_log.c              |  2 --
>  tools/virtiofsd/fuse_lowlevel.c         | 10 ----------
>  tools/virtiofsd/fuse_opt.c              |  4 ----
>  tools/virtiofsd/fuse_signals.c          |  5 -----
>  tools/virtiofsd/fuse_virtio.c           | 10 ----------
>  tools/virtiofsd/helper.c                |  8 --------
>  tools/virtiofsd/passthrough_ll.c        | 12 ------------
>  tools/virtiofsd/passthrough_seccomp.c   |  3 ---
>  util/nvdimm-utils.c                     |  1 +
>  27 files changed, 5 insertions(+), 78 deletions(-)
> 
> diff --git a/contrib/vhost-user-gpu/vugbm.h b/contrib/vhost-user-gpu/vugbm.h
> index 07e698fcd7..66f1520764 100644
> --- a/contrib/vhost-user-gpu/vugbm.h
> +++ b/contrib/vhost-user-gpu/vugbm.h
> @@ -10,10 +10,8 @@
>  #ifndef VHOST_USER_GPU_VUGBM_H
>  #define VHOST_USER_GPU_VUGBM_H
>  
> -#include "qemu/osdep.h"
>  
>  #ifdef CONFIG_MEMFD
> -#include <sys/mman.h>
>  #include <sys/ioctl.h>
>  #endif
>  
> diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
> index 3153c9a6de..5eca2a96ab 100644
> --- a/contrib/vhost-user-gpu/vugpu.h
> +++ b/contrib/vhost-user-gpu/vugpu.h
> @@ -15,7 +15,6 @@
>  #ifndef VUGPU_H
>  #define VUGPU_H
>  
> -#include "qemu/osdep.h"
>  
>  #include "contrib/libvhost-user/libvhost-user-glib.h"
>  #include "standard-headers/linux/virtio_gpu.h"
> diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
> index 5a49029543..c1bd5f6555 100644
> --- a/include/hw/block/swim.h
> +++ b/include/hw/block/swim.h
> @@ -11,7 +11,6 @@
>  #ifndef SWIM_H
>  #define SWIM_H
>  
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> index c133fa271e..80806b0306 100644
> --- a/include/hw/display/macfb.h
> +++ b/include/hw/display/macfb.h
> @@ -13,7 +13,6 @@
>  #ifndef MACFB_H
>  #define MACFB_H
>  
> -#include "qemu/osdep.h"
>  #include "exec/memory.h"
>  #include "ui/console.h"
>  #include "qom/object.h"
> diff --git a/include/qemu/nvdimm-utils.h b/include/qemu/nvdimm-utils.h
> index 4b8b198ba7..5f45774c2c 100644
> --- a/include/qemu/nvdimm-utils.h
> +++ b/include/qemu/nvdimm-utils.h
> @@ -1,7 +1,6 @@
>  #ifndef NVDIMM_UTILS_H
>  #define NVDIMM_UTILS_H
>  
> -#include "qemu/osdep.h"
>  
>  GSList *nvdimm_get_device_list(void);
>  #endif
> diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
> index 08e9560a79..3a8570e84c 100644
> --- a/tests/qtest/fuzz/fuzz.h
> +++ b/tests/qtest/fuzz/fuzz.h
> @@ -14,7 +14,6 @@
>  #ifndef FUZZER_H_
>  #define FUZZER_H_
>  
> -#include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index c4d925f9e6..b4c5fefeca 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -13,7 +13,6 @@
>  #ifndef GENERIC_FUZZ_CONFIGS_H
>  #define GENERIC_FUZZ_CONFIGS_H
>  
> -#include "qemu/osdep.h"
>  
>  typedef struct generic_fuzz_config {
>      const char *name, *args, *objects;
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 5aee5193eb..30b18b4966 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -18,8 +18,6 @@
>  
>  #include "fuse_log.h"
>  #include "fuse_opt.h"
> -#include <stdint.h>
> -#include <sys/types.h>
>  
>  /** Major version of FUSE library interface */
>  #define FUSE_MAJOR_VERSION 3
> diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
> index bf6c11ff11..8d7091bd4d 100644
> --- a/tools/virtiofsd/fuse_log.h
> +++ b/tools/virtiofsd/fuse_log.h
> @@ -14,7 +14,6 @@
>   * This file defines the logging interface of FUSE
>   */
>  
> -#include <stdarg.h>
>  
>  /**
>   * Log severity level
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index 9c06240f9e..0e10a14bc9 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -25,10 +25,7 @@
>  
>  #include "fuse_common.h"
>  
> -#include <fcntl.h>
> -#include <sys/stat.h>
>  #include <sys/statvfs.h>
> -#include <sys/types.h>
>  #include <sys/uio.h>
>  #include <utime.h>
>  
> diff --git a/tools/virtiofsd/fuse_misc.h b/tools/virtiofsd/fuse_misc.h
> index 5c618ce21f..f252baa752 100644
> --- a/tools/virtiofsd/fuse_misc.h
> +++ b/tools/virtiofsd/fuse_misc.h
> @@ -7,7 +7,6 @@
>   */
>  
>  #include <pthread.h>
> -#include "config-host.h"
>  
>  /*
>   * Versioned symbols cannot be used in some cases because it
> diff --git a/tools/virtiofsd/passthrough_seccomp.h b/tools/virtiofsd/passthrough_seccomp.h
> index d47c8eade6..a3ab073f08 100644
> --- a/tools/virtiofsd/passthrough_seccomp.h
> +++ b/tools/virtiofsd/passthrough_seccomp.h
> @@ -9,7 +9,6 @@
>  #ifndef VIRTIOFSD_SECCOMP_H
>  #define VIRTIOFSD_SECCOMP_H
>  
> -#include <stdbool.h>
>  
>  void setup_seccomp(bool enable_syslog);
>  
> diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
> index b0bc22c3c1..e647278052 100644
> --- a/contrib/vhost-user-gpu/virgl.c
> +++ b/contrib/vhost-user-gpu/virgl.c
> @@ -12,6 +12,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  
> +#include "qemu/osdep.h"
>  #include <virglrenderer.h>
>  #include "virgl.h"
>  
> diff --git a/contrib/vhost-user-gpu/vugbm.c b/contrib/vhost-user-gpu/vugbm.c
> index 9c357b6399..f5304ada2f 100644
> --- a/contrib/vhost-user-gpu/vugbm.c
> +++ b/contrib/vhost-user-gpu/vugbm.c
> @@ -7,6 +7,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  
> +#include "qemu/osdep.h"
>  #include "vugbm.h"
>  
>  static bool
> diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
> index 6020c6f33a..25e2faa16b 100644
> --- a/contrib/vhost-user-input/main.c
> +++ b/contrib/vhost-user-input/main.c
> @@ -6,7 +6,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include <glib.h>
>  #include <linux/input.h>
>  
>  #include "qemu/iov.h"
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index ed0e637f25..aa7bd594aa 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -9,7 +9,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/error-report.h"
> -#include "qemu/typedefs.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/units.h"
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index d5c78063b5..28343f90e3 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -9,11 +9,12 @@
>   * directory.
>   */
>  
> +#include "qemu/osdep.h"
> +
>  #include <sys/ioctl.h>
>  #include <linux/vfio.h>
>  #include <linux/vfio_zdev.h>
>  
> -#include "qemu/osdep.h"
>  #include "trace.h"
>  #include "hw/s390x/s390-pci-bus.h"
>  #include "hw/s390x/s390-pci-clp.h"
> diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
> index 27c1377f22..2085db2743 100644
> --- a/tools/virtiofsd/buffer.c
> +++ b/tools/virtiofsd/buffer.c
> @@ -12,11 +12,6 @@
>  #include "qemu/osdep.h"
>  #include "fuse_i.h"
>  #include "fuse_lowlevel.h"
> -#include <assert.h>
> -#include <errno.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <unistd.h>
>  
>  size_t fuse_buf_size(const struct fuse_bufvec *bufv)
>  {
> diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
> index c301ff6da1..745d88cd2a 100644
> --- a/tools/virtiofsd/fuse_log.c
> +++ b/tools/virtiofsd/fuse_log.c
> @@ -11,8 +11,6 @@
>  #include "qemu/osdep.h"
>  #include "fuse_log.h"
>  
> -#include <stdarg.h>
> -#include <stdio.h>
>  
>  static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
>                               const char *fmt, va_list ap)
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index c70fb16a9a..d4119e92ab 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -16,17 +16,7 @@
>  #include "fuse_opt.h"
>  #include "fuse_virtio.h"
>  
> -#include <assert.h>
> -#include <errno.h>
> -#include <glib.h>
> -#include <limits.h>
> -#include <stdbool.h>
> -#include <stddef.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  #include <sys/file.h>
> -#include <unistd.h>
>  
>  #define THREAD_POOL_SIZE 64
>  
> diff --git a/tools/virtiofsd/fuse_opt.c b/tools/virtiofsd/fuse_opt.c
> index 28922361a2..f0ab8d22f4 100644
> --- a/tools/virtiofsd/fuse_opt.c
> +++ b/tools/virtiofsd/fuse_opt.c
> @@ -14,10 +14,6 @@
>  #include "fuse_i.h"
>  #include "fuse_misc.h"
>  
> -#include <assert.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  
>  struct fuse_opt_context {
>      void *data;
> diff --git a/tools/virtiofsd/fuse_signals.c b/tools/virtiofsd/fuse_signals.c
> index f18625b6e2..1de46de1ce 100644
> --- a/tools/virtiofsd/fuse_signals.c
> +++ b/tools/virtiofsd/fuse_signals.c
> @@ -12,11 +12,6 @@
>  #include "fuse_i.h"
>  #include "fuse_lowlevel.h"
>  
> -#include <errno.h>
> -#include <signal.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  
>  static struct fuse_session *fuse_instance;
>  
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 83ba07c6cd..2c800418f1 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -20,20 +20,10 @@
>  #include "fuse_opt.h"
>  #include "fuse_virtio.h"
>  
> -#include <assert.h>
> -#include <errno.h>
> -#include <glib.h>
> -#include <stdint.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  #include <sys/eventfd.h>
>  #include <sys/socket.h>
> -#include <sys/types.h>
>  #include <sys/un.h>
> -#include <sys/types.h>
>  #include <grp.h>
> -#include <unistd.h>
>  
>  #include "contrib/libvhost-user/libvhost-user.h"
>  
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 75ac48dec2..28243b51b2 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -16,16 +16,8 @@
>  #include "fuse_misc.h"
>  #include "fuse_opt.h"
>  
> -#include <errno.h>
> -#include <limits.h>
> -#include <stddef.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  #include <sys/param.h>
> -#include <sys/time.h>
>  #include <sys/resource.h>
> -#include <unistd.h>
>  
>  #define FUSE_HELPER_OPT(t, p)                       \
>      {                                               \
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ec1008bceb..56cff773e4 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -41,29 +41,17 @@
>  #include "fuse_log.h"
>  #include "fuse_lowlevel.h"
>  #include "standard-headers/linux/fuse.h"
> -#include <assert.h>
>  #include <cap-ng.h>
>  #include <dirent.h>
> -#include <errno.h>
> -#include <glib.h>
> -#include <inttypes.h>
> -#include <limits.h>
>  #include <pthread.h>
> -#include <stdbool.h>
> -#include <stddef.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
>  #include <sys/file.h>
>  #include <sys/mount.h>
>  #include <sys/prctl.h>
>  #include <sys/resource.h>
>  #include <sys/syscall.h>
> -#include <sys/types.h>
>  #include <sys/wait.h>
>  #include <sys/xattr.h>
>  #include <syslog.h>
> -#include <unistd.h>
>  
>  #include "qemu/cutils.h"
>  #include "passthrough_helpers.h"
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index 11623f56f2..a60d7da4b4 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -10,10 +10,7 @@
>  #include "passthrough_seccomp.h"
>  #include "fuse_i.h"
>  #include "fuse_log.h"
> -#include <errno.h>
> -#include <glib.h>
>  #include <seccomp.h>
> -#include <stdlib.h>
>  
>  /* Bodge for libseccomp 2.4.2 which broke ppoll */
>  #if !defined(__SNR_ppoll) && defined(__SNR_brk)
> diff --git a/util/nvdimm-utils.c b/util/nvdimm-utils.c
> index 5cc768ca47..aa3d199f2d 100644
> --- a/util/nvdimm-utils.c
> +++ b/util/nvdimm-utils.c
> @@ -1,3 +1,4 @@
> +#include "qemu/osdep.h"
>  #include "qemu/nvdimm-utils.h"
>  #include "hw/mem/nvdimm.h"
>  
> -- 
> 2.26.2
> 

