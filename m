Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACC1F1FFD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 21:34:21 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiNXJ-0003YN-13
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 15:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiNVG-0002dO-Cv
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 15:32:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24351
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiNVE-0002Gh-TH
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 15:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591644730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ+gIEfrVZuxD3Rumc95y3mwFvxZewbIxyrArW8Amos=;
 b=Eevd0LK6BEsLvETQKNOCa9tJxgQ7ybpHJHtFmE3z7hWNQGTX6XDUIGGMMpHf3aewM2Bapp
 Tve7PtJdBW0DXiH8fyYFnTNrQICCotkuj9HgNeTzNivKbkSNReVzoQHJu8Ex66+o3Mc9Y0
 vahqLPsjKljXRghR9n1zvUCduCt03wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-epLY38VuMHyX1LuFlE7HYw-1; Mon, 08 Jun 2020 15:32:09 -0400
X-MC-Unique: epLY38VuMHyX1LuFlE7HYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3362F107ACF4;
 Mon,  8 Jun 2020 19:32:08 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E2D7BFE3;
 Mon,  8 Jun 2020 19:32:07 +0000 (UTC)
Subject: Re: [PATCH v6 5/5] iotests: Add test 291 to for qemu-img bitmap
 coverage
To: Kevin Wolf <kwolf@redhat.com>
References: <20200521192137.1120211-1-eblake@redhat.com>
 <20200521192137.1120211-6-eblake@redhat.com>
 <20200608191704.GJ6419@linux.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <18425890-f6ee-3b98-a307-850c8c0ec4d0@redhat.com>
Date: Mon, 8 Jun 2020 14:32:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608191704.GJ6419@linux.fritz.box>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/20 2:17 PM, Kevin Wolf wrote:
> Am 21.05.2020 um 21:21 hat Eric Blake geschrieben:
>> Add a new test covering the 'qemu-img bitmap' subcommand, as well as
>> 'qemu-img convert --bitmaps', both added in recent patches.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> This one fails for me. We need to filter out "disk size" because it
> depends on the filesystem.

Will fix. Thanks for the heads up.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


