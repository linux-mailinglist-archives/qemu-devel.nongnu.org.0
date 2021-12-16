Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2A477219
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:44:54 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxq7w-0004Se-Aw
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzf-0001T6-3Y
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzb-0004R5-Aj
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2skDZvWnQtoytSn9RHd8O8lTVGucYsnuIkRml4QGWCQ=;
 b=UAau1bF8jOIeJssFOdFfur2CHd+pFSC4s1HlsiMLLr1ZhLRrWszbzaRLCrRFRJ6IwnrtL5
 ASXP/v7aWZ4Mc+PiNTBTBCFly1UKzlX15THBiJHAAULHV9FRwwy5CcNNRyKNV9kU2AilZN
 bdm1yUD+STUNcmKaPY5hByTYkDbf7DE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-Yz7E4kp5Ntirwfwke4fOrw-1; Thu, 16 Dec 2021 07:36:09 -0500
X-MC-Unique: Yz7E4kp5Ntirwfwke4fOrw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so10242251wmr.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YZ770cliX+BGXipMo2euyb+AE2bGqVu+D8rxm5FfoM4=;
 b=JkQLAqdk6PLYQpHqiypCMJnKoXqd91Hyk9Ocjstemk/KgZTDAXFkmevn8X0zFu8bFC
 3Qc0xeeF7StuKuZHpSHNn32xs5MVH5Ywhc62AotZTjZXGhjoVibCe3dm26w1BnizkZCb
 5tenQJSCIkMu6vQewlRhsVJKnJA6xvQaKhwzi1U0KHUDyuGEyFcy90TRxvQw/Vag7D2L
 RzFDL24mY6V51q1oAzocoWjDCg+mVizi/H3S2cR0YxKpMiXgLbruC+XDucT5eyH+Yyw8
 7EAuOEBYLt18ng0v7Y+NcR6E7myf7vD+XDTSKzzTJNVVWoP+345YVZ7DK0ihdh83njGk
 m5XA==
X-Gm-Message-State: AOAM530NpjCJdjbT/ddDAEiamaPu6wpOXt/DnWy54/answ4kLnkl04ui
 8XABDK1o8z7Qjg9xCCN3cYM1SGzr3bov5Ud6m+gUUu63Ho5+CGeu4n+Md3ajY/iTjg9NQ22XuFN
 6H68JlpwIqTMuQXi+vzu4YKkG9KoikLoWeW2WAGG1xVM6C2vTx7h6o+xc0hiKSX19
X-Received: by 2002:a5d:6442:: with SMTP id d2mr1146254wrw.334.1639658168223; 
 Thu, 16 Dec 2021 04:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4R3J61onJK/Ni6qtXgf9PfWlOry79A5rZI4Qs4aJVx+Yk1Rd3g8cJrHSRg1cWxEwTtjXF5w==
X-Received: by 2002:a5d:6442:: with SMTP id d2mr1146222wrw.334.1639658167972; 
 Thu, 16 Dec 2021 04:36:07 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l9sm5627319wrs.101.2021.12.16.04.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hw: Have DMA API take MemTxAttrs arg & propagate
 MemTxResult (part 2)
Date: Thu, 16 Dec 2021 13:35:50 +0100
Message-Id: <20211216123558.799425-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the continuation of part 1 (dma_memory API):=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html=0D
=0D
This series update the dma_buf API.=0D
=0D
Based on "hw: Let the DMA API take a MemTxAttrs argument"=0D
Based-on: <20210702092439.989969-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  dma: Have dma_buf_rw() take a void pointer=0D
  dma: Have dma_buf_read() / dma_buf_write() take a void pointer=0D
  dma: Let pci_dma_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_write() take MemTxAttrs argument=0D
  dma: Let dma_buf_read() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() propagate MemTxResult=0D
  dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h  | 10 +++++----=0D
 include/sysemu/dma.h  |  6 ++++--=0D
 hw/audio/intel-hda.c  |  3 ++-=0D
 hw/ide/ahci.c         | 10 +++++----=0D
 hw/nvme/ctrl.c        |  5 +++--=0D
 hw/scsi/esp-pci.c     |  2 +-=0D
 hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------=0D
 hw/scsi/scsi-bus.c    |  4 ++--=0D
 softmmu/dma-helpers.c | 25 ++++++++++++++--------=0D
 9 files changed, 74 insertions(+), 39 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


