Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1E559530
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:19:12 +0200 (CEST)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eX0-0003cw-SR
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eUC-0001PR-BB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eU7-0003hq-FG
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656058570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=QW4QBE1RAWxddDcRZFkerpHP0g6ZmEI6JR9Fbv4Hum1EiI89I7pO/lG/Qa+HRGaxRvyF3i
 cgjSj2SxalgIbEjsOt4zpiPGb/jXj6GmXm8Iwd1yMoZJD3pm0LaL7FSaoxnlimsuHjEcC2
 wC7u2A0JIFRwZOEOssIRB60F6pVdY14=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-TVL8I-gXNKOk6s5ECw_wUQ-1; Fri, 24 Jun 2022 04:16:08 -0400
X-MC-Unique: TVL8I-gXNKOk6s5ECw_wUQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c20-20020a05640227d400b004369cf00c6bso1131493ede.22
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=qApy+cXjeGTDl9wq4fW8fAP3mgoaPmpW5W1kyug6B/IYNFUa5+csEW0SC7MAH7xwDg
 74h2IUM2b8EhXgJOftLUJkuAyhJklH14j7SfoMY8Lbhx/ohuTW0+pwevvGeAo3NPat+e
 IqYv2gk+lOKFmzgDMNvruAkW6nhV78N45xXzE8YaJoog35PQt8cv/Np1mA1vDCE4LEPt
 xl++mfayahBuPRGvoyqB1x8EGXKtprtoeQyDR5I5miEQU1vR3WpTXfr44qqNMwOI4sMJ
 vl3zWlBVRKWAqbTjLPmuNVpDOxWnQwK4LPFu9OnXpVEhz369cxdz1z82pZoT/98eD78s
 pOgA==
X-Gm-Message-State: AJIora8Dxl+M9ZJBoGUcnGt6vdw6IMIIgQLge9VPkfmnynD2etcpINnk
 w4lb6zCeLbaw+jRAYAT4sLxPzGgHtLOr2VGOJBwRIQ/beCOUQPzp3Z7+ie2od+0JpRbQJq0SbQ1
 gUGbPAdnvCR4pUDI=
X-Received: by 2002:a05:6402:1f14:b0:435:97f3:640 with SMTP id
 b20-20020a0564021f1400b0043597f30640mr15867318edb.169.1656058566996; 
 Fri, 24 Jun 2022 01:16:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjEo+3jZ96Mm5vtq/ZnTyGZOldJJrYfD52XUBAEGdTa0yGqW39bSsH1f/L2BDNg5+6jBR60g==
X-Received: by 2002:a05:6402:1f14:b0:435:97f3:640 with SMTP id
 b20-20020a0564021f1400b0043597f30640mr15867292edb.169.1656058566789; 
 Fri, 24 Jun 2022 01:16:06 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm694687ejm.80.2022.06.24.01.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:16:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v2] fuzz: only use generic-fuzz targets on oss-fuzz
Date: Fri, 24 Jun 2022 10:16:00 +0200
Message-Id: <20220624081600.245265-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623125505.2137534-1-alxndr@bu.edu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo



