Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D246B33AE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:59:47 +0100 (CET)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLj4k-0001MN-V5
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj2p-0000BR-84
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLj2m-0006P0-Ln
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615798663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXyWk/M454tGToxGEoPuTZqKKUwq8ZYtJWhGMG2i3I4=;
 b=AYM3SAIa46WFPrd1GVk9CvpuKehX08PE5MuYjsDzJElYr+CM0/B6/0nms+HxXKYsebZkuD
 ra8wxMdmxgI4HnGmAnullzY95QSkKMmeAluKgWIJO2t9hPgdVUuQE6m14wrzEND6/uZZpT
 uUwLk5tUjEwV1uvgYP8BiIksLM4iGeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-MmNVA530Ot-BxkF0cobF5g-1; Mon, 15 Mar 2021 04:57:39 -0400
X-MC-Unique: MmNVA530Ot-BxkF0cobF5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E618042BE;
 Mon, 15 Mar 2021 08:57:38 +0000 (UTC)
Received: from [10.36.112.200] (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C380610AF;
 Mon, 15 Mar 2021 08:57:32 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] acpi: Set proper maximum size for
 "etc/table-loader" blob
To: qemu-devel@nongnu.org
References: <20210304105554.121674-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <acb73d49-6c26-0f4a-9426-fd345b9cf35a@redhat.com>
Date: Mon, 15 Mar 2021 09:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.03.21 11:55, David Hildenbrand wrote:
> Fix and cleanup initializing the maximum size of mutable ACPI blobs.
> 
> v1/v2 -> v3:
> - 'acpi: Set proper maximum size for "etc/table-loader" blob'
> -- Move "etc/table-loader" change to separate patch
> -- Extend description
> -- Fixup maximum size (now really use 64k)
> - Add some patches to cleanup/refactor the code. I avoided using a new
>    enum for the different tables for now, using the table names should be
>    good enough and is simple.
> 

Ping, would be nice to get this into v6.0


-- 
Thanks,

David / dhildenb


