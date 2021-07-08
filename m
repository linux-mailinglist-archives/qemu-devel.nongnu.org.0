Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0813C163B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:45:27 +0200 (CEST)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WDO-0004zW-7J
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1VnR-0001SS-1R
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1VnP-0008Pd-05
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVKbrVC7hIomy03yWrZcjIxihAWag+gptx38poNf5FY=;
 b=dki2HSDlyGxwc52s1F+OaHHIgauSgwe2ArCj+1FhcxNf6zjASvznm8Rh2PNyzJyEPVAkVc
 qsn/000ixEypXF5Gm1jBPyE970dEGhQWasYmYwsaHZ6ulKBqgv9PO2ZmVuNf2dzzvtckMN
 cyJmuyrr6dTGcq2kdNN4rkN7Gwl+Z80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-F9g86yJCMpeTO0HOqOtDTQ-1; Thu, 08 Jul 2021 11:18:31 -0400
X-MC-Unique: F9g86yJCMpeTO0HOqOtDTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52CE28015F5;
 Thu,  8 Jul 2021 15:18:30 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 087BA5C1C2;
 Thu,  8 Jul 2021 15:18:21 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:18:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 3/7] tests: Add suffix tpm2 or tpm12 to ACPI table files
Message-ID: <20210708171820.3a67ab18@redhat.com>
In-Reply-To: <7a308683-2642-ff74-3f77-5826c6d5cfbd@linux.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
 <20210708155902.53e3d7f7@redhat.com>
 <7a308683-2642-ff74-3f77-5826c6d5cfbd@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 10:17:51 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 7/8/21 9:59 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 11:37:19 -0400
> > Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
> >  
> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> ---
> >>   tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
> >>   tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
> >>   tests/qtest/bios-tables-test.c                  |   3 ++-
> >>   3 files changed, 2 insertions(+), 1 deletion(-)
> >>   rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
> >>   rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)  
> > it fails checkpatch which falsely detects it as adding new files
> >
> > ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
> >
> > ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
> >
> > looks like checkpatch needs to be fixed to handle testcase variant renaming.  
> 
> Is this a show stopper for upstreaming it?
patch itself looks fine to me but I'm not sure if it's possible CCing Michael/Peter.


