Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4FA253F27
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 09:31:03 +0200 (CEST)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBCNC-00059f-Ln
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 03:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBCDR-0008U7-8Q
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 03:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBCDO-0004vg-NE
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 03:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598512853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/bf040rCDe7j7OEsP/dl7TxlH3lmLw+K/IXNq+U6mA=;
 b=f8l8UwsP+c+CZDKfObQxDHjHEm3o6TjLvAxHydzqteSSpxFeIDukZAsdz4ndEek7Yqa2nh
 hoE+n77Q6GddW5Cy259Rg7xPR3WcaUbIjXEv+TaR2kLE+SugqO/GyPR1Cv1o9Z2nv7IelW
 7OOaYUq+l6g1aDcBl45CG//mtzD56yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-SkbRmXRIPSONQueWqSw7nw-1; Thu, 27 Aug 2020 03:20:51 -0400
X-MC-Unique: SkbRmXRIPSONQueWqSw7nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51548185FD6A;
 Thu, 27 Aug 2020 07:20:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAF4C1992F;
 Thu, 27 Aug 2020 07:20:42 +0000 (UTC)
Subject: Re: [PULL 0/3] Fixes 20200825 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200825062008.6502-1-kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <128e42b3-3b0f-744b-91be-f4c52837c3a2@redhat.com>
Date: Thu, 27 Aug 2020 09:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200825062008.6502-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.239, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, laurent@vivier.eu,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/2020 08.20, Gerd Hoffmann wrote:
> The following changes since commit 30aa19446d82358a30eac3b556b4d6641e00b7c1:
> 
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20200812' into staging (2020-08-24 16:39:53 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kraxel.org/qemu tags/fixes-20200825-pull-request
> 
> for you to fetch changes up to 9755c94a50c8b845ad133a6e660f55ca131b9c7a:
> 
>   meson: avoid compiling qemu-keymap by default (2020-08-25 08:12:19 +0200)
> 
> ----------------------------------------------------------------
> meson: keymap fixes
> 
> ----------------------------------------------------------------

 Hi Gerd,

if I've got that right, something in this pull request broke the gitlab
CI, see:

 https://gitlab.com/qemu-project/qemu/-/jobs/702680909

216 (33/45)
tests/acceptance/vnc.py:Vnc.test_change_password_requires_a_password:
ERROR: Unexpected empty reply from server (0.08 s)
217 (34/45) tests/acceptance/vnc.py:Vnc.test_change_password:  ERROR:
Unexpected empty reply from server (0.06 s)

Peter, what is still missing that you could use the gitlab CI as gating
tests, too?

 Thomas


