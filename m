Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBB264E2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:38:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRS5-0000YH-NZ
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:38:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTRNj-0006aC-0j
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:34:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTRNh-0003Sr-Jd
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:34:11 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38623)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTRNb-0003O3-T9; Wed, 22 May 2019 09:34:04 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MbBQU-1gwZSs0UGm-00beSi; Wed, 22 May 2019 15:33:38 +0200
To: Boxuan Li <liboxuan@connect.hku.hk>, qemu-devel@nongnu.org
References: <20190503154424.73933-1-liboxuan@connect.hku.hk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1b3ff9fd-860b-1b14-ee74-03b6188f8a37@vivier.eu>
Date: Wed, 22 May 2019 15:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190503154424.73933-1-liboxuan@connect.hku.hk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:e4SQbxf5e1+cz5hk3NDUS30kkJqb3iHMyHerjECCMYLn4GFIwbr
	ZmGfYCprhwR7PIlczWdqzieXHOFqmSLI4y5t1LR9ZPeVij98tM2uiYbf1p4rdgxQ7hzrQgn
	kW49xsFPKp7Q5fcTM+M5nLK6jmA4PbdvJ9hSEe+Ab9p1hPClkiUsshOFv8DcFht/AGCeQ4S
	BQybBYWzmi7T/E8Cf9rZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V2XC0DJNPUc=:wYr8VOkric2qJwCdJXdTqO
	b4UPRXTx+lwrLyXuPX9OGJLUeWydYwP0qwR4QQ91qo2LaZ4xXnzA9t8BSivt8ZULACjS/eVxg
	N03/w9HaXoiCMFHfQPK7gf8yHBGHKh/iIbjZ+p59yVQd6PRfP8C1iANCgCRo6C7h960IIqEpY
	MBT8MKw7aWHk6/9U1QH5CoPIRht+A2xy41DwXolDr3uLFNa/csra1qRNn7w/VeOe4NVzP09L/
	zMhmQHl/Fk5fv3H54LtFUeY4g0FFTjUzmyFAZVXFD9jXu3JKXNzPCH+foYibg6j6YSGPCHonT
	o6Vd5m9ul4ps63TNDFF24jP7aeJU+3d5G4iwlSwG9++yL/5Zu8bV/L7hEm9DPwskCo2PTc+R9
	QiTWzyS9LqftYaM46Jrg3al6IeGanMDnrq1nOnlpc7BwGJZJ1B50Uv5itrDmv+6CKzP3gzzE8
	YlND0B8i3LAjC+ZVl3H/ea/fWHxcZ9gZFNiiWtSdLRxgIVdqDmFIJXPkMg4jtyBVt7+Q5Wy0I
	A3Dip66yGvYrc5VgGxmrHfR/kSY3Tuk9kphe9oiw3oXXOrrmkZt+0jhH2LuVJV6N7Zr2E2SDe
	0qHDsFltAbJ1nMeDTXh6HRmMVdQouregqzh0+jbdWLFzNNZdH2zUeA+R1LVrsUQNotP3gamcZ
	DPhwpNdWMAc9dTBjaO9qEDNDNleKcGsSdJKh2it/6kc8AhK0cYjj5DTi4bg9qXHMZ5Uhq1xHT
	ZXw1POp74YUfCIlPEdh2bR2gIo4V/tgBUaTxkqhcdyAxME918Bba05HJ7aM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH v4] hw/virtio/virtio-mmio:
 Convert DPRINTF to trace and log
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	philmd@redhat.com, yuval.shaia@oracle.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2019 17:44, Boxuan Li wrote:
> Use traces for debug message and qemu_log_mask for errors.
> 
> Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
> ---
> v1: https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/
> v2: https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/
> v3: https://patchew.org/QEMU/20190503084654.18413-1-liboxuan@connect.hku.hk/
> v4: Fix indentation and do not convert uint64_t to int
> ---
>   hw/virtio/trace-events  |  7 +++++++
>   hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++-----------------------
>   2 files changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 60c649c4bc..e28ba48da6 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s g
>   virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
>   virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
>   virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: 0x%"PRIx64" num_pages: %d"
> +
> +# virtio-mmio.c
> +virtio_mmio_read(uint64_t offset) "virtio_mmio_read offset 0x%" PRIx64
> +virtio_mmio_write_offset(uint64_t offset, uint64_t value) "virtio_mmio_write offset 0x%" PRIx64 " value 0x%" PRIx64
> +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" PRIx64 " shift %d"
> +virtio_mmio_queue_write(uint64_t value, int max_size) "mmio_queue write 0x%" PRIx64 " max %d"
> +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 5807aa87fe..96c762f0bf 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -27,16 +27,8 @@
>   #include "sysemu/kvm.h"
>   #include "hw/virtio/virtio-bus.h"
>   #include "qemu/error-report.h"
> -
> -/* #define DEBUG_VIRTIO_MMIO */
> -
> -#ifdef DEBUG_VIRTIO_MMIO
> -
> -#define DPRINTF(fmt, ...) \
> -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do {} while (0)
> -#endif
> +#include "qemu/log.h"
> +#include "trace.h"
>   
>   /* QOM macros */
>   /* virtio-mmio-bus */
> @@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>       VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>   
> -    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
> +    trace_virtio_mmio_read(offset);
>   
>       if (!vdev) {
>           /* If no backend is present, we treat most registers as
> @@ -144,7 +136,9 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>           }
>       }
>       if (size != 4) {
> -        DPRINTF("wrong size access to register!\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: wrong size access to register!\n",
> +                      __func__);
>           return 0;
>       }
>       switch (offset) {
> @@ -182,10 +176,12 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>       case VIRTIO_MMIO_QUEUE_ALIGN:
>       case VIRTIO_MMIO_QUEUE_NOTIFY:
>       case VIRTIO_MMIO_INTERRUPT_ACK:
> -        DPRINTF("read of write-only register\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: read of write-only register\n",
> +                      __func__);
>           return 0;
>       default:
> -        DPRINTF("bad register offset\n");
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __func__);
>           return 0;
>       }
>       return 0;
> @@ -197,8 +193,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>       VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>   
> -    DPRINTF("virtio_mmio_write offset 0x%x value 0x%" PRIx64 "\n",
> -            (int)offset, value);
> +    trace_virtio_mmio_write_offset(offset, value);
>   
>       if (!vdev) {
>           /* If no backend is present, we just make all registers
> @@ -226,7 +221,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>           return;
>       }
>       if (size != 4) {
> -        DPRINTF("wrong size access to register!\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: wrong size access to register!\n",
> +                      __func__);
>           return;
>       }
>       switch (offset) {
> @@ -246,8 +243,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>           if (proxy->guest_page_shift > 31) {
>               proxy->guest_page_shift = 0;
>           }
> -        DPRINTF("guest page size %" PRIx64 " shift %d\n", value,
> -                proxy->guest_page_shift);
> +        trace_virtio_mmio_guest_page(value, proxy->guest_page_shift);
>           break;
>       case VIRTIO_MMIO_QUEUE_SEL:
>           if (value < VIRTIO_QUEUE_MAX) {
> @@ -255,7 +251,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>           }
>           break;
>       case VIRTIO_MMIO_QUEUE_NUM:
> -        DPRINTF("mmio_queue write %d max %d\n", (int)value, VIRTQUEUE_MAX_SIZE);
> +        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
>           virtio_queue_set_num(vdev, vdev->queue_sel, value);
>           /* Note: only call this function for legacy devices */
>           virtio_queue_update_rings(vdev, vdev->queue_sel);
> @@ -303,11 +299,13 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>       case VIRTIO_MMIO_DEVICE_FEATURES:
>       case VIRTIO_MMIO_QUEUE_NUM_MAX:
>       case VIRTIO_MMIO_INTERRUPT_STATUS:
> -        DPRINTF("write to readonly register\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: write to readonly register\n",
> +                      __func__);
>           break;
>   
>       default:
> -        DPRINTF("bad register offset\n");
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __func__);
>       }
>   }
>   
> @@ -327,7 +325,7 @@ static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
>           return;
>       }
>       level = (atomic_read(&vdev->isr) != 0);
> -    DPRINTF("virtio_mmio setting IRQ %d\n", level);
> +    trace_virtio_mmio_setting_irq(level);
>       qemu_set_irq(proxy->irq, level);
>   }
>   
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

