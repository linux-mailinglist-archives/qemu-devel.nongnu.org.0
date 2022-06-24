Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68C55967E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:26:39 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4faI-0000a1-28
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4f5u-0002Xr-R2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4f5t-0001Jl-2o
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656060912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=clZcKvLIlaSI0aj01C5lBcQXLk+ikl+B/lRxtrhuDg5wwkqdYF5UPGMlnYSf0lpgXhCWYT
 gls4LxDtou6pAKKKlV+4NFGPA7Of0TZclZCdFuJWDN30JduJvike14IeynA/GPT59zCXzZ
 nLJPAC8DViQwIpulrZlJ8I7gTkkG5jQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-8kQPj_gwPha5AfRxe-hGEg-1; Fri, 24 Jun 2022 04:55:08 -0400
X-MC-Unique: 8kQPj_gwPha5AfRxe-hGEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6A61C06915;
 Fri, 24 Jun 2022 08:55:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3893C53360;
 Fri, 24 Jun 2022 08:55:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com, thuth@redhat.com,
 alexandru.elisei@arm.com, alex.bennee@linaro.org, andre.przywara@arm.com,
 nikos.nikoleris@arm.com, ricarkol@google.com, seanjc@google.com,
 maz@kernel.org, peter.maydell@linaro.org
Subject: Re: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Date: Fri, 24 Jun 2022 04:55:06 -0400
Message-Id: <20220624085506.2731362-1-pbonzini@redhat.com>
In-Reply-To: <20220623131017.670589-1-drjones@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



