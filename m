Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F026F9F6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 12:10:19 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJDLO-0003Ve-As
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 06:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJDI8-0002CT-I6
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJDI6-0001WG-Hs
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600423612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2kHpNZMWfFyjMZ085WS3x5ybDFSrVSOrJumoflsIM8=;
 b=Au3BPNJV7Yn723SxnmFxfi3df9v+vtHRKEhzRMQtp9dEUM8ReDNQ0UTHFqn5bGVxO0tcKA
 SKk2V05b+7tVsn+3FTg8kq2Ksi8YP08MZNJhCVvsFe4gii2x7NOVJWhkZw6Dkk50ZPCTP8
 3BKVEKXCYTn5Y8Zwq8Ql5XwsFBhB6rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-goB40yOEPLqkfWTQH_gXgQ-1; Fri, 18 Sep 2020 06:06:50 -0400
X-MC-Unique: goB40yOEPLqkfWTQH_gXgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABF4B1882FC6;
 Fri, 18 Sep 2020 10:06:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7187E6198E;
 Fri, 18 Sep 2020 10:06:48 +0000 (UTC)
Subject: Re: [PATCH v2] docs: simplify and clarify the platform support rules
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200918090603.1640224-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b39a1eaa-b242-abca-8b9f-c380bd8f033a@redhat.com>
Date: Fri, 18 Sep 2020 12:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200918090603.1640224-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/09/2020 11.06, Daniel P. Berrangé wrote:
> The distinction between short life and long life Linux distributions
> turned out to be redundant. They can both be covered in a simple way
> by noting support will target the current release, and the previous
> release for a period of two years or until its EOL. This rule can also
> apply to the other UNIX based distros, leaving only Windows needing a
> different set of rules.
> 
> This also clarifies that Debian LTS is out of scope, because the LTS
> support is provided by a separate group from the main Debian maintainer
> team.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/system/build-platforms.rst | 59 +++++++++++----------------------
>  1 file changed, 19 insertions(+), 40 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


