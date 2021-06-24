Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61423B2E85
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:04:07 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO5W-00064D-1t
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3t-0003Wp-7r
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:25 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3o-0003oZ-3e
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536140; x=1656072140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xn8LyTYMh6M05szL/60RbaU9FvVoBSNwnVbRypR2OZM=;
 b=jysOBKU/vyqa7LOL89CodY+1sMb57RpQ8N1wbi/nIUgMV3q2P5BSoGrh
 eCmYhBayFbsQlgnUxfHN4pSjhPOys+6SF5wW02PoGdOgXkqsGc6e+ZglA
 i1pUAd8CKlekRHBTh3bpiEgs34BQJ/6fPE6vwn5kw2FuWgply+1YapADj
 atx9fXE2svIya+LXex2LqbZNnufa1x0SC3W0W5HxfvUluD+HXkCkBZr6Z
 N18/2FGuLNE0X0DU8ZyNAyQnEMA64U4O7O1YAwQrLt0RTxGUQlbd7potj
 KiMD9akTUGItEGi3l3QyDKMicKA0SVPncahA09OMJHprZ9v+VICQvtnNA A==;
IronPort-SDR: v+GMdQ0xMnYcO5IcjBf2Uta+L6YFtLJczRdt8APOGjEiuv3jt90A9Y595t3zX91JuQ+TbY2uBp
 c2Av+KGsQ+8hZFbo5UwnrCMwtYsZbogwouI/eY5Y16VxEkMpzItvTx8qs5v6YM23sakA/h1vIC
 UpwpCzM3IS9qnPbZ4aFR44qjI6a9+i3cdzobpLvzzJ94bFfDKyhoTyolhWTfneQcH0UHMTB5sB
 1elYoYnRAJK1+ynk45BjaJ+rRFHp7OvcSIqwTa2fBT/TzPbKmRnxnPpXl4kf8BYJW4y4Td7JNW
 p4g=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360797"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: mYN32j8lF47I8dEFBlTnwLH7fFM7vCsd4XsfBx+KE2X2CZZ5DsjB0S2vk/1EZUVY+C6s5SJ2uc
 47N+cAuXE58aIpW9NC6cW0urXncpFxNOxd8U/9SOaVa4X4pT4CO+q56ZbUmUgdTVlRuWV5DbIz
 4KnlejD4NZAs9uLDD2DfPwaiWbIW4wqoDM0OflHD3VIjxvdIXTf7MBGTD0bZGer4qyYL02uWQw
 /Os8SqGhwP/tMFzLPeSMadIKubwC5+xID80hvey1yZ5u8kR5cvDxoNXZi0xkk6K8yyfxXkmYP9
 LBxGO04AI67KU9ZuAXhQ6bhV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:30 -0700
IronPort-SDR: Q0zK+b/wiJJM4g4WFFAoTYP7qG09ww3Yg1jkOwELlm9zY7Z2XDQ5mq3MMW6YeNdaQFWCVdjHsY
 aX9gDNzOvS4Usg2tYObF49gB6bjbSdsBJjuMatgsxDrfrd/W8RZChNbGGTpgJS2kVUHKJuz/Zm
 D73yE2FWCP5ZNmJWnpu0WVchrkSJsysFoQLp2Vq/qJRySaENtsE22/OGeJtCi3mlGe3R9AiqcI
 d+NEDUpbpxmIiiFZWAUEChWFlZvZ8heiS90lbXq2FyriqY8hTC1seaBAi0ac/ba9c7WARwVXwO
 Cro=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/7] riscv-to-apply queue
Date: Thu, 24 Jun 2021 05:02:04 -0700
Message-Id: <20210624120211.85499-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d0ac9a61474cf594d19082bc8976247e984ea9a3:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-06-21' into staging (2021-06-24 09:31:26 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210624-2

for you to fetch changes up to 3ef6434409c575e11faf537ce50ca05426c78940:

  hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer (2021-06-24 05:00:13 -0700)

----------------------------------------------------------------
Third RISC-V PR for 6.1 release

 - Fix MISA in the DisasContext
 - Fix GDB CSR XML generation
 - QOMify the SiFive UART
 - Add support for the OpenTitan timer

----------------------------------------------------------------
Alistair Francis (4):
      target/riscv: Use target_ulong for the DisasContext misa
      hw/char/ibex_uart: Make the register layout private
      hw/timer: Initial commit of Ibex Timer
      hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer

Bin Meng (1):
      target/riscv: gdbstub: Fix dynamic CSR XML generation

Lukas Jünger (2):
      hw/char: Consistent function names for sifive_uart
      hw/char: QOMify sifive_uart

 include/hw/char/ibex_uart.h   |  37 -----
 include/hw/char/sifive_uart.h |  11 +-
 include/hw/riscv/opentitan.h  |   5 +-
 include/hw/timer/ibex_timer.h |  52 +++++++
 hw/char/ibex_uart.c           |  37 +++++
 hw/char/sifive_uart.c         | 152 +++++++++++++++++----
 hw/riscv/opentitan.c          |  14 +-
 hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c        |   2 +-
 target/riscv/translate.c      |   2 +-
 MAINTAINERS                   |   6 +-
 hw/timer/meson.build          |   1 +
 12 files changed, 543 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/timer/ibex_timer.h
 create mode 100644 hw/timer/ibex_timer.c

