Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A775359C1E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:29:58 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoOj-0006vl-Ex
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUoNC-0006JN-Vg
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUoNB-0000hc-2B
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617964098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06jpNA+G8s9WVhkwJ0+O3I/6J8vINevEbRTxDpMeJc0=;
 b=Rsay9xzf52xhb+16d+VRroXY31i8MoLDeluraAYsNHJnz1oXAW2vW/Js0evYscsY84mgoS
 k1QC8A/0jX9nPYxmwfdEotc64oJV2mPrQ8VosQKzhWoiC92HUFmgYQMZxc2bA/V4RMR7AW
 zXBizU+wMLp9nkukFwrbiORYaiwzxMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-5uPG01sgO0G3h5z2OJbL0Q-1; Fri, 09 Apr 2021 06:28:14 -0400
X-MC-Unique: 5uPG01sgO0G3h5z2OJbL0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA6C6D581;
 Fri,  9 Apr 2021 10:28:13 +0000 (UTC)
Received: from gondolin (ovpn-113-112.ams2.redhat.com [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87A8A5D765;
 Fri,  9 Apr 2021 10:28:00 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:27:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210409122757.5e0e182d.cohuck@redhat.com>
In-Reply-To: <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
References: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
 <1617899529-9329-2-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  8 Apr 2021 18:32:09 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> ccw_dstream_read/write functions returned values are sometime
> not taking into account and reported back to the upper level
> of interpretation of CCW instructions.
> 
> It follows that accessing an invalid address does not trigger
> a subchannel status program check to the guest as it should.
> 
> Let's test the return values of ccw_dstream_write[_buf] and
> ccw_dstream_read[_buf] and report it to the caller.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/char/terminal3270.c | 11 +++++--
>  hw/s390x/3270-ccw.c    |  5 +++-
>  hw/s390x/css.c         | 14 +++++----
>  hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>  4 files changed, 69 insertions(+), 27 deletions(-)

Thanks, queued to s390-fixes (with cc:stable added.)


