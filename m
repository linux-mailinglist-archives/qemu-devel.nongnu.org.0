Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B587292F33
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 22:10:59 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUbUg-0001jW-DM
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 16:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUbSg-00011O-NM
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUbSf-0001BP-4z
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603138131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNT/Blost0UywBHZJQ3FhZMKSoejoEaUW22NIYfMryE=;
 b=RSo7bJwFK64O45CoQ8Nvf+Cl5/uCStAmdv4JLTuZL/jw8zLELIKj2/U9GYF33+nWhuaka3
 At7QSjU/8hrEzzXDg/mmp7G4iUKScidobaHLRhzqERA2YoKrb2NhPsxe10SATw1ArWX9cP
 mUFcfjwPwJ+ONYo2s4KTVAAaXIMPCQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-7S3MhBnOO9-yF8tsMuJB-w-1; Mon, 19 Oct 2020 16:08:47 -0400
X-MC-Unique: 7S3MhBnOO9-yF8tsMuJB-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84E8F879515;
 Mon, 19 Oct 2020 20:08:46 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C85C95577A;
 Mon, 19 Oct 2020 20:08:42 +0000 (UTC)
Subject: Re: [RFC PATCH v3 1/1] tests/vm: Add Haiku test based on their
 vagrant images
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201019110749.1635343-1-f4bug@amsat.org>
 <20201019110749.1635343-2-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b49bcd34-30e2-a51f-e0a8-946376d04afa@redhat.com>
Date: Mon, 19 Oct 2020 15:08:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019110749.1635343-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/20 6:07 AM, Philippe Mathieu-Daudé wrote:
> From: Alexander von Gluck IV <kallisti5@unixzen.com>
> 
> Signed-off-by: Alexander von Gluck IV <kallisti5@unixzen.com>
> [PMD: Avoid to recreate the image each time]

grammar: s/to recreate/recreating/

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


