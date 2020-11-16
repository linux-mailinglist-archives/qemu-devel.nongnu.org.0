Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEB2B4A58
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:10:48 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keh5U-0000md-2I
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1keh2B-0007N2-Sm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1keh25-0007MP-03
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605542821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlhXw4wRO66yj+OY2OOMl/xFZewC2Gz8TowFHGrjRpM=;
 b=WsJGJlJxW+BcGII31/5DOT/itlemKBif8Ohlok6vXd5w6v98TokQnYv0vQ5VB3p0RMyjWa
 rU2zb5CQVsQajgv77Y4vngNlTUfblZYgvcCddt2oSCPikOyW0EXPpAygV46x+YvQWS+SI/
 hfjSpOHW4iSrNkVV5jToIhtSJCjm6Rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-VIFUXOFjOtSCupGL6OiQsw-1; Mon, 16 Nov 2020 11:06:56 -0500
X-MC-Unique: VIFUXOFjOtSCupGL6OiQsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B213905402;
 Mon, 16 Nov 2020 16:06:55 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3A318E23;
 Mon, 16 Nov 2020 16:06:52 +0000 (UTC)
Subject: Re: [PATCH for-5.2] qga: update schema for guest-get-disks
 'dependents' field
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <20201113183312.432630-1-michael.roth@amd.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b1eef574-0398-2a29-36fa-f89e1aeaa564@redhat.com>
Date: Mon, 16 Nov 2020 10:06:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113183312.432630-1-michael.roth@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 12:33 PM, Michael Roth wrote:
> The recently-added 'guest-get-disk' command returns a list of
> GuestDiskInfo entries, which in turn have a 'dependents' field which
> lists devices these entries are dependent upon. Thus, 'dependencies'
> is a better name for this field. Address this by renaming the field
> accordingly.
> 
> Additionally, 'dependents' is specified as non-optional, even though
> it's not implemented for w32. This is misleading, since it gives users
> the impression that a particular disk might not have dependencies,
> when in reality that information is simply not known to the guest
> agent. Address this by making 'dependents' an optional field, and only
> marking it as in-use when the facilities to obtain this information are
> available to the guest agent.
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Tomáš Golembiovský <tgolembi@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  qga/commands-posix.c | 10 ++++++----
>  qga/qapi-schema.json |  8 ++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 12c1ba5ef7..c089e38120 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1285,6 +1285,7 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
>          g_debug("failed to list entries in %s", deps_dir);
>          return;
>      }
> +    disk->has_dependencies = true;
>      while ((dep = g_dir_read_name(dp_deps)) != NULL) {
>          g_autofree char *dep_dir = NULL;
>          strList *dep_item = NULL;
> @@ -1297,8 +1298,8 @@ static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
>              g_debug("  adding dependent device: %s", dev_name);
>              dep_item = g_new0(strList, 1);
>              dep_item->value = dev_name;
> -            dep_item->next = disk->dependents;
> -            disk->dependents = dep_item;
> +            dep_item->next = disk->dependencies;
> +            disk->dependencies = dep_item;

You could use QAPI_LIST_PREPEND() here (which was just recently added);
but if not, then my work to use that macro in more places in 6.0 will
revisit this code.

>          }
>      }
>      g_dir_close(dp_deps);
> @@ -1351,8 +1352,9 @@ static GuestDiskInfoList *get_disk_partitions(
>          partition->name = dev_name;
>          partition->partition = true;
>          /* Add parent disk as dependent for easier tracking of hierarchy */
> -        partition->dependents = g_new0(strList, 1);
> -        partition->dependents->value = g_strdup(disk_dev);
> +        partition->dependencies = g_new0(strList, 1);
> +        partition->dependencies->value = g_strdup(disk_dev);

Same here.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


