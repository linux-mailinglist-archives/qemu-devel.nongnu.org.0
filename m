Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E532637E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:46:43 +0100 (CET)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdS5-0004KA-HW
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFdPo-0003W2-Ao
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFdPi-00019Q-4r
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614347052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRJ35sAOgAxTV8j4XzxnS8ZOgCudMbgblLCPkf795fI=;
 b=YOPeXh3piJWErHq/46LfRtH3Skxe+uaNfmB9yaYCSPdUKmB8tUOJx1bTl3Q5VhRiBOyRsO
 MkJ+5q15kvLeODAER4RwaGIDaiQ7IRiX/egu2QbGIGMyTBPvwCh4kHanwKbKxtDPM2tY6Y
 Uk+SJNm26KIYmoZP7Qt4LsjghAZzUGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-cBocditDPymRafZ0mQnU6g-1; Fri, 26 Feb 2021 08:44:08 -0500
X-MC-Unique: cBocditDPymRafZ0mQnU6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47D180402C;
 Fri, 26 Feb 2021 13:44:07 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8EF18A77;
 Fri, 26 Feb 2021 13:44:07 +0000 (UTC)
Subject: Re: [PATCH] storage-daemon: include current command line option in
 the errors
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210226110312.157645-1-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bfd3670a-e686-aea2-2d43-702b6a1bd406@redhat.com>
Date: Fri, 26 Feb 2021 07:44:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226110312.157645-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:03 AM, Paolo Bonzini wrote:
> Use the location management facilities that the emulator uses, so that
> the current command line option appears in the error message.
> 
> Before:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: Invalid parameter 'key..'
> 
> After:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


