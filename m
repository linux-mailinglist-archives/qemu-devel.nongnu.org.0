Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D356122C731
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 15:59:23 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyyEM-0002H5-I0
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 09:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jyy9Y-0004f9-4v
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:54:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54761
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jyy9V-0005a8-9a
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595598859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cs+iqhZ3rb7gTgl5yCIBj0nxuhU8aFdMKrRaQX9xEp8=;
 b=RQiCE8QxRh6/SJtvBqrDSXXVSSpBg62ZaDdtnpxbG+bHoJ/8DQHthU8PxUfkKX2cSDrG3n
 CWYHauj53eMRA5+0vHHMqgyBQYzwZHEHSJideRIlUZxCFPl+Q5gVqN5hJ8ZFZ1UIzjzFJt
 aqRBl5zk5UxTa9WNXDjQAd6J01oOWUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-zgilH63HPzidM3QZ4DRkLg-1; Fri, 24 Jul 2020 09:54:15 -0400
X-MC-Unique: zgilH63HPzidM3QZ4DRkLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D57F800685;
 Fri, 24 Jul 2020 13:54:14 +0000 (UTC)
Received: from [10.3.112.130] (ovpn-112-130.phx2.redhat.com [10.3.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD0E183AB;
 Fri, 24 Jul 2020 13:54:11 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] util: rename qemu_open() to qemu_open_old()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200724132510.3250311-1-berrange@redhat.com>
 <20200724132510.3250311-2-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f2e2a108-e6b7-0be5-e73a-f6a4d0a71b20@redhat.com>
Date: Fri, 24 Jul 2020 08:54:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724132510.3250311-2-berrange@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 08:55:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/24/20 8:25 AM, Daniel P. Berrangé wrote:
> We want to introduce a new version of qemu_open() that uses an Error
> object for reporting problems and make this it the preferred interface.
> Rename the existing method to release the namespace for the new impl.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---

>   23 files changed, 42 insertions(+), 40 deletions(-)

Mechanical, and a quick grep shows you got them all.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


