Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA072DD486
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:45:32 +0100 (CET)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvTA-00045I-1w
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpvBi-0002kR-2c
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpvBY-0005jh-CR
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608218838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvhZBU0oZ8i3j3NELibNeKfoKofDhQB4nNHO4d7G7Fc=;
 b=HR5Ci0H6TKpukYYmyQRqCysH9iW58fdNyurp8dwNMFvoMCRTmBh65uFRu7vUJn6qG8dQLP
 JyTfuhc2jwr6BSsySJ27kjyViXp02xLZPy7+jq6lY2GxGpKLSHBcTuk7ndxCf1/a1SFxoa
 K7W2dSqMxmsCatxw8gNVVsNaehyUV8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Kz72rcLhMce5hgKNjBR0YA-1; Thu, 17 Dec 2020 10:27:14 -0500
X-MC-Unique: Kz72rcLhMce5hgKNjBR0YA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84ED1801817;
 Thu, 17 Dec 2020 15:27:12 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F1E5D6DC;
 Thu, 17 Dec 2020 15:27:10 +0000 (UTC)
Date: Thu, 17 Dec 2020 15:27:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tuguoyi <tu.guoyi@h3c.com>, den@openvz.org, berrange@redhat.com
Subject: Re: [PATCH 1/2] savevm: Remove dead code in save_snapshot()
Message-ID: <20201217152708.GI4117@work-vm>
References: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
 <1607410416-13563-2-git-send-email-tu.guoyi@h3c.com>
MIME-Version: 1.0
In-Reply-To: <1607410416-13563-2-git-send-email-tu.guoyi@h3c.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tuguoyi (tu.guoyi@h3c.com) wrote:
> The snapshot in each bs is deleted at the beginning, so there is no need
> to find the snapshot again.
> 
> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>

This looks OK to me, becoming redundant after Denis's 0b46160 - but
I don't know the snapshot code much;

Denis - do you agree this is correct?

Dave

> ---
>  migration/savevm.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 5f937a2..601b514 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2728,7 +2728,7 @@ int qemu_load_device_state(QEMUFile *f)
>  int save_snapshot(const char *name, Error **errp)
>  {
>      BlockDriverState *bs, *bs1;
> -    QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
> +    QEMUSnapshotInfo sn1, *sn = &sn1;
>      int ret = -1, ret2;
>      QEMUFile *f;
>      int saved_vm_running;
> @@ -2797,13 +2797,7 @@ int save_snapshot(const char *name, Error **errp)
>      }
>  
>      if (name) {
> -        ret = bdrv_snapshot_find(bs, old_sn, name);
> -        if (ret >= 0) {
> -            pstrcpy(sn->name, sizeof(sn->name), old_sn->name);
> -            pstrcpy(sn->id_str, sizeof(sn->id_str), old_sn->id_str);
> -        } else {
> -            pstrcpy(sn->name, sizeof(sn->name), name);
> -        }
> +        pstrcpy(sn->name, sizeof(sn->name), name);
>      } else {
>          /* cast below needed for OpenBSD where tv_sec is still 'long' */
>          localtime_r((const time_t *)&tv.tv_sec, &tm);
> -- 
> 2.7.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


