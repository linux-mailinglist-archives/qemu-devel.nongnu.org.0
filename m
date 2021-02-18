Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D7C31E7A2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 09:50:28 +0100 (CET)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCf11-0004vH-3w
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 03:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCezu-0004Bf-AA
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 03:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCezq-00043a-NA
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 03:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613638153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsA1sg6+YNrE6M5yNoFPff8/sHdozIwtyKIdVvdg3LU=;
 b=gH8ycKpqe0E3MIvO2Blu00TlKuWQXql8wlM6i4LsDqnk1DqGbjWgyDD4OtIhMSJlamOzkt
 UtMR9L89b/1Y+fbY01y+kOIBL/rgis8UTMA78U8tAmOQWar/HDy8AeRwzLaBBVz3r7IJLu
 wa9ct3P566Ypdxcvv9OPIhJDpTJxQ/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-GkAHgMtvPQ-37F5qjHBbnQ-1; Thu, 18 Feb 2021 03:49:10 -0500
X-MC-Unique: GkAHgMtvPQ-37F5qjHBbnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08FE1801975;
 Thu, 18 Feb 2021 08:49:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F171819D80;
 Thu, 18 Feb 2021 08:49:05 +0000 (UTC)
Subject: Re: [PATCH] qsd: Document FUSE exports
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210217115844.62661-1-mreitz@redhat.com>
 <dfe78693-0ce5-c7a2-369c-ce47598a6651@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <61fc58b4-3773-7f1f-dc61-925e66febaa9@redhat.com>
Date: Thu, 18 Feb 2021 09:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dfe78693-0ce5-c7a2-369c-ce47598a6651@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.02.21 17:26, Eric Blake wrote:
> On 2/17/21 5:58 AM, Max Reitz wrote:
>> Implementing FUSE exports required no changes to the storage daemon, so
>> we forgot to document them there.  Considering that both NBD and
>> vhost-user-blk exports are documented in its man page (and NBD exports
>> in its --help text), we should probably do the same for FUSE.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   docs/tools/qemu-storage-daemon.rst   | 19 +++++++++++++++++++
>>   storage-daemon/qemu-storage-daemon.c |  4 ++++
>>   2 files changed, 23 insertions(+)
> 
>> @@ -142,6 +153,14 @@ domain socket ``vhost-user-blk.sock``::
>>         --blockdev driver=qcow2,node-name=qcow2,file=file \
>>         --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=vhost-user-blk.sock,node-name=qcow2
>>   
>> +Export a qcow2 image file ``disk.qcow2`` via FUSE on itself, so the disk image
>> +file will then appear as a raw image::
>> +
>> +  $ qemu-storage-daemon \
>> +      --blockdev driver=file,node-name=file,filename=disk.qcow2 \
>> +      --blockdev driver=qcow2,node-name=qcow2,file=file \
>> +      --export type=fuse,id=export,node-name=qcow2,mountpoint=disk.qcow2,writable=on
>> +
> 
> Should the example also mention how to unmount the file when you're done?

Just as with other exports, the export goes away when it is deleted, 
which happens e.g. when the QSD exits.  I.e., fuse_export_delete() calls 
fuse_session_unmount().

> Otherwise looks good to me.  Any documentation is better than none, even
> if we can add more, so
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Max


