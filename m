Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F0693AFC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 00:05:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLNi-0003G4-8z; Sun, 12 Feb 2023 18:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLNf-0003Fj-TB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 18:03:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLNd-0005wt-0J
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 18:03:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id o18so10478906wrj.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 15:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MzvAIS83b6VjIDeqZccxvmP1NDso4YaWFeNvh3H89PM=;
 b=FXJbwjocXNke03u0qpwzdsPE/Wf6qk8ACR0cSx75aACEXj4gUJx2+uj38kZpridQBT
 UguaizSfzi2/Rsf168gRE+3xMm93q83HpvN3ynxC8rskuwW2gOAsLPNa9Ig2FFxvJ5GF
 ETJ2K34VbZRisGlUjYUzQYLVxDxiOljhLoyUZ8TTmStDNHEwB3sekkTMb5YemZzqdatl
 q6jdN2rLQAW3p9KIp0w2IBkG//G6r6n7UmhXijUAjxagOJ4R6XS2DB8r+TkJg2pKmWzi
 i2SHTTEc381hcj6DtVt9smLT8P6oLq/Ewfs9Uo9P0iV6CoZx0d6wsC9NZ/p9mwoUHu+j
 ug6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzvAIS83b6VjIDeqZccxvmP1NDso4YaWFeNvh3H89PM=;
 b=5y0pWiwqa8tNyV8sAV/5vFpIFYq68ZYGPPdN4xIeGZOdb099eUZ7Acj80maQb4ZqfT
 d0ITYAaD1sNtz7saRKuhNr9/8xTarv2M+HZD4RXHJT65rRxjXz+3YyGQAzlP/Vfh9xmK
 rvq7BR9SIgO6QBwdb3vSlHfnAkra5hqFFu6Vdw8Gb4/X56fZ67nSgP2LUjWs1nLtcfuI
 Q1aMHS8Uvy2bt9ogxoyX8/oMU9B6dC0M/JAGMLYgq+QgPNE8JBPiDCBQpZgGhpburNzE
 G9RTroaqqAg4PLUo4EZeCOcGFYfiGQxlJWhFCrtt6WAX4QRkKLQaJkx0uFNAaQDfcYhN
 ZeSg==
X-Gm-Message-State: AO0yUKWsBsTSRNTuUMtdcYtnbjmGLI0ZE1/xi+oH1m7hHfsq2R1Cp1gn
 grlrnLDwgEuC8j3yJ0XoNQ+pSjpPjEETo+qD
X-Google-Smtp-Source: AK7set/P81jL5s2D8Mlb0vtqaKH5/VtnY/Wx3qa3m7ftFjt50YvkqqWJFsnFGTSdqNo3actka+nKOw==
X-Received: by 2002:a5d:4d8f:0:b0:2bf:d428:a768 with SMTP id
 b15-20020a5d4d8f000000b002bfd428a768mr18529326wru.49.1676243010883; 
 Sun, 12 Feb 2023 15:03:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b002c3f50228afsm8952275wrt.3.2023.02.12.15.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 15:03:30 -0800 (PST)
Message-ID: <88026156-1838-bb8e-c637-b59a26759cc3@linaro.org>
Date: Mon, 13 Feb 2023 00:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] hw: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230212224730.51438-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/2/23 23:47, Philippe Mathieu-Daudé wrote:
> DeviceState::parent_bus is an internal field and should be
> accessed by the qdev_get_parent_bus() helper. Replace all
> uses in hw/ except the QDev uses in hw/core/.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/audio/intel-hda.c                |  2 +-
>   hw/block/fdc.c                      |  2 +-
>   hw/block/swim.c                     |  2 +-
>   hw/ide/qdev.c                       |  4 ++--
>   hw/net/virtio-net.c                 |  2 +-
>   hw/pci-bridge/pci_expander_bridge.c |  2 +-
>   hw/scsi/scsi-bus.c                  |  2 +-
>   hw/usb/bus.c                        |  2 +-
>   hw/usb/desc.c                       |  2 +-
>   hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
>   10 files changed, 18 insertions(+), 18 deletions(-)

I missed:

-- >8 --
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 6bc239a981..ec38828da0 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -103,14 +103,14 @@ HDACodecDevice *hda_codec_find(HDACodecBus *bus, 
uint32_t cad)

  void hda_codec_response(HDACodecDevice *dev, bool solicited, uint32_t 
response)
  {
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
      bus->response(dev, solicited, response);
  }

  bool hda_codec_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                      uint8_t *buf, uint32_t len)
  {
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
      return bus->xfer(dev, stnr, output, buf, len);
  }

