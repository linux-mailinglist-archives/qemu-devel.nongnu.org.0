Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF2A20B3A0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:32:34 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jopP7-000596-8q
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jopNs-0003sx-7e
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:31:16 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44031
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jopNp-0004S7-6t
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593181870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mdj6WkRabNOg+n11I5GylXjjrZ5g0Ru2RakJCt3hczE=;
 b=OpCMcwob/rtt0AKI3VMDDu5QKFfHfURH2mbV5P+qOMWbmDddvzsbslN2mBgcIL7koqtJex
 rgYNc+LgPQbJriC/5s5P365oFZLyyGza7cXdq2CGgt8XdmiN4pWgKljDJ5/OCcDxZZ8N4b
 oxWl0d3lIwo6G2WdBR/nwQAiMCYYuf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-drMKyH_hNp2BkYUV5U98xA-1; Fri, 26 Jun 2020 10:31:06 -0400
X-MC-Unique: drMKyH_hNp2BkYUV5U98xA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0B5107ACCA;
 Fri, 26 Jun 2020 14:31:05 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF237FEBE;
 Fri, 26 Jun 2020 14:31:05 +0000 (UTC)
Subject: Re: [PATCH 5/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqxcvPwakFCC2Qy-S3FZ1NdVJ2rojsZGg5S7KK-feZ-BnA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2dc07aa4-ed63-182f-06e2-a0b33453cb31@redhat.com>
Date: Fri, 26 Jun 2020 09:31:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqxcvPwakFCC2Qy-S3FZ1NdVJ2rojsZGg5S7KK-feZ-BnA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/20 7:54 AM, David CARLIER wrote:
>>From 6fa7a4108236f513201192654e07c7044a3d7e58 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 13:51:37 +0000
> Subject: [PATCH 3/3] qemu_init_exec_dir Haiku implementation

meta-comment: the original subject line says 5/5, while this line says 
3/3, which adds to the confusion of which patches are actually doing 
what, as well as which iteration of the patches we are on.  Also, the 
original subject line "haiku build fix" has been repeated for multiple 
distinct emails; better is to have the subject line come from the patch 
itself (the contents of this line would have been better as the overall 
patch subject).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


