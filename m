Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AFD2C1B1A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 02:59:13 +0100 (CET)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khNbs-0001qn-6T
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 20:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khNa3-0001HE-VZ; Mon, 23 Nov 2020 20:57:20 -0500
Received: from ozlabs.org ([203.11.71.1]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khNa0-0005zq-5z; Mon, 23 Nov 2020 20:57:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cg6bB0nNPz9sSf; Tue, 24 Nov 2020 12:57:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606183030;
 bh=eA/MNy5Ho8czw2hmFl9jWxT8QLVP9/SbTFAjvX7wmA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EzzsTFLyastmOS5HA/e7P8mq2hB5q+pNOYpLTEE/+giDoKXaehj+gbwd32xAknnbK
 1ddzDir5cyS1NyoUh3d/9C5Z8iT48YIyZuQEXILTCT403DP5TUgtMz9Kei5iu/fiQA
 jLVawwI1d1ZN5rwXXBQzUJLNIHErwPa4Pep6Zuis=
Date: Tue, 24 Nov 2020 12:47:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] xive: Add trace events
Message-ID: <20201124014758.GA521467@yekko.fritz.box>
References: <20201123163717.1368450-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8a48p4KKsB+A/3VY"
Content-Disposition: inline
In-Reply-To: <20201123163717.1368450-1-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gustavo Romero <gromero@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8a48p4KKsB+A/3VY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 05:37:17PM +0100, C=E9dric Le Goater wrote:
> I have been keeping those logging messages in an ugly form for
> while. Make them clean !
>=20
> Beware not to activate all of them, this is really verbose.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/intc/spapr_xive.c | 27 +++++++++++++++++++++++++++
>  hw/intc/xive.c       | 40 +++++++++++++++++++++++++++++++++++++---
>  hw/intc/trace-events | 26 ++++++++++++++++++++++++++
>  3 files changed, 90 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 1fa09f287ac0..644cc85cbdc9 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -24,6 +24,7 @@
>  #include "hw/ppc/xive.h"
>  #include "hw/ppc/xive_regs.h"
>  #include "hw/qdev-properties.h"
> +#include "trace.h"
> =20
>  /*
>   * XIVE Virtualization Controller BAR and Thread Managment BAR that we
> @@ -900,6 +901,8 @@ static target_ulong h_int_get_source_info(PowerPCCPU =
*cpu,
>      target_ulong flags  =3D args[0];
>      target_ulong lisn   =3D args[1];
> =20
> +    trace_spapr_xive_get_source_info(flags, lisn);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1015,6 +1018,8 @@ static target_ulong h_int_set_source_config(PowerPC=
CPU *cpu,
>      uint8_t end_blk;
>      uint32_t end_idx;
> =20
> +    trace_spapr_xive_set_source_config(flags, lisn, target, priority, ei=
sn);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1120,6 +1125,8 @@ static target_ulong h_int_get_source_config(PowerPC=
CPU *cpu,
>      uint8_t nvt_blk;
>      uint32_t end_idx, nvt_idx;
> =20
> +    trace_spapr_xive_get_source_config(flags, lisn);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1194,6 +1201,8 @@ static target_ulong h_int_get_queue_info(PowerPCCPU=
 *cpu,
>      uint8_t end_blk;
>      uint32_t end_idx;
> =20
> +    trace_spapr_xive_get_queue_info(flags, target, priority);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1281,6 +1290,8 @@ static target_ulong h_int_set_queue_config(PowerPCC=
PU *cpu,
>      uint8_t end_blk, nvt_blk;
>      uint32_t end_idx, nvt_idx;
> =20
> +    trace_spapr_xive_set_queue_config(flags, target, priority, qpage, qs=
ize);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1448,6 +1459,8 @@ static target_ulong h_int_get_queue_config(PowerPCC=
PU *cpu,
>      uint8_t end_blk;
>      uint32_t end_idx;
> =20
> +    trace_spapr_xive_get_queue_config(flags, target, priority);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1541,6 +1554,10 @@ static target_ulong h_int_set_os_reporting_line(Po=
werPCCPU *cpu,
>                                                  target_ulong opcode,
>                                                  target_ulong *args)
>  {
> +    target_ulong flags   =3D args[0];
> +
> +    trace_spapr_xive_set_os_reporting_line(flags);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1577,6 +1594,10 @@ static target_ulong h_int_get_os_reporting_line(Po=
werPCCPU *cpu,
>                                                  target_ulong opcode,
>                                                  target_ulong *args)
>  {
> +    target_ulong flags   =3D args[0];
> +
> +    trace_spapr_xive_get_os_reporting_line(flags);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1629,6 +1650,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
>      hwaddr mmio_addr;
>      XiveSource *xsrc =3D &xive->source;
> =20
> +    trace_spapr_xive_esb(flags, lisn, offset, data);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1698,6 +1721,8 @@ static target_ulong h_int_sync(PowerPCCPU *cpu,
>      target_ulong flags =3D args[0];
>      target_ulong lisn =3D args[1];
> =20
> +    trace_spapr_xive_sync(flags, lisn);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> @@ -1763,6 +1788,8 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
>      SpaprXive *xive =3D spapr->xive;
>      target_ulong flags   =3D args[0];
> =20
> +    trace_spapr_xive_reset(flags);
> +
>      if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
>          return H_FUNCTION;
>      }
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 489e6256ef70..fa8c3d82877f 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "hw/ppc/xive.h"
>  #include "hw/ppc/xive_regs.h"
> +#include "trace.h"
> =20
>  /*
>   * XIVE Thread Interrupt Management context
> @@ -93,6 +94,10 @@ static uint64_t xive_tctx_accept(XiveTCTX *tctx, uint8=
_t ring)
> =20
>          /* Drop Exception bit */
>          regs[TM_NSR] &=3D ~mask;
> +
> +        trace_xive_tctx_accept(tctx->cs->cpu_index, ring,
> +                               regs[TM_IPB], regs[TM_PIPR],
> +                               regs[TM_CPPR], regs[TM_NSR]);
>      }
> =20
>      return (nsr << 8) | regs[TM_CPPR];
> @@ -113,12 +118,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_=
t ring)
>          default:
>              g_assert_not_reached();
>          }
> +        trace_xive_tctx_notify(tctx->cs->cpu_index, ring,
> +                               regs[TM_IPB], regs[TM_PIPR],
> +                               regs[TM_CPPR], regs[TM_NSR]);
>          qemu_irq_raise(xive_tctx_output(tctx, ring));
>      }
>  }
> =20
>  static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cpp=
r)
>  {
> +    uint8_t *regs =3D &tctx->regs[ring];
> +
> +    trace_xive_tctx_set_cppr(tctx->cs->cpu_index, ring,
> +                             regs[TM_IPB], regs[TM_PIPR],
> +                             cppr, regs[TM_NSR]);
> +
>      if (cppr > XIVE_PRIORITY_MAX) {
>          cppr =3D 0xff;
>      }
> @@ -508,6 +522,8 @@ void xive_tctx_tm_write(XivePresenter *xptr, XiveTCTX=
 *tctx, hwaddr offset,
>  {
>      const XiveTmOp *xto;
> =20
> +    trace_xive_tctx_tm_write(offset, size, value);
> +
>      /*
>       * TODO: check V bit in Q[0-3]W2
>       */
> @@ -545,6 +561,7 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveT=
CTX *tctx, hwaddr offset,
>                             unsigned size)
>  {
>      const XiveTmOp *xto;
> +    uint64_t ret;
> =20
>      /*
>       * TODO: check V bit in Q[0-3]W2
> @@ -560,7 +577,8 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveT=
CTX *tctx, hwaddr offset,
>                            "@%"HWADDR_PRIx"\n", offset);
>              return -1;
>          }
> -        return xto->read_handler(xptr, tctx, offset, size);
> +        ret =3D xto->read_handler(xptr, tctx, offset, size);
> +        goto out;
>      }
> =20
>      /*
> @@ -568,13 +586,17 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, Xiv=
eTCTX *tctx, hwaddr offset,
>       */
>      xto =3D xive_tm_find_op(offset, size, false);
>      if (xto) {
> -        return xto->read_handler(xptr, tctx, offset, size);
> +        ret =3D xto->read_handler(xptr, tctx, offset, size);
> +        goto out;
>      }
> =20
>      /*
>       * Finish with raw access to the register values
>       */
> -    return xive_tm_raw_read(tctx, offset, size);
> +    ret =3D xive_tm_raw_read(tctx, offset, size);
> +out:
> +    trace_xive_tctx_tm_read(offset, size, ret);
> +    return ret;
>  }
> =20
>  static char *xive_tctx_ring_print(uint8_t *ring)
> @@ -1005,6 +1027,8 @@ static uint64_t xive_source_esb_read(void *opaque, =
hwaddr addr, unsigned size)
>                        offset);
>      }
> =20
> +    trace_xive_source_esb_read(addr, srcno, ret);
> +
>      return ret;
>  }
> =20
> @@ -1030,6 +1054,8 @@ static void xive_source_esb_write(void *opaque, hwa=
ddr addr,
>      uint32_t srcno =3D addr >> xsrc->esb_shift;
>      bool notify =3D false;
> =20
> +    trace_xive_source_esb_write(addr, srcno, value);
> +
>      /* In a two pages ESB MMIO setting, trigger page only triggers */
>      if (xive_source_is_trigger_page(xsrc, addr)) {
>          notify =3D xive_source_esb_trigger(xsrc, srcno);
> @@ -1507,6 +1533,7 @@ static bool xive_presenter_notify(XiveFabric *xfb, =
uint8_t format,
> =20
>      /* handle CPU exception delivery */
>      if (count) {
> +        trace_xive_presenter_notify(nvt_blk, nvt_idx, match.ring);
>          xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(pri=
ority));
>      }
> =20
> @@ -1558,6 +1585,7 @@ static void xive_router_end_notify(XiveRouter *xrtr=
, uint8_t end_blk,
>      }
> =20
>      if (!xive_end_is_valid(&end)) {
> +        trace_xive_router_end_notify(end_blk, end_idx, end_data);
>          qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
>                        end_blk, end_idx);
>          return;
> @@ -1683,6 +1711,10 @@ do_escalation:
>          }
>      }
> =20
> +    trace_xive_router_end_escalate(end_blk, end_idx,
> +           (uint8_t) xive_get_field32(END_W4_ESC_END_BLOCK, end.w4),
> +           (uint32_t) xive_get_field32(END_W4_ESC_END_INDEX, end.w4),
> +           (uint32_t) xive_get_field32(END_W5_ESC_END_DATA,  end.w5));
>      /*
>       * The END trigger becomes an Escalation trigger
>       */
> @@ -1796,6 +1828,8 @@ static uint64_t xive_end_source_read(void *opaque, =
hwaddr addr, unsigned size)
>      end_blk =3D xive_router_get_block_id(xsrc->xrtr);
>      end_idx =3D addr >> (xsrc->esb_shift + 1);
> =20
> +    trace_xive_end_source_read(end_blk, end_idx, addr);
> +
>      if (xive_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
>                        end_idx);
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 22782b3f089b..77addc100f72 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -203,3 +203,29 @@ heathrow_set_irq(int num, int level) "set_irq: num=
=3D0x%02x level=3D%d"
>  # bcm2835_ic.c
>  bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #%d level %d"
>  bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
> +
> +# spapr_xive.c
> +spapr_xive_get_source_info(uint64_t flags, uint64_t lisn) "flags=3D0x%"P=
RIx64" lisn=3D0x%"PRIx64
> +spapr_xive_set_source_config(uint64_t flags, uint64_t lisn, uint64_t tar=
get, uint64_t priority, uint64_t eisn) "flags=3D0x%"PRIx64" lisn=3D0x%"PRIx=
64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64" eisn=3D0x%"PRIx64
> +spapr_xive_get_source_config(uint64_t flags, uint64_t lisn) "flags=3D0x%=
"PRIx64" lisn=3D0x%"PRIx64
> +spapr_xive_get_queue_info(uint64_t flags, uint64_t target, uint64_t prio=
rity) "flags=3D0x%"PRIx64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64
> +spapr_xive_set_queue_config(uint64_t flags, uint64_t target, uint64_t pr=
iority, uint64_t qpage, uint64_t qsize) "flags=3D0x%"PRIx64" target=3D0x%"P=
RIx64" priority=3D0x%"PRIx64" qpage=3D0x%"PRIx64" qsize=3D0x%"PRIx64
> +spapr_xive_get_queue_config(uint64_t flags, uint64_t target, uint64_t pr=
iority) "flags=3D0x%"PRIx64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64
> +spapr_xive_set_os_reporting_line(uint64_t flags) "flags=3D0x%"PRIx64
> +spapr_xive_get_os_reporting_line(uint64_t flags) "flags=3D0x%"PRIx64
> +spapr_xive_esb(uint64_t flags, uint64_t lisn, uint64_t offset, uint64_t =
data) "flags=3D0x%"PRIx64" lisn=3D0x%"PRIx64" offset=3D0x%"PRIx64" data=3D0=
x%"PRIx64
> +spapr_xive_sync(uint64_t flags, uint64_t lisn) "flags=3D0x%"PRIx64" lisn=
=3D0x%"PRIx64
> +spapr_xive_reset(uint64_t flags) "flags=3D0x%"PRIx64
> +
> +# xive.c
> +xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0=
x%02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
> +xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0=
x%02x CPPR=3D0x%02x NSR=3D0x%02x raise !"
> +xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pi=
pr, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=
=3D0x%02x new CPPR=3D0x%02x NSR=3D0x%02x"
> +xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x=
0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
> +xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0=
x0x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
> +xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_d=
ata) "END 0x%02x/0x%04x -> enqueue 0x%08x"
> +xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_=
blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate EN=
D 0x%02x/0x%04x data 0x%08x"
> +xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "=
@0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> +xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@=
0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
> +xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "=
found NVT 0x%x/0x%x ring=3D0x%x"
> +xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "=
END 0x%x/0x%x @0x0x%"PRIx64

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8a48p4KKsB+A/3VY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+8ZkwACgkQbDjKyiDZ
s5JSbQ/9HJ+QT0iBeXA91QeRAXvqyfqM9nWlN2clA17TwBnlVCItqASivzzAksuo
9l4s9kR8Vv7q0zHjYXBWdT2jvHrlotYEFT9iXS0/jJ8H7zBSo14ceq+Ha8t5rfvl
8CnsEmgIK92pjLBAanRbmCj/Gz0lj1Vu47A6VWUmjdzNcFnHHikTxAmuajB7vjYe
oBvk6OzlrTDn7+Bl7HDuYJ40qjovFotsk5baKPz8Zo8kJMWHgTQkkntUKLz/rqm5
zhwiJLhJdpe1w3pGZ1qIGsg1S4jx6UxMS5kgxRGr5YjLX55cRQWgNhEXdeuLu3dz
xsHmw+/clzXUxJRYQaJwaY3SdEMEtmEampFDSp4ZZu5L9XkiOAMN4CqdBcW0qMsU
q7cBtLJEYM3MJ47hMxkW+JWwn2pwAI86c4vaIekEXS03LFRoyZF5aqdlqKLUGmTm
fXUJedImpd6wNJG4NLprObCEWT/R2IMJt6AcJli4R4ea0gkdiDOANWgNAtGg0eTv
m46t9vr78jNcPHwHb9jGmcFicRFL36TvKitITJUj/YarsUwQhePIqfI7F/7iAcAG
HLjcrygJ6/yFHYoUAu0ybD2GCdnMeg6dyarqeuLkYAXNrymhD6GJH3LykEQK/dDz
VWwq925JBmaIz11QVajpDeX/ks1N7wGPVeNaaS3zyDPxUSiVKYU=
=L6KU
-----END PGP SIGNATURE-----

--8a48p4KKsB+A/3VY--

