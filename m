Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B3F30F313
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:22:29 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7deW-0006eh-Tk
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l7ddn-0006F7-Hj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:21:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l7ddj-0006Kg-8N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612441298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qU98W4luyiq/VDUTepuZKs+WqGSlmysjQm9RjPB67NA=;
 b=hVGLK5LSiJJ0jd7e1DaTVLArp5BC7CShwzUAynOo7/Isd9rIRdv/Hg8IwSZGKolqAX/hJw
 vlrNylsLolr7qkeHSFeojdDeReRBcUjGzW80miIkOwIw62Q1hipYq70uzan5ZfKsfIDHCK
 EFIiarGJi2vFRwRACXg1SkLtgeAqk7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-4gJJ00I0PJGJKDonooNgTQ-1; Thu, 04 Feb 2021 07:21:36 -0500
X-MC-Unique: 4gJJ00I0PJGJKDonooNgTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42DAA803650;
 Thu,  4 Feb 2021 12:21:35 +0000 (UTC)
Received: from [10.40.193.72] (unknown [10.40.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 255595D9EF;
 Thu,  4 Feb 2021 12:21:33 +0000 (UTC)
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210121161504.1007247-1-imammedo@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <1db4ec5d-4cd1-ea67-d414-07565c4ee70e@redhat.com>
Date: Thu, 4 Feb 2021 13:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210121161504.1007247-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 5:15 PM, Igor Mammedov wrote:
 >

Ping, please? Is there anything I can help with to get this merged? 
Libvirt's migration is broken without this patch [1] and thus I'd like 
to have this merged sooner rather than later.

1: There's a libvirt patch required but depends on this one.

Thanks,
Michal


