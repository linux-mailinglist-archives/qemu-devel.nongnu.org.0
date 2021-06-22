Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA63AFD33
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:45:59 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaAY-0005js-Dq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lva9M-0004Eo-T4
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:44:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lva9K-0000SU-6E
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624344281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETdCV4XF+U0mbcRD0sUo1cTS3WfplBShflfv1z3I0Bo=;
 b=KFu0n90eT0wc6jHyw32D1heZ3+kFq09DSU9Q3NEbsObKkZcgx/ovTxBI9pZDT4C1dY3oXR
 f0ck5aUiHAglpoVusAx59b9dbkQR6BQQg0SEUWy02omNjWv51+oBiGmnHzJjUO9YpIp4/t
 KwztJMqoZdHyhg2J3MYgTA9nAWHVEUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-tuk7GCWpPYqkc7k_rTIfeQ-1; Tue, 22 Jun 2021 02:44:37 -0400
X-MC-Unique: tuk7GCWpPYqkc7k_rTIfeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53AE48042FE;
 Tue, 22 Jun 2021 06:44:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D7710016FE;
 Tue, 22 Jun 2021 06:44:31 +0000 (UTC)
Date: Tue, 22 Jun 2021 08:44:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v4 1/6] ACPI ERST: bios-tables-test.c steps 1 and 2
Message-ID: <20210622084430.7f85a0fb@redhat.com>
In-Reply-To: <20210622083409.342aaf22@redhat.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
 <1623436283-20213-2-git-send-email-eric.devolder@oracle.com>
 <20210622083409.342aaf22@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 08:34:09 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 11 Jun 2021 14:31:18 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
> > Following the guidelines in tests/qtest/bios-tables-test.c, this
> > change adds empty placeholder files per step 1 for the new ERST
> > table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
> > per step 2.
> > 
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>  
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> > ---
> >  tests/data/acpi/microvm/ERST                | 0
> >  tests/data/acpi/pc/ERST                     | 0
> >  tests/data/acpi/q35/ERST                    | 0


wait,
you are adding empty template files here
but the later matching bios-tables-test is nowhere to be found
Was testcase lost somewhere along the way?

also it seems you add ERST only to pc/q35,
so why tests/data/acpi/microvm/ERST is here?

> >  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
> >  4 files changed, 4 insertions(+)
> >  create mode 100644 tests/data/acpi/microvm/ERST
> >  create mode 100644 tests/data/acpi/pc/ERST
> >  create mode 100644 tests/data/acpi/q35/ERST
> > 
> > diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523..e004c71 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,5 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/pc/ERST",
> > +"tests/data/acpi/q35/ERST",
> > +"tests/data/acpi/microvm/ERST",
> > +  
> 
> 


