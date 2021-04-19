Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B6363F69
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:14:50 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQvZ-0000hv-7A
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lYQtE-0008J1-M8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lYQt9-0004Kf-2j
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618827136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2tfH6umEAeC46xRVOYI1GtMg1/BGFtIItRNy8l+l84=;
 b=DliWGtLha//nicOBNMtJQR6rHtfcsgKwz/asE/oDnJ697bwvPsPHUvCVmy8EWHFahplSTI
 ytSpJ9769QjJR9AZwRjZz9AxFlEzMEyOl9rJZmeczKWVd7eJKGxTSvwy3IbHGWtM800KPA
 cK0uY1K1jjikirZUCLA5eweO3AD907c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-KvJF9jxHMW-QdDO-3XkZ2g-1; Mon, 19 Apr 2021 06:11:07 -0400
X-MC-Unique: KvJF9jxHMW-QdDO-3XkZ2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9108B8143F2;
 Mon, 19 Apr 2021 10:11:06 +0000 (UTC)
Received: from nautilus.local (unknown [10.40.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8884B5D74B;
 Mon, 19 Apr 2021 10:10:56 +0000 (UTC)
Date: Mon, 19 Apr 2021 12:10:53 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
Message-ID: <YH1XLd34h7OXXqYR@nautilus.local>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
 <YH1QJZGYQXc6x9Et@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YH1QJZGYQXc6x9Et@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daudé wrote:
> > Forks run the same jobs than mainstream, which might be overkill.
> > Allow them to easily rebase their custom set, while keeping using
> > the mainstream templates, and ability to pick specific jobs from
> > the mainstream set.
> > 
> > To switch to your set, simply add your .gitlab-ci.yml as
> > .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
> > is your gitlab 'namespace', usually username). This file will be
> > used instead of the default mainstream set.
> 
> I find this approach undesirable, because AFAICT, it means you have
> to commit this extra file to any of your downstream branches that
> you want this to be used for.  Then you have to be either delete it
> again before sending patches upstream, or tell git-publish to
> exclude the commit that adds this.
> 
> IMHO any per-contributor overhead needs to not involve committing
> stuff to their git branches, that isn't intended to go upstream.

Not just that, ideally, they should also run all the upstream workloads before
submitting a PR or posting patches because they'd have to respin because of a
potential failure in upstream pipelines anyway.

Erik


