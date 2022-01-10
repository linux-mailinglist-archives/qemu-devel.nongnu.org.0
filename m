Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63658489EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:12:08 +0100 (CET)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6z9L-0007Lq-Ez
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1n6z44-0008Fb-Kq
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:06:40 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:33812 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1n6z3c-0008KL-FP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:06:27 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1827647901;
 Mon, 10 Jan 2022 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1641837963; x=1643652364; bh=gNA53FEVM5d/J6+/1gq92R
 XqiR71lgfivwQ6UwHwQVM=; b=dQGWTB4cmnnbOGbQzJ9Eg6JEeArjVjG5QpNQUr
 6VXOA5HUIIdsXbJxuUCIjcO7PKGzkrrR5FpbjGCAwsY40D8bDcu/oDw999MwUbMr
 tLZfiATrvCjdoaqwUEREOii+jyV6FoOeOzDwE867VM2HpXe+jtpPpJuWe/9iVa1f
 3pfsk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPbF8zzobIye; Mon, 10 Jan 2022 21:06:03 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 089EC46FCA;
 Mon, 10 Jan 2022 21:06:01 +0300 (MSK)
Received: from localhost (172.22.0.12) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 21:06:01 +0300
Date: Mon, 10 Jan 2022 21:06:00 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 0/7] host: Support macOS 12
Message-ID: <Ydx1iJqG38wef4jq@SPB-NB-133.local>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
X-Originating-IP: [172.22.0.12]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:09:54PM +0100, Philippe Mathieu-Daudé wrote:
> Few patches to be able to build QEMU on macOS 12 (Monterey).
> 
> This basically consists of adapting deprecated APIs. I am not
> sure about these APIs, so tagging as RFC.
> 
> I couldn't succeed to adapt the Cocoa code.
> 
> CI job added to avoid bitrotting.
> 
> Since v2:
> - Addressed Akihiko Odaki comments:
>   . use __is_identifier(),
>   . remove cocoa setAllowedFileTypes()
> - Addressed Daniel Berrangé comment:
>   . rebased on testing/next, update libvirt-ci/lcitool
> 
> Based on Alex's testing/next

Hi Philippe,

Could you please share URI to the remote?
I want to apply the series on it.

Thanks,
Roman

> Based-on: <20220110124638.610145-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (7):
>   configure: Allow passing extra Objective C compiler flags
>   ui/cocoa: Remove allowedFileTypes restriction in SavePanel
>   hvf: Make hvf_get_segments() / hvf_put_segments() local
>   hvf: Remove deprecated hv_vcpu_flush() calls
>   audio/coreaudio: Remove a deprecation warning on macOS 12
>   block/file-posix: Remove a deprecation warning on macOS 12
>   gitlab-ci: Support macOS 12 via cirrus-run
> 
>  configure                         |  8 ++++++++
>  meson.build                       |  5 +++++
>  target/i386/hvf/vmx.h             |  2 --
>  target/i386/hvf/x86hvf.h          |  2 --
>  audio/coreaudio.c                 | 16 ++++++++++------
>  block/file-posix.c                | 13 +++++++++----
>  target/i386/hvf/x86_task.c        |  1 -
>  target/i386/hvf/x86hvf.c          |  6 ++----
>  .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++
>  .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>  tests/lcitool/libvirt-ci          |  2 +-
>  tests/lcitool/refresh             |  1 +
>  ui/cocoa.m                        |  6 ------
>  13 files changed, 67 insertions(+), 26 deletions(-)
>  create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
> 
> -- 
> 2.33.1
> 

