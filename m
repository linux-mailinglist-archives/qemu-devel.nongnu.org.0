Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6CE2F2909
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:40:25 +0100 (CET)
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEHw-0005eO-Bc
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1kzEH8-0005Da-Sk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1kzEH6-0007dD-5b
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610437168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3yeWyOfcXxXr2qy81TjT4y/5i/ixOWJK5gQnDyWwOAI=;
 b=Oaap+8DPW9AuJQqZ8Ll8KtH9emez1ZCe9KCu6BTQXv7CeLxos51xdtZQ63Q+BKtLe1maeH
 kW1EkCExBj+KMV8apaiHvHqtflVD6ac7uWuvbvLTmWVoWEo1r4vhcnggvQ74kzolzIRrFD
 3mHKf6l2u1yRmUGuJDpzNOjTTYEG3TE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-WHskFh9xNoiFAAeidnF-Fw-1; Tue, 12 Jan 2021 02:39:26 -0500
X-MC-Unique: WHskFh9xNoiFAAeidnF-Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B132E100C660
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 07:39:25 +0000 (UTC)
Received: from [10.40.195.39] (unknown [10.40.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF823A47;
 Tue, 12 Jan 2021 07:39:24 +0000 (UTC)
Subject: Re: [PATCH] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210111222729.757402-1-imammedo@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <53870093-3b5d-2c4a-8f0e-04c78996db70@redhat.com>
Date: Tue, 12 Jan 2021 08:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111222729.757402-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 11:27 PM, Igor Mammedov wrote:
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
> 
> PS:
> While at it add a comment to x-use-canonical-path-for-ramblock-id,
> to make sure it won't go away by accident.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   backends/hostmem.c |  8 ++++++++
>   qemu-options.hx    | 25 ++++++++++++++++++++++++-
>   2 files changed, 32 insertions(+), 1 deletion(-)

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


