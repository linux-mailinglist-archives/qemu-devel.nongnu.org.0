Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0A5A7C8B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 13:54:12 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTMIN-00036p-TK
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 07:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMGt-0001Dy-FA
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMGr-0006Nz-Ek
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661946756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yyz6C+EX6Cfrev98WLHadex2snmB/Rh4QUYxSknqxmY=;
 b=S97I4ryzbyB45x32Yc5RrEoemLJQ/OpBBtLMiCuItS+J1I3ZiXCGiGKJgNYRtyDD7/3mf9
 UGA/WTAfZ/CEnSw3/Ui9PhDa2RATd79EMaGXVbsXjUUXYfOTBNvWdnL/ti4LxU0RUp7l/u
 O1tO9sPMgPE9FkpJrB85+xALmZwnmZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-b_fw-1qxO4OWR82JxdKyEA-1; Wed, 31 Aug 2022 07:52:35 -0400
X-MC-Unique: b_fw-1qxO4OWR82JxdKyEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9B318188A1;
 Wed, 31 Aug 2022 11:52:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01821909FF;
 Wed, 31 Aug 2022 11:52:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF31821E6900; Wed, 31 Aug 2022 13:52:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 14/16] qapi: fix example of query-migrate command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-15-victortoso@redhat.com>
Date: Wed, 31 Aug 2022 13:52:33 +0200
In-Reply-To: <20220830161545.84198-15-victortoso@redhat.com> (Victor Toso's
 message of "Tue, 30 Aug 2022 18:15:43 +0200")
Message-ID: <87mtbkaav2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Victor Toso <victortoso@redhat.com> writes:

> The example's return type has several missing mandatory member names.
> Fix it.
>
> Problem was noticed when using the example as a test case for Go
> bindings.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/migration.json | 56 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 81185d4311..2ac26d1971 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -295,7 +295,18 @@
>  #           "duplicate":123,
>  #           "normal":123,
>  #           "normal-bytes":123456,
> -#           "dirty-sync-count":15
> +#           "dirty-sync-count":15,
> +#           "mbps":0,
> +#           "skipped":0,
> +#           "postcopy-requests":0,
> +#           "page-size":0,
> +#           "multifd-bytes":0,
> +#           "pages-per-second":0,
> +#           "precopy-bytes":0,
> +#           "downtime-bytes":0,
> +#           "postcopy-bytes":0,
> +#           "dirty-sync-missed-zero-copy":0,
> +#           "dirty-pages-rate":0
>  #         }
>  #      }
>  #    }
> @@ -321,7 +332,18 @@
>  #             "duplicate":123,
>  #             "normal":123,
>  #             "normal-bytes":123456,
> -#             "dirty-sync-count":15
> +#             "dirty-sync-count":15,
> +#             "mbps":0,
> +#             "skipped":0,
> +#             "postcopy-requests":0,
> +#             "page-size":0,
> +#             "multifd-bytes":0,
> +#             "pages-per-second":0,
> +#             "precopy-bytes":0,
> +#             "downtime-bytes":0,
> +#             "postcopy-bytes":0,
> +#             "dirty-sync-missed-zero-copy":0,
> +#             "dirty-pages-rate":0
>  #          }
>  #       }
>  #    }
> @@ -342,12 +364,38 @@
>  #             "duplicate":123,
>  #             "normal":123,
>  #             "normal-bytes":123456,
> -#             "dirty-sync-count":15
> +#             "dirty-sync-count":15,
> +#             "mbps":1,
> +#             "skipped":1,
> +#             "postcopy-requests":1,
> +#             "page-size":1,
> +#             "multifd-bytes":1,
> +#             "pages-per-second":1,
> +#             "precopy-bytes":1,
> +#             "downtime-bytes":1,
> +#             "postcopy-bytes":1,
> +#             "dirty-sync-missed-zero-copy":1,
> +#             "dirty-pages-rate":1
>  #          },
>  #          "disk":{
>  #             "total":20971520,
>  #             "remaining":20880384,
> -#             "transferred":91136
> +#             "transferred":91136,
> +#             "duplicate":2,
> +#             "skipped":2,
> +#             "normal":2,
> +#             "normal-bytes":2,
> +#             "dirty-pages-rate":2,
> +#             "mbps":2,
> +#             "dirty-sync-count":2,
> +#             "postcopy-requests":2,
> +#             "page-size":2,
> +#             "multifd-bytes":2,
> +#             "pages-per-second":2,
> +#             "precopy-bytes":2,
> +#             "downtime-bytes":2,
> +#             "postcopy-bytes":2,
> +#             "dirty-sync-missed-zero-copy":2
>  #          }
>  #       }
>  #    }

Full example output is fairly long.  Perhaps that's what we want.  Or
perhaps we'd prefer abridged output.  See also my review of PATCH 03.


