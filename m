Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A325528059
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:05:34 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWfP-0002SZ-06
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWbE-0000Zl-UO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqWbA-0006wD-JP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pz8FgZLrtjqzU4VCDPPwZG8DcMj8lqiYotNaPWH9+RQ=;
 b=J9q/gmrBinF6Qqt11SkLkMdbHGjSLQ1RJASfhfQqDXsYMMS7H7hzLb3tG98jWAtqdl6qCK
 yeKhXH2miQC7wuLglMyKfngS75cbku6/lX+RlNnB/rUeEJIOaH0nbvynD6bqanuZwCzIgK
 716QBldPo4F/ZxC1nDGUKnvYPu9slFs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-dVco2wu7Poi0kRijABnDkA-1; Mon, 16 May 2022 05:01:01 -0400
X-MC-Unique: dVco2wu7Poi0kRijABnDkA-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso5504920ejc.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pz8FgZLrtjqzU4VCDPPwZG8DcMj8lqiYotNaPWH9+RQ=;
 b=FSzuz9X1NXfxligzXa66M6RxBM+WdFrOkNehg31BIjAXNFK3QsBtPMoOI9TDaAC77I
 XKLZjQsV2UsoNQoPEV23n2I4u7OS68Yh3KsYVvXCn+Pi+Pk8M/ec9Mvl4Yx2DgQoyUOK
 CgzYLLN9Of2xqvMnBHRZVad3Yx2qHmyKpkwzMd7rOEeJ8AIeFN13BmUj4UpvujXBTsKx
 WQ/vYn9zRKfBOzf51c+nONs0cpwulfwJLb22WVm4TeTrb7ifDCfWFZ0t3n8snIMC13sl
 PC9afBtrbmQk8Zkm560S45EovDFSh5AhvOOo20vDxRZAuixyS+LtW9oUIx7YLE3LzxNs
 m3VA==
X-Gm-Message-State: AOAM532NYj0LdkeQ5zT6KnUWGVnet12DX2fBb7/tNhQBURwza3dVbEdG
 nJAaZaELn4GJkijDou5ru1WG9+hZUrJUZXIRNKBRTa4vE0PZsTnahB6llxeVeNzup1Gk2Jx1jpS
 mJaKH3EoQd/bAA7Bn+oy3QpT6uVPhtjJwlO6tjocfVQm9PnXbWfQmSUj88YEfVRNmO24=
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr14156052ejc.439.1652691660270; 
 Mon, 16 May 2022 02:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeXTEN1ghOrM5ZHHwfk45r+r7JTu3hNRoll3Qu9VyrYk7cdrgMt9GmiTH+RSA/6TbbyFjrrg==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr14156025ejc.439.1652691660005; 
 Mon, 16 May 2022 02:01:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 jz21-20020a17090775f500b006f3ef214db4sm3039934ejc.26.2022.05.16.02.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:00:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	berrange@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v3 0/8] qmp, hmp: statistics subsystem and KVM suport.
Date: Mon, 16 May 2022 11:00:50 +0200
Message-Id: <20220516090058.1195767-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This patchset adds QEMU support for querying fd-based KVM statistics.
This allows the user to analyze the behavior of the VM without access
to debugfs.

However, instead of adding an ad hoc command, the new QMP entry point
can be extended in the future to more statistics provider than KVM
(for example TCG, tap, or the block layer) and to more objects than
the VM and vCPUS (for example network interfaces or block devices).

Because the statistics exposed by KVM are not known at compile time,
the kernel interface also comes with an introspectable schema.  This
schema is exposed by the query-stats-schemas QMP command.

Patches 1 and 2 add the basic support, respectively the QMP command
and the KVM producer.

Patches 3 and 4 add a basic HMP implementation.  The first of the two
adds a basic filtering mechanism to the QMP command, which is then used
by HMP (which only shows vCPU statistics for the currently selected
guest CPU; this is consistent with other HMP commands and does not
flood the user with an overwhelming amount of output).

The remaining patches add more filtering, respectively by provider
and by the name of a statistic.

The v2->v3 delta is just improved commit messages and documentation,
especially around the rationale for the separate introspection mechanism
and the stability of the data.

Paolo

Mark Kanda (3):
  qmp: Support for querying stats
  kvm: Support for querying fd-based stats
  hmp: add basic "info stats" implementation

Paolo Bonzini (5):
  qmp: add filtering of statistics by target vCPU
  qmp: add filtering of statistics by provider
  hmp: add filtering of statistics by provider
  qmp: add filtering of statistics by name
  hmp: add filtering of statistics by name

 accel/kvm/kvm-all.c     | 414 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |  14 ++
 include/monitor/hmp.h   |   1 +
 include/monitor/stats.h |  42 ++++
 monitor/hmp-cmds.c      | 229 ++++++++++++++++++++++
 monitor/qmp-cmds.c      | 132 +++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 246 ++++++++++++++++++++++++
 9 files changed, 1080 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.36.0


