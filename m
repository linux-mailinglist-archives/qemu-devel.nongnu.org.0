Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB41C9093
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 16:48:18 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWhov-0000yW-6L
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 10:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWhnd-0000HT-99
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:46:57 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57662
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWhnZ-0004p3-MW
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588862812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAYK4DgJqN9PUL2KZHkmfLZ2ER+9wrR5OQMfEtdNCLw=;
 b=N59SsP/71LHimKTOGB30pPgMSWw3CvTdoEWqK1a/kZ5/WcmDYOfYKxS/iCb+Px9HVPmczH
 Hk4oME66DHygLFZxzk2RzDoiCJpFRK9JQrvizHYU8+eDTifwESoYU+6Uy/ukcW/D8f8sO3
 5fFpxG39LzlxGLmAykwCFrpY/kp6jWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-sunOIShEPDC7ITSAMPwS6g-1; Thu, 07 May 2020 10:46:49 -0400
X-MC-Unique: sunOIShEPDC7ITSAMPwS6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977858015CF;
 Thu,  7 May 2020 14:46:48 +0000 (UTC)
Received: from work-vm (ovpn-114-224.ams2.redhat.com [10.36.114.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF9160CCC;
 Thu,  7 May 2020 14:46:47 +0000 (UTC)
Date: Thu, 7 May 2020 15:46:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2 0/3] Improved reporting for migrate parameters
Message-ID: <20200507144645.GB17348@work-vm>
References: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mao Zhongyi (maozhongyi@cmss.chinamobile.com) wrote:
> This series mainly improve the report message of migrate parameters
> to make it easier to read.

Queued

> v2->v1
> -p1: avoid using constants, replace it with stringify().
>=20
> Cc: quintela@redhat.com
> Cc: dgilbert@redhat.com
>=20
> Mao Zhongyi (3):
>   migration/migration: improve error reporting for migrate parameters
>   monitor/hmp-cmds: add hmp_handle_error() for hmp_migrate_set_speed()
>   migration: move the units of migrate parameters from milliseconds to
>     ms
>=20
>  migration/migration.c | 20 ++++++++++++--------
>  monitor/hmp-cmds.c    | 13 ++++++++-----
>  2 files changed, 20 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.17.1
>=20
>=20
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


