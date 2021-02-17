Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69131D7D4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:04:49 +0100 (CET)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKdU-0004WC-SZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCKcF-0003dl-OA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:03:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCKcB-0001aZ-6h
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613559804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdWxqWs0MGw2lP4zr2nDdaDj8XIhRcGTrZ5RO0ha5DM=;
 b=BEPe7yN2/PVXCSBTvFoYGhnC6Cjl9OS4PkoK3yXnPxkgz4PUcQ/JqUnViIRTqH6NaH/FmB
 6KWaxubY5sHlL8EPE8sw2HQxMb3dTAE+5C6RNpUiQF44G8fkYoX2qTogkNVAcma9DWtwen
 TVP7yALHvJMVt1V7Jq5HOZdsNuMd+x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-W33cNscWNEG1y8Vs1jUdSw-1; Wed, 17 Feb 2021 06:03:22 -0500
X-MC-Unique: W33cNscWNEG1y8Vs1jUdSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D406801983
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 11:03:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32C856267A;
 Wed, 17 Feb 2021 11:03:16 +0000 (UTC)
Subject: Re: [qemu-web PATCH] Add Outreachy and GSoC announcement
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210217100748.269005-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <10d1e37a-035b-01cc-cf34-08b0bce1e06b@redhat.com>
Date: Wed, 17 Feb 2021 12:03:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217100748.269005-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/02/2021 11.07, Stefan Hajnoczi wrote:
> QEMU is participating in Outreachy May-August and is applying for GSoC
> 2021. It's time to publish information on these internship programs and
> how to apply.

Thanks, it's online now:

  https://www.qemu.org/2021/02/17/gsoc-and-outreachy-2021/

  Thomas


