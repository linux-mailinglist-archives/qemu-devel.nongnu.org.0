Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AC39AB21
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 21:56:21 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lotRz-0004DB-1k
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 15:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lotQV-0002ol-UO
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lotQS-00008o-PW
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622750082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BjGY/KCSk4vBafykyiq6JVULKpW0uTwk/ONurD4Ab1w=;
 b=Ne/88ij7+uB7w7asF17+odwOIYNAHW/+xrQSwbwqmtvc9XYJAQMfCXtAHLsFUzm2Erh83Z
 sKZTeA1+Ehx1DdOf7bVrWrDqIjkAp+zM21CNCSgys4DH+BmY1W69deWxs3qTwvUBkAc8a1
 8YgIlGXApf1ch284gH12of0jLqNYVcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-KTtaELhzOtqA0PbuAWLJcQ-1; Thu, 03 Jun 2021 15:54:41 -0400
X-MC-Unique: KTtaELhzOtqA0PbuAWLJcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71CE88015F5;
 Thu,  3 Jun 2021 19:54:40 +0000 (UTC)
Received: from localhost (ovpn-120-94.rdu2.redhat.com [10.10.120.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2461E1B46C;
 Thu,  3 Jun 2021 19:54:40 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:54:39 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v2 1/3] doc: Fix some mistakes in the SEV documentation
Message-ID: <20210603195439.zrqfosqdrpfeo4av@habkost.net>
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
 <95a079ae-a6b3-b7f6-5d22-c8114b3da991@amd.com>
 <4b4fee23-96be-740b-87dc-cbee8ef7ea53@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4b4fee23-96be-740b-87dc-cbee8ef7ea53@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 10:29:35AM +0200, Laszlo Ersek wrote:
> On 06/02/21 21:19, Tom Lendacky wrote:
> > Just a quick ping on this series...
> 
> Right, I'm unsure who is supposed to merge this... Do you remember who
> usually merges the SEV-related patch series (plural)?

I'm queueing this series by now, but we truly need somebody to
volunteer as maintainer of the SEV code.

-- 
Eduardo


