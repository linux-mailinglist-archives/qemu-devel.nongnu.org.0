Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02322135D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 10:08:32 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrGkJ-000821-PP
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 04:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrGjV-0007Sn-QN
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 04:07:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrGjU-0008Ou-BX
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 04:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593763659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVzwH1N/S3m4IpaySxJwk4F+uUlD58Qkpr9pAZm039I=;
 b=cPdUHHL3hCk5QWJEbA8+dC8Lww3SM1yzG2CD2EMkoF8eKEmUprO/bmsmtyH4wrz7aLTHwl
 yrVFAwyvZUo4uriCtAHfK5fPTensttQ0du3mN2KRkx+/S+XWdCaJhFHEFM0KlU51eRjCFG
 erTtipNewsQ3tm3+egQk6rn1zuIUdcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-06tZ6nxZMCKCMXMhv1oj-Q-1; Fri, 03 Jul 2020 04:07:34 -0400
X-MC-Unique: 06tZ6nxZMCKCMXMhv1oj-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA746A0BD8;
 Fri,  3 Jul 2020 08:07:32 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C19D5FC30;
 Fri,  3 Jul 2020 08:07:29 +0000 (UTC)
Date: Fri, 3 Jul 2020 10:07:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 01/25] iotests: Fix 051 output after
 qdev_init_nofail() removal
Message-ID: <20200703080728.GC5285@linux.fritz.box>
References: <20200624140446.15380-1-alex.bennee@linaro.org>
 <20200624140446.15380-2-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200624140446.15380-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:38:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, cota@braap.org, Max Reitz <mreitz@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.06.2020 um 16:04 hat Alex Bennée geschrieben:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Commit 96927c744 replaced qdev_init_nofail() call by
> isa_realize_and_unref() which has a different error
> message. Update the test output accordingly.
> 
> Gitlab CI error after merging b77b5b3dc7:
> https://gitlab.com/qemu-project/qemu/-/jobs/597414772#L4375
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20200616154949.6586-1-philmd@redhat.com>

Thanks, applied (this individual patch) to the block branch.

Kevin


