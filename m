Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40F33DB69
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:51:55 +0100 (CET)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDrG-0006Gf-4F
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDQq-0007tn-LC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDQp-0002kC-1O
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/Ms0vzaxk/469dSOwSeLIwjC46nAN7nadCWLnlTU2o=;
 b=A9JUtFlnJnRY0peeZF1M8pz7IXFF9+ZOkBsibYpIlzOSEyLPnYtnDdX4dTNrQRG54Ggq93
 IVVVNxwOrrJ+4m8TQbwnalJll52DRBqTF9aWekyTAHuUx1rh15tVY4q+yARjnUCYrPktkt
 v3wuYpbcYsaDK5jiobpsputsw9hLP3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-BuphfURiPhqNmsw5i5TPUQ-1; Tue, 16 Mar 2021 13:24:30 -0400
X-MC-Unique: BuphfURiPhqNmsw5i5TPUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F52FDF8A7;
 Tue, 16 Mar 2021 17:24:29 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E2D5C1A3;
 Tue, 16 Mar 2021 17:24:29 +0000 (UTC)
Subject: Re: [PULL 00/11] QOM and fdc patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210316165231.3910842-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7e545d07-778c-bd84-153b-7367de18df80@redhat.com>
Date: Tue, 16 Mar 2021 12:24:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316165231.3910842-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:52 AM, Markus Armbruster wrote:
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
> 
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
> 
> are available in the Git repository at:
> 
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16
> 
> for you to fetch changes up to 901c36b68c327c5a4e4b3701cd991dd927ac07ae:
> 
>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-16 15:52:26 +0100)
> 
> ----------------------------------------------------------------
> QOM and fdc patches patches for 2021-03-16
> 
> ----------------------------------------------------------------
> Markus Armbruster (6):
>       docs/system/deprecated: Fix note on fdc drive properties
>       fdc: Drop deprecated floppy configuration
>       fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
>       blockdev: Drop deprecated bogus -drive interface type
>       hw: Replace anti-social QOM type names
>       memory: Drop "qemu:" prefix from QOM memory region type names
> 
>  docs/system/deprecated.rst                   |  33 --

Patch mixup? The tag pull-qom-fdc-2021-03-16 only has these six patches,
but the subject line and the remaining 11 messages in this email chain
suggest a different series.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


