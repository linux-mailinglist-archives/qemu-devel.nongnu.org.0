Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8C1FBB57
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:19:09 +0200 (CEST)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlEIm-0002wo-Km
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlEHZ-00021n-6q
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:17:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlEHW-00068C-UH
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592324269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=BFQ7Fz93QaOSpAGyCIUZTu4zuSzXRnnNoB36M190uUg=;
 b=eSBHegqwLD7foTBfvzcopehpzkXmb1Xt+S8N6+XQizqsKFF5Vg4WP+jqgDUXMsRe4LMBPr
 sIH7gNW8KPAgS9d7iAeSbTXuoPqZt34iuwyc+d7nQaGFwQ+rGM974v0rhy2j2okL/89lkL
 Iucp165bobguZH3PlbpoQJj1oZkfaq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-GNLdCCO5MeSlSlcR1cTtBg-1; Tue, 16 Jun 2020 12:17:47 -0400
X-MC-Unique: GNLdCCO5MeSlSlcR1cTtBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D760610059B2;
 Tue, 16 Jun 2020 16:17:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A6C79315;
 Tue, 16 Jun 2020 16:17:45 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix 051 output after qdev_init_nofail() removal
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200616154949.6586-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <618085da-e10d-5427-4b60-c94699fa269a@redhat.com>
Date: Tue, 16 Jun 2020 18:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200616154949.6586-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2020 17.49, Philippe Mathieu-Daudé wrote:
> Commit 96927c744 replaced qdev_init_nofail() call by
> isa_realize_and_unref() which has a different error
> message. Update the test output accordingly.
> 
> Gitlab CI error after merging b77b5b3dc7:
> https://gitlab.com/qemu-project/qemu/-/jobs/597414772#L4375
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qemu-iotests/051.pc.out | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


