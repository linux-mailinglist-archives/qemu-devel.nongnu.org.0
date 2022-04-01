Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB944EF8A7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:07:37 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKkK-0007kI-Do
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1naKiM-0006UH-In
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1naKiD-0008GK-Bz
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648832722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Op7S8hA3lAl40BPzCTER+BcyXDttw5RRkJCpo4ohTLs=;
 b=EiabfVmrzZ+dBO5wFhL0r+iNPJrsTaLyvQ3WwCYRVERv+XVUGvhrVT/hp5N0fMe7xbGFS8
 9E4Q7OEpdlcRxkxSif31A5a9vgD1X9mFbOjPfmTT6bqnpRKbzHtPVmytck+pcAnIr5gVPR
 hRUXb6qjyXIQZC224f7UwmZwcu3cQ/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-3aOYB3G1PJyPFWlms-IyFg-1; Fri, 01 Apr 2022 13:05:21 -0400
X-MC-Unique: 3aOYB3G1PJyPFWlms-IyFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37D7E3838C80
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 17:05:21 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F21BC40E8104;
 Fri,  1 Apr 2022 17:05:18 +0000 (UTC)
Date: Fri, 1 Apr 2022 19:05:16 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 02/13] fork qemu.qmp from qemu.git
Message-ID: <YkcwzP2lu8B8dYNu@paraplu>
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220330182424.3438872-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 02:24:13PM -0400, John Snow wrote:
> Split python/ from qemu.git, using these commands:
> 
> > git subtree split -P python/ -b python-split-v3
> > mkdir ~/src/tmp
> > cd ~/src/tmp
> > git clone --no-local --branch python-split-v3 --single-branch ~/src/qemu
> > cd qemu
> > git filter-repo --path qemu/machine/           \
>                   --path qemu/utils/             \
>                   --path tests/iotests-mypy.sh   \
>                   --path tests/iotests-pylint.sh \
>                   --invert-paths
> 
> This commit, however, only performs some minimum cleanup to reflect the
> deletion of the other subpackages. It is not intended to be exhaustive,
> and further edits are made in forthcoming commits.
> 
> These fixes are broken apart into micro-changes to facilitate mailing
> list review subject-by-subject. They *could* be squashed into a single
> larger commit on merge if desired, but due to the nature of the fork,
> bisectability across the fork boundary is going to be challenging
> anyway. It may be better value to just leave these initial commits
> as-is.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitignore |  2 +-
>  Makefile   | 16 ++++++++--------
>  setup.cfg  | 24 +-----------------------
>  setup.py   |  2 +-
>  4 files changed, 11 insertions(+), 33 deletions(-)

The changes here look fine to me (and thanks for making it a "micro
change").  I'll let sharper eyes than mine to give a closer look at the
`git filter-repo` surgery.  Although, that looks fine to me too.

[...]

>  .PHONY: distclean
>  distclean: clean
> -	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> +	rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
>  	rm -f .coverage .coverage.*
>  	rm -rf htmlcov/
> diff --git a/setup.cfg b/setup.cfg
> index e877ea5..4ffab73 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -1,5 +1,5 @@
>  [metadata]
> -name = qemu
> +name = qemu.qmp
>  version = file:VERSION
>  maintainer = QEMU Developer Team

In the spirit of patch 04 ("update maintainer metadata"), do you also
want to update here too? s/QEMU Developer Team/QEMU Project?

FWIW:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

[...]

-- 
/kashyap


