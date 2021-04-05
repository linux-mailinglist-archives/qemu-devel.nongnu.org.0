Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E33542D8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:34:02 +0200 (CEST)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQIj-0002Er-D9
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQGu-0000tl-BZ
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQGs-0001aE-Hy
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so591544wma.3
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56qCabGiTmp8/OA1qjGwzgIpTxwT0naSQo5r4vu8MsE=;
 b=QHs9McSf1F5G2xF3fEsoomdoTk08jMXfETJNApewAHbYLvGmt1VLoaBPkIV4O3pVm9
 1mSBYVDFvtDVun7vynRKpYdzFhuHXThKxEFxvROQ8vKp1yD2X0lQqt/qJJ4INsP4iLrM
 6U8/KXeAK1oHc8IkKgNa6q6p7uY0khm6i285ZlezHzRMCStzsiyqDqCz4VogSMZxlGOa
 x0XrmDIHW1b362HTss9E3wMz2P6pviSV6/CETjL1Rv5pN4IXOw5JccajPL8h9CuEXt2U
 GlvGdH4xfbOcV+kTVNUsjVo7BcDm9b9Qbwc/XymmY6Rq81Uscs9Yioz1Yb7UXpIJ/VLX
 g10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56qCabGiTmp8/OA1qjGwzgIpTxwT0naSQo5r4vu8MsE=;
 b=N+vteAEygckZVESTffhq2/Wi6YJ8vvdY+vYvduTHQ1I3vvC/q3llkQhkB5H0SVW2IK
 kH45l/Iou7DvT9ANc5QcxiT5q9MPubvgGRLUzy2opFrbc+jTgYwKdL+OByNuR180CBJa
 fTBq3N5sibbhN6H77acPcdg5c9sFq2+H2Ashfg+mnomOL0wzNZOjfP415FaHiVnCJ5rL
 qb3ntKoUrnsIIx1WMxdjJulhG5fESDKywtPBxIrr1HeoFTu02YyqITXygzAukGPKwspy
 iInvliD4kdedD6Z/2JL7q68lzZpGlfJXjKfg9c/ZeunK1TvWLTbOR7X7TFyXJYUzYkHJ
 I9jw==
X-Gm-Message-State: AOAM5330E3JAoxpaThEAfc04AAwxXQC3+Whg8s5wBcOp7khNtRGiwghk
 8OM8jwN/xQybSIP5Ww3pNeTYRe9KGvY9lQ==
X-Google-Smtp-Source: ABdhPJzL1FnnYlnVABNcEDZI+X1NwkYu629PRg/jNBTXxd5cduN+KNvYL2sBVxz9kIsedEZmP7Va0g==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr6671649wmq.41.1617633124416; 
 Mon, 05 Apr 2021 07:32:04 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:03 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: *** ARC port for review ***
Date: Mon,  5 Apr 2021 15:31:11 +0100
Message-Id: <20210405143138.17016-1-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone,

Here is a long due refresh of ARC port patches.

The reason for taking so long was that I did a big refreshement to the
code due to the adition of the soon to release ARCv3 (64 bit) architecture.
In order to avoid further big changes in the original patches we decided to
delay the submittion and include all the changes done to support ARCv3.

Special thanks and apologies for Richard Henderson that has (long time ago)
given his feedback which unfortunately took us a while to address and improve.

Requests addressed:
 - Long list of fixes/improvements by Richard.
 - Generalization of the code to support both 32 and 64 bit targets.

Pending to be addressed:
 - Refactor of the decoder code which currently depends on string
   matching of the mnemonic.

In order to simplify the review process, we have separated the patches 
for ARCv3 from the previous emailed ARCv2 ones. Being the patches from
1 to 16 for ARCv2 and 17 to 27 for ARCv3.

Best regards,
Cupertino Miranda