@@ -344,7 +344,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
  static void intel_hda_response(HDACodecDevice *dev, bool solicited, 
uint32_t response)
  {
      const MemTxAttrs attrs = { .memory = true };
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
      IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
      hwaddr addr;
      uint32_t wp, ex;
@@ -399,7 +399,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, 
uint32_t stnr, bool output,
                             uint8_t *buf, uint32_t len)
  {
      const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
      IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
      hwaddr addr;
      uint32_t s, copy, left;
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 96582ce49b..6ae2627a56 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -164,7 +164,7 @@ typedef struct IDEDrive {

  static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error 
**errp)
  {
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, dev->qdev.parent_bus);
+    IDEBus *bus = DO_UPCAST(IDEBus, qbus, 
qdev_get_parent_bus(DEVICE(dev)));
      IDEState *s = bus->ifs + dev->unit;
      int ret;

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 9d4fec2c04..dfc5c436bd 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -382,7 +382,7 @@ static void rtas_quiesce(PowerPCCPU *cpu, 
SpaprMachineState *spapr,

  static SpaprVioDevice *reg_conflict(SpaprVioDevice *dev)
  {
-    SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
+    SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));
      BusChild *kid;
      SpaprVioDevice *other;

@@ -492,7 +492,7 @@ static void spapr_vio_busdev_realize(DeviceState 
*qdev, Error **errp)
          }
      } else {
          /* Need to assign an address */
-        SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
+        SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));

          do {
              dev->reg = bus->next_reg++;
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 3127cd7273..7b2a82b335 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -104,7 +104,7 @@ static void scsi_device_unrealize(SCSIDevice *s)
  int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                         size_t buf_len, void *hba_private)
  {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(dev)));
      int rc;

      assert(cmd->len == 0);
@@ -250,7 +250,7 @@ static bool scsi_bus_check_address(BusState *qbus, 
DeviceState *qdev, Error **er
  static void scsi_qdev_realize(DeviceState *qdev, Error **errp)
  {
      SCSIDevice *dev = SCSI_DEVICE(qdev);
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(dev)));
      bool is_free;
      Error *local_err = NULL;

@@ -705,7 +705,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps 
*reqops, SCSIDevice *d,
  SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
                            uint8_t *buf, size_t buf_len, void *hba_private)
  {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(d)));
      const SCSIReqOps *ops;
      SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(d);
      SCSIRequest *req;
@@ -1353,7 +1353,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, 
SCSICommand *cmd, uint8_t *buf,

  void scsi_device_report_change(SCSIDevice *dev, SCSISense sense)
  {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(dev)));

      scsi_device_set_ua(dev, sense);
      if (bus->info->change) {
@@ -1372,7 +1372,7 @@ void scsi_req_unref(SCSIRequest *req)
  {
      assert(req->refcount > 0);
      if (--req->refcount == 0) {
-        BusState *qbus = req->dev->qdev.parent_bus;
+        BusState *qbus = qdev_get_parent_bus(DEVICE(req->dev));
          SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qbus);

          if (bus->info->free_request && req->hba_private) {
@@ -1444,7 +1444,7 @@ void scsi_req_print(SCSIRequest *req)
      int i;

      fprintf(fp, "[%s id=%d] %s",
-            req->dev->qdev.parent_bus->name,
+            qdev_get_parent_bus(DEVICE(req->dev))->name,
              req->dev->id,
              scsi_command_name(req->cmd.buf[0]));
      for (i = 1; i < req->cmd.len; i++) {
@@ -1698,7 +1698,7 @@ static int put_scsi_requests(QEMUFile *f, void 
*pv, size_t size,
                               const VMStateField *field, JSONWriter 
*vmdesc)
  {
      SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(s)));
      SCSIRequest *req;

      QTAILQ_FOREACH(req, &s->requests, next) {
@@ -1726,7 +1726,7 @@ static int get_scsi_requests(QEMUFile *f, void 
*pv, size_t size,
                               const VMStateField *field)
  {
      SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, 
qdev_get_parent_bus(DEVICE(s)));
      int8_t sbyte;

      while ((sbyte = qemu_get_sbyte(f)) > 0) {
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 6ea4b64fe7..843dde8851 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -177,7 +177,7 @@ static inline void scsi_bus_init(SCSIBus *bus, 
size_t bus_size,

  static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
  {
-    return DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    return DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(d)));
  }

  SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 32c23a5ca2..b2111bb1c7 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -520,7 +520,7 @@ void usb_check_attach(USBDevice *dev, Error **errp);

  static inline USBBus *usb_bus_from_device(USBDevice *d)
  {
-    return DO_UPCAST(USBBus, qbus, d->qdev.parent_bus);
+    return DO_UPCAST(USBBus, qbus, qdev_get_parent_bus(DEVICE(d)));
  }

  extern const VMStateDescription vmstate_usb_device;
---

